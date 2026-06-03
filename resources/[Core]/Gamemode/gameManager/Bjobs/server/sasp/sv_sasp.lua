ESX = nil


TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

-- Props

local Objectsasp = {}
local activeReports = {}

RegisterNetEvent('Koy:sasp:AddProps')
AddEventHandler('Koy:sasp:AddProps', function(netId)
    table.insert(Objectsasp, netId)
end)

RegisterNetEvent('Koy:sasp:RemoveProps')
AddEventHandler('Koy:sasp:RemoveProps', function(netId)
    for index, ObjId in pairs(Objectsasp) do
        if (ObjId == netId) then
            table.remove(Objectsasp, index)
        end
    end
end)

RegisterNetEvent('sasp:reportShooting')
AddEventHandler('sasp:reportShooting', function(coords, street, zone, report)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local isInGunfight = exports['Core']:isPlayerInGunfight(source)
    if isInGunfight then
        return
    end
    
    for _, report in pairs(activeReports) do
        local distance = #(vector3(coords.x, coords.y, coords.z) - vector3(report.coords.x, report.coords.y, report.coords.z))
        if distance < 50.0 then
            return
        end
    end
    
    local reportId = #activeReports + 1
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
    
    table.insert(activeReports, report)
    
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'sasp' then
            TriggerClientEvent('sasp:receiveReport', xPlayers[i], report)
        end
    end
end) 

RegisterNetEvent('sasp:takeReport')
AddEventHandler('sasp:takeReport', function(reportId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.job.name == 'sasp' then
        for k, report in pairs(activeReports) do
            if report.id == reportId and not report.taken then
                report.taken = true
                report.takenBy = source
                report.takenByName = xPlayer.getName()
                TriggerClientEvent('sasp:reportTaken', source, report)
                
                local xPlayers = ESX.GetPlayers()
                for i=1, #xPlayers do
                    local targetPlayer = ESX.GetPlayerFromId(xPlayers[i])
                    if targetPlayer.job.name == 'sasp' then
                        TriggerClientEvent('sasp:updateReportStatus', xPlayers[i], reportId, report.takenByName)
                    end
                end
                break
            end
        end
    end
end)

ESX.RegisterServerCallback('sasp:getActiveReports', function(source, cb)
    cb(activeReports)
end)

ESX.RegisterServerCallback('GetAllPropssasp', function(source, cb)
    cb(Objectsasp)
end)
--

RegisterServerEvent('annonce:servicesasp')
AddEventHandler('annonce:servicesasp', function(status)
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
    if xPlayer.job.name == 'sasp' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'sasp' then
                TriggerClientEvent('sasp:InfoService', xPlayers[i], status, name)
            end
        end
    else
        xPlayer.ban(0, '(annonce:servicesasp)');
    end
end)

RegisterServerEvent('sasp:verif')
AddEventHandler('sasp:verif', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'sasp' then
        xPlayer.ban(0, '(sasp:verif)');
    end
end)

RegisterNetEvent('sasp:spawnVehicle', function(model, position, heading)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'sasp' then
        xPlayer.ban(0, '(sasp:spawnVehicle)');
        return
    end
    ESX.SpawnVehicle(GetHashKey(model), position, heading, nil, false, nil, function(vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
end)

RegisterServerEvent('buyWeaponForSASP')
AddEventHandler('buyWeaponForSASP', function(weapon)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	local coords = GetEntityCoords(GetPlayerPed(source));
	local distance = #(coords - vector3(452.254028, -998.024109, 30.710693));
	if xPlayer.job.name == 'sasp' then
		if weapon == "weapon_stungun" or weapon == "weapon_flashlight" or weapon == "weapon_nightstick" or weapon == "weapon_combatpistol" or weapon == "weapon_carbinerifle" or weapon == "weapon_pumpshotgun" then
			if (distance < 35.0) then
				if not xPlayer.hasWeapon(weapon) then
					xPlayer.addWeapon(weapon, 255)
				else
					TriggerClientEvent('esx:showNotification', source, "~s~Vous possédez déjà ceci.")
				end
			else
				xPlayer.ban(0, '(buyWeaponForSASP)');
			end
		else
			xPlayer.ban(0, '(buyWeaponForSASP)');
		end
	else
        xPlayer.ban(0, '(buyWeaponForSASP)');
    end
end)

RegisterServerEvent('menotterForsasp')
AddEventHandler('menotterForsasp', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target);
    
    if xPlayer.job.name == 'sasp' or xPlayer.job.name == 'gouv' or xPlayer.job.name == 'usms' or xPlayer.job.name == 'lsco' then
        if (target ~= -1 and targetXPlayer) then
            if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 5.0 ) then
                TriggerClientEvent('menotterlejoueursasp', target)
            end
        end
    else
        xPlayer.ban(0, '(menotterForsasp)');
    end
end);

RegisterServerEvent('escortersasp')
AddEventHandler('escortersasp', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target);
    
    if xPlayer.job.name == 'sasp' or xPlayer.job.name == 'gouv' or xPlayer.job.name == 'usms' or xPlayer.job.name == 'lsco' then
        if (target ~= -1 and targetXPlayer) then
            if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 5.0 ) then
                TriggerClientEvent('actionescortersasp', target, source)
            end
        end
    else
        xPlayer.ban(0, '(escortersasp)');
    end
