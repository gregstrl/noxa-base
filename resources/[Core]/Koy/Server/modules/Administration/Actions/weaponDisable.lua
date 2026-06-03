local disabledWeapons = {}

local permanentWeapons = {
    "WEAPON_NEVA",
    "WEAPON_GYS",
    "WEAPON_GLOCK17",
    "WEAPON_IAR",
    "WEAPON_M133",
    "WEAPON_A15RC",
    "WEAPON_JRBAK",
    "WEAPON_FAMASU1",
    "WEAPON_UMP45",
    "WEAPON_UZI",
    "WEAPON_ENERGYKNIFE",
    "WEAPON_KARAMBIT",
    "WEAPON_M416P",
    "WEAPON_G36"
}

MySQL.Async.execute([[
    CREATE TABLE IF NOT EXISTS disabled_weapons (
        identifier VARCHAR(50) NOT NULL,
        weapon VARCHAR(50) NOT NULL,
        expire_time INT NOT NULL,
        disabled_by VARCHAR(50) NOT NULL,
        PRIMARY KEY (identifier, weapon)
    )
]], {})

local function syncDisabledWeapons(source, identifier)
    if not disabledWeapons[identifier] then return end
    
    local playerWeapons = {}
    for weapon, _ in pairs(disabledWeapons[identifier]) do
        playerWeapons[weapon] = true
    end
    TriggerClientEvent("JG:updateDisabledWeapons", source, playerWeapons)
end

local function loadDisabledWeapons()
    MySQL.Async.fetchAll('SELECT * FROM disabled_weapons WHERE expire_time > UNIX_TIMESTAMP()', {}, function(results)
        for _, data in ipairs(results) do
            if not disabledWeapons[data.identifier] then
                disabledWeapons[data.identifier] = {}
            end
            disabledWeapons[data.identifier][data.weapon] = {
                expireTime = data.expire_time,
                disabledBy = data.disabled_by
            }
            
            local xPlayer = ESX.GetPlayerFromIdentifier(data.identifier)
            if xPlayer then
                syncDisabledWeapons(xPlayer.source, data.identifier)
            end
        end
    end)
end

CreateThread(function()
    Wait(1000)
    loadDisabledWeapons()
end)

local function isWeaponDisabled(identifier, weaponName)
    if not disabledWeapons[identifier] then return false end
    
    for weapon, data in pairs(disabledWeapons[identifier]) do
        if weapon == weaponName and data.expireTime > os.time() then
            return true
        elseif weapon == weaponName then
            MySQL.Async.execute('DELETE FROM disabled_weapons WHERE identifier = @identifier AND weapon = @weapon', {
                ['@identifier'] = identifier,
                ['@weapon'] = weaponName
            })
            disabledWeapons[identifier][weapon] = nil
            
            local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
            if xPlayer then
                TriggerClientEvent("JG:removeDisabledWeapon", xPlayer.source, weaponName)
            end
            return false
        end
    end
    return false
end

local function disableWeapon(xPlayer, targetPlayer, weaponName, hours, expireTime)
    if not disabledWeapons[targetPlayer.identifier] then
        disabledWeapons[targetPlayer.identifier] = {}
    end
    
    disabledWeapons[targetPlayer.identifier][weaponName] = {
        expireTime = expireTime,
        disabledBy = xPlayer.identifier
    }
    
    MySQL.Async.execute('REPLACE INTO disabled_weapons (identifier, weapon, expire_time, disabled_by) VALUES (@identifier, @weapon, @expire_time, @disabled_by)', {
        ['@identifier'] = targetPlayer.identifier,
        ['@weapon'] = weaponName,
        ['@expire_time'] = expireTime,
        ['@disabled_by'] = xPlayer.identifier
    })
    
    TriggerClientEvent("JG:addDisabledWeapon", targetPlayer.source, weaponName)
end

Shared:RegisterCommand("disableallperm", function(xPlayer, args)
    if not xPlayer then return end
    
    if not JG.AdminManager:PlayerIsStaff(xPlayer) then
        return xPlayer.showNotification("Vous n'avez pas la permission d'utiliser cette commande.")
    end
    
    local targetId = tonumber(args[1])
    local hours = tonumber(args[2])
    
    if not targetId or not hours then
        return xPlayer.showNotification("Usage: /disableallperm [ID] [Heures]")
    end
    
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    if not targetPlayer then
        return xPlayer.showNotification("Joueur non trouvé.")
    end
    
    local expireTime = os.time() + (hours * 3600)
    
    for _, weaponName in ipairs(permanentWeapons) do
        disableWeapon(xPlayer, targetPlayer, weaponName, hours, expireTime)
    end
    
    targetPlayer.showNotification(("Toutes vos armes permanentes ont été désactivées pour %d heures."):format(hours))
    xPlayer.showNotification(("Vous avez désactivé toutes les armes permanentes de %s pour %d heures."):format(targetPlayer.getName(), hours))
    
    JG.Discord:SendMessage(
        "Admin:DisableAllPerm",
        ("***%s*** a désactivé toutes les armes permanentes de ***%s***"):format(xPlayer.getName(), targetPlayer.getName()),
        {
            {
                name = "Staff",
                value = xPlayer.getName(),
                inline = true
            },
            {
                name = "Joueur",
                value = targetPlayer.getName(),
                inline = true
            },
            {
                name = "Durée",
                value = hours .. " heures",
                inline = true
            }
        }
    )
end, {help = "Désactive toutes les armes permanentes d'un joueur pendant une durée définie", params = {
    {name = "id", help = "ID du joueur"},
    {name = "hours", help = "Durée en heures"}
}}, {
    permission = "weapon_disable"
})

