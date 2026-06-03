ESX = exports['Framework']:getSharedObject()

local AllowedJobs = {
    ["unicorn"] = true,
    ["bahamas"] = true,
    ["club77"] = true
}

RegisterServerEvent('shop:buyItem')
AddEventHandler('shop:buyItem', function(itemName, quantity, price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    if not xPlayer then return end
    
    if not AllowedJobs[xPlayer.job.name] then
        TriggerClientEvent('shop:notification', _source, "Vous n'avez pas accès à ce shop")
        return
    end
    
    local totalPrice = price * quantity
    local playerMoney = xPlayer.getAccount('cash').money
    
    if playerMoney >= totalPrice then
        xPlayer.removeAccountMoney('cash', totalPrice)
        
        xPlayer.addInventoryItem(itemName, quantity)
        
        TriggerClientEvent('shop:notification', _source, "Achat effectué: "..quantity.."x "..itemName)
    else
        TriggerClientEvent('shop:notification', _source, "Vous n'avez pas assez d'argent")
    end
end) 