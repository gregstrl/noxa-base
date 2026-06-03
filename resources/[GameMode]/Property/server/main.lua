ESX, Property, Sonnerie = nil, {}, {}

ESX = exports["Framework"]:getSharedObject()

UsersInfos, Property, myGarage, myVehicles = {}, {}, {}, {} 
ActiveStorageUsers = {}

RegisterNetEvent('esx:playerLoaded')

RegisterServerEvent("Property:setPlayerToBucket")
AddEventHandler("Property:setPlayerToBucket", function(propertyID)
    local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	local PlayerBucket = Config.Buckets["player"]+propertyID
	SetPlayerRoutingBucket(_src, PlayerBucket)
	SetRoutingBucketPopulationEnabled(PlayerBucket, false)
end)

RegisterServerEvent("Property:setPlayerToNormalBucket")
AddEventHandler("Property:setPlayerToNormalBucket", function()
    local _src = source
    SetPlayerRoutingBucket(_src, 0)
end)

RegisterServerEvent("Property:ExitInteract")
AddEventHandler("Property:ExitInteract", function(propertyID)
    local _src = source

    if Property[propertyID] and Property[propertyID].players then
        for i = #Property[propertyID].players, 1, -1 do
            if Property[propertyID].players[i].id == _src then
                table.remove(Property[propertyID].players, i)
                break
            end
        end
    end

    TriggerClientEvent("Property:ExitProperty", _src, propertyID)
end)


function isValidPropertyID(propertyID, source)
    if not propertyID or type(propertyID) ~= "number" then
        TriggerClientEvent("esx:showNotification", source, "~s~Erreur : ID de la propriété invalide")
        return false
    end
    return true
end

RegisterServerEvent("Property:EnteringInteract")
AddEventHandler("Property:EnteringInteract", function(propertyType, propertyID, isVisit)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    if not isValidPropertyID(propertyID, _src) then return end

    if not Property[propertyID] then 
        Property[propertyID] = { players = {} }
    end

    local alreadyInProperty = false
    for _, p in ipairs(Property[propertyID].players) do
        if p.id == _src then
            alreadyInProperty = true
            break
        end
    end

    if not alreadyInProperty then
        table.insert(Property[propertyID].players, {
            id = _src,
            playerName = GetPlayerName(_src),
            identifier = xPlayer.getIdentifier()
        })
    end

    TriggerClientEvent("Property:EnteringProperty", _src, propertyType, propertyID, isVisit)
end)


RegisterServerEvent("Property:openJobInteractionsMenu")
AddEventHandler("Property:openJobInteractionsMenu", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
	MySQL.Async.fetchAll("SELECT * FROM properties_build", {}, function(propertiesJobs)
        for k, v in pairs(propertiesJobs) do
            v.propertyEntering = json.decode(v.propertyEntering)
			v.propertyGarage = json.decode(v.propertyGarage)
			v.propertyRented = json.decode(v.propertyRented)
			v.data = json.decode(v.data)
			v.dataMoney = json.decode(v.dataMoney)
			v.ownerList = json.decode(v.ownerList)
        end
		TriggerClientEvent("Property:OpenBuilderMenu", _src, propertiesJobs)
    end)
end)



RegisterServerEvent("Property:AddProperty")
AddEventHandler("Property:AddProperty", function(PropertyInfos)
    local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	MySQL.Async.execute('INSERT INTO properties_build (propertyLabel, propertyInteriors, propertyEntering, propertyGarage, propertyRented, garageInteriors, maxStorage) VALUES (@propertyLabel, @propertyInteriors, @propertyEntering, @propertyGarage, @propertyRented, @garageInteriors, @maxStorage)',{
		['propertyLabel'] = PropertyInfos.NameOfProperty,
		['propertyInteriors'] = PropertyInfos.Interiors,
		['propertyEntering'] = json.encode(PropertyInfos.EnteringPos),
		['propertyGarage'] = json.encode(PropertyInfos.GaragePos),
		['propertyRented'] = json.encode(PropertyInfos.RentedPos),
		['garageInteriors'] = PropertyInfos.garageInteriors,
        ['maxStorage'] = PropertyInfos.AllowedStorage
	})
	TriggerClientEvent('esx:showNotification', _src, "~s~Agence Immobilière~s~\nPropriété : ~s~"..PropertyInfos.NameOfProperty.."~s~ crée !")
	SetTimeout(250, function()
		MySQL.Async.fetchAll("SELECT * FROM properties_build", {}, function(allProperties)
			for k, v in pairs(allProperties) do
				v.propertyEntering = json.decode(v.propertyEntering)
				v.propertyGarage = json.decode(v.propertyGarage)
				v.propertyRented = json.decode(v.propertyRented)
				v.data = json.decode(v.data)
				v.dataMoney = json.decode(v.dataMoney)
				v.ownerList = json.decode(v.ownerList)
			end
			TriggerClientEvent("Property:refreshProperty", -1, nil, allProperties) 
		end)
	end)
end)

RegisterServerEvent("Property:OwnedProperties")
AddEventHandler("Property:OwnedProperties", function(PropertyID)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)

    if not isValidPropertyID(PropertyID, _src) then return end

    MySQL.Async.fetchAll("SELECT * FROM properties_build WHERE propertyID = @propertyID", {
        ['@propertyID'] = PropertyID
    }, function(propertyResult)
        if not propertyResult or not propertyResult[1] then
            TriggerClientEvent("esx:showNotification", _src, "~s~Propriété introuvable")
            return
        end

        local propertyData = propertyResult[1]

        if propertyData.propertyEntering then propertyData.propertyEntering = json.decode(propertyData.propertyEntering) end
        if propertyData.propertyGarage then propertyData.propertyGarage = json.decode(propertyData.propertyGarage) end
        if propertyData.propertyRented then propertyData.propertyRented = json.decode(propertyData.propertyRented) end
        if propertyData.data then propertyData.data = json.decode(propertyData.data) end
        if propertyData.dataMoney then propertyData.dataMoney = json.decode(propertyData.dataMoney) end
        if propertyData.ownerList then propertyData.ownerList = json.decode(propertyData.ownerList) end
        if propertyData.accessList then propertyData.accessList = json.decode(propertyData.accessList) end

        local isOwner = propertyData.propertyOwner == xPlayer.getIdentifier()
        local isCoOwner = false
        local isJobOwner = false
        local hasAccess = false

        if propertyData.ownerList then
            for _, owner in pairs(propertyData.ownerList) do
                if owner.identifier == xPlayer.getIdentifier() then
                    isCoOwner = true
                    break
                end
            end
        end

        if propertyData.accessList then
            for _, access in pairs(propertyData.accessList) do
                if access.identifier == xPlayer.getIdentifier() then
                    hasAccess = true
                    break
                end
            end
        end

        if string.find(propertyData.propertyOwner or "", "job_") then
            local jobName = string.gsub(propertyData.propertyOwner, "job_", "")
            if xPlayer.job.name == jobName or xPlayer.job2.name == jobName then
                isJobOwner = true
            end
        end

        TriggerClientEvent("Property:OpenPropertyMenu", _src, isOwner or isCoOwner or isJobOwner or hasAccess, {propertyData})
    end)
