ESX = exports["Framework"]:getSharedObject()

RegisterNetEvent('farm:harvest')
AddEventHandler('farm:harvest', function(zoneType, itemName, amount, itemLabel)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not table.contains(ConfigFarms.FarmZones[zoneType].jobs, xPlayer.job.name) then
        return
    end

    xPlayer.addInventoryItem(itemName, amount)
    
    TriggerClientEvent('esx:showNotification', source, "Vous avez récolté ~r~" .. amount .. "~s~ " .. itemLabel)
end)

function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end
