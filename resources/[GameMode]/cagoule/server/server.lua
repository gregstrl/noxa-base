ESX = exports["Framework"]:getSharedObject()

ESX.RegisterUsableItem('cagoule', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('cagoule:useItem', source)
end)

RegisterServerEvent('cagoule:applyHood')
AddEventHandler('cagoule:applyHood', function(targetId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)
    
    if xPlayer.getInventoryItem('cagoule').count > 0 then
        xPlayer.removeInventoryItem('cagoule', 1)
        
        TriggerClientEvent('cagoule:applyToTarget', targetId)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez mis une cagoule')
        TriggerClientEvent('esx:showNotification', targetId, 'Quelqu\'un vous a mis une cagoule')
        
        savePlayerHood(targetId, true)
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas de cagoule')
    end
end)

RegisterServerEvent('cagoule:removeHood')
AddEventHandler('cagoule:removeHood', function(targetId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)
    
    if isPlayerHooded(targetId) then
        xPlayer.addInventoryItem('cagoule', 1)
        
        TriggerClientEvent('cagoule:removeFromTarget', targetId)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez retiré la cagoule ')
        TriggerClientEvent('esx:showNotification', targetId, 'Quelqu\'un vous a retiré la cagoule')
        
        savePlayerHood(targetId, false)
    end
end)

RegisterServerEvent('cagoule:checkPlayerHood')
AddEventHandler('cagoule:checkPlayerHood', function(targetId)
    local source = source
    
    if isPlayerHooded(targetId) then
        TriggerClientEvent('cagoule:toggleHelp', source, true)
    end
end)

local hookedPlayers = {}

function savePlayerHood(playerId, state)
    hookedPlayers[playerId] = state
end

function isPlayerHooded(playerId)
    return hookedPlayers[playerId] or false
end

RegisterServerEvent('cagoule:playerDropped')
AddEventHandler('cagoule:playerDropped', function(source)
    if hookedPlayers[source] then
        hookedPlayers[source] = nil
    end
end)

AddEventHandler('playerDropped', function()
    if hookedPlayers[source] then
        hookedPlayers[source] = nil
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        MySQL.Async.execute([[
            INSERT IGNORE INTO items (name, label, weight)
            VALUES ('cagoule', 'Cagoule', 1)
        ]], {})
    end
end)
