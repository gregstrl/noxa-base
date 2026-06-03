ESX.RegisterServerCallback('obi:getTargetId', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(target)
    if xPlayer then
        local targetId = exports['uid']:UIDServer1(target) 
        cb(targetId)
    else
        cb(nil)
    end
end)

RegisterNetEvent('serax:admin:spawnVehicle')
AddEventHandler('serax:admin:spawnVehicle', function(target, model)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer and xPlayer.getGroup() ~= 'user' then
        TriggerClientEvent('esx:spawnVehicle', target, model)
    end
end)

ESX.RegisterServerCallback('obiSecond:getTargetId', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(target)
    if xPlayer then
        local targetId = "ID Temp: " .. xPlayer.source .. " ID Unique: " .. exports['uid']:UIDServer(target)
        cb(targetId)
    else
        cb(nil)
    end
end)
