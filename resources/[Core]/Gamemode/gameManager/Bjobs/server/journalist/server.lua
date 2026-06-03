ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterServerEvent('Ouvre:journalist')
AddEventHandler('Ouvre:journalist', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'WEAZEL NEWS', '~s~Annonce', "Weazel News est désormais ~g~Ouvert", '#FF3333', 'CHAR_WEAZELNEWS')

	end
end)

RegisterServerEvent('journalist:annonce')
AddEventHandler('journalist:annonce', function(annonce)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent('esx:showNotification', xPlayers[i], annonce)
    end
end)

RegisterServerEvent('Ferme:journalist')
AddEventHandler('Ferme:journalist', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'WEAZEL NEWS', '~s~Annonce', "Weazel News est désormais ~s~Fermer", '#FF3333', 'CHAR_WEAZELNEWS')
	end
end)

RegisterServerEvent('Recru:journalist')
AddEventHandler('Recru:journalist', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'WEAZEL NEWS', '~o~Recrutement', "Weazel News recrutent ! Rendez-vous au ~o~Weazel News", '#FF9933', 'CHAR_WEAZELNEWS')
	end
end)
