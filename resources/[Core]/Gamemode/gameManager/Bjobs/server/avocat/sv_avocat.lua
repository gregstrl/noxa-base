ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterServerEvent('Ouvre:avocat')
AddEventHandler('Ouvre:avocat', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'AVOCAT', '~o~Annonce', "Avocat est désormais ~g~Ouvert", '#FFB266', 'CHAR_AVOCAT')
	end
end)

RegisterServerEvent('Ferme:avocat')
AddEventHandler('Ferme:avocat', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'AVOCAT', '~o~Annonce', "Avocat est désormais ~s~Fermer", '#FFB266', 'CHAR_AVOCAT')

	end
end)

RegisterServerEvent('Recru:avocat')
AddEventHandler('Recru:avocat', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'AVOCAT', '~o~Recrutement', "Les avocats recrutent ! Rendez-vous au ~o~Cabinet d\'Avocat", '#FFB266', 'CHAR_AVOCAT')

	end
end)

-- ANNONCE
local TimeoutJob = {};

RegisterServerEvent('Personnaliser:avocat')
AddEventHandler('Personnaliser:avocat', function(message)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
    
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
        TimeoutJob[xPlayer.identifier] = GetGameTimer();
        
        if xPlayer.job.name ~= "avocat" then
            xPlayer.ban(0, '(Personnaliser:avocat)');
            return
        end

		sendToDiscord("Annonce Avocat", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)

        
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'AVOCAT', '~o~Annonce', message, '#FFB266', 'CHAR_AVOCAT')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

local function sendToDiscordWithSpecialURL(Color, Title, Description)
	local Content = {
	        {
	            ["color"] = Color,
	            ["title"] = Title,
	            ["description"] = Description,
		        ["footer"] = {
	            ["text"] = "Johnny Avocat",
	            ["icon_url"] = nil,
	            },
	        }
	    }
	PerformHttpRequest(ConfigWebhookRendezVous, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("Rdv:Avocat")
AddEventHandler("Rdv:Avocat", function(nomprenom, numero, heurerdv, rdvmotif)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ident = xPlayer.getIdentifier()
	local date = os.date('*t')

	if date.day < 10 then date.day = '' .. tostring(date.day) end
	if date.month < 10 then date.month = '' .. tostring(date.month) end
	if date.hour < 10 then date.hour = '' .. tostring(date.hour) end
	if date.min < 10 then date.min = '' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '' .. tostring(date.sec) end

	if ident == 'steam:11' then--Special character in username just crash the server
	else 
		sendToDiscordWithSpecialURL(16744192, "Demande de Rendez-Vous\n\n```Nom : "..nomprenom.."\n\nNuméro de Téléphone: "..numero.."\n\nHeure du Rendez Vous : " ..heurerdv.."\n\nMotif du Rendez-vous : " ..rdvmotif.. "\n\n```Date : " .. date.day .. "." .. date.month .. "." .. date.year .. " | " .. date.hour .. " h " .. date.min .. " min " .. date.sec)
	end
end)


RegisterServerEvent('Appel:avocat')
AddEventHandler('Appel:avocat', function()
    
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'avocat' then
		TriggerClientEvent('esx:showNotification', xPlayers[i], 'Un Avocat est appelé l\'accueil !')
        end
    end
end)

ConfigWebhookRendezVous = "https://discord.com/api/webhooks/1119323769706643538/lkSugbpe9DBeQkKbFPfdUxQD4Sz61d9u3on7pQkGLWg5ZU_04erIsR9nzbyVCc2T_YVN"