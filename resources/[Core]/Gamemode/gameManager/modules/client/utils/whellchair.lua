local wheel_MODEL = "iak_wheelchair"

RegisterNetEvent('iak_wheelchair:usewheel', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 and GetEntityModel(vehicle) == GetHashKey(wheel_MODEL) then
        return
    end

    if not HasModelLoaded(wheel_MODEL) then
        RequestModel(wheel_MODEL)
        while not HasModelLoaded(wheel_MODEL) do
            Wait(100)
        end
    end

    local wheel = CreateVehicle(wheel_MODEL, coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
    SetPedIntoVehicle(playerPed, wheel, -1)

    local networkID = NetworkGetNetworkIdFromEntity(wheel)
    SetNetworkIdCanMigrate(networkID, true)
    SetEntityAsMissionEntity(wheel, true, false)

    TriggerServerEvent("iak_wheelchair:removewheel")
    TriggerEvent('esx:showNotification', "Vous avez fait apparaître une Chaise Roulante.")
end)

CreateThread(function()
    while GetResourceState("ox_target") ~= "started" do
        Wait(100)
    end

    exports.ox_target:addGlobalVehicle({
        label = "Ranger la Chaise Roulante",
        icon = "fa-solid fa-car-side",
        name = "mechanic_wheel_on",
        distance = 3.0,
        canInteract = function(entity)
            return GetEntityModel(entity) == GetHashKey(wheel_MODEL)
        end,
        onSelect = function(data)
            local entity = data.entity
            if DoesEntityExist(entity) then
                TriggerServerEvent("iak_wheelchair:addwheel")
                exports.ox_target:removeEntity(NetworkGetNetworkIdFromEntity(entity))
                DeleteEntity(entity)
            end
        end
    })
end)