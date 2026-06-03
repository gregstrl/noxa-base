RegisterNetEvent('serax:admin:freezeUnfreezePlayer', function(value)
    if value == 'freeze' then
        FreezeEntityPosition(PlayerPedId(), true)
    elseif value == 'unfreeze' then
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)



RegisterNetEvent('serax:admin:returnveh', function(veh)
    local handle = NetworkGetEntityFromNetworkId(veh)
    if not DoesEntityExist(handle) then return end

    local rot = GetEntityRotation(handle, 2)
    local forward, right, up = GetEntityMatrix(handle)
    local vehicleUp = up.z
    if vehicleUp < 0.7 then
        NetworkRequestControlOfEntity(handle)
        while not NetworkHasControlOfEntity(handle) do
            Wait(0)
        end
        SetEntityRotation(handle, rot.x, rot.y, rot.z + 180.0, 2, true)
        SetVehicleOnGroundProperly(handle)
        local vehicleCoords = GetEntityCoords(handle)
        SetEntityCoordsNoOffset(handle, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, false, false, false)
    end
end)

vehicleStats = nil

function getVehicleInfos(vehicleData)
    ESX.TriggerServerCallback('serax:getVehicleInfos', function(data)
        Citizen.SetTimeout(1800, function()
            vehicleStats = data
        end)
    end, vehicleData.plate)
end


Citizen.CreateThread(function ()
    while GetResourceState("ox_target") ~= "started" do Wait(0) end
    exports.ox_target:addGlobalVehicle({
        {
            label = "Administration",
            icon = "fas fa-angle-double-right",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            openMenu = "admin-option-veh"
        }, 
        {
            menuName = "admin-option-veh",
            label = "Supprimer le véhicule",
            icon = "fa-solid fa-car-side",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
        
                return false
            end,
            onSelect = function (data)
                TriggerServerEvent("serax:admin:delVeh", NetworkGetNetworkIdFromEntity(data.entity))
            end
        },
        {
            menuName = "admin-option-veh",
            label = "Retourner le véhicule",
            icon = "fa-solid fa-car-side",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                TriggerServerEvent("serax:admin:flipVeh", NetworkGetNetworkIdFromEntity(data.entity))
            end
        },
        {
            menuName = "admin-option-veh",
            label = "Crocheter le véhicule",
            icon = "fa-solid fa-car-side",
            distance = 80.0,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                local veh = ESX.Game.GetClosestVehicle(data.entity)
                SetVehicleDoorsLockedForAllPlayers(veh, false)
                SetEntityAsMissionEntity(veh, true, true)
                SetVehicleDoorsLocked(veh, 1)
                SetVehicleHasBeenOwnedByPlayer(veh, true)
            end
        },
        {
            menuName = "admin-option-veh",
            label = "Freeze/Unfreeze le véhicule",
            icon = "fa-solid fa-car-side",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
        
                return false
            end,
            onSelect = function (data)
                if IsEntityPositionFrozen(data.entity) then
                    TriggerServerEvent("serax:admin:freezeunfreezevehicle", NetworkGetNetworkIdFromEntity(data.entity), false)
                else
                    TriggerServerEvent("serax:admin:freezeunfreezevehicle", NetworkGetNetworkIdFromEntity(data.entity), true)
                end
            end
        },                    
    })

    exports.ox_target:addGlobalVehicle({
        {
            label = 'Coffre du véhicule',
            icon = "fa-solid fa-car-side",
            distance = 5,
            canInteract = function()
                return true
            end,
            onSelect = function(data)
                ExecuteCommand('trunk')
            end
        },
        {
            label = 'Identifiants des joueurs',
            icon = "fa-solid fa-fingerprint",
            distance = 5,
            canInteract = function()
                return true
            end,
            onSelect = function(data)
                local vehicle = data.entity
                if vehicle and vehicle ~= 0 then
                    local playerIds = {}
                    local playerRoles = {}
    
                    for seatIndex = -1, 2 do
                        local ped = GetPedInVehicleSeat(vehicle, seatIndex)
                        if ped and ped ~= 0 then
                            local player = NetworkGetPlayerIndexFromPed(ped)
                            if player then
                                table.insert(playerIds, GetPlayerServerId(player))
                                if seatIndex == -1 then
                                    table.insert(playerRoles, "Conducteur")
                                else
                                    table.insert(playerRoles, "Passager " .. (seatIndex + 1))
                                end
                            end
                        end
                    end
    
                    if #playerIds > 0 then
                        TriggerServerEvent('getUniqueIDs', playerIds, playerRoles, 'receiveUniqueIDs')
                    else
                        ESX.ShowNotification('Il n\'y a pas de joueurs dans le véhicule.')
                    end
                end
            end
        },
    })
    RegisterNetEvent('receiveUniqueIDs')
    AddEventHandler('receiveUniqueIDs', function(uniqueIDs, playerRoles)
        if #uniqueIDs > 0 then
            local info = ""
            local roleCount = #uniqueIDs

            for i, data in ipairs(uniqueIDs) do
                local uniqueID = data.uniqueID
                local role = playerRoles[i]
                local colorCode = "~s~"
                if role == "Conducteur" then
                    colorCode = "~b~"
                elseif role:match("Passager") then
                    colorCode = "~b~"
                end
                info = info .. colorCode .. role .. "~s~\nId : " .. data.playerId .. ", Id unique : " .. uniqueID
                if i < roleCount then
                    info = info .. "\n\n"
                end
            end
                ESX.ShowNotification(info)
            end
        end)
end)