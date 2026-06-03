--[[
local isF7MenuOpen = false
local closestVehicle = nil
local kidnapTarget = nil

function OpenGangF7Menu()
    if isF7MenuOpen then
        isF7MenuOpen = false
        RageUI.Visible(f7Menu, false)
        return
    else
        isF7MenuOpen = true
        RageUI.Visible(f7Menu, true)
        
        closestVehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 5.0)
        
        kidnapTarget = GetClosestPedWithState()
        
        Citizen.CreateThread(function()
            while isF7MenuOpen do
                RageUI.IsVisible(f7Menu, function()
                    RageUI.Separator(string.format("%s / %s", 3, 4))
                    
                    RageUI.Button("Informations territoires", nil, {RightLabel = ">"}, true, {
                        onSelected = function()
                        end
                    })
                    
                    RageUI.Button("Afficher les territoires sur la carte", nil, {RightLabel = ">"}, true, {
                        onSelected = function()
                        end
                    })
                    
                    RageUI.Button("Interaction avec le kidnappé", nil, {RightLabel = ">"}, kidnapTarget ~= nil, {
                        onSelected = function()
                        end
                    }, kidnappedMenu)
                    
                    RageUI.Button("Interaction avec les voiture", nil, {RightLabel = ">"}, closestVehicle ~= nil, {
                        onSelected = function()
                        end
                    }, vehiclesMenu)
                end)
                
                RageUI.IsVisible(kidnappedMenu, function()
                    RageUI.Separator(string.format("%s / %s", 1, 1))
                    
                    RageUI.Button("Fouiller", nil, {RightLabel = ">"}, kidnapTarget ~= nil, {
                        onSelected = function()
                            local targetId = NetworkGetPlayerIndexFromPed(kidnapTarget)
                            if targetId ~= nil then
                                TriggerServerEvent('gangsbuilder:searchPlayer', targetId)
                            else
                                ESX.ShowNotification("Impossible de fouiller cette personne")
                            end
                        end
                    })
                end)
                
                RageUI.IsVisible(vehiclesMenu, function()
                    RageUI.Separator(string.format("%s / %s", 1, 1))
                    
                    RageUI.Button("Informations du véhicule", nil, {RightLabel = ">"}, closestVehicle ~= nil, {
                        onSelected = function()
                            local vehProps = ESX.Game.GetVehicleProperties(closestVehicle)
                            if vehProps then
                                ESX.TriggerServerCallback('gangsbuilder:getVehicleInfo', function(owner, model)
                                    if owner then
                                        ESX.ShowNotification("Propriétaire: " .. owner .. "\nModèle: " .. model)
                                    else
                                        ESX.ShowNotification("Aucune information disponible sur ce véhicule")
                                    end
                                end, vehProps.plate)
                            end
                        end
                    })
                end)
                
                Citizen.Wait(0)
            end
        end)
    end
end

function GetClosestVehicle(coords, radius)
    local vehicles = ESX.Game.GetVehiclesInArea(coords, radius)
    local closestDistance = radius
    local closestVehicle = nil
    
    for i = 1, #vehicles do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = #(coords - vehicleCoords)
        
        if distance < closestDistance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end
    
    return closestVehicle
end

function GetClosestPedWithState()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local peds = ESX.Game.GetPeds()
    local closestDistance = 3.0
    local closestPed = nil
    
    for i = 1, #peds do
        local ped = peds[i]
        
        if DoesEntityExist(ped) and ped ~= playerPed then
            local pedCoords = GetEntityCoords(ped)
            local distance = #(coords - pedCoords)
            
            if distance < closestDistance and IsEntityPlayingAnim(ped, "mp_arresting", "idle", 3) then
                closestPed = ped
                closestDistance = distance
            end
        end
    end
    
    return closestPed
end 
]]--