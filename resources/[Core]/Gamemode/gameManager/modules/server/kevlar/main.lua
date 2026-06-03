Config.eKevlar.PlayerList = {}
Config.eKevlar.KevPlayList = {}
Config.eKevlar.tokenPlayer = {}

AddEventHandler('esx:playerLoaded', function()
    local _src = source
    if not Config.eKevlar.KevPlayList[_src] then 
        Config.eKevlar.KevPlayList[_src] = _src
        Config.eKevlar.tokenPlayer[_src] = _src

    end
end)

AddEventHandler("esx:playerDropped", function(reason)
    if Config.eKevlar.KevPlayList[source] then 
        Config.eKevlar.KevPlayList[source] = nil
        Config.eKevlar.tokenPlayer[source] = nil
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000) -- Augmente l'intervalle pour réduire la charge du processeur

        -- Parcours la liste des joueurs uniquement si nécessaire
        for k, v in pairs(Config.eKevlar.PlayerList) do
            local playerPed = GetPlayerPed(k)
            if playerPed ~= 0 then
                local playerArmor = GetPedArmour(playerPed)

                -- Si l'armure est à 0 et que le joueur est dans la liste, on le supprime
                if playerArmor == 0 then
                    if Config.eKevlar.KevPlayList[k] then
                        Config.eKevlar.KevPlayList[k] = nil
                    end
                else
                    -- Si l'armure est > 0 et que le joueur est dans la liste, on met à jour
                    if Config.eKevlar.KevPlayList[k] then
                        Config.eKevlar.KevPlayList[k] = playerArmor
                    else
                        -- Si le joueur n'est pas dans la liste, on appelle l'action de bannissement
                        Config.eKevlar.BanAction()
                    end
                end
            end
        end
    end
end)


Citizen.CreateThread(function()
    while ESX == nil do Wait(1) end 
    ESX.RegisterUsableItem('kevlar', function(source)
                --ESX.toConsole('kevlar')
        TriggerEvent('obi:UseKevlar', source, 'kevlar', 100)
    end)

    ESX.RegisterUsableItem('kevlarvip', function(source)
        TriggerEvent('obi:UseKevlar', source, 'kevlarvip', 100)
    end)
end)

RegisterNetEvent('getPlayerskin')
AddEventHandler('getPlayerskin', function(identifier, cb)
    if not identifier or type(cb) ~= "function" then
        print("[getPlayerskin] Invalid parameters.")
        return
    end

    -- Utilisation d'une requête SQL asynchrone
    MySQL.Async.fetchScalar('SELECT skin FROM users WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(skinData)
        local skin = nil

        -- Décodage JSON si des données sont trouvées
        if skinData then
            local success, decoded = pcall(json.decode, skinData)
            if success then
                skin = decoded
            else
                print("[getPlayerskin] JSON decoding failed for identifier:", identifier)
            end
        end

        -- Exécution du callback avec les données du skin
        cb(skin)
    end)
end)


RegisterNetEvent('obi:BreakKevlar')
AddEventHandler('obi:BreakKevlar', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if Config.eKevlar.KevPlayList[src] then 
        Config.eKevlar.KevPlayList[src] = nil
    end
end)

AddEventHandler('obi:UseKevlar', function(src, type, count)
    local src = src
    local xPlayer = ESX.GetPlayerFromId(src)
    --ESX.toConsole('src ===>'..src)

    
    if (xPlayer) then 
     --   ESX.toConsole('use kevlar after xplayer')
        if xPlayer.getInventoryItem(type).count > 0 then
            if not Config.eKevlar.KevPlayList[src] then
              xPlayer.removeInventoryItem(type, 1)
              Config.eKevlar.KevPlayList[src] = count
              SetPedArmour(GetPlayerPed(src), count)
               -- ESX.toConsole('identifier '..xPlayer.identifier)
              TriggerEvent('getPlayerskin', xPlayer.identifier, function(skin)
                  if skin.sex == 0 then
                   -- ESX.toConsole('skin sex')
                      local clothesSkin = {
                          ['bproof_1'] = Config.eKevlar.skin.male.kevID, 
                          ['bproof_2'] = Config.eKevlar.skin.male.textureID,
                      }
                      TriggerClientEvent(Config.eKevlar.loadClothesEvent, src, skin, clothesSkin)
                  else
                      local clothesSkin = {
                          ['bproof_1'] = Config.eKevlar.skin.female.kevID, 
                          ['bproof_2'] = Config.eKevlar.skin.female.textureID,
                      }
                      TriggerEvent(Config.eKevlar.loadClothesEvent, src, skin, clothesSkin)
                  end
              end)
              TriggerClientEvent('obi:SetArmour', src, true)
              SendLogs(("Le Joueur (%s - %s) viens d'utiliser son kevlar"):format(xPlayer.name, xPlayer.character_id ), {
                author = society,
                fields = {
                    {title = 'Player', subtitle = xPlayer.name},
                    {title = 'ID Unique', subtitle = xPlayer.character_id},
                    {title = 'Identifier', subtitle = xPlayer.identifier},
                },
                channel = 'kevlar'
            })
            else
                xPlayer.showNotification('[~r~Impossible~s~] Vous avez déjà un kevlar')
            end
        end
    end
end)

RegisterNetEvent('obi:RemoveKevlar')
AddEventHandler('obi:RemoveKevlar', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if Config.eKevlar.KevPlayList[src] and GetPedArmour(GetPlayerPed(src)) > 0 then
        if GetPedArmour(GetPlayerPed(src)) > 50 and GetPedArmour(GetPlayerPed(src)) <= 100 then
            xPlayer.addInventoryItem('kevlar', 1) 
            Config.eKevlar.KevPlayList[src] = nil
        elseif GetPedArmour(GetPlayerPed(src)) > 50 and GetPedArmour(GetPlayerPed(src)) <= 100 then
            xPlayer.addInventoryItem('kevlarip', 1) 
            ServerConfiguration.eKevlar.KevPlayList[src] = nil
        end
        TriggerEvent('getPlayerskin', xPlayer.identifier, function(skin)
            if skin.sex == 0 then
                local clothesSkin = {
                    ['bproof_1'] = 0, 
                    ['bproof_2'] = 0,
                }
                TriggerClientEvent(Config.eKevlar.loadClothesEvent, src, skin, clothesSkin)
            else
                local clothesSkin = {
                    ['bproof_1'] = 0, 
                    ['bproof_2'] = 0,
                }
                TriggerEvent(Config.eKevlar.loadClothesEvent, src, skin, clothesSkin)
            end
        end)
        SetPedArmour(GetPlayerPed(src), 0)
        xPlayer.showNotification('Votre kevlar à été remis dans votre inventaire')
        TriggerClientEvent('obi:SetArmour', src, false)
    else
        xPlayer.showNotification('Vous n\'avez pas de kevlar')
    end
end)

AddEventHandler('playerDropped', function (reason)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if (xPlayer) then
        if Config.eKevlar.KevPlayList[src] then
            if Config.eKevlar.KevPlayList[src] > 70 and Config.eKevlar.KevPlayList[src] <= 100 then
                xPlayer.addInventoryItem('kevlar', 1)
            elseif ServerConfiguration.eKevlar.KevPlayList[src] > 70 and ServerConfiguration.eKevlar.KevPlayList[src] <= 100 then
                xPlayer.addInventoryItem('kevlarvip', 1) 
            end
        end
    end
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