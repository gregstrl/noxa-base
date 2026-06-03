local isSpectating = false
local lastPosition = nil
local targetPed = nil
local invisible = false

RegisterNetEvent('spectate:start')
AddEventHandler('spectate:start', function(targetId, targetCoords)
    local playerPed = PlayerPedId()

    if targetId == GetPlayerServerId(PlayerId()) then
        ESX.ShowNotification("❌ Tu ne peux pas te spectate toi-même !")
        return
    end

    if isSpectating then
        StopSpectate()
    else
        lastPosition = GetEntityCoords(playerPed)
        isSpectating = true

        SetEntityCoordsNoOffset(playerPed, targetCoords.x, targetCoords.y, targetCoords.z + 5.0, false, false, false)
        FreezeEntityPosition(playerPed, true)
        SetEntityVisible(playerPed, false, false)
        invisible = true

        Wait(1000)

        local targetPlayer = GetPlayerFromServerId(targetId)
        targetPed = GetPlayerPed(targetPlayer)

        if DoesEntityExist(targetPed) then
            NetworkSetInSpectatorMode(true, targetPed)
            ESX.ShowNotification("👁️‍🗨️ Tu es en mode spectate !")
        else
            ESX.ShowNotification("❌ Échec du spectate, joueur introuvable.")
            StopSpectate()
        end
    end
end)

function StopSpectate()
    if isSpectating then
        isSpectating = false
        NetworkSetInSpectatorMode(false, PlayerPedId())

        if invisible then
            SetEntityVisible(PlayerPedId(), true, false)
            invisible = false
        end

        if lastPosition then
            SetEntityCoordsNoOffset(PlayerPedId(), lastPosition.x, lastPosition.y, lastPosition.z, false, false, false)
        end

        FreezeEntityPosition(PlayerPedId(), false)
        ESX.ShowNotification("❌ Mode spectate désactivé.")
    end
end

RegisterCommand("spectate", function(source, args)
    local targetId = tonumber(args[1])
    if targetId then
        TriggerServerEvent("spectate:request", targetId)
    else
        ESX.ShowNotification("❌ Utilisation : /spectate [ID]")
    end
end, false)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if isSpectating then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour arrêter de spectate")
            if IsControlJustReleased(0, 38) then 
                StopSpectate()
            end
        end
    end
end)
