--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil


TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

-- Props

local Objectlsco = {}
local activeReports2 = {}


RegisterNetEvent('Koy:lsco:AddProps')
AddEventHandler('Koy:lsco:AddProps', function(netId)
    table.insert(Objectlsco, netId)
end)

RegisterNetEvent('Koy:lsco:RemoveProps')
AddEventHandler('Koy:lsco:RemoveProps', function(netId)
    for index, ObjId in pairs(Objectlsco) do
        if (ObjId == netId) then
            table.remove(Objectlsco, index)
        end
    end
end)


ESX.RegisterServerCallback('GetAllPropslsco', function(source, cb)
    cb(Objectlsco)
end)
--

RegisterServerEvent('annonce:servicelsco')
AddEventHandler('annonce:servicelsco', function(status)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName(source)
    local xPlayers = ESX.GetPlayers()
    if status == "fin" then
        if xPlayer.hasWeapon("weapon_stungun") then
            xPlayer.removeWeapon("weapon_stungun")
        end
        if xPlayer.hasWeapon("weapon_nightstick") then
            xPlayer.removeWeapon("weapon_nightstick")
        end
        if xPlayer.hasWeapon("weapon_combatpistol") then
            xPlayer.removeWeapon("weapon_combatpistol")
        end
        if xPlayer.hasWeapon("weapon_carbinerifle") then
            xPlayer.removeWeapon("weapon_carbinerifle")
        end
    end
    if xPlayer.job.name == 'lsco' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'lsco' then
                TriggerClientEvent('lsco:InfoService', xPlayers[i], status, name)
            end
        end
    else
        xPlayer.ban(0, '(annonce:servicelsco)');
    end
end)

RegisterServerEvent('lsco:verif')
AddEventHandler('lsco:verif', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'lsco' then
        xPlayer.ban(0, '(lsco:verif)');
    end
end)

