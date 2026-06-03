ESX.RegisterUsableItem('bmx', function(source)
    TriggerClientEvent('bmx:useBmx', source)
end)

RegisterNetEvent("bmx:addBmx", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer and xPlayer.canCarryItem('bmx', 1) then
        xPlayer.addInventoryItem('bmx', 1)
        TriggerClientEvent('esx:showNotification', src, "[~g~Succès~h~] Vous ranger reçu un BMX.")
    else
        TriggerClientEvent('esx:showNotification', src, "[~r~Impossible~h~] Vous n'avez pas assez de place dans votre inventaire.")
    end
end)

RegisterNetEvent("bmx:removeBmx", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        local item = xPlayer.getInventoryItem('bmx')
        if item and item.count > 0 then
            xPlayer.removeInventoryItem('bmx', 1)
        else
            TriggerClientEvent('esx:showNotification', src, "[~r~Impossible~h~] Vous n'avez pas de BMX à ranger.")
        end
    end
end)