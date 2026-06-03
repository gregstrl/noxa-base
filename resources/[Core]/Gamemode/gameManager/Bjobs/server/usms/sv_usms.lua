--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

-- Props

local Objectusms = {}

RegisterNetEvent('Koy:usms:AddProps')
AddEventHandler('Koy:usms:AddProps', function(netId)
    table.insert(Objectusms, netId)
end)

RegisterNetEvent('Koy:usms:RemoveProps')
AddEventHandler('Koy:usms:RemoveProps', function(netId)
    for index, ObjId in pairs(Objectusms) do
        if (ObjId == netId) then
            table.remove(Objectusms, index)
        end
    end
end)


ESX.RegisterServerCallback('GetAllPropsusms', function(source, cb)
    cb(Objectusms)
end)

RegisterServerEvent('annonce:serviceusms')
AddEventHandler('annonce:serviceusms', function(status)
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
    if xPlayer.job.name == 'usms' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'usms' then
                TriggerClientEvent('usms:InfoService', xPlayers[i], status, name)
            end
        end
    else
        xPlayer.ban(0, '(annonce:serviceusms)');
    end
end)

RegisterServerEvent('usms:verif')
AddEventHandler('usms:verif', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'usms' then
        xPlayer.ban(0, '(usms:verif)');
    end
end)