end)

RegisterServerEvent("Property:OwnedGarages")
AddEventHandler("Property:OwnedGarages", function(PropertyID)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
	local propertyOwner = nil
	MySQL.Async.fetchAll("SELECT * FROM properties_build WHERE propertyID = @propertyID", {
		['propertyID'] = PropertyID
	}, function(propertyResult)
		if propertyResult[1] then 
			for k, v in pairs(propertyResult) do
				if v.propertyEntering ~= nil then 
					v.propertyEntering = json.decode(v.propertyEntering)
				end
				if v.propertyGarage ~= nil then 
					v.propertyGarage = json.decode(v.propertyGarage)
				end
				if v.propertyRented ~= nil then 
					v.propertyRented = json.decode(v.propertyRented)
				end
				if v.ownerList ~= nil then 
					v.ownerList = json.decode(v.ownerList)
				end
				v.data = json.decode(v.data)
				v.dataMoney = json.decode(v.dataMoney)
				propertyOwner = v.propertyOwner
				MySQL.Async.fetchAll("SELECT * FROM properties_vehicles WHERE propertyID = @propertyID", {
					['@propertyID'] = PropertyID
				}, function(propertyVehiclesResult)
					if propertyVehiclesResult[1] then 
						for k, v in pairs(propertyVehiclesResult) do
							v.data_vehicle = json.decode(v.data_vehicle)
						end
						if propertyOwner == xPlayer.getIdentifier() then 
							TriggerClientEvent("Property:OpenGarageMenu", _src, true, propertyResult, propertyVehiclesResult)
						else
							TriggerClientEvent("Property:OpenGarageMenu", _src, true, propertyResult, propertyVehiclesResult)
						end
					else
						if propertyOwner == xPlayer.getIdentifier() then 
							TriggerClientEvent("Property:OpenGarageMenu", _src, true, propertyResult, nil)
						else
							TriggerClientEvent("Property:OpenGarageMenu", _src, false, propertyResult, nil)
						end
					end
				end)
			end
		end
	end)
end)

RegisterServerEvent("Property:GivePropertyToPlayer")
AddEventHandler("Property:GivePropertyToPlayer", function(propertyID, target)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(target)

    if not xTarget then
        TriggerClientEvent('esx:showNotification', _src, "~s~Erreur : Joueur introuvable")
        return
    end

    MySQL.Async.execute("UPDATE properties_build SET propertyOwner = @propertyOwner, ownerName = @ownerName WHERE propertyID = @propertyID", {
        ["@propertyOwner"] = xTarget.identifier,
        ["@ownerName"] = GetPlayerName(target),
        ["@propertyID"] = propertyID
    })
    TriggerClientEvent('esx:showNotification', _src, "~s~Agence Immobilière~s~\nVous avez attribué une propriété.")
    TriggerClientEvent('esx:showNotification', target, "~s~Agence Immobilière~s~\nVous avez reçu une propriété.")
    SetTimeout(250, function()
        MySQL.Async.fetchAll("SELECT * FROM properties_build", {}, function(allProperties)
            for k, v in pairs(allProperties) do
                v.propertyEntering = json.decode(v.propertyEntering)
                v.propertyGarage = json.decode(v.propertyGarage)
                v.propertyRented = json.decode(v.propertyRented)
                v.data = json.decode(v.data)
                v.dataMoney = json.decode(v.dataMoney)
                v.ownerList = json.decode(v.ownerList)
            end
            TriggerClientEvent("Property:refreshProperty", -1, nil, allProperties) 
        end)
    end)
end)

RegisterServerEvent("Property:GetVehiclesProperties")
AddEventHandler("Property:GetVehiclesProperties", function(PropertyID)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
	MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @owner AND propertyID = @propertyID", {
		['@owner'] = xPlayer.identifier,
		['@propertyID'] = 0
	}, function(ownedResult)
		for k,v in pairs (ownedResult) do 
            v.vehicle = json.decode(v.vehicle)
		end
		MySQL.Async.fetchAll("SELECT * FROM properties_vehicles WHERE propertyID = @propertyID", {
			['propertyID'] = PropertyID
		}, function(propertiesVehiclesResult)
			for k,v in pairs (propertiesVehiclesResult) do 
				v.data_vehicle = json.decode(v.data_vehicle)
			end
			TriggerClientEvent("Property:OpenGestionGarageMenu", _src, ownedResult, propertiesVehiclesResult)
		end)
    end)
end)

RegisterServerEvent("Property:InteractionsGarage")
AddEventHandler("Property:InteractionsGarage", function(propertyID, vehicleInfos, Actions)
    local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	if Actions == 1 then 
		MySQL.Async.execute("UPDATE owned_vehicles SET propertyID = @propertyID WHERE plate = @plate", {
			["@propertyID"] = propertyID, 
			["@plate"] = vehicleInfos.plate
		}, function(result)
			MySQL.Async.execute('INSERT INTO properties_vehicles (propertyID, plate, data_vehicle) VALUES (@propertyID, @plate, @data_vehicle)',{
				['propertyID'] = propertyID,
				['plate'] = vehicleInfos.plate,
				['data_vehicle'] = json.encode(vehicleInfos)
			})
			SetTimeout(120, function()
				MySQL.Async.fetchAll("SELECT * FROM properties_vehicles WHERE propertyID = @propertyID", {
					["propertyID"] = propertyID,
				}, function(vehicleResult)
					for k,v in pairs(vehicleResult) do 
						v.data_vehicle = json.decode(v.data_vehicle)
					end
					MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @owner AND propertyID = @propertyID", {
						["owner"] = xPlayer.getIdentifier(),
						["propertyID"] = 0
					}, function(ownedResult)
						for k,v in pairs(ownedResult) do 
							v.vehicle = json.decode(v.vehicle)
						end
						TriggerClientEvent("Property:reloadVehicles", _src, vehicleResult, ownedResult)
					end)
				end)
				TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\nVéhicule ajouté avec succès.")
			end)
		end)
	elseif Actions == 2 then 
		MySQL.Async.execute("UPDATE owned_vehicles SET propertyID = @propertyID WHERE plate = @plate", {
			["@propertyID"] = 0, 
			["@plate"] = vehicleInfos.plate
		}, function(result)
			MySQL.Async.execute('DELETE FROM properties_vehicles WHERE plate = @plate', {
				['@plate'] = vehicleInfos.plate
			})
			SetTimeout(120, function()
				MySQL.Async.fetchAll("SELECT * FROM properties_vehicles WHERE propertyID = @propertyID", {
					["propertyID"] = propertyID,
				}, function(vehicleResult)
					for k,v in pairs(vehicleResult) do 
						v.data_vehicle = json.decode(v.data_vehicle)
					end
					MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @owner AND propertyID = @propertyID", {
						["owner"] = xPlayer.getIdentifier(),
						["propertyID"] = 0
					}, function(ownedResult)
						for k,v in pairs(ownedResult) do 
							v.vehicle = json.decode(v.vehicle)
						end
						TriggerClientEvent("Property:reloadVehicles", _src, vehicleResult, ownedResult)
					end)
				end)
				TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\nVéhicule retiré avec succès.")
			end)
		end)
	end
