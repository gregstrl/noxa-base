---
--- @author Azagal
--- Create at [31/10/2022] 12:18:11
--- Current project [Koy-V1]
--- File name [vehicleMenu]
---

function Taxi:vehicleMenu()
    local menuPosition = Taxi.Config.vehicle.menuPosition
    local mainMenu = RageUI.CreateMenu("", "Garage")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while (mainMenu ~= nil) do
        local playerCoords = GetEntityCoords(PlayerPedId())

        RageUI.IsVisible(mainMenu, function()
            RageUI.Separator("Liste des véhicules")
            RageUI.Button(GetLabelText(GetDisplayNameFromVehicleModel(Taxi.Config.vehicle.model)), nil, {
                RightLabel = "Prendre →"
            }, true, {
                onSelected = function()
                    local spawnPosition = Taxi.Config.vehicle.spawnPosition
                    local selectedPosition = nil

                    for i = 1, #spawnPosition do
                        local currentPosition = spawnPosition[i]
                        if (currentPosition ~= nil and ESX.Game.IsSpawnPointClear(vector3(currentPosition.x, currentPosition.y, currentPosition.z), 1.0)) then
                            selectedPosition = i
                            break
                        end
                    end

                    if (selectedPosition == nil) then
                        ESX.ShowAdvancedNotification("[~r~Impossible~h~] Aucune place libre")
                    else
                        TriggerServerEvent("Taxi:Spawn:Vehicle", selectedPosition)
                    end
                end
            })
        end)

        if (not RageUI.Visible(mainMenu) or #(playerCoords-menuPosition) > 5.0) then
            mainMenu = RMenu:DeleteType('mainMenu', true)
        end

        Wait(0)
    end
end