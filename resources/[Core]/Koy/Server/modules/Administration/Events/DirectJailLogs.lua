---
--- Fichier: [DirectJailLogs]
---

Shared.Events:OnNet("Admin:DirectJailLogs", function(xPlayer, uid)
    if not xPlayer then return end
    
    if not JG.AdminManager:PlayerIsStaff(xPlayer) then return end
    
    
    MySQL.Async.fetchAll('SELECT motif, remainingTasks FROM jail WHERE identifier = @identifier', {
        ['@identifier'] = uid
    }, function(results)
        local logs = results or {}
        
        for _, log in ipairs(logs) do
        end
        
        xPlayer.triggerEvent("Admin:DirectJailLogsResult", logs, uid)
    end)
end) 