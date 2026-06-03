RegisterNetEvent("Koy:radio:resquestMenu", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        local hasRadio = xPlayer.hasInventoryItem("radio", 1)
        if xPlayer.job.name == "sahp" or xPlayer.job.name == "lsco" or xPlayer.job.name == "usms" or xPlayer.job.name == "fib" or xPlayer.job.name == "ambulance" or xPlayer.job.name == "gouv" then
            hasRadio = true
        end
        TriggerClientEvent("Koy:radio:player:resquestMenu", source, hasRadio)
    end

end)


RegisterNetEvent('tonio:haveRadio')
AddEventHandler('tonio:haveRadio', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local items = xPlayer.getInventoryItem('radio')

    if items then
        TriggerClientEvent("radioGood", source, true)
    else
       TriggerClientEvent("radioGood", source, false)
    end
end)