RegisterNetEvent('usms:spawnVehicle', function(model, position, heading)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'usms' then
        xPlayer.ban(0, '(usms:spawnVehicle)');
        return
    end
    ESX.SpawnVehicle(GetHashKey(model), position, heading, nil, false, nil, function(vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
end)


AddEventHandler('playerDropped', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not xPlayer then return end

    -- Liste des armes à retirer
    local weaponsToRemove = {
        "WEAPON_MUSKET",
        "weapon_stungun",
        "weapon_nightstick",
        "weapon_pumpshotgun",
        "weapon_heavysniper",
        "weapon_combatpistol",
        "weapon_carbinerifle"
    }

    -- Parcourt la liste et retire les armes si le joueur les possède
    for _, weapon in ipairs(weaponsToRemove) do
        if xPlayer.hasWeapon(weapon) then
            xPlayer.removeWeapon(weapon)
        end
    end
end)
RegisterServerEvent('buyWeaponForUSMS')
AddEventHandler('buyWeaponForUSMS', function(weapon)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	local coords = GetEntityCoords(GetPlayerPed(source));
	local distance = #(coords - vector3(1835.103027, 3693.154785, 34.71));
	if xPlayer.job.name == 'usms' then
		if weapon == "weapon_stungun" or weapon == "weapon_flashlight" or weapon == "weapon_nightstick" or weapon == "weapon_combatpistol" or weapon == "weapon_carbinerifle" or weapon == "weapon_pumpshotgun" then
			if (distance < 35.0) then
				if not xPlayer.hasWeapon(weapon) then
					xPlayer.addWeapon(weapon, 255)
				else
					TriggerClientEvent('esx:showNotification', source, "~s~Vous possédez déjà ceci.")
				end
			else
				xPlayer.ban(0, '(buyWeaponForUSMS)');
			end
		else
			xPlayer.ban(0, '(buyWeaponForUSMS)');
		end
	else
        xPlayer.ban(0, '(buyWeaponForUSMS)');
    end
end)

RegisterServerEvent('message', function(player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local pName = xPlayer.getName()
    if (xPlayer.job.name == "usms" and player) then
        if (#(GetEntityCoords(GetPlayerPed(xPlayer.source)) - GetEntityCoords(GetPlayerPed(player))) < 5.0) then
            TriggerClientEvent('esx:showNotification', player, "👮 L'U.S Marshal vous fouille")
        end
    end
end);

RegisterServerEvent('demande')
AddEventHandler('demande', function(coords, raison)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
    if xPlayer.job.name == 'usms' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'usms' then
                TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, raison)
            end
        end
    else
        xPlayer.ban(0, '(demande)');
    end
end)


RegisterNetEvent('confiscatePlayerItemusms', function(target, itemType, itemName, amount)
    local source = source
    local sourceXPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    if (not sourceXPlayer or not targetXPlayer) then return end

    local ped = GetPlayerPed(sourceXPlayer.source);
    local targetPed = GetPlayerPed(targetXPlayer.source);

    if sourceXPlayer.job.name ~= 'usms' then
        xPlayer.ban(0, '(confiscatePlayerItemusms)');
    else
        if (#(GetEntityCoords(targetPed) - GetEntityCoords(ped)) < 4.0) then
            if itemType == 'item_standard' then
                local sourceItem = sourceXPlayer.getInventoryItem(itemName)
                TriggerEvent('esx_addoninventory:getSharedInventory', 'usms', function(inventory)
                    if (amount and tonumber(amount) and sourceItem and sourceItem.count and tonumber(sourceItem.count)) then
                        if sourceItem.count >= amount and amount > 0 then 
                            inventory.addItem(itemName, amount);
                            targetXPlayer.removeInventoryItem(itemName, amount);
                            TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~g~"..amount..' '..sourceItem.label.."~s~.")
                            TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~s~"..amount..' '..sourceItem.label.."~s~.")
                            SendLogs("usms", "Koy | usms", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre un item "..amount.." "..sourceItem.label.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1260736064994152469/k0vvylQcDrIgT23Hrbfx98J-vYB6VIdLXf6Z0jO6IR29azqdB0P-pfT-Df94n0FlOZ-O")
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
                    TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~s~"..amount.."$ ~s~argent non déclaré~s~.");
                    SendLogs("usms", "Koy | usms", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre de l'argent "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1260736064994152469/k0vvylQcDrIgT23Hrbfx98J-vYB6VIdLXf6Z0jO6IR29azqdB0P-pfT-Df94n0FlOZ-O")
                else
                    TriggerClientEvent('esx:showNotification', source, "Quantité invalide");
                end
            end
        
            if itemType == 'item_weapon' then
                if (targetXPlayer.hasWeapon(string.upper(itemName))) then
                    targetXPlayer.removeWeapon(itemName, 0);
                    TriggerEvent('esx_datastore:getSharedDataStore', 'usms', function(store)
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
                    SendLogs("usms", "Koy | usms", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre une arme "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1260736064994152469/k0vvylQcDrIgT23Hrbfx98J-vYB6VIdLXf6Z0jO6IR29azqdB0P-pfT-Df94n0FlOZ-O")
                end
            end
        end
    end
end);

ESX.RegisterServerCallback('getOtherPlayerDatausms', function(source, cb, target, notify)
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

ESX.RegisterServerCallback('getVehicleInfos', function(source, cb, plate)
    MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)

        local retrivedInfo = {
            plate = plate
        }

        if result[1] then
            MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier',  {
                ['@identifier'] = result[1].owner
            }, function(result2)

                --if Config.EnableESXIdentity then
                    retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname
            --	else
                    retrivedInfo.owner = result2[1].name
                --end

                cb(retrivedInfo)
            end)
        else
            cb(retrivedInfo)
        end
    end)
end)


RegisterNetEvent("usms:SendFacture", function(target, price)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'usms' then
        xPlayer.ban(0, '(usms:SendFacture)');
        return
	end

    local society = ESX.DoesSocietyExist("usms");

    if (society) then

        local xTarget = ESX.GetPlayerFromId(target);

        if (xTarget) then

            xTarget.removeAccountMoney('bank', price);
            ESX.AddSocietyMoney("usms", price);
            xTarget.showNotification("Votre compte en banque à été réduit de "..price.."~g~$~s~.");
            xPlayer.showNotification("Vous avez donné une amende de "..price.."~g~$~s~");
            SendLogs("Facture", "Koy | Facture", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) vient d'envoyer une facture de "..price.."$ au joueur **"..xTarget.name.."** (***"..xTarget.identifier.."***) pour l'entreprise **usms** ", "https://discord.com/api/webhooks/1324574130284134420/1zQ7seVAHceUxcMGkuuVOk2VSbmAUxEygNa8BnOmDUqG0IV0iEAIq-amztlkawpOm_e2")

        end

    end

end);

ESX.RegisterServerCallback('fusms:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'usms', function(inventory)
		cb(inventory.items)
	end)
end)


ESX.RegisterServerCallback('fusms:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

--johnny

ClothesPlayer = {}

Citizen.CreateThread(function()
    MySQL.Async.fetchAll("SELECT * FROM clothes_societies ", {}, function(result)
        for k, v in pairs(result) do
            if not ClothesPlayer[v.identifier] then 
                ClothesPlayer[v.identifier] = {}
            end
            if not ClothesPlayer[v.identifier][v.id] then
                ClothesPlayer[v.identifier][v.id] = {}
            end 
            ClothesPlayer[v.identifier][v.id].identifier = v.identifier
            ClothesPlayer[v.identifier][v.id].label = v.label 
            ClothesPlayer[v.identifier][v.id].skin = v.skin
            ClothesPlayer[v.identifier][v.id].type = v.type
            ClothesPlayer[v.identifier][v.id].equip = v.equip
            ClothesPlayer[v.identifier][v.id].id = v.id
        end
        print('[^4LOAD^0] [^4'..#result..'^0] Tenues ont été load avec succès')
    end)
end)


RegisterNetEvent("johnny:addtenue", function(label, skin)
    local NumberCount = 0
    local xPlayer = ESX.GetPlayerFromId(source)
    local NumberTenueAutorized = 9999
    if not ClothesPlayer[xPlayer.identifier] then
        NumberCount = 0
    else
        NumberCount = 0
    end

    if NumberCount+1 > NumberTenueAutorized then 
        xPlayer.showNotification('Vous avez déjà trop de tenue.')
    else
        local IdTenue = math.random(11111,99999)
        local IdTenue2 = math.random(11111,99999)
        local ValidateID = IdTenue+IdTenue2

        if not ClothesPlayer[xPlayer.identifier][ValidateID] then
            ClothesPlayer[xPlayer.identifier][ValidateID] = {}
            ClothesPlayer[xPlayer.identifier][ValidateID].identifier = xPlayer.identifier
            ClothesPlayer[xPlayer.identifier][ValidateID].label = label
            ClothesPlayer[xPlayer.identifier][ValidateID].type = "vetement"
            ClothesPlayer[xPlayer.identifier][ValidateID].equip = "n"
            ClothesPlayer[xPlayer.identifier][ValidateID].skin = json.encode(skin)
            ClothesPlayer[xPlayer.identifier][ValidateID].id = ValidateID
        end
        MySQL.Async.execute("INSERT INTO clothes_societies (label, skin, type, identifier) VALUES (@label, @skin, @type, @identifier)", {
            ["@label"] = tostring(label),
            ["@skin"] = json.encode(skin),
            ["@type"] = "vetement",
            ["@identifier"] = xPlayer.identifier 
        })
        xPlayer.showNotification('Vous avez crée une tenue (~g~'..label..'~w~)')
        TriggerClientEvent("johnny:recieveclientsidevetement", xPlayer.source, ClothesPlayer[xPlayer.identifier])
       
    end
end)


RegisterNetEvent('johnny:RenameTenue', function(id, NewLabel)
    local xPlayer = ESX.GetPlayerFromId(source)
    if ClothesPlayer[xPlayer.identifier][id] then
        if ClothesPlayer[xPlayer.identifier][id].identifier == xPlayer.identifier then
            xPlayer.showNotification('Vous avez renommer votre tenue (~g~'..ClothesPlayer[xPlayer.identifier][id].label..'~w~)')
            ClothesPlayer[xPlayer.identifier][id].label = NewLabel
            TriggerClientEvent("johnny:recieveclientsidevetement", xPlayer.source, ClothesPlayer[xPlayer.identifier])
            MySQL.Async.execute("UPDATE clothes_societies set label = @label WHERE id = @id", {
                ["@label"] = tostring(NewLabel),
                ["@id"] = id
            })
        else
            DropPlayer(source, 'Mhh c\'est chaud c\'que t\'essaie de faire')
        end
    end
end)

RegisterNetEvent('johnny:deletetenue', function(id, NewLabel)
    local xPlayer = ESX.GetPlayerFromId(source)
    if ClothesPlayer[xPlayer.identifier][id] then
        if ClothesPlayer[xPlayer.identifier][id].identifier == xPlayer.identifier then
            xPlayer.showNotification('Vous avez supprimer votre tenue (~g~'..ClothesPlayer[xPlayer.identifier][id].label..'~w~)')
            ClothesPlayer[xPlayer.identifier][id] = nil
            TriggerClientEvent("johnny:recieveclientsidevetement", xPlayer.source, ClothesPlayer[xPlayer.identifier])
            MySQL.Async.execute("DELETE FROM clothes_societies WHERE id = @id", {
                ["@id"] = id
            })
        else
            DropPlayer(source, 'Mhh c\'est chaud c\'que t\'essaie de faire')
        end
    end
end)

AddEventHandler("esx:playerLoaded", function(source, xPlayer)
    if not xPlayer then return end

    if not ClothesPlayer[xPlayer.identifier] then 
        ClothesPlayer[xPlayer.identifier] = {}
        TriggerClientEvent("johnny:recieveclientsidevetement", xPlayer.source, nil)
    else
        TriggerClientEvent("johnny:recieveclientsidevetement", xPlayer.source, ClothesPlayer[xPlayer.identifier])
    end
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

RegisterServerEvent('usms:avocat')
AddEventHandler('usms:avocat', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'USMS', '~b~Annonce', 'Un avocat est prié de se présenter au PDP', '#0055ff', 'CHAR_USMS')
	end
end)

RegisterServerEvent('usms:annonce')
AddEventHandler('usms:annonce', function(annonce)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'USMS', '~b~Annonce', annonce, '#0055ff', 'CHAR_USMS')
        sendToDiscord("Annonce USMS", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)
    end
end)


RegisterServerEvent('usms:requestArrest')
AddEventHandler('usms:requestArrest', function(targetId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.job.name == 'usms' then
        TriggerClientEvent('usms:getArrested', targetId, source)
        TriggerClientEvent('usms:handcuffAnimation', source)
    end
end)