end)

RegisterServerEvent("Property:AddVehicleIntoGarage")
AddEventHandler("Property:AddVehicleIntoGarage", function(propertyID, CurrentVehicle, vehicleLabel)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    exports.oxmysql:execute("SELECT * FROM properties_vehicles WHERE propertyID = ? AND plate = ?", 
    { propertyID, CurrentVehicle.plate }, function(result)
        if result and result[1] then
            exports.oxmysql:execute("UPDATE properties_vehicles SET stored = ?, data_vehicle = ? WHERE plate = ?", 
            { 1, json.encode(CurrentVehicle), CurrentVehicle.plate })

            TriggerClientEvent('esx:showNotification', _src, ("🚗 Vous avez rangé un/une ~s~%s~s~"):format(vehicleLabel))
        else
            exports.oxmysql:execute("INSERT INTO properties_vehicles (propertyID, plate, stored, data_vehicle) VALUES (?, ?, ?, ?)", 
            { propertyID, CurrentVehicle.plate, 1, json.encode(CurrentVehicle) })

            TriggerClientEvent('esx:showNotification', _src, ("✅ Votre véhicule ~s~%s~s~ a été ajouté au garage !"):format(vehicleLabel))
        end
        TriggerClientEvent("Property:checkGarage", _src)
    end)
end)


RegisterServerEvent("Property:UpdateStored")
AddEventHandler("Property:UpdateStored", function (vehiclePlate, vehicleLabel)
	local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
  	if vehiclePlate ~= nil then
		MySQL.Async.execute("UPDATE properties_vehicles SET stored = @stored WHERE plate = @plate", {
			["@stored"] = 0, 
			["@plate"] = vehiclePlate
		})
		TriggerClientEvent('esx:showNotification', _src, ("Vous avez sortie un/une ~s~%s~s~"):format(vehicleLabel))
	end
end)

RegisterServerEvent("Property:DeleteProperty")
AddEventHandler("Property:DeleteProperty", function (propertyID)
	local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
  	if propertyID ~= nil then
		SetTimeout(250, function()
			MySQL.Async.fetchAll("SELECT * FROM properties_vehicles WHERE propertyID = @propertyID", {
				['@propertyID'] = propertyID
			}, function(propertyVehicle)
				if propertyVehicle[1] then 
					for k,v in pairs(propertyVehicle) do 
						MySQL.Async.execute("UPDATE owned_vehicles SET propertyID = @propertyID WHERE plate = @plate", {
							["@plate"] = v.plate,
							["@propertyID"] = 0
						})
					end
				end
			end)
			Wait(50)
			MySQL.Async.execute('DELETE FROM properties_build WHERE propertyID = @propertyID', {
				['@propertyID'] = propertyID
			})
			Wait(50)
			MySQL.Async.execute('DELETE FROM properties_vehicles WHERE propertyID = @propertyID', {
				['@propertyID'] = propertyID
			})
		end)
	end
	SetTimeout(450, function()
		MySQL.Async.fetchAll("SELECT * FROM properties_build", {}, function(allProperties)
			for k, v in pairs(allProperties) do
				v.propertyEntering = json.decode(v.propertyEntering)
				v.propertyGarage = json.decode(v.propertyGarage)
				v.propertyRented = json.decode(v.propertyRented)
				v.data = json.decode(v.data)
				v.dataMoney = json.decode(v.dataMoney)
				v.ownerList = json.decode(v.ownerList)
			end
			TriggerClientEvent("Property:refreshProperty", -1, nil, allProperties) 
		end)
	end)
end)




