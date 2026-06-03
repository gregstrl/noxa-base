ESX.RegisterUsableItem('iak_wheelchair', function(source)
    TriggerClientEvent('iak_wheelchair:usewheel', source)
end)

RegisterNetEvent("iak_wheelchair:addwheel", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer and xPlayer.canCarryItem('iak_wheelchair', 1) then
        xPlayer.addInventoryItem('iak_wheelchair', 1)
        TriggerClientEvent('esx:showNotification', src, "[~g~Succès~h~] Vous ranger reçu une Chaise Roulante.")
    else
        TriggerClientEvent('esx:showNotification', src, "[~r~Impossible~h~] Vous n'avez pas assez de place dans votre inventaire.")
    end
end)

RegisterNetEvent("iak_wheelchair:removewheel", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        local item = xPlayer.getInventoryItem('iak_wheelchair')
        if item and item.count > 0 then
            xPlayer.removeInventoryItem('iak_wheelchair', 1)
        else
            TriggerClientEvent('esx:showNotification', src, "[~r~Impossible~h~] Vous n'avez pas de Chaise Roulante à ranger.")
        end
    end
end)