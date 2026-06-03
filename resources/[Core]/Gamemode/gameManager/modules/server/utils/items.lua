ESX.RegisterUsableItem('ciseaux', function(source)
	TriggerClientEvent('exodia:useciseaux', source)
end)

RegisterNetEvent('exodia:haircut', function(target)
	TriggerClientEvent('exodia:haircut', target, source)
end)

--[[RegisterServerEvent('exodia:useNitro')
AddEventHandler('exodia:useNitro', function(vehicleNetworkId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem('nitrovehicle').count > 0 then
        xPlayer.removeInventoryItem('nitrovehicle', 1)
        TriggerClientEvent('nitroEffect', -1, vehicleNetworkId)
        TriggerClientEvent('useNitro', -1, vehicleNetworkId)
    else
       -- TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas de nitro.')
    end
end)
]]