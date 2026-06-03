Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        SetVehicleDensityMultiplierThisFrame(2.0) -- densité des véhicules pnj ( exemple : 1 bcp de véhicules / 0.1 pas bcp de véhicules )
        SetPedDensityMultiplierThisFrame(8.2) -- densité des pnj qui marche ( exemple : 1 bcp de véhicules / 0.1 pas bcp de véhicules )
        SetRandomVehicleDensityMultiplierThisFrame(2.2) -- densité des véhicules pnj random spawn ( exemple : 1 bcp de véhicules / 0.1 pas bcp de véhicules )
        SetParkedVehicleDensityMultiplierThisFrame(2.2) -- densité des véhicules garré des pnj ( exemple : 1 bcp de véhicules / 0.1 pas bcp de véhicules )
        SetScenarioPedDensityMultiplierThisFrame(2.2, 2.2) -- densité des pnj qui sont posé en sénario ( exemple : 1 bcp de véhicules / 0.1 pas bcp de véhicules )
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(800)

        local player = GetPlayerPed(-1)
        local PlayerPedId = PlayerPedId(player)

        local veh = GetVehiclePedIsTryingToEnter(PlayerPedId)
        if veh ~= nil and DoesEntityExist(veh) then

            local lockStatus = GetVehicleDoorLockStatus(veh)
            if lockStatus == 7 then
                SetVehicleDoorsLocked(veh, 2)
            end

            local ped = GetPedInVehicleSeat(veh, -1)
            if ped then
                SetPedCanBeDraggedOut(ped, false)
            end

        end
    end
end) 