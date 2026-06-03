--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local TimeoutJob4 = {};

RegisterServerEvent('Ouvre:unicorn')
AddEventHandler('Ouvre:unicorn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob4[xPlayer.identifier] or GetGameTimer() - TimeoutJob4[xPlayer.identifier] > 120000) then
		TimeoutJob4[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "unicorn" then
            xPlayer.ban(0, '(Ouvre:unicorn)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'UNICORN', '~s~Annonce', "Unicorn est désormais ~g~Ouvert", '#FF00FF', 'CHAR_UNICORN')

        end
    else
        xPlayer.showNotification("Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Personnaliser:unicorn')
AddEventHandler('Personnaliser:unicorn', function(message)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
    if (not TimeoutJob4[xPlayer.identifier] or GetGameTimer() - TimeoutJob4[xPlayer.identifier] > 120000) then
		TimeoutJob4[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "unicorn" then
            xPlayer.ban(0, '(Personnaliser:unicorn)');
            return
        end
        sendToDiscord("Annonce Unicorn", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)


        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'UNICORN', '~o~Annonce', message, '#FF9933', 'CHAR_UNICORN')
        end
    else
        xPlayer.showNotification("Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Ferme:unicorn')
AddEventHandler('Ferme:unicorn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob4[xPlayer.identifier] or GetGameTimer() - TimeoutJob4[xPlayer.identifier] > 120000) then
		TimeoutJob4[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "unicorn" then
            xPlayer.ban(0, '(Ferme:unicorn)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'UNICORN', '~s~Annonce', "Unicorn est désormais ~s~Fermer", '#FF00FF', 'CHAR_UNICORN')

        end
    else
        xPlayer.showNotification("Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Recrutement:unicorn')
AddEventHandler('Recrutement:unicorn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob4[xPlayer.identifier] or GetGameTimer() - TimeoutJob4[xPlayer.identifier] > 120000) then
		TimeoutJob4[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "unicorn" then
            xPlayer.ban(0, '(Recrutement:unicorn)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'UNICORN', '~o~Recrutement', "Les Recrutement en cours, rendez-vous au ~s~Vanilla Unicorn", '#FF9933', 'CHAR_UNICORN')

        end
    else
        xPlayer.showNotification("Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

