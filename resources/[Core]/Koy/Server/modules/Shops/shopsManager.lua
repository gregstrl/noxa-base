ShopsManager = ShopsManager or {};

function ShopsManager.GetFromId(shpId)
    return Config["Shops"].list[shpId]
end


ClientCanAccessFood = 1

RegisterNetEvent("Ouvre:BurgerShot", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == "burgershot" then
        ClientCanAccessFood = 0
    end
end)

RegisterNetEvent("Ferme:BurgerShot", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == "burgershot" then
        ClientCanAccessFood = 1
    end
end)