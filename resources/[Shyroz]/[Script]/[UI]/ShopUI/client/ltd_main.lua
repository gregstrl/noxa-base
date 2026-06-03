ESX = exports["Framework"]:getSharedObject()

local items = {
    bmx = { name = "Bmx", price = 5000, img = "img/bmx.png", inventoryName = "bmx" },
    radio = { name = "Radio", price = 5000, img = "img/radio.png", inventoryName = "radio" },
    jerican = { name = "Jerrican D'essence", price = 2500, img = "img/jerican.png", inventoryName = "jerican" },
    fishingrod = { name = "Canne à pêche", price = 500, img = "img/fishingrod.png", inventoryName = "fishingrod" },
    phone = { name = "Téléphone", price = 300, img = "img/classic_phone.png", inventoryName = "phone" },
    bread = { name = "Pain", price = 40, img = "img/bread.png", inventoryName = "bread" },
    water = { name = "Bouteille d'eau", price = 40, img = "img/water.png", inventoryName = "water" },
}

local zoneShop = {
    vec3(373.87, 325.89, 103.36),
    vec3(2557.45, 382.28, 108.42),
    vec3(-3038.93, 585.95, 7.7),
    vec3(-3241.92, 1001.46, 12.63),
    vec3(547.43, 2671.71, 41.95),
    vec3(1961.46, 3740.67, 32.14),
    vec3(1729.21, 6414.13, 34.83),
    vec3(2678.91, 3280.67, 55.04),
    vec3(1135.8, -982.28, 46.21),
    vec3(-1222.91, -906.98, 12.12),
    vec3(-1487.55, -379.10, 39.96),
    vec3(-707.5, -914.26, 19.01),
    vec3(-1820.52, 792.51, 137.91),
    vec3(1698.38, 4924.40, 41.86),
    vec3(26.57, -1347.26, 29.49),
    vec3(-48.58, -1756.82, 29.42),
    vec3(1163.59, -323.86, 69.20),
    vec3(4985.693848, -5202.044434, 2.50),
}

local shopOpen = false

CreateThread(function()
    blipsShop()
    while true do
        local sleep = 500
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for _, v in pairs(zoneShop) do
            local distance = #(playerCoords - v)

            if distance < 10.0 then
                drawMarkerShop(v)
            end

            if distance < 1.5 then
                sleep = 0
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le magasin")

                if IsControlJustReleased(0, 38) then
                    openShop()
                end
            end
        end
        Wait(sleep)
    end
end)

function blipsShop()
    for _, v in pairs(zoneShop) do
        local blip = AddBlipForCoord(v)
        SetBlipSprite(blip, 52)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, 69)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("[Magasin] Supérette")
        EndTextCommandSetBlipName(blip)
    end
end

function drawMarkerShop(coords)
    DrawMarker(23, coords.x, coords.y, coords.z - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.3, 0, 85, 255, 200, false, false, nil, false, false, false, false)
end

function openShop()
    if shopOpen then return end
    shopOpen = true

    local playerData = ESX.GetPlayerData()
    local firstname = playerData.firstName or "Inconnu"
    local lastname = playerData.lastName or "Inconnu"

    local shopData = {
        type = "shop",
        state = true,
        nameShop = "LTD Shop",
        namePlayer = "Employé : " .. firstname .. " " .. lastname,
        img = "img/header_ltd.png",
        item = items
    }

    SendNuiMessage(json.encode(shopData))
    SetNuiFocus(true, true)
end

function closeShop()
    if not shopOpen then return end
    shopOpen = false

    SendNuiMessage(json.encode({
        type = "shop",
        state = false
    }))

    SetNuiFocus(false, false)
end

RegisterNUICallback("closeShopNui", function(_, cb)
    closeShop()
    cb("ok")
end)

RegisterNUICallback("processOrder", function(data, cb)
    TriggerServerEvent("Kays:processOrder", data)
    cb("ok")
end)

RegisterNetEvent("Kays:purchaseSuccess")
AddEventHandler("Kays:purchaseSuccess", function(success)
    if success then
        closeShop()
    end
end)
