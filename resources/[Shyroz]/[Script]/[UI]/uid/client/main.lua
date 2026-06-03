ESX = exports["Framework"]:getSharedObject()

local currentUID = nil
local uidCache = {}

RegisterNetEvent('esx:setUID')
AddEventHandler('esx:setUID', function(playerUID)
    currentUID = playerUID
    ESX.PlayerData.uid = playerUID
end)

RegisterNetEvent('esx:retouruidjoueur')
AddEventHandler('esx:retouruidjoueur', function(serverId, playerUid)
    uidCache[serverId] = playerUid
end)

exports('UIDClient', function()
    if not currentUID then
        TriggerServerEvent('esx:requestUID')
        while not currentUID do
            Wait(0)
        end
    end
    return currentUID
end)

exports('UIDClient1', function(serverId)
    local target = GetPlayerFromServerId(serverId)
    if not target then 
        return nil 
    end

    if uidCache[serverId] then
        return uidCache[serverId]
    end

    TriggerServerEvent('esx:UIDClient', serverId)
    
    local attempts = 0
    while not uidCache[serverId] and attempts < 10 do
        Wait(100)
        attempts = attempts + 1
    end
    
    local uid = uidCache[serverId]
    return uid
end)

Citizen.CreateThread(function()
    while true do
        Wait(60000)
        uidCache = {}
    end
end) 