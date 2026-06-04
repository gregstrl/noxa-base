--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj 
end)

local JobCustoms = {
    ['mecano'] = true,
    ['mecano2'] = true,
    ['autoexotic'] = true,
    ['larrys'] = true,
}



RegisterServerEvent("BuyLsCustoms")
AddEventHandler("BuyLsCustoms", function(newVehProps, amount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local job = xPlayer.job.name
    local societyAccount = nil
    -- Securite : le montant vient du client. Entier strictement positif obligatoire,
    -- sinon un montant negatif credite la societe (RemoveSocietyMoney avec valeur < 0).
    local price = tonumber(amount)
    if (not price) or price <= 0 or price ~= math.floor(price) then return end
    TriggerEvent('Mecano:refreshOwnedVehicle', newVehProps)
    TriggerClientEvent("Mecano:installMod", _src)
    ESX.RemoveSocietyMoney(job, price)
end)

RegisterServerEvent("BuyLsCustomsPDG")
AddEventHandler("BuyLsCustomsPDG", function(newVehProps, amount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    local job = xPlayer.job.name
    local societyAccount = nil
    -- Securite : le montant vient du client. Entier strictement positif obligatoire,
    -- sinon un montant negatif credite la societe (RemoveSocietyMoney avec valeur < 0).
    local price = tonumber(amount)
    if (not price) or price <= 0 or price ~= math.floor(price) then return end
    TriggerEvent('Mecano:refreshOwnedVehicle', newVehProps)
    TriggerClientEvent("Mecano:installMod", _src)
    ESX.RemoveSocietyMoney(job, price)
end)


ESX.RegisterServerCallback("Koy:PayCustom", function(source, cb, tplayer, price, societyName)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer == nil then
            return
        end
        -- Securite : le prix vient du client. Entier strictement positif obligatoire,
        -- sinon un prix negatif credite la cible et vide la societe.
        price = tonumber(price)
        if (not price) or price <= 0 or price ~= math.floor(price) then
            cb(false)
            return
        end
        local tPlayer = ESX.GetPlayerFromId(tplayer)
        local job = xPlayer.job.name
        local societyExists = ESX.DoesSocietyExist(job)

        if tPlayer then
            if societyExists then
                if tPlayer.getAccount("bank").money >= price then
                    tPlayer.removeAccountMoney("bank", price)
                    tPlayer.showNotification("Vous avez payé ~g~" .. price .. "$~s~.")
                    ESX.AddSocietyMoney(job, price)
                    xPlayer.showNotification("Le client a payé ~g~" .. price .. "$~s~.")
                    print(tPlayer.getAccount("bank").money)
                    cb(true)
                else
                    cb(false)
                end
            else
                cb(false)
            end
        else
            cb(false)
        end
    end
)

ESX.RegisterServerCallback("Koy:PayCustomPatron", function(source, cb, tplayer, price, societyName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer == nil then
        return
    end
    -- Securite : le prix vient du client. Entier strictement positif obligatoire,
    -- sinon un prix negatif credite le joueur et vide la societe.
    price = tonumber(price)
    if (not price) or price <= 0 or price ~= math.floor(price) then
        cb(false)
        return
    end
    local job = xPlayer.job.name
    local societyExists = ESX.DoesSocietyExist(job)

    if xPlayer then
        if societyExists then
            if xPlayer.getAccount("bank").money >= price then
                xPlayer.removeAccountMoney("bank", price)
                xPlayer.showNotification("Vous avez payé ~g~" .. price .. "$~s~.")
                ESX.AddSocietyMoney(job, price)
                cb(true)
            else
                cb(false)
            end
        else
            cb(false)
        end
    else
        cb(false)
    end
end
)


RegisterNetEvent('Mecano:refreshOwnedVehicle', function(myCar)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE @plate = plate', {
        ['@plate'] = myCar.plate
    }, function(result)
        if result[1] then

        MySQL.Async.execute('UPDATE `owned_vehicles` SET `vehicle` = @vehicle WHERE `plate` = @plate',
        {
            ['@plate'] = myCar.plate,
            ['@vehicle'] = json.encode(myCar)
        })
        end
    end)
end)



RegisterServerEvent("Koy:mechanic:requestPlayerBillsState", function(target_player_source)

    if (type(target_player_source) ~= "number") then
        return
    end

    local player_source = source
    local player_source_data = ESX.GetPlayerFromId(player_source)
    local target_player_source_data = ESX.GetPlayerFromId(target_player_source)

    if (player_source_data ~= nil and target_player_source_data ~= nil) then

        MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @a', {
        ['@a'] = target_player_source_data.getIdentifier()
        }, function(player_bills)

            if (player_bills[1] ~= nil) then

                player_source_data.showNotification("La personne sélectionner a déjà une ou plusieurs factures impayées.")
                target_player_source_data.showNotification("Vous avez déjà une ou plusieurs factures impayées.");
                player_source_data.triggerEvent("Koy:mechanic:receivePlayerBillsState", false);

            else

                player_source_data.triggerEvent("Koy:mechanic:receivePlayerBillsState", true);

            end

        end);

    end

end);


ESX.RegisterUsableItem('cleankit', function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('use:Chiffon', source)
end)

ESX.RegisterUsableItem('carokit', function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('use:carokit', source)
end)

ESX.RegisterUsableItem('jerican', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('use:jerican', source)
end)


RegisterServerEvent('usecarokit')
AddEventHandler('usecarokit', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('carokit', 1)
end)

RegisterServerEvent('useJerican')
AddEventHandler('useJerican', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('jerican', 1)
end)

RegisterServerEvent('useChiffon')
AddEventHandler('useChiffon', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('cleankit', 1)
end)

function SendLogs(name, title, message, web)
    local local_date = os.date('%H:%M:%S', os.time())
  
	local embeds = {
		{
			["title"]= title,
			["description"]= message,
			["type"]= "rich",
			["color"] = 652101,
			["footer"]=  {
				["text"]= "Powered by wise ©   |  "..local_date.."",
				["icon_url"] = "https://i.imgur.com/.png"
			},
		}
	}
  
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(web, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end