Shared:RegisterCommand("disableperm", function(xPlayer, args)
    if not xPlayer then return end
    
    if not JG.AdminManager:PlayerIsStaff(xPlayer) then
        return xPlayer.showNotification("Vous n'avez pas la permission d'utiliser cette commande.")
    end
    
    local targetId = tonumber(args[1])
    local hours = tonumber(args[2])
    local weaponName = args[3]
    
    if not targetId or not hours or not weaponName then
        return xPlayer.showNotification("Usage: /disableperm [ID] [Heures] [Arme]")
    end
    
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    if not targetPlayer then
        return xPlayer.showNotification("Joueur non trouvé.")
    end
    
    if not ESX.GetWeaponLabel(weaponName) then
        return xPlayer.showNotification("Cette arme n'existe pas.")
    end
    
    local expireTime = os.time() + (hours * 3600)
    
    disableWeapon(xPlayer, targetPlayer, weaponName, hours, expireTime)
    
    targetPlayer.showNotification(("Votre arme permanente %s a été désactivée pour %d heures."):format(ESX.GetWeaponLabel(weaponName), hours))
    xPlayer.showNotification(("Vous avez désactivé l'arme permanente %s de %s pour %d heures."):format(ESX.GetWeaponLabel(weaponName), targetPlayer.getName(), hours))
    
    JG.Discord:SendMessage(
        "Admin:DisablePerm",
        ("***%s*** a désactivé l'arme permanente de ***%s***"):format(xPlayer.getName(), targetPlayer.getName()),
        {
            {
                name = "Staff",
                value = xPlayer.getName(),
                inline = true
            },
            {
                name = "Joueur",
                value = targetPlayer.getName(),
                inline = true
            },
            {
                name = "Arme",
                value = ESX.GetWeaponLabel(weaponName),
                inline = true
            },
            {
                name = "Durée",
                value = hours .. " heures",
                inline = true
            }
        }
    )
end, {help = "Désactive une arme permanente d'un joueur pendant une durée définie", params = {
    {name = "id", help = "ID du joueur"},
    {name = "hours", help = "Durée en heures"},
    {name = "weapon", help = "Nom de l'arme"}
}}, {
    permission = "weapon_disable"
})

RegisterNetEvent("esx:setWeapon")
AddEventHandler("esx:setWeapon", function(source, weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    if isWeaponDisabled(xPlayer.identifier, weaponName) then
        TriggerClientEvent("esx:removeWeapon", source, weaponName)
        xPlayer.showNotification(("L'arme %s est temporairement désactivée pour vous."):format(ESX.GetWeaponLabel(weaponName)))
    end
end)

CreateThread(function()
    while true do
        Wait(60000)
        
        local currentTime = os.time()
        for identifier, weapons in pairs(disabledWeapons) do
            for weaponName, data in pairs(weapons) do
                if data.expireTime <= currentTime then
                    MySQL.Async.execute('DELETE FROM disabled_weapons WHERE identifier = @identifier AND weapon = @weapon', {
                        ['@identifier'] = identifier,
                        ['@weapon'] = weaponName
                    })
                    
                    disabledWeapons[identifier][weaponName] = nil
                    local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
                    if xPlayer then
                        xPlayer.showNotification(("Votre arme permanente %s est à nouveau disponible."):format(ESX.GetWeaponLabel(weaponName)))
                    end
                end
            end
            
            if next(weapons) == nil then
                disabledWeapons[identifier] = nil
            end
        end
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    MySQL.Async.fetchAll('SELECT * FROM disabled_weapons WHERE identifier = @identifier AND expire_time > UNIX_TIMESTAMP()', {
        ['@identifier'] = xPlayer.identifier
    }, function(results)
        if #results > 0 then
            if not disabledWeapons[xPlayer.identifier] then
                disabledWeapons[xPlayer.identifier] = {}
            end
            
            for _, data in ipairs(results) do
                disabledWeapons[xPlayer.identifier][data.weapon] = {
                    expireTime = data.expire_time,
                    disabledBy = data.disabled_by
                }
                xPlayer.showNotification(("Votre arme %s est toujours désactivée."):format(ESX.GetWeaponLabel(data.weapon)))
            end
            
            syncDisabledWeapons(source, xPlayer.identifier)
        end
    end)
end) 