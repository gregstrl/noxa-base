ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local vehiclePlates = {}

CreateThread(function()
    while true do
        Wait(1000) 
        local vehicles = GetGamePool('CVehicle')

        for _, vehicle in ipairs(vehicles) do
            if DoesEntityExist(vehicle) and not vehiclePlates[vehicle] then
                local driver = GetPedInVehicleSeat(vehicle, -1)

                if driver and driver ~= 0 and not IsPedAPlayer(driver) then
                    local randomNumber = math.random(1000, 9999)
                    local plate = "PNJ" .. randomNumber
                    SetVehicleNumberPlateText(vehicle, plate)

                    vehiclePlates[vehicle] = true
                end
            end
        end

        for vehicle, _ in pairs(vehiclePlates) do
            if not DoesEntityExist(vehicle) then
                vehiclePlates[vehicle] = nil
            end
        end
    end
end)


--[[local GameTimer = {}
local blacklist = {"discord.gg", ".gg", "ez", "ladose", "bz", "discord", "tz", "bfn", "bluecity", "Koy", "nique toi", "ntm", "eulen", "susano", "cheater", "mod", "keyzer", "hx", "cheat", "cheat er", "killer", "id", "i d", "report", "r e p o r t", "rep ort", "r eport", "captus", "captus leplusbeau", "tige", "jail", "t i g e", "ta mere la pute", "csc", "s e r a", "staff", "st a ff", "s t a f f", "washington", "j a i l", "travaux interet", "spam", "bztmr", "bztm", "bztmort", "inverssed", "Enzo Legrand", "Legrand", "neel", "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "xxxxxxxxxxxxxxxxxxxx", "serax", "neel", "nsk", "n s k", "c a p t u s", "milox", "hayder", "captus", "s e r a x", "ser ax", "ntm", "fdp","serveur","server","moddeur","modeur","revive","report","troll","trolleur","hrp","rp","staff","niquer","race","hitler","carkill","adolf","noir","arabe","blanc","jail","baizer","baize","baise","baiser","whitos","poutine","staline","juif","spawns","negro","négro","pd","negre","nègre","serv","Wise","handicapé","handicape","handicaper","lénégropu","lgbt","homo","cheat","mods","nik","nique","niq","carte","tp","staff","encule","chatte","chate","[ano]","tg","Phantom","id","ids","pakito","pakitoo","pakiito","paakito","bagarre","bagarree","bagaarre","ms13","ms-13","nique","arme","maxxtox","ban","bans","spiderman","staffss","Scene","rolep","fils de pute","rp","roleplay","discord.gg",".gg/","rencons","nike","mere","pere","maman","papa","trolleur","troll","troleur","moddeur","magicien","dieu","mod","freekill","troll","trolleur","trol","jail","pain","/ano","ano","fdp","ntm","irl","discord","report","server","joueurs","joueur","serveur","staff","staffs","papillon","max2tox","max","maxxtox","papillion",}

RegisterCommand("twt", function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xPlayers = ESX.GetPlayers()
    local msg = table.concat(args, " ")
    local blacklistfound = false

    if GameTimer[src] == nil or GetGameTimer() > GameTimer[src] then
        for _, word in pairs(blacklist) do
            for _, arg in pairs(args) do
                if string.sub(string.lower(arg), 1, string.len(word)) == word then
                    blacklistfound = true
                    xPlayer.showNotification("[~c~Impossible~w~] Votre phrase contient un mot non-autorisé.", false, false, nil)
                end
            end
        end

        if not blacklistfound then
            -- Récupération des noms directement depuis la base de données
            MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
                ['@identifier'] = xPlayer.identifier
            }, function(result)
                local firstName = result[1] and result[1].firstname or "Inconnu"
                local lastName = result[1] and result[1].lastname or "Inconnu"
                local fullName = firstName .. " " .. lastName

                -- Envoi des logs
                SendLogs("Logs Twitter", "Koy | Twitter", "**__Informations Notification__**\n\n> **Nom** : `"
                    .. fullName .. "` | **ID UNIQUE :** (`" .. xPlayer.character_id .. "`)"
                    .. " | **ID TEMPORAIRE :** (`" .. xPlayer.source .. "`)\n> **Message : ** `" .. msg .. "`",
                    "https://discord.com/api/webhooks/1320592373645836429/4vz0Ue6S2MPyY7X7unzgjEFSVXzWYsIAr-8i_1RBVy5GiRq8fTLr5Vz6SsxQFR1eEjAe"
                )


                -- Notification à tous les joueurs
                for _, playerId in ipairs(xPlayers) do
                    TriggerClientEvent('esx:showAdvancedNotification', playerId, 'Twitter', 
                        '~b~' .. fullName, '~b~Message~w~: ' .. msg, '#5eb6e6', 'CHAR_TWT')
                end
            end)
        end

        GameTimer[src] = GetGameTimer() + 15000
    else
        xPlayer.showNotification("[~c~Impossible~w~] Vous devez attendre 15 secondes pour refaire un tweet.", false, false, nil)
    end
end)]]

