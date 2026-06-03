--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local TimeoutJob7 = {};

RegisterServerEvent('Ouvre:Bahamas')
AddEventHandler('Ouvre:Bahamas', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob7[xPlayer.identifier] or GetGameTimer() - TimeoutJob7[xPlayer.identifier] > 120000) then
		TimeoutJob7[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "bahamas" then
            xPlayer.ban(0, '(Ouvre:Bahamas)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BAHAMAS', '~s~Annonce', "Bahamas est désormais ~g~Ouvert", '#FF00FF', 'CHAR_BAHAMAS')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Ferme:Bahamas')
AddEventHandler('Ferme:Bahamas', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob7[xPlayer.identifier] or GetGameTimer() - TimeoutJob7[xPlayer.identifier] > 120000) then
		TimeoutJob7[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "bahamas" then
            xPlayer.ban(0, '(Ferme:Bahamas)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BAHAMAS', '~s~Annonce', "Bahamas est désormais ~s~Fermer", '#FF00FF', 'CHAR_BAHAMAS')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Recrutement:Bahamas')
AddEventHandler('Recrutement:Bahamas', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob7[xPlayer.identifier] or GetGameTimer() - TimeoutJob7[xPlayer.identifier] > 120000) then
		TimeoutJob7[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "bahamas" then
            xPlayer.ban(0, '(Recrutement:Bahamas)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BAHAMAS', '~o~Recrutement', "Recrutement~s~ en cours, rendez-vous au ~o~Bahamas", '#FF9933', 'CHAR_BAHAMAS')

        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Personnaliser:Bahamas')
AddEventHandler('Personnaliser:Bahamas', function(message)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob7[xPlayer.identifier] or GetGameTimer() - TimeoutJob7[xPlayer.identifier] > 120000) then
		TimeoutJob7[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "bahamas" then
            xPlayer.ban(0, '(Personnaliser:Bahamas)');
            return
        end

        sendToDiscord("Annonce Bahamas", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)


        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BAHAMAS', '~b~Annonce', message, '#FF00FF', 'CHAR_BAHAMAS')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

local TimeoutSpawn = {}

RegisterNetEvent('bahamas:SpawnVehicle')
AddEventHandler('bahamas:SpawnVehicle', function(model, position, heading)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not TimeoutSpawn[xPlayer.identifier] or GetGameTimer() - TimeoutSpawn[xPlayer.identifier] > 60000) then
		TimeoutSpawn[xPlayer.identifier] = GetGameTimer();

        if xPlayer.job.name ~= "bahamas" then
            xPlayer.ban(0, '(bahamas:SpawnVehicle)');
            return
        end

        if model == "stretch" or model == "patriot2" then
            ESX.SpawnVehicle(GetHashKey(model), position, heading, nil, false, nil, function(vehicle)
                TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
            end)
            return
        else
            xPlayer.ban(0, '(bahamas:SpawnVehicle)');
            return
        end
    else
        xPlayer.showNotification("Veuillez patienter 1 minute avant de pouvoir ressortir un véhicule à nouveau.");
    end

end)