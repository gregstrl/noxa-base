local playersInCooldown = {}

local function hasPermission(xPlayer)
    local allowedGroups = {
        'founder', 'responsable', 'admin', 'moderateur', 'modotest'
    }

    for _, group in ipairs(allowedGroups) do
        if xPlayer.getGroup() == group then
            return true
        end
    end
    return false
end


local playerAtatStates = {}

RegisterServerEvent('atat:saveState')
AddEventHandler('atat:saveState', function(atatEndTime)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]

    if identifier then
        playerAtatStates[identifier] = atatEndTime
    end
end)

RegisterServerEvent('atat:loadState')
AddEventHandler('atat:loadState', function()
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]

    if identifier and playerAtatStates[identifier] then
        local atatEndTime = playerAtatStates[identifier]
        TriggerClientEvent('atat:applyState', src, atatEndTime)
    end
end)


local function startAtat(playerId)
    local atatDuration = 100

    TriggerClientEvent('atat:applyEffect', playerId, true)

    Citizen.SetTimeout(atatDuration * 1000, function()
        TriggerClientEvent('atat:applyEffect', playerId, false)
    end)

    playersInCooldown[playerId] = true
    Citizen.SetTimeout(Config.CooldownDuration * 1000, function()
        playersInCooldown[playerId] = nil
    end)
end


RegisterCommand('giveata', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if hasPermission(xPlayer) then
        local targetPlayerId = tonumber(args[1])

        if not targetPlayerId then
            TriggerClientEvent('esx:showNotification', source, 'Utilisation: /giveata [ID du joueur]')
            return
        end

        TriggerClientEvent('atat:applyEffect', targetPlayerId, true)
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas la permission d\'utiliser cette commande.')
    end
end, false)

RegisterCommand('supp', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if hasPermission(xPlayer) then
        local targetPlayerId = tonumber(args[1])

        if not targetPlayerId then
            TriggerClientEvent('esx:showNotification', source, 'Utilisation: /suppata [ID du joueur]')
            return
        end

        TriggerClientEvent('atat:applyEffect', targetPlayerId, false)
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas la permission d\'utiliser cette commande.')
    end
end, false)


RegisterCommand('removeata', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if hasPermission(xPlayer) then
        local targetPlayerId = tonumber(args[1])

        if not targetPlayerId then
            xPlayer.showNotification('Utilisation: /removeata [ID du joueur]')
            return
        end

        local targetPlayer = ESX.GetPlayerFromId(targetPlayerId)
        if not targetPlayer then
            xPlayer.showNotification('Joueur non trouvé')
            return
        end

        TriggerClientEvent('atat:applyEffect', targetPlayerId, false)
        
        local identifier = GetPlayerIdentifiers(targetPlayerId)[1]
        if identifier and playerAtatStates[identifier] then
            playerAtatStates[identifier] = nil
        end

        xPlayer.showNotification('ATA retiré pour l\'ID: ' .. targetPlayerId)
        targetPlayer.showNotification('Votre ATA a été retiré par un staff')

    else
        xPlayer.showNotification('Vous n\'avez pas la permission d\'utiliser cette commande.')
    end
end, false)

RegisterCommand('atazone', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if hasPermission(xPlayer) then
        local radius = tonumber(args[1])
        
        if not radius then
            TriggerClientEvent('esx:showNotification', source, 'Utilisation: /atazone [rayon en mètres]')
            return
        end
        
        local sourceCoords = GetEntityCoords(GetPlayerPed(source))
        local players = ESX.GetPlayers()
        
        for _, playerId in ipairs(players) do
            if playerId ~= source then
                local targetCoords = GetEntityCoords(GetPlayerPed(playerId))
                local distance = #(sourceCoords - targetCoords)
                
                if distance <= radius then
                    TriggerClientEvent('atat:applyEffect', playerId, true)
                end
            end
        end
        
        TriggerClientEvent('esx:showNotification', source, 'ATA appliqué dans une zone de ' .. radius .. 'm')
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas la permission d\'utiliser cette commande.')
    end
end, false)