RegisterServerEvent("Property:ActionsStorage")
AddEventHandler("Property:ActionsStorage", function(propertyID, dataStorage, itemName, currentStorage, count, Type)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    if not xPlayer then return end

    count = math.floor(count)

    MySQL.Async.fetchAll("SELECT data FROM properties_build WHERE propertyID = @propertyID", {
        ["@propertyID"] = propertyID
    }, function(result)
        local storageData = result[1] and json.decode(result[1].data) or {}

        if Type == 1 then 
            if currentStorage.count + count <= currentStorage.max then
                if xPlayer.hasWeapon(itemName) then
                    storageData["weapons"] = storageData["weapons"] or {}

                    table.insert(storageData["weapons"], {
                        name = itemName,
                        label = ESX.GetWeaponLabel(itemName),
                        id = os.time() .. math.random(1000, 9999)
                    })

                    MySQL.Async.execute("UPDATE properties_build SET data = @data WHERE propertyID = @propertyID", {
                        ["@propertyID"] = propertyID,
                        ["@data"] = json.encode(storageData)
                    }, function(rowsChanged)
                        if rowsChanged > 0 then
                            xPlayer.removeWeapon(itemName)
							SendLogs("Depôt Arme", "Koy | Depôt Arme", "**__Informations Joueur__**\n\n> **Nom** : `"..GetPlayerName(xPlayer.source).."` | **U :** (`"..xPlayer.identifier.."`)\n\n> __**Actions**__ :\n\n> **Depôt Arme :** `x1` **-** `"..itemName.."`", "https://discord.com/api/webhooks/1321357442298150923/FVVv7GjNfoIGRgcSIf3dqCExI6Dr-4XNKR6Pf8tE-KOU9JCyIhFluIIZQWFOryd4yK69")
                            TriggerClientEvent('esx:showNotification', _src, "~s~Arme stockée: ~s~" .. ESX.GetWeaponLabel(itemName))
                            TriggerClientEvent("Property:reloadStorage", -1, propertyID, storageData)
                            TriggerClientEvent("Property:updateWeaponsList", _src, propertyID, storageData["weapons"])
                        end
                    end)
                elseif count <= xPlayer.getInventoryItem(itemName).count then
                    storageData[itemName] = storageData[itemName] or {
                        label = ESX.GetItemLabel(itemName),
                        name = itemName,
                        count = 0
                    }
                    storageData[itemName].count = storageData[itemName].count + count

                    MySQL.Async.execute("UPDATE properties_build SET data = @data WHERE propertyID = @propertyID", {
                        ["@propertyID"] = propertyID,
                        ["@data"] = json.encode(storageData)
                    }, function(rowsChanged)
                        if rowsChanged > 0 then
                            xPlayer.removeInventoryItem(itemName, count)
							SendLogs("Depôt Item", "Koy | Depôt Item", "**__Informations Joueur__**\n\n> **Nom** : `"..GetPlayerName(xPlayer.source).."` | **U :** (`"..xPlayer.identifier.."`)\n\n> __**Actions**__ :\n\n> **Depôt Item :** `x"..count.."` **-** `"..itemName.."`", "https://discord.com/api/webhooks/1321357308214771782/IO0YGqg6CRApWZCE8InZ6Ryh4bKXrTn-THjV9JL1wevnF2Ckg0rsJFRzTDbU1z8YNY76")
                            TriggerClientEvent('esx:showNotification', _src, "~s~Objet stocké: ~s~" .. count .. " " .. ESX.GetItemLabel(itemName))
                            TriggerClientEvent("Property:reloadStorage", -1, propertyID, storageData)
                        end
                    end)
                end
            end
        elseif Type == 2 then  
			local foundWeapon = false 
		
			if storageData["weapons"] and #storageData["weapons"] > 0 then
				for i, weapon in ipairs(storageData["weapons"]) do
					if weapon.name == itemName then
						if xPlayer.hasWeapon(itemName) then
							TriggerClientEvent('esx:showNotification', _src, "~s~Vous possédez déjà cette arme !")
							return
						end
		
						table.remove(storageData["weapons"], i)
						foundWeapon = true
		
						MySQL.Async.execute("UPDATE properties_build SET data = @data WHERE propertyID = @propertyID", {
							["@propertyID"] = propertyID,
							["@data"] = json.encode(storageData)
						}, function(rowsChanged)
							if rowsChanged > 0 then
								xPlayer.addWeapon(itemName, 50)
								SendLogs("Retrait Arme", "Koy | Retrait Arme", "**__Informations Joueur__**\n\n> **Nom** : `"..GetPlayerName(xPlayer.source).."` | **U :** (`"..xPlayer.identifier.."`)\n\n> __**Actions**__ :\n\n> **Retrait Arme :** `x1` **-** `"..itemName.."`", "https://discord.com/api/webhooks/1321357442298150923/FVVv7GjNfoIGRgcSIf3dqCExI6Dr-4XNKR6Pf8tE-KOU9JCyIhFluIIZQWFOryd4yK69")
								TriggerClientEvent('esx:showNotification', _src, "~g~Arme retirée: ~s~" .. ESX.GetWeaponLabel(itemName))
								TriggerClientEvent("Property:reloadStorage", -1, propertyID, storageData)
								TriggerClientEvent("Property:updateWeaponsList", -1, propertyID, storageData["weapons"])
							end
						end)
						return
					end
				end
			end
		
			if not foundWeapon then
				if storageData[itemName] and storageData[itemName].count then
					if storageData[itemName].count >= count then
						storageData[itemName].count = storageData[itemName].count - count
						if storageData[itemName].count == 0 then storageData[itemName] = nil end
		
						MySQL.Async.execute("UPDATE properties_build SET data = @data WHERE propertyID = @propertyID", {
							["@propertyID"] = propertyID,
							["@data"] = json.encode(storageData)
						}, function(rowsChanged)
							if rowsChanged > 0 then
								xPlayer.addInventoryItem(itemName, count)
								SendLogs("Retrait Item", "Koy | Retrait Item", "**__Informations Joueur__**\n\n> **Nom** : `"..GetPlayerName(xPlayer.source).."` | **U :** (`"..xPlayer.identifier.."`)\n\n> __**Actions**__ :\n\n> **Retrait Item :** `x"..count.."` **-** `"..itemName.."`", "https://discord.com/api/webhooks/1321357308214771782/IO0YGqg6CRApWZCE8InZ6Ryh4bKXrTn-THjV9JL1wevnF2Ckg0rsJFRzTDbU1z8YNY76")
								TriggerClientEvent('esx:showNotification', _src, "~g~Objet retiré: ~s~" .. count .. "x " .. ESX.GetItemLabel(itemName))
								TriggerClientEvent("Property:reloadStorage", -1, propertyID, storageData)
							end
						end)
					else
						TriggerClientEvent('esx:showNotification', _src, "~s~Quantité insuffisante dans le stockage.")
					end
				else
					TriggerClientEvent('esx:showNotification', _src, "~s~Aucun objet trouvé dans le stockage.")
				end
			end
		end
		
    end)
end)


RegisterNetEvent("Property:updateWeaponsList")
AddEventHandler("Property:updateWeaponsList", function(propertyID, newWeapons)
    for k,v in pairs(myProperties) do
        if v.propertyID == propertyID then
            v.data["weapons"] = newWeapons
            countData(propertyID)
            break
        end
    end
end)
















