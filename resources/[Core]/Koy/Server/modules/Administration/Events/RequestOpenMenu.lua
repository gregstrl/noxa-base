---
--- @author Kadir#6666
--- Create at [20/04/2023] 15:12:36
--- Current project [Koy-V1]
--- File name [RequestOpenMenu]
---

RegisterNetEvent("Koy:server:ready")
AddEventHandler("Koy:server:ready", function()
    CreateThread(function()
        local players = ESX.GetPlayers()
        
        for _, playerId in ipairs(players) do
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if xPlayer and xPlayer.getGroup() ~= "user" then
                xPlayer.triggerEvent("Admin:MenuReady")
            end
        end
        
        AddEventHandler("playerConnected", function(playerId)
            Wait(500) 
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if xPlayer and xPlayer.getGroup() ~= "user" then
                xPlayer.triggerEvent("Admin:MenuReady")
            end
        end)
    end)
end)

Shared.Events:OnNet(Enums.Administration.Server.RequestOpenMenu, function(xPlayer)
    if (not xPlayer) then
        return
    end

    xPlayer.triggerEvent("Admin:OpeningMenu")
end)