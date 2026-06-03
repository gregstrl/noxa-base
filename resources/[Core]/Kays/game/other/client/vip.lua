RegisterNetEvent('Serax:clientPreventVehicleDespawn')
AddEventHandler('Serax:clientPreventVehicleDespawn', function(vehicleNetId)
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
    if vehicle ~= 0 and DoesEntityExist(vehicle) then
        SetEntityAsMissionEntity(vehicle, true, true)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        SetVehicleNeedsToBeHotwired(vehicle, false)
    end
end)

-- Fonction personnalisée pour détecter les véhicules de police
function IsCopVehicle(model)
    local copVehicles = {
        GetHashKey("police"),
        GetHashKey("police2"),
        GetHashKey("police3"),
        GetHashKey("bus"),
        GetHashKey("police4"),
        GetHashKey("fbi"),
        GetHashKey("firetruk"),
        GetHashKey("pbus"),
        GetHashKey("fbi2"),
        GetHashKey("sheriff"),
        GetHashKey("sheriff2"),
        -- Tu peux ajouter ici d'autres véhicules spéciaux si nécessaire
    }

    for _, hash in ipairs(copVehicles) do
        if model == hash then
            return true
        end
    end
    return false
end

-- Thread principal
Citizen.CreateThread(function()
    while true do
        Wait(0)

        -- Densité des PNJ et véhicules
        SetPedDensityMultiplierThisFrame(0.2)
        SetVehicleDensityMultiplierThisFrame(0.00001)
        SetRandomVehicleDensityMultiplierThisFrame(0.00001)
        SetParkedVehicleDensityMultiplierThisFrame(0.0)
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)

        -- Suppression des policiers aléatoires
        SetCreateRandomCops(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetCreateRandomCopsOnScenarios(false)

        -- Vérifie si le joueur est dans un véhicule
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if vehicle ~= 0 then
            local model = GetEntityModel(vehicle)
            if IsCopVehicle(model) then 
                DeleteEntity(vehicle)
            end
        end

        -- Désactive autres véhicules spéciaux
        SetGarbageTrucks(false)
        SetRandomBoats(true)
        SetRandomTrains(false)

        -- Empêche le despawn des véhicules avec PNJ conducteur
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            local driver = GetPedInVehicleSeat(vehicle, -1)
            if driver ~= 0 and not IsPedAPlayer(driver) then
                local vehicleNetId = NetworkGetNetworkIdFromEntity(vehicle)
                TriggerServerEvent('Serax:preventVehicleDespawn', vehicleNetId)
            end
        end
    end
end)
