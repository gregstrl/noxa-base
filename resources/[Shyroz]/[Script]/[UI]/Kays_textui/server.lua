RegisterNetEvent("sendHelpNotificationToPlayer")
AddEventHandler("sendHelpNotificationToPlayer", function(targetPlayer, msg)
    if targetPlayer and msg then
        TriggerClientEvent("showHelpNotification", targetPlayer, msg)
    end
end)

RegisterNetEvent("sendHelpNotificationToAll")
AddEventHandler("sendHelpNotificationToAll", function(msg)
    if msg then
        TriggerClientEvent("showHelpNotification", -1, msg)
    end
end)

exports("SendHelpNotificationToPlayer", function(targetPlayer, msg)
    TriggerEvent("sendHelpNotificationToPlayer", targetPlayer, msg)
end)

exports("SendHelpNotificationToAll", function(msg)
    TriggerEvent("sendHelpNotificationToAll", msg)
end)
