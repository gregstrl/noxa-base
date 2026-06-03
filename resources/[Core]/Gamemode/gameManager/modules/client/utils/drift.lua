local kmh = 3.6
local mph = 2.23693629
local carspeed = 0
driftmode = false -- on/off speed
local speed = kmh -- or mph
local drift_speed_limit = 200.0

-- Fonction pour obtenir le joueur et son véhicule
function GetPed() return PlayerPedId() end
function GetCar() return GetVehiclePedIsIn(PlayerPedId(), false) end

Citizen.CreateThread(function()
    while true do
        Wait(driftmode and 1 or 1500) -- Réduit la charge CPU
        if driftmode then
            if IsPedInAnyVehicle(GetPed(), false) then
                local car = GetCar()
                local carSpeed = GetEntitySpeed(car) * speed
                if GetPedInVehicleSeat(car, -1) == GetPed() then
                    if carSpeed <= drift_speed_limit then
                        if IsControlPressed(1, 21) then
                            SetVehicleReduceGrip(car, true)
                        else
                            SetVehicleReduceGrip(car, false)
                        end
                    else
                        SetVehicleReduceGrip(car, false) -- Reset si au-dessus de la limite
                    end
                end
            end
        end
    end
end)