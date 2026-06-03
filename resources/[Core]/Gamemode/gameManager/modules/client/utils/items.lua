--[[RegisterNetEvent('useNitro')
AddEventHandler('useNitro', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local timeout = GetGameTimer() + 10000
    while GetGameTimer() < timeout do
        Wait(0)
        local vehicleSpeed = GetEntitySpeed(vehicle) * 3.6
        if vehicleSpeed < 100 then
            SetVehicleCheatPowerIncrease(vehicle, 6.0) -- Augmenté de 4.0 à 6.0
        elseif vehicleSpeed < 180 then
            SetVehicleCheatPowerIncrease(vehicle, 5.0) -- Augmenté de 3.0 à 5.0
        else
            SetVehicleCheatPowerIncrease(vehicle, 4.0) -- Augmenté de 2.0 à 4.0
        end
    end
end)
]]

--[[RegisterNetEvent('nitroEffect')
AddEventHandler('nitroEffect', function(netId)
    if not NetworkDoesEntityExistWithNetworkId(netId) then
        return
    end
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(vehicle) or not HasModelLoaded(GetEntityModel(vehicle)) then
        return
    end

    local nitroEffect = false
    if GetVehiclePedIsIn(PlayerPedId(), false) == vehicle then
        -- L'effet de caméra est désactivé ici
        nitroEffect = true
        -- NitroScreenEffect(true) -- Suppress this line to disable the camera effect
    end

    local particles = {}
    SetVehicleBoostActive(vehicle, true)
    for _, exhaust in pairs(ServerConfiguration.Activity.NitroVehicle.Exhausts) do
        Citizen.CreateThread(function()
            local bone = GetEntityBoneIndexByName(vehicle, exhaust)
            if bone > 0 then
                local ptfxAsset = 'core'
                ESX.Streaming.RequestNamedPtfxAsset(ptfxAsset)
                UseParticleFxAssetNextCall(ptfxAsset)
                local particle = StartParticleFxLoopedOnEntityBone('sp_fire_trail_plane', vehicle, 0.0, 0.0, 0.0, 90.0, 0.0, 0.0, bone, 1.0, true, true, true)
                table.insert(particles, particle)

                local ptfxAsset = 'veh_xs_vehicle_mods'
                ESX.Streaming.RequestNamedPtfxAsset(ptfxAsset)
                UseParticleFxAssetNextCall(ptfxAsset)
                local particle = StartParticleFxLoopedOnEntityBone('veh_nitrous', vehicle, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, bone, 1.0, true, true, true)
                table.insert(particles, particle)
            end
        end)
    end

    Citizen.Wait(10000)

    for _, particle in pairs(particles) do
        StopParticleFxLooped(particle, 1)
    end
    SetVehicleBoostActive(vehicle, false)

    if nitroEffect then
        -- L'effet de caméra est désactivé ici également
        -- NitroScreenEffect(false) -- Suppress this line to disable the camera effect
    end
end)
]]
--[[
RegisterCommand('nitroVehicle', function(source,args)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if (vehicle ~= 0) then 
        TriggerServerEvent('exodia:useNitro', NetworkGetNetworkIdFromEntity(vehicle))
    end
end)
RegisterKeyMapping('nitroVehicle', 'Activer Nitro Véhicule', 'keyboard', 'O')]]


RegisterNetEvent('exodia:useciseaux', function()
    if not (SafeZone:playerIsIn()) then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        local Ply = PlayerPedId()
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
        local prop_name = "p_cs_scissors_s"

        if closestPlayer ~= -1 and closestDistance <= 3.0 then
            local targetPed = GetPlayerPed(closestPlayer)

            if IsEntityPlayingAnim(targetPed, 'random@mugging3', 'handsup_standing_base', 3) then
                ExecuteCommand('me utilise des ciseaux')
                ciseau = CreateObject(GetHashKey("p_cs_scissors_s"), x, y, z, true, true, true)
                AttachEntityToEntity(ciseau, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), -0.0, 0.03, 0.03, 0, -270.0, -20.0, true, true, false, true, 1, true)
                ESX.Streaming.RequestAnimDict('misshair_shop@barbers', function()
                    TaskPlayAnim(Ply, 'misshair_shop@barbers', 'keeper_idle_b', 2.0, 2.0, 10000, 48, 0, false, false, false)
                end)
                exports["rprogress"]:Start('', 10000)
                DeleteObject(ciseau)
                TriggerServerEvent('exodia:haircut', GetPlayerServerId(closestPlayer))
                ciseau = CreateObject(GetHashKey("p_cs_scissors_s"), x, y, z, false, false, false)
            else
                ESX.ShowNotification('✋ ~s~La personne doit lever les mains pour que vous puissiez lui couper les cheveux.')
            end
        else
            ESX.ShowNotification('✂️ ~s~Impossible~s~~n~personne à proximité de vous.')
        end
    else
        ESX.ShowNotification('✂️ Vous ne pouvez pas couper les cheveux de quelqu\'un en Zone Safe')
    end
end)


RegisterNetEvent('exodia:haircut', function()
    TriggerEvent('skinchanger:change', 'hair_1', 0)
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:save', skin)
    end)
end)