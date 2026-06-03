RegisterNetEvent("ui:showInteraction")
AddEventHandler("ui:showInteraction", function(key, message)
    SendNUIMessage({
        type = "showInteraction",
        key = key,
        message = message
    })
end)