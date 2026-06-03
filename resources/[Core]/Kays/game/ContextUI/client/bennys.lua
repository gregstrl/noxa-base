Citizen.CreateThread(function()
    while GetResourceState("ox_target") ~= "started" do 
        Wait(500)
    end
    
    exports.ox_target:addGlobalVehicle({

        {
            label = "Mettre en fourrière",
            icon = "fa-solid fa-car-side",
            name = "mechanic_pound_2",
            distance = 3.0,
            canInteract = function()
                if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'mecano2' or ESX.PlayerData.job.name == 'autoexotic' or ESX.PlayerData.job.name == 'larrys' or ESX.PlayerData.job.name == 'police' then
                    return true
                else
                    return false
                end
            end,
            onSelect = function(data)
                local coords = GetEntityCoords(PlayerPedId())
                local vehicle = nil
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                else
                    vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                end
                if DoesEntityExist(vehicle) then
                    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    
                    Citizen.CreateThread(function()
                        Wait(10000) 
                        ESX.Game.DeleteVehicle(vehicle)
                        ClearPedTasksImmediately(PlayerPedId())
                        ESX.ShowNotification('Véhicule mis en fourrière')
                    end)
                end
            end
        }, {
            label = "Nettoyer le véhicule",
            icon = "fa-solid fa-car-side",
            name = "mechanic_pound_2",
            distance = 3.0,
            canInteract = function()
                if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'mecano2' or ESX.PlayerData.job.name == 'autoexotic' or ESX.PlayerData.job.name == 'larrys' then
                    return true
                else
                    return false
                end
            end,
            onSelect = function(data)
                local playerPed = PlayerPedId()
                local coords    = GetEntityCoords(playerPed)
    
                if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
    
                    local vehicle = nil
    
                    if IsPedInAnyVehicle(playerPed, false) then
                        vehicle = GetVehiclePedIsIn(playerPed, false)
                    else
                        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                    end
    
                    if DoesEntityExist(vehicle) then
                        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                        Citizen.CreateThread(function()
                            Wait(10000)
                            SetVehicleDirtLevel(vehicle, 0)
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("Véhicule nettoyé avec succès")
                        end)
                    end
                end
            end
        },
        {
            label = "Réparer le véhicule",
            icon = "fa-solid fa-car-side",
            name = "mechanic_pound_2",
            distance = 3.0,
            canInteract = function()
                if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'mecano2' or ESX.PlayerData.job.name == 'autoexotic' or ESX.PlayerData.job.name == 'larrys' then
                    return true
                else
                    return false
                end
            end,
            onSelect = function(data)
                local playerPed = PlayerPedId()
                local coords    = GetEntityCoords(playerPed)
        
                if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
        
                    local vehicle = nil
        
                    if IsPedInAnyVehicle(playerPed, false) then
                        vehicle = GetVehiclePedIsIn(playerPed, false)
                    else
                        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                    end
        
                    if DoesEntityExist(vehicle) then
                        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                        Citizen.CreateThread(function()
                            Wait(10000)
                            SetVehicleFixed(vehicle)
                            SetVehicleDeformationFixed(vehicle)
                            SetVehicleUndriveable(vehicle, false)
                            SetVehicleEngineOn(vehicle,  true,  true)
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("Véhicule réparé avec succès")
                        end)
                    end
                end
            end
        },
        {
            label = "Mettre/Retirer sur plateau",
            icon = "fa-solid fa-car-side",
            name = "mechanic_pound_2",
            distance = 23.0,
            canInteract = function()
                if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'mecano2' or ESX.PlayerData.job.name == 'autoexotic' or ESX.PlayerData.job.name == 'larrys' then
                    return true
                else
                    return false
                end
            end,
            onSelect = function(data)
                local vehicledepannage = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 5.0, 0, 70)
                local playerPed = PlayerPedId()
                local vehicle = GetVehiclePedIsIn(playerPed, true)
        
                local towmodel = GetHashKey('flatbed')
                local isVehicleTow = IsVehicleModel(vehicle, towmodel)
        
                if isVehicleTow then
                    if CurrentlyTowedVehicle == nil then
                        if DoesEntityExist(vehicledepannage) then
                            if not IsPedInAnyVehicle(playerPed, true) then
                                if vehicle ~= vehicledepannage then
                                    ClearPedTasks(playerPed)
                                    AttachEntityToEntity(vehicledepannage, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                    CurrentlyTowedVehicle = vehicledepannage
                                    ESX.ShowNotification("~g~Mise sur le plateau réussi")
                                else
                                    ESX.ShowNotification("[~r~Impossible~s~] Vous ne pouvez pas attacher votre véhicule de dépannage")
                                end
                            end
                        else
                            ESX.ShowNotification("[~r~Impossible~s~] Aucun véhicule à proximité")
                        end
                    else
                        AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                        DetachEntity(CurrentlyTowedVehicle, true, true)
                        CurrentlyTowedVehicle = nil
                        ESX.ShowNotification("[~g~Succès~s~] Véhicule retiré du plateau")
                    end
                else
                    ESX.ShowNotification("[~r~Impossible~s~] Vous devez avoir un véhicule à plateau pour faire cela")
                end
            end
        },
    })
end)