end);


RegisterServerEvent('message', function(player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local pName = xPlayer.getName()
    if (xPlayer.job.name == "sasp" and player) then
        if (#(GetEntityCoords(GetPlayerPed(xPlayer.source)) - GetEntityCoords(GetPlayerPed(player))) < 5.0) then
            TriggerClientEvent('esx:showNotification', player, "👮 La sasp vous fouille")
        end
    end
end);

RegisterServerEvent('demandesasp')
AddEventHandler('demandesasp', function(coords, raison)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
    if xPlayer.job.name == 'sasp' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'sasp' then
                TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, raison)
            end
        end
    else
        xPlayer.ban(0, '(demandesasp)');
    end
end)


RegisterNetEvent('confiscatePlayerItemsasp', function(target, itemType, itemName, amount)
    local source = source
    local sourceXPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    if (not sourceXPlayer or not targetXPlayer) then return end

    local ped = GetPlayerPed(sourceXPlayer.source);
    local targetPed = GetPlayerPed(targetXPlayer.source);

    if sourceXPlayer.job.name ~= 'sasp' then
        xPlayer.ban(0, '(confiscatePlayerItemsasp)');
    else
        if (#(GetEntityCoords(targetPed) - GetEntityCoords(ped)) < 4.0) then
            if itemType == 'item_standard' then
                local sourceItem = sourceXPlayer.getInventoryItem(itemName)
                TriggerEvent('esx_addoninventory:getSharedInventory', 'sasp', function(inventory)
                    if (amount and tonumber(amount) and sourceItem and sourceItem.count and tonumber(sourceItem.count)) then
                        if sourceItem.count >= amount and amount > 0 then 
                            inventory.addItem(itemName, amount);
                            targetXPlayer.removeInventoryItem(itemName, amount);
                            TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~g~"..amount..' '..sourceItem.label.."~s~.")
                            TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~g~"..amount..' '..sourceItem.label.."~s~.")
                            SendLogs("sasp", "Kay | sasp", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre un item "..amount.." "..sourceItem.label.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1260736064994152469/k0vvylQcDrIgT23Hrbfx98J-vYB6VIdLXf6Z0jO6IR29azqdB0P-pfT-Df94n0FlOZ-O")
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
                    SendLogs("sasp", "Kay | sasp", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre de l'argent "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1260736064994152469/k0vvylQcDrIgT23Hrbfx98J-vYB6VIdLXf6Z0jO6IR29azqdB0P-pfT-Df94n0FlOZ-O")
                else
                    TriggerClientEvent('esx:showNotification', source, "Quantité invalide");
                end
            end
        
            if itemType == 'item_weapon' then
                if (targetXPlayer.hasWeapon(string.upper(itemName))) then
                    targetXPlayer.removeWeapon(itemName, 0);
                    TriggerEvent('esx_datastore:getSharedDataStore', 'sasp', function(store)
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
                    SendLogs("sasp", "Kay | sasp", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre une arme "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1260736064994152469/k0vvylQcDrIgT23Hrbfx98J-vYB6VIdLXf6Z0jO6IR29azqdB0P-pfT-Df94n0FlOZ-O")
                end
            end
        end
    end
end);


ESX.RegisterServerCallback('getOtherPlayerDatasasp', function(source, cb, target, notify)
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

RegisterNetEvent("sasp:SendFacture", function(target, price)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'sasp' then
        xPlayer.ban(0, '(sasp:SendFacture)');
        return
	end

    local society = ESX.DoesSocietyExist("sasp");

    if (society) then

        local xTarget = ESX.GetPlayerFromId(target);

        if (xTarget) then

            xTarget.removeAccountMoney('bank', price);
            ESX.AddSocietyMoney("sasp", price);
            xTarget.showNotification("Votre compte en banque à été réduit de "..price.."~g~$~s~.");
            xPlayer.showNotification("Vous avez donné une amende de "..price.."~g~$~s~");
            SendLogs("Facture", "Kay | Facture", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) vient d'envoyer une facture de "..price.."$ au joueur **"..xTarget.name.."** (***"..xTarget.identifier.."***) pour l'entreprise **sasp** ", "https://discord.com/api/webhooks/1324574130284134420/1zQ7seVAHceUxcMGkuuVOk2VSbmAUxEygNa8BnOmDUqG0IV0iEAIq-amztlkawpOm_e2")

        end

    end

end);

ESX.RegisterServerCallback('fsasp:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'sasp', function(inventory)
		cb(inventory.items)
	end)
end)


ESX.RegisterServerCallback('fsasp:getPlayerInventory', function(source, cb)
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

RegisterServerEvent('sasp:avocat')
AddEventHandler('sasp:avocat', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'SASP', '~b~Annonce', 'Un avocat est prié de se présenter au PDP', '#0055ff', 'CHAR_SASP')
	end
end)

RegisterServerEvent('sasp:annonce')
AddEventHandler('sasp:annonce', function(annonce)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'SASP', '~b~Annonce', annonce, '#0055ff', 'CHAR_SASP')
    end
end)


RegisterNetEvent('sasp:putInVehicle')
AddEventHandler('sasp:putInVehicle', function(target)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)
    
    if xPlayer.job.name == 'sasp' or xPlayer.job.name == 'gouv' or xPlayer.job.name == 'usms' or xPlayer.job.name == 'lsco' then
        local sourceCoords = GetEntityCoords(GetPlayerPed(source))
        local targetCoords = GetEntityCoords(GetPlayerPed(target))
        
        if #(sourceCoords - targetCoords) <= 3.0 then
            TriggerClientEvent('putInVehicle', target)
        end
    end
end)

RegisterNetEvent('sasp:OutVehicle')
AddEventHandler('sasp:OutVehicle', function(target)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)
    
    if xPlayer.job.name == 'sasp' or xPlayer.job.name == 'gouv' or xPlayer.job.name == 'usms' or xPlayer.job.name == 'lsco' then
        local sourceCoords = GetEntityCoords(GetPlayerPed(source))
        local targetCoords = GetEntityCoords(GetPlayerPed(target))
        
        if #(sourceCoords - targetCoords) <= 3.0 then
            TriggerClientEvent('outofVehicle', target)
        end
    end
end)

RegisterNetEvent('sasp:closeReport')
AddEventHandler('sasp:closeReport', function(reportId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.job.name == 'sasp' then
        for k, report in pairs(activeReports) do
            if report.id == reportId and report.takenBy == source then
                table.remove(activeReports, k)
                
                local xPlayers = ESX.GetPlayers()
                for i=1, #xPlayers do
                    local targetPlayer = ESX.GetPlayerFromId(xPlayers[i])
                    if targetPlayer.job.name == 'sasp' then
                        TriggerClientEvent('sasp:reportClosed', xPlayers[i], reportId)
                    end
                end
                break
            end
        end
    end
end)

RegisterNetEvent('DealDeDrogueEnCours')
AddEventHandler('DealDeDrogueEnCours', function(coords, sex, locationName)
    local source = source
    
    for _, report in pairs(activeReports) do
        local distance = #(vector3(coords.x, coords.y, coords.z) - vector3(report.coords.x, report.coords.y, report.coords.z))
        if distance < 50.0 and report.type == "Vente de drogue" then
            return
        end
    end
    
    local reportId = #activeReports + 1
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
    
    table.insert(activeReports, report)
    
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'sasp' then
            TriggerClientEvent('sasp:receiveReport', xPlayers[i], report)
        end
    end
end)

RegisterServerEvent('sasp:requestArrest')
AddEventHandler('sasp:requestArrest', function(targetId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.job.name == 'sasp' then
        TriggerClientEvent('sasp:getArrested', targetId, source)
        TriggerClientEvent('sasp:handcuffAnimation', source)
    end
end)

RegisterServerEvent('sasp:getUnpaidFines')
AddEventHandler('sasp:getUnpaidFines', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.job.name == 'sasp' then
        MySQL.Async.fetchAll('SELECT * FROM billing WHERE society = @society AND paid = 0', {
            ['@society'] = 'sasp'
        }, function(result)
            local fines = {}
            for _, bill in pairs(result) do
                table.insert(fines, {
                    label = bill.label,
                    price = bill.amount
                })
            end
            TriggerClientEvent('sasp:receiveUnpaidFines', source, fines)
        end)
    end
end)

RegisterNetEvent('sasp:clearAllReports')
AddEventHandler('sasp:clearAllReports', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.job.name == 'sasp' then
        activeReports = {}
        
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers do
            local targetPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if targetPlayer.job.name == 'sasp' then
                TriggerClientEvent('sasp:allReportsCleared', xPlayers[i])
            end
        end
    end
end)