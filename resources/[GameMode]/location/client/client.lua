-- SCRIPT FAIT ET LEAK SUR DISCORD.GG/CHINALEAK

ESX = exports['Framework']:getSharedObject()

local isUIOpen = false
local rentedVehicle = nil
local rentalTimer = 0
local rentalCost = 0
local isTimerVisible = false
local currentRentalLocation = nil

Citizen.CreateThread(function()
    for k, v in ipairs(Config.RentalLocations) do
        local blip = AddBlipForCoord(v.menuMarker)
        SetBlipSprite(blip, v.blipInfo.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, v.blipInfo.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.blipInfo.label)
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for k, v in ipairs(Config.RentalLocations) do
            local distance = #(playerCoords - v.menuMarker)
            
            if distance < Config.MarkerSettings.drawDistance then
                DrawMarker(
                    Config.MarkerSettings.type,
                    v.menuMarker,
                    0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0,
                    Config.MarkerSettings.size,
                    Config.MarkerSettings.color.r, Config.MarkerSettings.color.g, Config.MarkerSettings.color.b, Config.MarkerSettings.color.a,
                    Config.MarkerSettings.bobUpAndDown, Config.MarkerSettings.faceCamera, 2, Config.MarkerSettings.rotate, nil, nil, false
                )
                
                if distance < 1.5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu de location")
                    if IsControlJustReleased(0, 38) then 
                        currentRentalLocation = v
                        OpenRentalUI()
                    end
                end
            end
        end
    end
end)

function OpenRentalUI()
    isUIOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openRental"
    })
end

RegisterNUICallback('closeUI', function(data, cb)
    CloseRentalUI()
    cb('ok')
end)

function CloseRentalUI()
    isUIOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "closeRental"
    })
end

RegisterNUICallback('rentVehicle', function(data, cb)
    ESX.TriggerServerCallback('leetachang_vehicleloca:canAffordRental', function(canAfford)
        if canAfford then
            TriggerServerEvent('leetachang_vehicleloca:rentVehicle', data.vehicle, data.duration)
            CloseRentalUI()
            cb('ok')
        else
            ESX.ShowNotification("[~r~Impossible~h~] Vous n'avez pas assez d'argent pour louer ce véhicule.")
            cb('not_enough_money')
        end
    end, data.vehicle, data.duration)
end)

RegisterNetEvent('leetachang_vehicleloca:spawnRentedVehicle')
AddEventHandler('leetachang_vehicleloca:spawnRentedVehicle', function(vehicleModel, duration, cost)
    if not currentRentalLocation then 
        ESX.ShowNotification("Erreur: Emplacement de location non défini.")
        return 
    end

    local spawnPoint = currentRentalLocation.spawnPoint
    
    if ESX.Game.IsSpawnPointClear(vector3(spawnPoint.x, spawnPoint.y, spawnPoint.z), 3.0) then
        ESX.Game.SpawnVehicle(vehicleModel, vector3(spawnPoint.x, spawnPoint.y, spawnPoint.z), spawnPoint.w, function(vehicle)
            if DoesEntityExist(vehicle) then
                TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                
                local plate = "LOCA" .. math.random(1000, 9999)
                SetVehicleNumberPlateText(vehicle, plate)
                
                rentedVehicle = vehicle
                rentalTimer = duration * 60
                rentalCost = cost
                
                ESX.ShowNotification("Vous avez loué un " .. GetLabelText(GetDisplayNameFromVehicleModel(vehicleModel)) .. " pour " .. duration .. " minutes. Coût: $" .. cost)
                
                SendNUIMessage({
                    action = "startTimer",
                    duration = duration * 60,
                    vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(vehicleModel))
                })
                
                StartRentalTimer()
            else
                ESX.ShowNotification("Nononono ça ne marche pas.")
            end
        end)
    else
        ESX.ShowNotification("La zone de spawn est obstruée. Veuillez décaler le véhicule qui dérange.")
    end
end)

function StartRentalTimer()
    Citizen.CreateThread(function()
        while rentalTimer > 0 do
            Wait(1000)
            rentalTimer = rentalTimer - 1
            
            local playerPed = PlayerPedId()
            if IsPedInVehicle(playerPed, rentedVehicle, false) and not isTimerVisible then
                ShowTimer()
            elseif not IsPedInVehicle(playerPed, rentedVehicle, false) and isTimerVisible then
                HideTimer()
            end
            
            if rentalTimer % 60 == 0 then
                local minutes = math.floor(rentalTimer / 60)
                ESX.ShowNotification("Temps de location restant: " .. minutes .. " minutes")
            end
            
            if rentalTimer <= 0 then
                EndRental()
            end
        end
    end)
end

function ShowTimer()
    SendNUIMessage({
        action = "showTimer"
    })
    isTimerVisible = true
end

function HideTimer()
    SendNUIMessage({
        action = "hideTimer"
    })
    isTimerVisible = false
end

function EndRental()
    if DoesEntityExist(rentedVehicle) then
        local playerPed = PlayerPedId()
        
        if IsPedInVehicle(playerPed, rentedVehicle, false) then
            TaskLeaveVehicle(playerPed, rentedVehicle, 0)
            
            while IsPedInVehicle(playerPed, rentedVehicle, false) do
                Wait(100)
            end
        end
        
        for i = 0, 5 do
            SetVehicleDoorShut(rentedVehicle, i, false)
        end
        
        SetVehicleDoorsLocked(rentedVehicle, 2)
        
        ESX.ShowNotification("La période de location est terminée. Le véhicule sera récupéré dans 5 secondes.")
        
        Wait(5000)
        
        ESX.Game.DeleteVehicle(rentedVehicle)
    end
    
    rentedVehicle = nil
    ESX.ShowNotification("Merci d'avoir utilisé notre service de location!")
    
    SendNUIMessage({
        action = "stopTimer"
    })
    isTimerVisible = false
end

RegisterNetEvent('leetachang_vehicleloca:endRental')
AddEventHandler('leetachang_vehicleloca:endRental', function()
    if rentalTimer > 0 then
        EndRental()
    end
end)

RegisterNUICallback('getData', function(data, cb)
    ESX.TriggerServerCallback('leetachang_vehicleloca:getData', function(data)
        cb(data)
    end)
end)

-- discord.gg/chinaleak