
local ESX
local fishSafety = {}

TriggerEvent(Config.ESX, function(obj)
    ESX = obj
end)

RegisterNetEvent("startFishing")
AddEventHandler("startFishing", function(fishingZoneId)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local coords = GetEntityCoords(GetPlayerPed(_src))
    local startZone = vector3(-1843.598, -1240.968, 13.01)

    -- Vérifications d'inventaire
    if not xPlayer.canCarryItem('saumon', 1) or not xPlayer.canCarryItem('cabillaud', 1) or not xPlayer.canCarryItem('sardine', 1) or not xPlayer.canCarryItem('truite', 1) or not xPlayer.canCarryItem('thon', 1) or not xPlayer.canCarryItem('brochet', 1) then
        TriggerClientEvent("stopFishing", _src, "[~r~Impossible~h~] Vous n'avez pas assez de place dans votre inventaire")
        return
    end

    -- Vérification de la canne à pêche
    if xPlayer.getInventoryItem(Config.Peche.fishingRod).count <= 0 then
        TriggerClientEvent("setFishingState", _src, false, "[~r~Impossible~h~] Vous n'avez pas de canne à pêche")
        return
    end

    -- Sécurité pour éviter les abus
    if fishSafety[_src] == nil then
        fishSafety[_src] = { isDoing = false }
    end
    if fishSafety[_src].isDoing == true then
        xPlayer.ban(0, '(startFishing (1))')
        return
    end
    fishSafety[_src] = { isDoing = true }

    -- Vérification de la zone de pêche
    if #(coords - startZone) > 40 / 2 then
        xPlayer.ban(0, '(startFishing)')
        return
    end

    -- Début de la pêche
    TriggerClientEvent("startFishing", _src, fishingZoneId, "yes")
    Wait(1000)
    SetTimeout(math.random(2000, 17000), function()
        xPlayer = ESX.GetPlayerFromId(_src)
        if not xPlayer then return end

        -- Calcul de la chance pour chaque poisson
        local totalChance = 0
        for _, fish in ipairs(Config.Peche.availableFish) do
            totalChance = totalChance + fish.chance
        end

        -- Tirage au sort
        local randomChance = math.random(1, totalChance)
        local reward = nil
        local cumulativeChance = 0

        for _, fish in ipairs(Config.Peche.availableFish) do
            cumulativeChance = cumulativeChance + fish.chance
            if randomChance <= cumulativeChance then
                reward = fish
                break
            end
        end

        -- Récompense pour le joueur
        if reward then
            local rewardCount = 1
            xPlayer.addInventoryItem(reward.name, rewardCount)
            TriggerClientEvent("stopFishing", _src, "Vous avez pêché ~g~" .. rewardCount .. " ~g~" .. reward.label .. " ~w~!")
        else
            TriggerClientEvent("stopFishing", _src, "Désolé, vous n'avez rien pêché.")
        end
    end)
    
    fishSafety[_src] = { isDoing = false }
end)


RegisterNetEvent("sellfishs")
AddEventHandler("sellfishs", function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local total = 0
    for k,v in pairs(Config.Peche.availableFish) do
        local count = xPlayer.getInventoryItem(v.name).count
        if count > 0 then
            xPlayer.removeInventoryItem(v.name, count)
            total = count*(v.price)
        end
    end
    if total <= 0 then
        TriggerClientEvent("esx:showNotification", _src, "[~r~Impossible~h~] Vous n'avez rien vendu !")
        return
    end
    TriggerClientEvent("esx:showNotification", _src, "~g~Vous avez vendu tous vos poissons pour "..total.."$")
    xPlayer.addAccountMoney('cash', total)
end)