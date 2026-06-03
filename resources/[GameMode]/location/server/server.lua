-- SCRIPT FAIT ET LEAK SUR DISCORD.GG/CHINALEAK
ESX = exports['Framework']:getSharedObject()

local vehiclePrices = {}
for _, vehicle in ipairs(Config.Vehicles) do
    vehiclePrices[vehicle.name] = vehicle.basePrice
end

ESX.RegisterServerCallback('leetachang_vehicleloca:canAffordRental', function(source, cb, vehicle, duration)
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = calculateRentalPrice(vehicle, duration)
    
    if xPlayer.getAccount('bank').money >= price then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('leetachang_vehicleloca:rentVehicle')
AddEventHandler('leetachang_vehicleloca:rentVehicle', function(vehicle, duration)
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = calculateRentalPrice(vehicle, duration)
    
    if xPlayer.getAccount('bank').money >= price then
        xPlayer.removeAccountMoney('bank', price)
        TriggerClientEvent('leetachang_vehicleloca:spawnRentedVehicle', source, vehicle, duration, price)
    else
        TriggerClientEvent('esx:showNotification', source, "[~r~Impossible~h~] Vous n'avez pas assez d'argent pour louer ce véhicule.")
    end
end)

function calculateRentalPrice(vehicle, duration)
    local basePrice = vehiclePrices[vehicle] or 100 
    local multiplier = 1
    for _, durationOption in ipairs(Config.RentalDurations) do
        if durationOption.duration == duration then
            multiplier = durationOption.multiplier
            break
        end
    end
    return math.round(basePrice * multiplier)
end

function math.round(num)
    return math.floor(num + 0.5)
end

ESX.RegisterServerCallback('leetachang_vehicleloca:getData', function(source, cb)
    cb({
        vehicles = Config.Vehicles,
        rentalDurations = Config.RentalDurations
    })
end)