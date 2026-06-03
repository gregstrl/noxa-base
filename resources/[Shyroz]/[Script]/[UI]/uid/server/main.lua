ESX = exports["Framework"]:getSharedObject()

local function GetNextUID()
    local result = MySQL.Sync.fetchScalar('SELECT MAX(uid) FROM player_uids')
    return (result or 0) + 1
end

local function AssignUID(source)
    if not source then return nil end
    
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end
    
    local identifier = xPlayer.identifier
    if not identifier then return nil end

    local result = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    })

    if result[1] and result[1].uid then
        xPlayer.uid = result[1].uid
        TriggerClientEvent('esx:setUID', source, xPlayer.uid)
        return result[1].uid
    end

    local newUID = GetNextUID()
    
    MySQL.Async.execute('INSERT INTO player_uids (uid, identifier) VALUES (@uid, @identifier)', {
        ['@uid'] = newUID,
        ['@identifier'] = identifier
    })

    MySQL.Async.execute('UPDATE users SET uid = @uid WHERE identifier = @identifier', {
        ['@uid'] = newUID,
        ['@identifier'] = identifier
    })

    xPlayer.uid = newUID
    TriggerClientEvent('esx:setUID', source, newUID)
    return newUID
end

AddEventHandler('playerConnecting', function()
    local source = source
    Citizen.Wait(2000)
    AssignUID(source)
end)

RegisterNetEvent('esx:requestUID')
AddEventHandler('esx:requestUID', function()
    local source = source
    Citizen.Wait(100) 
    AssignUID(source)
end)

RegisterNetEvent('esx:UIDClient')
AddEventHandler('esx:UIDClient', function(serverId)
    local source = source
    if not serverId then return end
    
    local xPlayer = ESX.GetPlayerFromId(serverId)
    if not xPlayer then
        TriggerClientEvent('esx:retouruidjoueur', source, serverId, nil)
        return
    end
    
    if not xPlayer.uid then
        xPlayer.uid = AssignUID(serverId)
    end
    
    TriggerClientEvent('esx:retouruidjoueur', source, serverId, xPlayer.uid)
end) 