RegisterServerEvent("Property:ActionsMoney")
AddEventHandler("Property:ActionsMoney", function (propertyID, dataMoney, moneyType, count, Type, TypeActions)
	local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
	count = math.floor(count)
	if Type == 1 then 
		if TypeActions == 1 then 
			if count <= xPlayer.getAccount('dirtycash').money then
				if dataMoney[moneyType].count then 
					dataMoney[moneyType].count = dataMoney[moneyType].count + count
				else
					dataMoney[moneyType] = {}
					dataMoney[moneyType].count = count
				end
				MySQL.Async.execute("UPDATE properties_build SET dataMoney = @dataMoney WHERE propertyID = @propertyID", {
					["@propertyID"] = propertyID, 
					["@dataMoney"] = json.encode(dataMoney)
				})
				xPlayer.removeAccountMoney('dirtycash', count)
				TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\nDépot de : ~s~"..count.."$ ~s~d'argent sale")

				SendLogs("Dépôt Argent Sale", "Property Money", "**Joueur :** "..GetPlayerName(_src).." | **ID :** "..xPlayer.identifier.."\n**Montant :** "..count.."$\n**Type :** Argent Sale", "https://discord.com/api/webhooks/1321357562691457148/ByErmuso-1Z_m-gBi5V8pRrO7wLZz3yH55X34L2i7GM4u_BZdsqefsfZVc6XpDuNoPuA")
			else
				TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\n[~r~Impossible~h~] Vous n'avez pas autant d'argent sale sur vous !")
			end
			SetTimeout(250, function()	
				MySQL.Async.fetchAll("SELECT * FROM properties_build WHERE propertyID = @propertyID", {
					["propertyID"] = propertyID
				}, function(propertyResult)
					for k, v in pairs(propertyResult) do
						v.propertyEntering = json.decode(v.propertyEntering)
						v.propertyGarage = json.decode(v.propertyGarage)
						v.propertyRented = json.decode(v.propertyRented)
						v.data = json.decode(v.data)
						v.dataMoney = json.decode(v.dataMoney)
						v.ownerList = json.decode(v.ownerList)
						for t,b in pairs(Property[v.propertyID].players) do 
							if b.id ~= nil then 
								TriggerClientEvent('Property:reloadInfos', b.id, propertyResult)
							end
						end
					end
				end)
			end)
		elseif TypeActions == 2 then 
			if count <= dataMoney[moneyType].count then 
				if dataMoney[moneyType].count then 
					dataMoney[moneyType].count = dataMoney[moneyType].count - count
				end
				MySQL.Async.execute("UPDATE properties_build SET dataMoney = @dataMoney WHERE propertyID = @propertyID", {
					["@propertyID"] = propertyID, 
					["@dataMoney"] = json.encode(dataMoney)
				})
				xPlayer.addAccountMoney('dirtycash', count)
				TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\nRetrait de : ~s~"..count.."$ ~s~d'argent sale")

				SendLogs("Retrait Argent Sale", "Property Money", "**Joueur :** "..GetPlayerName(_src).." | **ID :** "..xPlayer.identifier.."\n**Montant :** "..count.."$\n**Type :** Argent Sale", "https://discord.com/api/webhooks/1321357562691457148/ByErmuso-1Z_m-gBi5V8pRrO7wLZz3yH55X34L2i7GM4u_BZdsqefsfZVc6XpDuNoPuA")
			else
				TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\n~s~Il n'y a pas autant dans le coffre !")
			end
			SetTimeout(250, function()	
				MySQL.Async.fetchAll("SELECT * FROM properties_build WHERE propertyID = @propertyID", {
					["propertyID"] = propertyID
				}, function(propertyResult)
					for k, v in pairs(propertyResult) do
						v.propertyEntering = json.decode(v.propertyEntering)
						v.propertyGarage = json.decode(v.propertyGarage)
						v.propertyRented = json.decode(v.propertyRented)
						v.data = json.decode(v.data)
						v.dataMoney = json.decode(v.dataMoney)
						v.ownerList = json.decode(v.ownerList)
						for t,b in pairs(Property[v.propertyID].players) do 
							if b.id ~= nil then 
								TriggerClientEvent('Property:reloadInfos', b.id, propertyResult)
							end
						end
					end
				end)
			end)
		end
	elseif Type == 2 then 
		if TypeActions == 1 then 
			if count <= xPlayer.getAccount('cash').money then
				if dataMoney[moneyType].count then 
					dataMoney[moneyType].count = dataMoney[moneyType].count + count
				else
					dataMoney[moneyType] = {}
					dataMoney[moneyType].count = count
				end
				MySQL.Async.execute("UPDATE properties_build SET dataMoney = @dataMoney WHERE propertyID = @propertyID", {
					["@propertyID"] = propertyID, 
					["@dataMoney"] = json.encode(dataMoney)
				})
				xPlayer.removeAccountMoney('cash', count)
				TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\nDépot de : ~s~"..count.."$ ~s~d'argent propre")

				SendLogs("Dépôt Argent Propre", "Property Money", "**Joueur :** "..GetPlayerName(_src).." | **ID :** "..xPlayer.identifier.."\n**Montant :** "..count.."$\n**Type :** Argent Propre", "https://discord.com/api/webhooks/1321357673534459924/nmXoN4-y4646xkuLTtvTNl7dW0S5Kpxo47q6JOJBF2_q4RiufoB5m3-N4KH-QDQFoBvy")
			else
				TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\n[~r~Impossible~h~] Vous n'avez pas autant d'argent propre sur vous !")
			end
			SetTimeout(250, function()	
				MySQL.Async.fetchAll("SELECT * FROM properties_build WHERE propertyID = @propertyID", {
					["propertyID"] = propertyID
				}, function(propertyResult)
					for k, v in pairs(propertyResult) do
						v.propertyEntering = json.decode(v.propertyEntering)
						v.propertyGarage = json.decode(v.propertyGarage)
						v.propertyRented = json.decode(v.propertyRented)
						v.data = json.decode(v.data)
						v.dataMoney = json.decode(v.dataMoney)
						v.ownerList = json.decode(v.ownerList)
						for t,b in pairs(Property[v.propertyID].players) do 
							if b.id ~= nil then 
								TriggerClientEvent('Property:reloadInfos', b.id, propertyResult)
							end
						end
					end
				end)
			end)
		elseif TypeActions == 2 then 
			if count <= dataMoney[moneyType].count then 
				if dataMoney[moneyType].count then 
					dataMoney[moneyType].count = dataMoney[moneyType].count - count
				end
				MySQL.Async.execute("UPDATE properties_build SET dataMoney = @dataMoney WHERE propertyID = @propertyID", {
					["@propertyID"] = propertyID, 
					["@dataMoney"] = json.encode(dataMoney)
				})
				xPlayer.addAccountMoney('cash', count)
				TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\nRetrait de : ~s~"..count.."~s~$ d'argent propre")

                SendLogs("Retrait Argent Propre", "Property Money", "**Joueur :** "..GetPlayerName(_src).." | **ID :** "..xPlayer.identifier.."\n**Montant :** "..count.."$\n**Type :** Argent Propre", "https://discord.com/api/webhooks/1321357673534459924/nmXoN4-y4646xkuLTtvTNl7dW0S5Kpxo47q6JOJBF2_q4RiufoB5m3-N4KH-QDQFoBvy")
			else
				TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\n~s~Il n'y a pas autant dans le coffre !")
			end
			SetTimeout(250, function()	
				MySQL.Async.fetchAll("SELECT * FROM properties_build WHERE propertyID = @propertyID", {
					["propertyID"] = propertyID
				}, function(propertyResult)
					for k, v in pairs(propertyResult) do
						v.propertyEntering = json.decode(v.propertyEntering)
						v.propertyGarage = json.decode(v.propertyGarage)
						v.propertyRented = json.decode(v.propertyRented)
						v.data = json.decode(v.data)
						v.dataMoney = json.decode(v.dataMoney)
						v.ownerList = json.decode(v.ownerList)
						for t,b in pairs(Property[v.propertyID].players) do 
							if b.id ~= nil then 
								TriggerClientEvent('Property:reloadInfos', b.id, propertyResult)
							end
						end
					end
				end)
			end)
		end
	end
end)


