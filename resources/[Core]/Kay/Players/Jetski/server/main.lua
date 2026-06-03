RegisterNetEvent('h4ci:locajetski')
AddEventHandler('h4ci:locajetski', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local argentdujoueurcash = xPlayer.getAccount('cash').money
    if argentdujoueurcash >= prix then
        xPlayer.removeAccountMoney('cash', 1500)
        TriggerClientEvent('esx:showNotification', source, "~b~Jetski~w~ obtenu ! ~s~-1500$")
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas assez d\'argent.')
    end
end)