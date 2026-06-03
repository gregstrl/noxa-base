RegisterNetEvent('getUniqueIDs')
AddEventHandler('getUniqueIDs', function(playerIds, playerRoles, callback)
    local uniqueIDs = {}

    for _, playerId in ipairs(playerIds) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer then
            table.insert(uniqueIDs, { uniqueID = xPlayer.character_id, playerId = playerId })
        end
    end

    TriggerClientEvent(callback, source, uniqueIDs, playerRoles)
end)

RegisterNetEvent('serax:admin:delVeh', function(veh)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    DeleteEntity(NetworkGetEntityFromNetworkId(veh))
end)

RegisterNetEvent('serax:admin:freezeunfreezeplayer', function(target, value)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(target)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    TriggerClientEvent('serax:admin:freezeUnfreezePlayer', xPlayer.source, value)
end)

RegisterNetEvent('serax:admin:freezeunfreezevehicle', function(veh, value)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    FreezeEntityPosition(NetworkGetEntityFromNetworkId(veh), value)
end)
RegisterNetEvent('serax:admin:repairVeh', function(veh)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'user' then return end
    TriggerClientEvent('serax:admin:repairVeh', -1, veh)
end)

RegisterNetEvent('serax:admin:flipVeh', function(veh)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'user' then return end
    TriggerClientEvent('serax:admin:returnveh', -1, veh)
end)


ESX.RegisterServerCallback('serax:getVehicleInfos', function(source, cb, plate)
    MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        local retrivedInfo = {plate = plate}
        
        if result[1] then
            local xPlayer = ESX.GetPlayerFromIdentifier(result[1].owner)
            MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier',  {
                ['@identifier'] = result[1].owner
            }, function(result2)
                if result2[1] then
                    retrivedInfo.owner = ('%s %s'):format(result2[1].firstname, result2[1].lastname)
                end
                cb(retrivedInfo)
            end)
        else
            cb(retrivedInfo)
        end
    end)
end)
