---
--- Fichier: [JailLogs]
---

Shared.Events:OnNet("Admin:GetJailLogs", function(xPlayer, playerId)
    if not xPlayer then return end
    
    if not JG.AdminManager:PlayerIsStaff(xPlayer) then return end
    
    local targetPlayer = ESX.GetPlayerFromId(playerId)
    if not targetPlayer then return end
    
    Shared.Events:ToClient(xPlayer, "Admin:RequestUID", playerId)
end)

Shared.Events:OnNet("Admin:ReceiveUID", function(xPlayer, playerId, playerUID)
    if not xPlayer then return end
    
    if not JG.AdminManager:PlayerIsStaff(xPlayer) then return end
    
    if not playerUID then
        playerUID = exports['uid']:UIDServer(playerId)
    end
    
    
    MySQL.Async.fetchAll('SELECT motif, remainingTasks FROM jail WHERE identifier = @identifier', {
        ['@identifier'] = playerUID
    }, function(results)
        local logs = results or {}
        
        xPlayer.triggerEvent("Admin:ReceiveJailLogs", playerId, ESX.GetPlayerFromId(playerId).getName(), logs, playerUID)
    end)
end) 