RegisterServerEvent("Property:NotInProperty")
AddEventHandler("Property:NotInProperty", function(playerSource)
	TriggerClientEvent("esx:showNotification", playerSource, "Le propriétaire n'est pas dans sa propriété.")
end)

RegisterServerEvent("Property:DringDring")
AddEventHandler("Property:DringDring", function(propertyOwner)
    local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	local xOwner = ESX.GetPlayerFromIdentifier(propertyOwner)
	if xOwner == nil then 
		return TriggerClientEvent("esx:showNotification", _src, "Le propriétaire n'est pas en ville.")
	end
	if Sonnerie[_src] then 
		return TriggerClientEvent("esx:showNotification", _src, "Vous avez déjà sonné, veuillez patienter.")
	end
	Sonnerie[_src] = {}
	TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\nVous avez sonné à la porte de ~s~"..GetPlayerName(xOwner.source))
	table.insert(Sonnerie[_src], {
		playerName = GetPlayerName(_src),
		source = _src
	})
	TriggerClientEvent("Property:DringDringReponse", xOwner.source, Sonnerie[_src])
	SetTimeout(5000, function()
		Sonnerie[_src] = nil
	end)
end)

RegisterServerEvent("Property:AcceptDringDring")
AddEventHandler("Property:AcceptDringDring", function(xOtherPlayer, propertyID)
    local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	if Sonnerie[xOtherPlayer] then 
		Sonnerie[xOtherPlayer] = nil
	end
	TriggerClientEvent('esx:showNotification', _src, "~s~Propriété~s~\nVous avez accepté ~s~"..GetPlayerName(xOtherPlayer))
    SetPlayerRoutingBucket(xOtherPlayer, Config.Buckets["player"]+propertyID)
	SetEntityCoords(GetPlayerPed(xOtherPlayer), GetEntityCoords(GetPlayerPed(_src)))
	if Property[propertyID].players then 
		table.insert(Property[propertyID].players, {
			id = xOtherPlayer,
			playerName = GetPlayerName(xOtherPlayer)
		})
	else
		Property[propertyID].players = {}
		table.insert(Property[propertyID].players, {
			id = xOtherPlayer,
			playerName = GetPlayerName(xOtherPlayer)
		})
	end
	TriggerClientEvent("Property:ReponsePerms", xOtherPlayer)
end)

local lastAnnouncement = {} 

RegisterServerEvent('Property:Announce')
AddEventHandler('Property:Announce', function(type, reason)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local identifier = xPlayer.getIdentifier()
    local currentTime = os.time()

    if lastAnnouncement[identifier] and (currentTime - lastAnnouncement[identifier]) < 300 then
        local remainingTime = 300 - (currentTime - lastAnnouncement[identifier])
        TriggerClientEvent('esx:showNotification', _src, "Veuillez attendre ~s~" .. remainingTime .. " secondes~s~ avant de refaire une annonce.")
        return
    end

    lastAnnouncement[identifier] = currentTime 

    if type == 1 then
        TriggerClientEvent('esx:showNotification', -1, "L'~c~Agence Immobilière~s~ est actuellement ~g~ouverte~s~ !")
    elseif type == 2 then
        TriggerClientEvent('esx:showNotification', -1, "L'~c~Agence Immobilière~s~ est actuellement ~s~fermée~s~ !")
    elseif type == 3 and reason and reason ~= "" then
        TriggerClientEvent('esx:showNotification', -1, reason)
    else
        TriggerClientEvent('esx:showNotification', _src, "~s~Erreur : Message invalide.")
    end
end)

RegisterServerEvent("Property:getInfos")
AddEventHandler("Property:getInfos", function()
    local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	local UserData, PropertiesData = {}, {}
	MySQL.Async.fetchAll("SELECT * FROM properties_build", {}, function(allProperties)
        for k, v in pairs(allProperties) do
            v.propertyEntering = json.decode(v.propertyEntering)
			v.propertyGarage = json.decode(v.propertyGarage)
			v.propertyRented = json.decode(v.propertyRented)
			v.data = json.decode(v.data)
			v.dataMoney = json.decode(v.dataMoney)
			v.ownerList = json.decode(v.ownerList)
        end
		PropertiesData = allProperties
    end)
	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		["@identifier"] = xPlayer.getIdentifier()
	}, function(userData)
		UserData = userData
    end)
	SetTimeout(250, function()
		TriggerClientEvent("Property:refreshProperty", _src, UserData, PropertiesData)
	end)
end)



RegisterServerEvent("Property:OpenOwnerList")
AddEventHandler("Property:OpenOwnerList", function(propertyID)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    if not propertyID or type(propertyID) ~= "number" then
        TriggerClientEvent("esx:showNotification", _src, "~s~Erreur : ID de la propriété invalide.")
        return
    end

    MySQL.Async.fetchAll("SELECT propertyOwner, ownerList FROM properties_build WHERE propertyID = @propertyID", {
        ["@propertyID"] = propertyID
    }, function(propertyData)
        if not propertyData or not propertyData[1] then 
            TriggerClientEvent("esx:showNotification", _src, "~s~Erreur : Propriété introuvable.")
            return
        end

        local propertyOwner = propertyData[1].propertyOwner
        local ownerList = json.decode(propertyData[1].ownerList) or {}
        local availablePlayers = {}

        if Property[propertyID] and Property[propertyID].players then
            for _, p in ipairs(Property[propertyID].players) do
                local xTarget = ESX.GetPlayerFromId(p.id)
                if xTarget then
                    local isAlreadyOwner = xTarget.getIdentifier() == propertyOwner
                    for _, coOwner in ipairs(ownerList) do
                        if coOwner.identifier == xTarget.getIdentifier() then
                            isAlreadyOwner = true
                            break
                        end
                    end

                    if not isAlreadyOwner then
                        table.insert(availablePlayers, { 
                            id = xTarget.source, 
                            playerName = GetPlayerName(xTarget.source), 
                            identifier = xTarget.getIdentifier() 
                        })
                    end
                end
            end
        end

        TriggerClientEvent("Property:OpenOwnerMenu", _src, ownerList, availablePlayers, propertyOwner, propertyID)
    end)
end)












RegisterServerEvent("Property:UpdateOwner")
AddEventHandler("Property:UpdateOwner", function(propertyID)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    if not isValidPropertyID(propertyID, _src) then return end

    MySQL.Async.fetchAll("SELECT propertyOwner FROM properties_build WHERE propertyID = @propertyID", {
        ["@propertyID"] = propertyID
    }, function(propertyResult)
        if not propertyResult or not propertyResult[1] then
            TriggerClientEvent("esx:showNotification", _src, "~s~Propriété introuvable.")
            return
        end

        if propertyResult[1].propertyOwner ~= xPlayer.getIdentifier() then
            TriggerClientEvent("esx:showNotification", _src, "~s~Vous n'êtes pas propriétaire de cette propriété.")
            return
        end

        MySQL.Async.execute("UPDATE properties_build SET ownerName = '-', propertyOwner = '-', data = '{}', dataMoney = '{}', ownerList = '{}' WHERE propertyID = @propertyID", {
            ["@propertyID"] = propertyID
        })

        TriggerClientEvent("esx:showNotification", _src, "Propriété révoquée avec succès.")
    end)
end)




