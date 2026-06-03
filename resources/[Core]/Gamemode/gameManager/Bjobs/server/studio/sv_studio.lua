ESX = nil

local TimeoutJob4 = {};

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterServerEvent('Studio:annonce')
AddEventHandler('Studio:annonce', function(message)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
    if (not TimeoutJob4[xPlayer.identifier] or GetGameTimer() - TimeoutJob4[xPlayer.identifier] > 120000) then
		TimeoutJob4[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "studio" then
            xPlayer.ban(0, '(Personnaliser:studio)');
            return
        end
        sendToDiscord("Annonce Studio", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)


        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showNotification', xPlayers[i], "~s~Annonce Studio\n~s~" .. message)
        end
    else
        xPlayer.showNotification("Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)