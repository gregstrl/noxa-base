local BMX_MODEL = "bmx"

RegisterNetEvent('bmx:useBmx', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 and GetEntityModel(vehicle) == GetHashKey(BMX_MODEL) then
        return
    end

    if not HasModelLoaded(BMX_MODEL) then
        RequestModel(BMX_MODEL)
        while not HasModelLoaded(BMX_MODEL) do
            Wait(100)
        end
    end

    local bmx = CreateVehicle(BMX_MODEL, coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
    SetPedIntoVehicle(playerPed, bmx, -1)

    local networkID = NetworkGetNetworkIdFromEntity(bmx)
    SetNetworkIdCanMigrate(networkID, true)
    SetEntityAsMissionEntity(bmx, true, false)

    TriggerServerEvent("bmx:removeBmx")
    TriggerEvent('esx:showNotification', "Vous avez fait apparaître un bmx.")
end)

CreateThread(function()
    while GetResourceState("ox_target") ~= "started" do
        Wait(100)
    end

    exports.ox_target:addGlobalVehicle({
        label = "Ranger le BMX",
        icon = "fa-solid fa-car-side",
        name = "mechanic_bmx_on",
        distance = 3.0,
        canInteract = function(entity)
            return GetEntityModel(entity) == GetHashKey(BMX_MODEL)
        end,
        onSelect = function(data)
            local entity = data.entity
            if DoesEntityExist(entity) then
                TriggerServerEvent("bmx:addBmx")
                exports.ox_target:removeEntity(NetworkGetNetworkIdFromEntity(entity))
                DeleteEntity(entity)
            end
        end
    })
end)