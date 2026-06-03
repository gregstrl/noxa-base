local displayEnabled = false

RegisterNetEvent('gamemode:safezone:toggleDisplay')
AddEventHandler('gamemode:safezone:toggleDisplay', function(state, zoneName)
    displayEnabled = state
    
    if state then
        SendNUIMessage({
            type = "showZone",
            zone = zoneName or "Safe"
        })
    else
        SendNUIMessage({
            type = "hideZone"
        })
    end
end)