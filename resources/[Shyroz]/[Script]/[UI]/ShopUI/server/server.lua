ESX = exports["Framework"]:getSharedObject()

RegisterServerEvent("Kays:processOrder")
AddEventHandler("Kays:processOrder", function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local items = data.items
    local total = tonumber(data.total) or 0

    if not xPlayer or not items or total <= 0 then
        TriggerClientEvent('esx:showNotification', source, "❌ Aucune commande valide à traiter.")
        return
    end

    local playerAccount = xPlayer.getAccount('cash')
    if not playerAccount then return end

    local playerMoney = playerAccount.money or 0

    if playerMoney >= total then
        xPlayer.removeAccountMoney('cash', total)
        for _, item in pairs(items) do
            xPlayer.addInventoryItem(item.inventoryName, item.quantity)
        end
        TriggerClientEvent('esx:showNotification', source, ("✅ Achat effectué ! Vous avez payé %s$."):format(total))
        TriggerClientEvent("Kays:purchaseSuccess", source, true)
    else
        TriggerClientEvent('esx:showNotification', source, ("❌ Fonds insuffisants ! Il vous manque %s$."):format(total - playerMoney))
        TriggerClientEvent("Kays:purchaseSuccess", source, false)
    end
end)