--[[RegisterCommand("ano", function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xPlayers = ESX.GetPlayers()
    local msg = table.concat(args, " ")
    local blacklistfound = false

    if GameTimer[src] == nil or GetGameTimer() > GameTimer[src] then
        for _, word in pairs(blacklist) do
            for _, arg in pairs(args) do
                if string.sub(string.lower(arg), 1, string.len(word)) == word then
                    blacklistfound = true
                    xPlayer.showNotification("[~c~Impossible~w~] Votre phrase contient un mot non-autorisé.", false, false, nil)
                end
            end
        end

        if not blacklistfound then
            -- Message anonyme
            SendLogs("Logs Anonyme", "Koy | Anonyme", "**__Informations Notification__**\n\n> **Nom** : `"..GetPlayerName(xPlayer.source).."` | **U :** (`"..xPlayer.character_id.."`)\n> **Message : ** `"..msg.."`", "https://discord.com/api/webhooks/1320592412330037299/n1-t5GP5Z0bBkOX5J58Thk7aB19s1E0qu4v-zgdfEQnM8XPQbQ4cLTVMNyO4EYAyZOOy")


            for _, playerId in ipairs(xPlayers) do
                TriggerClientEvent('esx:showAdvancedNotification', playerId, 'Anonymous', 
                    '~b~wise', '~b~Message~w~: ' .. msg, '#0055ff', 'CHAR_ANO')
            end
        end

        GameTimer[src] = GetGameTimer() + 30000
    else
        xPlayer.showNotification("[~c~Impossible~w~] Vous devez attendre 30 secondes pour refaire un message anonyme.", false, false, nil)
    end
end)]]
--[[function SendLogs(name, title, message, web)
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
end]]

-- SAVE AUTOMATIQUE TOUT LES HEURES

Citizen.CreateThread(function()
    while true do
        -- Log pour savoir quand le thread s'exécute
        print("[INFO] Exécution de la commande '/savegang' automatique.")
        -- Exécute la commande
        ExecuteCommand('savegang') 

        -- Attente (utilise 1800000 pour une demi-heure)
        Wait(1800000)
    end
end)

-- Evénement pour le joueur qui se connecte
AddEventHandler('esx:playerLoaded', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    -- Vérifie si xPlayer existe
    if xPlayer then
        -- Récupère le niveau VIP du joueur via la méthode getVIP()
        local getVIP = xPlayer.getVIP()

        if getVIP == 2 then
            TriggerClientEvent('esx:showNotification', source, '[~y~Information~s~] Votre poids a été réglé à 70kg. (~y~Gold~s~)')
            xPlayer.setMaxWeight(70)  -- Poids pour VIP Gold
        elseif getVIP == 3 then
            -- VIP Diamond
            TriggerClientEvent('esx:showNotification', source, '[~y~Information~s~] Votre poids a été réglé à 85kg. (~b~Diamond~s~)')
            xPlayer.setMaxWeight(85)
        else
            xPlayer.setMaxWeight(50)
        end
    end
end)

RegisterNetEvent('Serax:preventVehicleDespawn')
AddEventHandler('Serax:preventVehicleDespawn', function(vehicleNetId)
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
    if vehicle ~= 0 and DoesEntityExist(vehicle) then
        local driver = GetPedInVehicleSeat(vehicle, -1)
        if driver ~= 0 and not IsPedAPlayer(driver) then
            TriggerClientEvent('Serax:clientPreventVehicleDespawn', -1, vehicleNetId)
        end
    end
end)
