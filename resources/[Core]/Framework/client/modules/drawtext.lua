local drawTexts = {}

RegisterNetEvent('esx:drawText3D')
AddEventHandler('esx:drawText3D', function(coords, text, duration)
    local id = #drawTexts + 1
    drawTexts[id] = {
        coords = coords,
        text = text,
        startTime = GetGameTimer(),
        duration = duration or 5000 -- 5 secondes par défaut
    }

    -- Supprimer le texte après la durée spécifiée
    SetTimeout(duration or 5000, function()
        drawTexts[id] = nil
    end)
end)

CreateThread(function()
    while true do
        Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        
        for _, data in pairs(drawTexts) do
            local distance = #(playerCoords - data.coords)
            if distance < 20 then
                local onScreen, screenX, screenY = World3dToScreen2d(data.coords.x, data.coords.y, data.coords.z)
                if onScreen then
                    local scale = (1 / distance) * 2
                    local fov = (1 / GetGameplayCamFov()) * 100
                    scale = scale * fov
                    
                    SetTextScale(0.35 * scale, 0.35 * scale)
                    SetTextFont(4)
                    SetTextProportional(1)
                    SetTextColour(255, 255, 255, 255)
                    SetTextDropshadow(0, 17, 17, 17, 255)
                    SetTextEdge(2, 0, 0, 0, 150)
                    SetTextDropShadow()
                    SetTextOutline()
                    SetTextEntry("STRING")
                    SetTextCentre(1)
                    AddTextComponentString(data.text)
                    DrawText(screenX, screenY)
                end
            end
        end
    end
end) 