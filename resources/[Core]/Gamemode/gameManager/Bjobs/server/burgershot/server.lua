TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local TimeoutJob7 = {};

RegisterServerEvent('Ouvre:BurgerShot')
AddEventHandler('Ouvre:BurgerShot', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob7[xPlayer.identifier] or GetGameTimer() - TimeoutJob7[xPlayer.identifier] > 120000) then
		TimeoutJob7[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "burgershot" then
            xPlayer.ban(0, '(Ouvre:BurgerShot)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BURGERSHOT', '~o~Annonce', "BurgerShot est désormais ~g~Ouvert", '#FF9933', 'CHAR_BURGERSHOT')

        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Ferme:BurgerShot')
AddEventHandler('Ferme:BurgerShot', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob7[xPlayer.identifier] or GetGameTimer() - TimeoutJob7[xPlayer.identifier] > 120000) then
		TimeoutJob7[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "burgershot" then
            xPlayer.ban(0, '(Ferme:BurgerShot)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BURGERSHOT', '~o~Annonce', "BurgerShot est désormais ~s~Fermer", '#FF9933', 'CHAR_BURGERSHOT')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Personnaliser:BurgerShot')
AddEventHandler('Personnaliser:BurgerShot', function(message)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()   
    if (not TimeoutJob7[xPlayer.identifier] or GetGameTimer() - TimeoutJob7[xPlayer.identifier] > 120000) then
		TimeoutJob7[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "burgershot" then
            xPlayer.ban(0, '(Personnaliser:BurgerShot)');
            return
        end
    end
    sendToDiscord("Annonce Burgershot", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)


    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BURGERSHOT', '~o~Annonce', message, '#FF9933', 'CHAR_BURGERSHOT')
    end
end)


RegisterServerEvent('Recrutement:BurgerShot')
AddEventHandler('Recrutement:BurgerShot', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob7[xPlayer.identifier] or GetGameTimer() - TimeoutJob7[xPlayer.identifier] > 120000) then
		TimeoutJob7[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "burgershot" then
            xPlayer.ban(0, '(Recrutement:BurgerShot)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BURGERSHOT', '~o~Recrutement', "Recrutement en cours, rendez-vous au ~o~BurgerShot", '#FF9933', 'CHAR_BURGERSHOT')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterNetEvent('burgershot:brugerclassique')
AddEventHandler('burgershot:brugerclassique', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ped = GetPlayerPed(_source);
    local coords = GetEntityCoords(ped)
    local craftbruger = vector3(-1186.4180, -901.2608, 13.7984)

    local garnitures = xPlayer.getInventoryItem('garnitures').count
    local painburger = xPlayer.getInventoryItem('painburger').count
	local burgerclassique = xPlayer.getInventoryItem('burgerclassique').count
    local steak = xPlayer.getInventoryItem('steak').count

    if xPlayer.job.name ~= "burgershot" then
        xPlayer.ban(0, '(burgershot:brugerclassique)');
        return
    end

    if #(coords - craftbruger) > 20.0 then
        xPlayer.ban(0, '(burgershot:brugerclassique)');
        return
    end

    if not xPlayer.canCarryItem("burgerclassique", 1) then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez ateint la limite maximum')
    elseif garnitures < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de garnitures pour faire ceci')
    elseif steak < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de garnitures pour faire ceci')
	elseif painburger < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de painburger pour faire ceci')
    else
        xPlayer.removeInventoryItem('garnitures', 1)
		xPlayer.removeInventoryItem('cornichons', 1)
		xPlayer.removeInventoryItem('painburger', 1)
        xPlayer.removeInventoryItem('steak', 1)
        xPlayer.addInventoryItem('burgerclassique', 1)    
    end
end)

RegisterNetEvent('burgershot:burger')
AddEventHandler('burgershot:burger', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ped = GetPlayerPed(_source);
    local coords = GetEntityCoords(ped)
    local craftburger = vector3(-1186.4180, -901.2608, 13.7984)

    local garnitures = xPlayer.getInventoryItem('garnitures').count
    local painburger = xPlayer.getInventoryItem('painburger').count
	local burger = xPlayer.getInventoryItem('burger').count
    local steak = xPlayer.getInventoryItem('steak').count

    if xPlayer.job.name ~= "burgershot" then
        xPlayer.ban(0, '(burgershot:burger)');
        return
    end

    if #(coords - craftburger) > 20.0 then
        xPlayer.ban(0, '(burgershot:burger)');
        return
    end

    if not xPlayer.canCarryItem("burger", 1) then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez ateint la limite maximum')
    elseif garnitures < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de garnitures pour faire ceci')
    elseif steak < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de garnitures pour faire ceci')
	elseif painburger < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de painburger pour faire ceci')
    else
        xPlayer.removeInventoryItem('garnitures', 1)
		xPlayer.removeInventoryItem('cornichons', 1)
		xPlayer.removeInventoryItem('painburger', 1)
        xPlayer.removeInventoryItem('steak', 1)
        xPlayer.addInventoryItem('burger', 1)    
    end
end)

RegisterNetEvent('burgershot:frite')
AddEventHandler('burgershot:frite', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ped = GetPlayerPed(_source);
    local coords = GetEntityCoords(ped)
    local craftfrite = vector3(-1187.9594, -899.0447, 13.7984)

    local salt = xPlayer.getInventoryItem('salt').count
    local frite = xPlayer.getInventoryItem('frite').count
    local boitedefrite = xPlayer.getInventoryItem('boitedefrite').count
	local patate = xPlayer.getInventoryItem('patate').count

    if xPlayer.job.name ~= "burgershot" then
        xPlayer.ban(0, '(burgershot:frite)');
        return
    end

    if #(coords - craftfrite) > 20.0 then
        xPlayer.ban(0, '(burgershot:frite)');
        return
    end

    if not xPlayer.canCarryItem("frite", 1) then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez ateint la limite maximum')
    elseif salt < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de salt pour faire ceci')
    elseif boitedefrite < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de boitedefrite pour faire ceci')
	elseif patate < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de patate pour faire ceci')
    else
        xPlayer.removeInventoryItem('salt', 1)
		xPlayer.removeInventoryItem('boitedefrite', 1)
		xPlayer.removeInventoryItem('patate', 1)
        xPlayer.addInventoryItem('frite', 1)    
    end
end)


RegisterNetEvent('burgershot:garnitures')
AddEventHandler('burgershot:garnitures', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ped = GetPlayerPed(_source);
    local coords = GetEntityCoords(ped)
    local craftgarniture = vector3(-1188.6073, -903.4839, 13.7984)

    local tomates = xPlayer.getInventoryItem('tomates').count
	local cornichons = xPlayer.getInventoryItem('cornichons').count
    local salade = xPlayer.getInventoryItem('salade').count

    if xPlayer.job.name ~= "burgershot" then
        xPlayer.ban(0, '(burgershot:garnitures)');
        return
    end

    if #(coords - craftgarniture) > 20.0 then
        xPlayer.ban(0, '(burgershot:garnitures)');
        return
    end

    if not xPlayer.canCarryItem("garnitures", 1) then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez ateint la limite maximum')
    elseif tomates < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de tomates pour faire ceci')
	elseif cornichons < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de cornichons pour faire ceci')
	elseif salade < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de salade pour faire ceci')
    else
        xPlayer.removeInventoryItem('tomates', 1)
		xPlayer.removeInventoryItem('cornichons', 1)
		xPlayer.removeInventoryItem('salades', 1)
        xPlayer.addInventoryItem('garnitures', 1)    
    end
end)

RegisterNetEvent('burgershot:BuyItem')
AddEventHandler('burgershot:BuyItem', function(item, price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = price
    local item = item

    if xPlayer.job.name ~= "burgershot" then
        xPlayer.ban(0, '(burgershot:BuyCornichons)');
        return
    end

    local society = ESX.DoesSocietyExist("burgershot");

    if (society) then

        if (xPlayer) then
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.addInventoryItem(item, 1)
                ESX.RemoveSocietyMoney("burgershot", price);
                TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
            else
                TriggerClientEvent('esx:showNotification', source, "[~r~Impossible~h~] Vous n'avez pas assez de place sur vous")
            end
        end

    end
    
end)