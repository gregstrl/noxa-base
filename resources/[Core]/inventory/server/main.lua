local function notifyPlayer(player, message, type)
    showNotification(player, message, type)
end

RegisterServerCallback("izeyko:getPlayerInventory", function(source, cb)
    local xPlayer = GetPlayerFromId(source)
    if not xPlayer then
        cb(nil)
        return
    end

    local identifier = GetPlayerLicense(xPlayer)
    local clothes = {}
    local dataPhone, idcardData

    if Config.ActivePhoneUnique then
        getNumberInBDD(identifier, function(phoneData)
            dataPhone = phoneData
        end)
    end

    if Config.ActiveIdCard then
        getCardInBDD(identifier, function(cardData)
            idcardData = cardData
        end)
    end

    MySQL.Async.fetchAll('SELECT * FROM izey_clothes WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        for _, item in ipairs(result) do
            table.insert(clothes, {
                type = item.type,
                clothe = item.data,
                id = item.id,
                label = item.name
            })
        end

        cb({
            inventory = GetPlayerInventory(xPlayer),
            accounts = GetPlayerMoney(xPlayer),
            weapons = GetPlayerWeapon(xPlayer),
            weight = GetPlayerWeight(xPlayer),
            maxWeight = GetPlayerMaxWeight(xPlayer),
            clothes = clothes,
            idcard = idcardData,
            phone = dataPhone
        })
    end)
end)

RegisterNetEvent('izey:removeItem')
AddEventHandler('izey:removeItem', function(info, name, count)
    local source = source
    local xPlayer = GetPlayerFromId(source)
    if not xPlayer then return end

    if info == 'item_standard' and count > 0 then
        local item = GetItem(xPlayer, name)
        if GetItemAmount(item) >= count then
            RemoveItem(xPlayer, name, count)
        end
    elseif info == 'item_weapon' and getWeapon(xPlayer, name) then
        removeWeapon(xPlayer, name)
    elseif info == 'item_account' and count > 0 and getAccount(xPlayer, name) >= count then
        removeMoney(xPlayer, name, count)
    elseif info == 'item_vetement' then
        MySQL.Async.execute('DELETE FROM izey_clothes WHERE id = @id', { ['@id'] = name })
    elseif info == 'item_phone' then
        MySQL.Sync.execute('DELETE FROM ' .. phoneTable .. ' WHERE ' .. numberTable .. ' = @' .. numberTable, {
            ['@' .. numberTable] = name
        })
    end

    sendToDiscordWithSpecialURL(
        "🚮 Delete Item",
        "\n\n``🔢``ID : ``[" .. source .. "] | " .. xPlayer.getName() .. "``\n``💿``Licence: ``" .. GetPlayerLicense(xPlayer) .. "``\n``💬``Action: ``delete " .. name .. " x" .. count .. " ``",
        webhooks['removeItem'].color,
        webhooks['removeItem'].webhook
    )
end)

ESX.RegisterServerCallback('izey:checkItemQuantity', function(source, cb, itemName, quantity)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local item = xPlayer.getInventoryItem(itemName)
        if item and item.count >= quantity then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('izey:checkWeaponOwnership', function(source, cb, weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local loadout = xPlayer.getLoadout()
        for _, weapon in pairs(loadout) do
            if weapon.name == weaponName then
                cb(true)
                return
            end
        end
        cb(false)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('izey:checkAccount', function(source, cb, accountName, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local account = xPlayer.getAccount(accountName)
        if account and account.money >= amount then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

RegisterNetEvent('izey:giveItem')
AddEventHandler('izey:giveItem', function(target, name, count, type, label)
    local source = source
    local xPlayer = GetPlayerFromId(source)
    local xTarget = GetPlayerFromId(target)
    if not xPlayer or not xTarget then return end

    if type == 'item_standard' and count > 0 then
        local item = GetItem(xPlayer, name)
        if GetItemAmount(item) >= count and getWeight(xTarget, name, count) then
            RemoveItem(xPlayer, name, count)
            AddItem(xTarget, name, count)
            notifyPlayer(xPlayer, (Locales[Config.Language]['give_from_item']):format(count, GetItemLabel(name)), 'success')
            notifyPlayer(xTarget, (Locales[Config.Language]['give_target_item']):format(count, GetItemLabel(name)), 'success')
        else
            notifyPlayer(xPlayer, Locales[Config.Language]['give_error_weight'], 'error')
        end
    elseif type == 'item_account' and count > 0 and getAccount(xPlayer, name) >= count then
        removeMoney(xPlayer, name, count)
        addMoney(xTarget, name, count)
        notifyPlayer(xPlayer, (Locales[Config.Language]['give_from_account']):format(count, Config.AccountName[name]), 'success')
        notifyPlayer(xTarget, (Locales[Config.Language]['give_target_account']):format(count, Config.AccountName[name]), 'success')
    elseif type == 'item_vetement' then
        MySQL.Sync.execute('UPDATE izey_clothes SET identifier = @identifier WHERE id = @id', {
            ['@id'] = name,
            ['@identifier'] = GetPlayerLicense(xTarget)
        })
        notifyPlayer(xPlayer, Locales[Config.Language]['give_from_clothes'], 'success')
        notifyPlayer(xTarget, Locales[Config.Language]['give_target_clothes'], 'success')
    elseif type == 'item_phone' then
        MySQL.Sync.execute('UPDATE ' .. phoneTable .. ' SET ' .. idPhoneTable .. ' = @' .. idPhoneTable .. ' WHERE ' .. numberTable .. ' = @' .. numberTable, {
            ['@' .. numberTable] = name,
            ['@' .. idPhoneTable] = GetPlayerLicense(xTarget)
        })
        notifyPlayer(xPlayer, (Locales[Config.Language]['give_from_phone']):format(formatPhoneNumber(name)), 'success')
        notifyPlayer(xTarget, (Locales[Config.Language]['give_target_phone']):format(formatPhoneNumber(name)), 'success')
    elseif type == 'item_weapon' and not getWeapon(xTarget, name) then
        removeWeapon(xPlayer, name)
        addWeapon(xTarget, name, 255)
        notifyPlayer(xPlayer, (Locales[Config.Language]['give_from_weapon']):format(label), 'success')
        notifyPlayer(xTarget, (Locales[Config.Language]['give_target_weapon']):format(label), 'success')
    else
        notifyPlayer(xPlayer, Locales[Config.Language]['give_error_weapon'], 'error')
    end

    sendToDiscordWithSpecialURL(
        "🧩 Give Item",
        "\n\n``🔢``ID : ``[" .. source .. "] " .. xPlayer.getName() .. "``\n``💿``Licence: ``" .. GetPlayerLicense(xPlayer) .. "``\n``💬``Action: ``a donné " .. name .. " x" .. count .. "``\n``🎮``Receveur ``[" .. xTarget.source .. "] " .. xTarget.getName() .. "``",
        webhooks['giveItem'].color,
        webhooks['giveItem'].webhook
    )
end)