RegisterNetEvent('lsco:spawnVehicle', function(model, position, heading)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'lsco' then
        xPlayer.ban(0, '(lsco:spawnVehicle)');
        return
    end
    ESX.SpawnVehicle(GetHashKey(model), position, heading, nil, false, nil, function(vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
end)

RegisterServerEvent('buyWeaponForlsco')
AddEventHandler('buyWeaponForlsco', function(weapon)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	local coords = GetEntityCoords(GetPlayerPed(source));
	local distance = #(coords - vector3(-443.881256, 6014.046387, 37.00));
	if xPlayer.job.name == 'lsco' then
		if weapon == "weapon_stungun" or weapon == "weapon_flashlight" or weapon == "weapon_nightstick" or weapon == "weapon_combatpistol" or weapon == "weapon_carbinerifle" or weapon == "weapon_pumpshotgun" then
			if (distance < 35.0) then
				if not xPlayer.hasWeapon(weapon) then
					xPlayer.addWeapon(weapon, 255)
				else
					TriggerClientEvent('esx:showNotification', source, "~s~Vous possédez déjà ceci.")
				end
			else
				xPlayer.ban(0, '(buyWeaponForlsco)');
			end
		else
			xPlayer.ban(0, '(buyWeaponForlsco)');
		end
	else
        xPlayer.ban(0, '(buyWeaponForlsco)');
    end
end)


RegisterServerEvent('message', function(player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local pName = xPlayer.getName()
    if (xPlayer.job.name == "lsco" and player) then
        if (#(GetEntityCoords(GetPlayerPed(xPlayer.source)) - GetEntityCoords(GetPlayerPed(player))) < 5.0) then
            TriggerClientEvent('esx:showNotification', player, "👮 La lsco vous fouille")
        end
    end
end);

RegisterServerEvent('demandelsco')
AddEventHandler('demandelsco', function(coords, raison)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
    if xPlayer.job.name == 'lsco' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'lsco' then
                TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, raison)
            end
        end
    else
        xPlayer.ban(0, '(demandelsco)');
    end
end)


RegisterNetEvent('confiscatePlayerItemlsco', function(target, itemType, itemName, amount)
    local source = source
    local sourceXPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    if (not sourceXPlayer or not targetXPlayer) then return end

    local ped = GetPlayerPed(sourceXPlayer.source);
    local targetPed = GetPlayerPed(targetXPlayer.source);

    if sourceXPlayer.job.name ~= 'lsco' then
        xPlayer.ban(0, '(confiscatePlayerItemlsco)');
    else
        if (#(GetEntityCoords(targetPed) - GetEntityCoords(ped)) < 4.0) then
            if itemType == 'item_standard' then
                local sourceItem = sourceXPlayer.getInventoryItem(itemName)
                TriggerEvent('esx_addoninventory:getSharedInventory', 'lsco', function(inventory)
                    if (amount and tonumber(amount) and sourceItem and sourceItem.count and tonumber(sourceItem.count)) then
                        if sourceItem.count >= amount and amount > 0 then 
                            inventory.addItem(itemName, amount);
                            targetXPlayer.removeInventoryItem(itemName, amount);
                            TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~g~"..amount..' '..sourceItem.label.."~s~.")
                            TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~g~"..amount..' '..sourceItem.label.."~s~.")
                            SendLogs("lsco", "Koy | lsco", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre un item "..amount.." "..sourceItem.label.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1260736064994152469/k0vvylQcDrIgT23Hrbfx98J-vYB6VIdLXf6Z0jO6IR29azqdB0P-pfT-Df94n0FlOZ-O")
                        else
                            TriggerClientEvent('esx:showNotification', source, "Quantité invalide");
                        end
                    end
                end);
            end         
            if itemType == 'item_account' then
                local targetAccount = targetXPlayer.getAccount(itemName)
                if (targetAccount and targetAccount.money >= amount) then
                    targetXPlayer.removeAccountMoney(itemName, amount);
                    TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~g~"..amount.."$ ~s~argent non déclaré~s~.");
                    TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~g~"..amount.."$ ~s~argent non déclaré~s~.");
                    SendLogs("lsco", "Koy | lsco", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre de l'argent "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1260736064994152469/k0vvylQcDrIgT23Hrbfx98J-vYB6VIdLXf6Z0jO6IR29azqdB0P-pfT-Df94n0FlOZ-O")
                else
                    TriggerClientEvent('esx:showNotification', source, "Quantité invalide");
                end
            end
        
            if itemType == 'item_weapon' then
                if (targetXPlayer.hasWeapon(string.upper(itemName))) then
                    targetXPlayer.removeWeapon(itemName, 0);
                    TriggerEvent('esx_datastore:getSharedDataStore', 'lsco', function(store)
                        local weapons = store.get('weapons') or {}
                        local foundWeapon = false

                        for i=1, #weapons, 1 do
                            if weapons[i].name == itemName then
                                weapons[i].count = weapons[i].count + 1
                                foundWeapon = true
                                break
                            end
                        end

                        if not foundWeapon then
                            table.insert(weapons, {
                                name  = itemName,
                                count = 1
                            })
                        end                    
                        store.set('weapons', weapons)
                    end)
                    SendLogs("lsco", "Koy | lsco", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre une arme "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1260736064994152469/k0vvylQcDrIgT23Hrbfx98J-vYB6VIdLXf6Z0jO6IR29azqdB0P-pfT-Df94n0FlOZ-O")
                end
            end
        end
    end
end);


ESX.RegisterServerCallback('getOtherPlayerDatalsco', function(source, cb, target, notify)
    local xPlayer = ESX.GetPlayerFromId(target)

    if xPlayer then
        local data = {
            name = xPlayer.getName(),
            job = xPlayer.job.label,
            grade = xPlayer.job.grade_label,
            inventory = xPlayer.getInventory(),
            accounts = xPlayer.getAccounts(),
            weapons = xPlayer.getLoadout()
        }

        cb(data)
    end
end)

RegisterNetEvent("lsco:SendFacture", function(target, price)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'lsco' then
        xPlayer.ban(0, '(lsco:SendFacture)');
        return
	end

    local society = ESX.DoesSocietyExist("lsco");

    if (society) then

        local xTarget = ESX.GetPlayerFromId(target);

        if (xTarget) then

            xTarget.removeAccountMoney('bank', price);
            ESX.AddSocietyMoney("lsco", price);
            xTarget.showNotification("Votre compte en banque à été réduit de "..price.."~g~$~s~.");
            xPlayer.showNotification("Vous avez donné une amende de "..price.."~g~$~s~");
            SendLogs("Facture", "Koy | Facture", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) vient d'envoyer une facture de "..price.."$ au joueur **"..xTarget.name.."** (***"..xTarget.identifier.."***) pour l'entreprise **lsco** ", "https://discord.com/api/webhooks/1324574130284134420/1zQ7seVAHceUxcMGkuuVOk2VSbmAUxEygNa8BnOmDUqG0IV0iEAIq-amztlkawpOm_e2")

        end

    end

end);

ESX.RegisterServerCallback('flsco:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'lsco', function(inventory)
		cb(inventory.items)
	end)
end)


ESX.RegisterServerCallback('flsco:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)


ESX.RegisterServerCallback('johnny:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll('SELECT owner, vehicle FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)

		local retrivedInfo = {
			plate = plate
		}

		if result[1] then
			MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname

				retrivedInfo.vehicle = json.decode(result[1].vehicle)

				cb(retrivedInfo)

			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

RegisterServerEvent('lsco:avocat')
AddEventHandler('lsco:avocat', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'lsco', '~b~Annonce', 'Un avocat est prié de se présenter au PDP', '#0055ff', 'CHAR_LSCO')
	end
end)

RegisterServerEvent('lsco:annonce')
AddEventHandler('lsco:annonce', function(annonce)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'lsco', '~b~Annonce', annonce, '#0055ff', 'CHAR_LSCO')
        sendToDiscord("Annonce LSCO", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)
    end
end)

RegisterNetEvent('lsco:reportShooting')
AddEventHandler('lsco:reportShooting', function(coords, street, zone, report)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local isInGunfight = exports['Core']:isPlayerInGunfight(source)
    if isInGunfight then
        return
    end
    
    for _, report in pairs(activeReports2) do
        local distance = #(vector3(coords.x, coords.y, coords.z) - vector3(report.coords.x, report.coords.y, report.coords.z))
        if distance < 50.0 then
            return
        end
    end
    
    local reportId = #activeReports2 + 1
    local report = {
        id = reportId,
        type = report and report.type or "Coups de feu signalés",
        coords = coords,
        taken = false,
        reportedBy = source,
        street = street,
        zone = zone,
        description = report and report.description or "Signalement de coups de feu"
    }
    
    table.insert(activeReports2, report)
    
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'lsco' then
            TriggerClientEvent('lsco:receiveReport', xPlayers[i], report)
        end
    end
end) 

RegisterNetEvent('DealDeDrogueEnCoursLSCO')
AddEventHandler('DealDeDrogueEnCoursLSCO', function(coords, sex, locationName)
    local source = source
    
    for _, report in pairs(activeReports2) do
        local distance = #(vector3(coords.x, coords.y, coords.z) - vector3(report.coords.x, report.coords.y, report.coords.z))
        if distance < 50.0 and report.type == "Vente de drogue" then
            return
        end
    end
    
    local reportId = #activeReports2 + 1
    local report = {
        id = reportId,
        type = "Vente de drogue",
        coords = coords,
        taken = false,
        reportedBy = source,
        street = "Rue inconnue",
        zone = locationName,
        description = "Signalement de vente de drogue " .. sex
    }
    
    table.insert(activeReports2, report)
    
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'lsco' then
            TriggerClientEvent('lsco:receiveReport', xPlayers[i], report)
        end
    end
end)

RegisterNetEvent('lsco:takeReport')
AddEventHandler('lsco:takeReport', function(reportId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.job.name == 'lsco' then
        for k, report in pairs(activeReports2) do
            if report.id == reportId and not report.taken then
                report.taken = true
                report.takenBy = source
                report.takenByName = xPlayer.getName()
                TriggerClientEvent('lsco:reportTaken', source, report)
                
                local xPlayers = ESX.GetPlayers()
                for i=1, #xPlayers do
                    local targetPlayer = ESX.GetPlayerFromId(xPlayers[i])
                    if targetPlayer.job.name == 'lsco' then
                        TriggerClientEvent('lsco:updateReportStatus', xPlayers[i], reportId, report.takenByName)
                    end
                end
                break
            end
        end
    end
end)

RegisterNetEvent('lsco:closeReport')
AddEventHandler('lsco:closeReport', function(reportId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.job.name == 'lsco' then
        for k, report in pairs(activeReports2) do
            if report.id == reportId and report.takenBy == source then
                table.remove(activeReports2, k)
                
                local xPlayers = ESX.GetPlayers()
                for i=1, #xPlayers do
                    local targetPlayer = ESX.GetPlayerFromId(xPlayers[i])
                    if targetPlayer.job.name == 'lsco' then
                        TriggerClientEvent('lsco:reportClosed', xPlayers[i], reportId)
                    end
                end
                break
            end
        end
    end
end)

ESX.RegisterServerCallback('lsco:getactiveReports2', function(source, cb)
    cb(activeReports2)
end)

RegisterServerEvent('lsco:requestArrest')
AddEventHandler('lsco:requestArrest', function(targetId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.job.name == 'lsco' then
        TriggerClientEvent('lsco:getArrested', targetId, source)
        TriggerClientEvent('lsco:handcuffAnimation', source)
    end
end)

RegisterNetEvent('lsco:clearAllReports')
AddEventHandler('lsco:clearAllReports', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.job.name == 'lsco' then
        activeReports2 = {}
        
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers do
            local targetPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if targetPlayer.job.name == 'lsco' then
                TriggerClientEvent('lsco:allReportsCleared', xPlayers[i])
            end
        end
    end
end)