RegisterServerEvent("Property:addOwner")
AddEventHandler("Property:addOwner", function(propertyID, ownerId)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(ownerId)

    if not propertyID or not ownerId or not xTarget then
        TriggerClientEvent("esx:showNotification", _src, "~s~Erreur : ID de propriété ou joueur invalide.")
        return
    end

    MySQL.Async.fetchAll("SELECT ownerList FROM properties_build WHERE propertyID = @propertyID", {
        ["@propertyID"] = propertyID
    }, function(propertyData)
        if not propertyData or not propertyData[1] then
            TriggerClientEvent("esx:showNotification", _src, "~s~Erreur : Propriété introuvable.")
            return
        end

        local ownerList = json.decode(propertyData[1].ownerList) or {}

        for _, owner in ipairs(ownerList) do
            if xTarget.getIdentifier() == owner.identifier then
                TriggerClientEvent("esx:showNotification", _src, "~s~Le joueur est déjà co-propriétaire.")
                return
            end
        end

        table.insert(ownerList, {identifier = xTarget.getIdentifier(), name = GetPlayerName(ownerId)})

        MySQL.Async.execute("UPDATE properties_build SET ownerList = @ownerList WHERE propertyID = @propertyID", {
            ["@propertyID"] = propertyID,
            ["@ownerList"] = json.encode(ownerList)
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent("esx:showNotification", _src, "Co Propriétaires ajouté avec succès")
				TriggerClientEvent("esx:showNotification", ownerId, "Vous avez été ajouté en tant que co-propriétaire")
                TriggerClientEvent("Property:RefreshOwnerList", _src, propertyID)
            else
                TriggerClientEvent("esx:showNotification", _src, "~s~Erreur : Impossible d'ajouter le co-propriétaire.")
            end
        end)
    end)
end)




RegisterServerEvent("Property:RefreshOwnerList")
AddEventHandler("Property:RefreshOwnerList", function(propertyID)
    local _src = source

    if not propertyID then
        TriggerClientEvent("esx:showNotification", _src, "❌ Erreur : ID de propriété invalide.")
        return
    end

    MySQL.Async.fetchAll("SELECT ownerList, propertyOwner FROM properties_build WHERE propertyID = @propertyID", {
        ["@propertyID"] = propertyID
    }, function(propertyData)
        if not propertyData or not propertyData[1] then
            TriggerClientEvent("esx:showNotification", _src, "❌ Erreur : Propriété introuvable.")
            return
        end

        local ownerList = json.decode(propertyData[1].ownerList) or {}
        local propertyOwner = propertyData[1].propertyOwner or nil
        local availablePlayers = {}

        if Property[propertyID] and Property[propertyID].players then
            for _, p in ipairs(Property[propertyID].players) do
                local xTarget = ESX.GetPlayerFromId(p.id)
                if xTarget then
                    local isAlreadyOwner = false
                    for _, owner in ipairs(ownerList) do
                        if owner.identifier == xTarget.getIdentifier() then
                            isAlreadyOwner = true
                            break
                        end
                    end

                    if not isAlreadyOwner then
                        table.insert(availablePlayers, {
                            id = xTarget.source,
                            playerName = GetPlayerName(xTarget.source),
                            identifier = xTarget.getIdentifier()
                        })
                    end
                end
            end
        end

        TriggerClientEvent("Property:OpenOwnerMenu", _src, ownerList, availablePlayers, propertyOwner, propertyID)
    end)
end)





RegisterServerEvent("Property:deleteOwner")
AddEventHandler("Property:deleteOwner", function(propertyID, propertyIdentifier)
    local _src = source

    if not propertyID or not propertyIdentifier then
        TriggerClientEvent("esx:showNotification", _src, "❌ Erreur : Informations invalides.")
        return
    end

    MySQL.Async.fetchAll("SELECT ownerList FROM properties_build WHERE propertyID = @propertyID", {
        ["@propertyID"] = propertyID
    }, function(propertyData)
        if not propertyData or not propertyData[1] then
            TriggerClientEvent("esx:showNotification", _src, "❌ Erreur : Propriété introuvable.")
            return
        end

        local ownerList = json.decode(propertyData[1].ownerList) or {}

        for i = #ownerList, 1, -1 do
            if ownerList[i].identifier == propertyIdentifier then
                table.remove(ownerList, i)
                break
            end
        end

        MySQL.Async.execute("UPDATE properties_build SET ownerList = @ownerList WHERE propertyID = @propertyID", {
            ["@propertyID"] = propertyID,
            ["@ownerList"] = json.encode(ownerList)
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent("esx:showNotification", _src, "✅ Co-propriétaire supprimé avec succès.")
                TriggerClientEvent("Property:RefreshOwnerList", _src, propertyID)
            else
                TriggerClientEvent("esx:showNotification", _src, "❌ Erreur : Impossible de supprimer le co-propriétaire.")
            end
        end)
    end)
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

RegisterServerEvent("Property:GivePropertyToJob")
AddEventHandler("Property:GivePropertyToJob", function(propertyID, jobName)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    if not propertyID or not jobName then
        TriggerClientEvent("esx:showNotification", _src, "~s~Erreur : Informations invalides.")
        return
    end

    MySQL.Async.execute("UPDATE properties_build SET propertyOwner = @propertyOwner, ownerName = @ownerName WHERE propertyID = @propertyID", {
        ["@propertyOwner"] = "job_" .. jobName,
        ["@ownerName"] = jobName,
        ["@propertyID"] = propertyID
    })

    TriggerClientEvent('esx:showNotification', _src, "~s~Agence Immobilière~s~\nPropriété attribuée au job : ~y~" .. jobName)
    
    SetTimeout(250, function()
        MySQL.Async.fetchAll("SELECT * FROM properties_build", {}, function(allProperties)
            for k, v in pairs(allProperties) do
                v.propertyEntering = json.decode(v.propertyEntering)
                v.propertyGarage = json.decode(v.propertyGarage)
                v.propertyRented = json.decode(v.propertyRented)
                v.data = json.decode(v.data)
                v.dataMoney = json.decode(v.dataMoney)
                v.ownerList = json.decode(v.ownerList)
            end
            TriggerClientEvent("Property:refreshProperty", -1, nil, allProperties)
        end)
    end)
end)

RegisterNetEvent("Property:GivePropertyToPlayerJob")
AddEventHandler("Property:GivePropertyToPlayerJob", function(propertyID, target, jobType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)
    
    if not xPlayer or not xTarget then return end
    
    local property = GetProperty(propertyID)
    if not property then return end
    
    if property.owner ~= xPlayer.identifier then
        TriggerClientEvent('esx:showNotification', source, "~s~Vous n'êtes pas propriétaire de cette propriété")
        return
    end
    
    local hasProperty = false
    for _, prop in pairs(Properties) do
        if prop.owner == xTarget.identifier then
            hasProperty = true
            break
        end
    end
    
    if hasProperty then
        TriggerClientEvent('esx:showNotification', source, "~s~Ce joueur possède déjà une propriété")
        return
    end
    
    property.owner = xTarget.identifier
    property.ownerName = xTarget.getName()
    property.job = jobType == "Job" and xTarget.job.name or xTarget.job2.name
    
    MySQL.Async.execute('UPDATE properties SET owner = @owner, ownerName = @ownerName, job = @job WHERE id = @id', {
        ['@owner'] = property.owner,
        ['@ownerName'] = property.ownerName,
        ['@job'] = property.job,
        ['@id'] = propertyID
    })
    
    TriggerClientEvent('esx:showNotification', source, "~g~Propriété vendue avec succès")
    TriggerClientEvent('esx:showNotification', target, "~g~Vous avez reçu une nouvelle propriété")
    
    TriggerClientEvent("Property:UpdateProperties", -1, Properties)
end)

RegisterServerEvent("Property:GetAccessList")
AddEventHandler("Property:GetAccessList", function(propertyID)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    MySQL.Async.fetchAll("SELECT accessList FROM properties_build WHERE propertyID = @propertyID", {
        ["@propertyID"] = propertyID
    }, function(result)
        if result and result[1] then
            local accessList = json.decode(result[1].accessList) or {}
            TriggerClientEvent("Property:UpdateAccessList", _src, propertyID, accessList)
        end
    end)
end)

RegisterServerEvent("Property:GiveAccess")
AddEventHandler("Property:GiveAccess", function(propertyID, targetId)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xTarget = ESX.GetPlayerFromId(targetId)

    if not xTarget then
        TriggerClientEvent('esx:showNotification', _src, "~s~Erreur : Joueur introuvable")
        return
    end

    MySQL.Async.fetchAll("SELECT accessList FROM properties_build WHERE propertyID = @propertyID", {
        ["@propertyID"] = propertyID
    }, function(result)
        if result and result[1] then
            local accessList = json.decode(result[1].accessList) or {}
            
            for _, access in ipairs(accessList) do
                if access.identifier == xTarget.identifier then
                    TriggerClientEvent('esx:showNotification', _src, "~s~Ce joueur a déjà accès à cette propriété")
                    return
                end
            end

            table.insert(accessList, {
                identifier = xTarget.identifier,
                name = GetPlayerName(targetId)
            })

            MySQL.Async.execute("UPDATE properties_build SET accessList = @accessList WHERE propertyID = @propertyID", {
                ["@propertyID"] = propertyID,
                ["@accessList"] = json.encode(accessList)
            }, function(rowsChanged)
                if rowsChanged > 0 then
                    TriggerClientEvent('esx:showNotification', _src, "~g~Accès donné avec succès")
                    TriggerClientEvent('esx:showNotification', targetId, "~g~Vous avez reçu l'accès à une propriété")
                    TriggerClientEvent("Property:UpdateAccessList", _src, propertyID, accessList)
                end
            end)
        end
    end)
end)

RegisterServerEvent("Property:RemoveAccess")
AddEventHandler("Property:RemoveAccess", function(propertyID, targetIdentifier)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    MySQL.Async.fetchAll("SELECT accessList FROM properties_build WHERE propertyID = @propertyID", {
        ["@propertyID"] = propertyID
    }, function(result)
        if result and result[1] then
            local accessList = json.decode(result[1].accessList) or {}
            local newAccessList = {}

            for _, access in ipairs(accessList) do
                if access.identifier ~= targetIdentifier then
                    table.insert(newAccessList, access)
                end
            end

            MySQL.Async.execute("UPDATE properties_build SET accessList = @accessList WHERE propertyID = @propertyID", {
                ["@propertyID"] = propertyID,
                ["@accessList"] = json.encode(newAccessList)
            }, function(rowsChanged)
                if rowsChanged > 0 then
                    TriggerClientEvent('esx:showNotification', _src, "~g~Accès retiré avec succès")
                    TriggerClientEvent("Property:UpdateAccessList", _src, propertyID, newAccessList)
                end
            end)
        end
    end)
end)

RegisterNetEvent("Property:GetTargetJob")
AddEventHandler("Property:GetTargetJob", function(propertyID, targetId, jobType)
    local source = source
    local xTarget = ESX.GetPlayerFromId(targetId)
    
    if xTarget then
        if jobType == "Job" then
            if xTarget.job and xTarget.job.name then
                TriggerClientEvent("Property:SetPropertyJob", source, propertyID, xTarget.job.name)
            else
                TriggerClientEvent("esx:showNotification", source, "~s~Le joueur n'a pas de job principal.")
            end
        else
            if xTarget.job2 and xTarget.job2.name then
                TriggerClientEvent("Property:SetPropertyJob", source, propertyID, xTarget.job2.name)
            else
                TriggerClientEvent("esx:showNotification", source, "~s~Le joueur n'a pas de job secondaire.")
            end
        end
    else
        TriggerClientEvent("esx:showNotification", source, "~s~Joueur introuvable.")
    end
end)

ActiveStorageUsers = {}

RegisterServerEvent("Property:CheckStorageAccess")
AddEventHandler("Property:CheckStorageAccess", function(propertyID)
    local _src = source
    
    if ActiveStorageUsers[propertyID] ~= nil and ActiveStorageUsers[propertyID] ~= _src then
        TriggerClientEvent('esx:showNotification', _src, "Une personne est déjà dans le coffre")
        return
    end
    
    ActiveStorageUsers[propertyID] = _src
    
    TriggerClientEvent("Property:OpenStorageMenuConfirmed", _src, propertyID)
end)

RegisterServerEvent("Property:ReleaseStorageAccess")
AddEventHandler("Property:ReleaseStorageAccess", function(propertyID)
    local _src = source
    
    if ActiveStorageUsers[propertyID] == _src then
        ActiveStorageUsers[propertyID] = nil
    end
end)

AddEventHandler('playerDropped', function()
    local _src = source
    
    for propertyID, sourceID in pairs(ActiveStorageUsers) do
        if sourceID == _src then
            ActiveStorageUsers[propertyID] = nil
        end
    end
end)