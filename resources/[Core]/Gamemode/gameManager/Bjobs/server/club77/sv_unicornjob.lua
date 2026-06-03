--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local TimeoutJob4 = {};

RegisterServerEvent('Ouvre:club77')
AddEventHandler('Ouvre:club77', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob4[xPlayer.identifier] or GetGameTimer() - TimeoutJob4[xPlayer.identifier] > 120000) then
		TimeoutJob4[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "club77" then
            xPlayer.ban(0, '(Ouvre:club77)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'CLUB 77', '~s~Annonce', "Club 77 est désormais ~g~Ouvert", '#FF00FF', 'CHAR_CLUB77')

        end
    else
        xPlayer.showNotification("[~s~Impossible~s~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Personnaliser:club77')
AddEventHandler('Personnaliser:club77', function(message)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
    if (not TimeoutJob4[xPlayer.identifier] or GetGameTimer() - TimeoutJob4[xPlayer.identifier] > 120000) then
		TimeoutJob4[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "club77" then
            xPlayer.ban(0, '(Personnaliser:club77)');
            return
        end
    end 
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'CLUB 77', '~s~Annonce', message, '#FF00FF', 'CHAR_CLUB77')
    end
end)

RegisterServerEvent('Ferme:club77')
AddEventHandler('Ferme:club77', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob4[xPlayer.identifier] or GetGameTimer() - TimeoutJob4[xPlayer.identifier] > 120000) then
		TimeoutJob4[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "club77" then
            xPlayer.ban(0, '(Ferme:club77)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'CLUB 77', '~s~Annonce', "Club 77 est désormais ~s~Fermer", '#FF00FF', 'CHAR_CLUB77')
        end
    else
        xPlayer.showNotification("[~s~Impossible~s~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Recrutement:club77')
AddEventHandler('Recrutement:club77', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob4[xPlayer.identifier] or GetGameTimer() - TimeoutJob4[xPlayer.identifier] > 120000) then
		TimeoutJob4[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "club77" then
            xPlayer.ban(0, '(Recrutement:club77)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'CLUB 77', '~o~Recrutement', "Les Recrutement en cours, rendez-vous au ~g~Club 77", '#FF9933', 'CHAR_CLUB77')

        end
    else
        xPlayer.showNotification("[~s~Impossible~s~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)


RegisterServerEvent('esx_club77job:prendreitems')
AddEventHandler('esx_club77job:prendreitems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(esx_club77job:prendreitems)');
        return
    end

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_club77', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, 'Objet retiré', count, inventoryItem.label)
			end
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)


RegisterNetEvent('esx_club77job:stockitem')
AddEventHandler('esx_club77job:stockitem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(esx_club77job:stockitem)');
        return
    end

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_club77', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', _source, "Objet déposé "..count..""..inventoryItem.label.."")
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)

ESX.RegisterServerCallback('esx_club77job:inventairejoueur', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(esx_club77job:inventairejoueur)');
        return
    end

	cb({items = items})
end)

ESX.RegisterServerCallback('esx_club77job:prendreitem', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(esx_club77job:prendreitem)');
        return
    end

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_club77', function(inventory)
		cb(inventory.items)
	end)
end)

--Shop Club77 
RegisterNetEvent('Club77:BuyEau')
AddEventHandler('Club77:BuyEau', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(Club77:BuyEau)');
        return
    end

    if xPlayer.canCarryItem('water', 1) then
        xPlayer.addInventoryItem('water', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterNetEvent('Club77:BuyIceTea')
AddEventHandler('Club77:BuyIceTea', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(Club77:BuyIceTea)');
        return
    end

    if xPlayer.canCarryItem('icetea', 1) then
        xPlayer.addInventoryItem('icetea', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterNetEvent('Club77:BuyLimonade')
AddEventHandler('Club77:BuyLimonade', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(Club77:BuyLimonade)');
        return
    end

    if xPlayer.canCarryItem('limonade', 1) then
        xPlayer.addInventoryItem('limonade', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
        return
    else
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterNetEvent('Club77:BuyVine')
AddEventHandler('Club77:BuyVine', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(Club77:BuyVine)');
        return
    end

    if xPlayer.canCarryItem('vine', 1) then
        xPlayer.addInventoryItem('vine', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterNetEvent('Club77:BuyWhiskycoca')
AddEventHandler('Club77:BuyWhiskycoca', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(Club77:BuyWhiskycoca)');
        return
    end

    if xPlayer.canCarryItem('wiskycoca', 1) then
        xPlayer.addInventoryItem('wiskycoca', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterNetEvent('Club77:BuyMojito')
AddEventHandler('Club77:BuyMojito', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(Club77:BuyMojito)');
        return
    end
    if xPlayer.canCarryItem('mojito', 1) then
        xPlayer.addInventoryItem('mojito', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterNetEvent('Club77:BuyCoca')
AddEventHandler('Club77:BuyCoca', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(Club77:BuyCoca)');
        return
    end

    if xPlayer.canCarryItem('coca', 1) then
        xPlayer.addInventoryItem('coca', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterNetEvent('Club77:BuyFanta')
AddEventHandler('Club77:BuyFanta', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(Club77:BuyFanta)');
        return
    end

    if xPlayer.canCarryItem('fanta', 1) then
        xPlayer.addInventoryItem('fanta', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterNetEvent('Club77:BuyChips')
AddEventHandler('Club77:BuyChips', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(Club77:BuyChips)');
        return
    end

    if xPlayer.canCarryItem('chips', 1) then
        xPlayer.addInventoryItem('chips', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterNetEvent('Club77:BuyCacahuete')
AddEventHandler('Club77:BuyCacahuete', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(Club77:BuyCacahuete)');
        return
    end

    if xPlayer.canCarryItem('cacahuete', 1) then
        xPlayer.addInventoryItem('cacahuete', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterNetEvent('Club77:BuyOlive')
AddEventHandler('Club77:BuyOlive', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  

    if xPlayer.job.name ~= "club77" then
        xPlayer.ban(0, '(Club77:BuyOlive)');
        return
    end

    if xPlayer.canCarryItem('olive', 1) then
        xPlayer.addInventoryItem('olive', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas assez de place dans votre inventaire')
    end
end)
