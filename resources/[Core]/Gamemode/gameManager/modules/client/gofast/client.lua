ESX = exports["Framework"]:getSharedObject()

local vehicleDeliveryPoint = {x = 2466.865234375, y = 1583.8132324219, z = 32.720279693604, heading = 273.25115966796875} 
local vehicleModels = {"drafter", "jugular", "buffalo", "bestiagts"}
local deliveryPoints = {
    {x = 1564.1342773438, y = -2169.1176757812, z = 77.528099060059}, {x = 1524.7364501953, y = 1704.4757080078, z = 109.88249969482},
    {x = -3186.3725585938, y = 1268.9205322266, z = 12.595007896423}, {x = -514.33331298828, y = 389.54168701172, z = 93.768348693848},
    {x = 90.946342468262, y = 6334.0556640625, z = 31.225786209106}, {x = -442.09085083008, y = 6341.7353515625, z = 12.715860366821},
    {x = -1194.9471435547, y = -1499.6030273438, z = 4.3653950691223}, {x = -665.78961181641, y = -2378.1262207031, z = 13.893465995789},
    {x = 51.39820098877, y = -2569.7341308594, z = 6.0045938491821}, {x = 51.39820098877, y = -2569.7341308594, z = 6.0045938491821}
}
local activeVehicle, destination, timer, timerActive, deliveryBlip = nil, nil, 420, false, nil
local restrictedJobs = {"police"}
local cooldownTime = 0

function IsPlayerRestricted()
    local job = ESX.PlayerData.job and ESX.PlayerData.job.name or nil
    for _, j in ipairs(restrictedJobs) do
        if job == j then return true end
    end
    return false
end

Citizen.CreateThread(function()
    Wait(5000)
    ESX.TriggerServerCallback("gofast:getCooldown", function(timeLeft)
        cooldownTime = timeLeft
    end)
end)



function GoFastMenu()
    local main = RageUI.CreateMenu("", "Menu GoFast")
    RageUI.Visible(main, not RageUI.Visible(main))

    while main do
        Wait(0)
        RageUI.IsVisible(main, function()
            local hours = math.floor(cooldownTime / 3600)
            local minutes = math.floor((cooldownTime % 3600) / 60)
            local seconds = cooldownTime % 60
            local cooldownText = string.format("Prochain GoFast dans : %02d:%02d:%02d", hours, minutes, seconds)

            if IsPlayerRestricted() then
                RageUI.Separator("  ")
                RageUI.Separator("~s~Dégage d'ici sale cops de merde !")
                RageUI.Separator("  ")
            else
                RageUI.Separator(cooldownText)
                RageUI.Line()
                RageUI.Button("Commencer un GoFast", "Une fois que vous avez commencé, vous devez livrer la marchandise à la destination en un temps limité", {RightLabel = "→→"}, activeVehicle == nil and cooldownTime <= 0, {
                    onSelected = function()
                        TriggerEvent("gofast:spawnVehicle")
                        RageUI.CloseAll()
                    end
                })
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType("main", true)
            break
        end
    end
end




RegisterNetEvent("gofast:updateCooldown")
AddEventHandler("gofast:updateCooldown", function(timeLeft)
    cooldownTime = timeLeft
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if cooldownTime > 0 then
            cooldownTime = cooldownTime - 1
        end
    end
end)


RegisterNetEvent("gofast:spawnVehicle")
AddEventHandler("gofast:spawnVehicle", function()
    if cooldownTime > 0 then
        ESX.ShowNotification("Vous devez attendre avant de pouvoir commencer un nouveau GoFast")
        return
    end

    TriggerServerEvent("gofast:startCooldown")

    local model = vehicleModels[math.random(#vehicleModels)]
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    activeVehicle = CreateVehicle(model, vehicleDeliveryPoint.x, vehicleDeliveryPoint.y, vehicleDeliveryPoint.z, vehicleDeliveryPoint.heading, true, false)

    -- Génération et application de la plaque d'immatriculation
    local plate = "GOF" .. math.random(1000, 9999)
    SetVehicleNumberPlateText(activeVehicle, plate)

    SetVehicleOnGroundProperly(activeVehicle)
    SetVehicleDoorsLocked(activeVehicle, 1)
    SetVehicleDoorsLockedForAllPlayers(activeVehicle, false)
    SetEntityAsMissionEntity(activeVehicle, true, true)
    SetPedIntoVehicle(PlayerPedId(), activeVehicle, -1)

    destination = deliveryPoints[math.random(#deliveryPoints)]
    ESX.ShowNotification("Vous avez 7 minutes pour livrer la marchandise à la destination indiquée")

    if deliveryBlip then RemoveBlip(deliveryBlip) end
    deliveryBlip = AddBlipForCoord(destination.x, destination.y, destination.z)
    SetBlipSprite(deliveryBlip, 1)
    SetBlipColour(deliveryBlip, 5)
    SetBlipScale(deliveryBlip, 1.0)
    SetBlipRoute(deliveryBlip, true)

    timer, timerActive = 420, true
end)


RegisterNetEvent("gofast:policeAlerted")
AddEventHandler("gofast:policeAlerted", function()
    ESX.ShowNotification("La police a été alertée de la situation alors dépêchez toi !")
end)

RegisterNetEvent("gofast:receiveAlert")
AddEventHandler("gofast:receiveAlert", function(x, y, z)
    ESX.ShowNotification("~s~Un GoFast est actuellement en cours ! Rendez-vous à la position indiquée")
    local alertBlip = AddBlipForRadius(x, y, z, 80.0)
    SetBlipColour(alertBlip, 1)
    SetBlipAlpha(alertBlip, 200)
    local testBlip = AddBlipForCoord(x, y, z)
    SetBlipSprite(testBlip, 161)
    SetBlipColour(testBlip, 1)
    SetBlipScale(testBlip, 1.2)
    Citizen.CreateThread(function() Wait(60000) RemoveBlip(alertBlip) RemoveBlip(testBlip) end)
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if timerActive and timer > 0 then timer = timer - 1 end
    end
end)

RegisterNetEvent("gofast:success")
AddEventHandler("gofast:success", function(amount)
    ESX.ShowNotification("Vous avez réussi la livraison, vous avez reçu ~s~" .. amount .. "$~s~.")
    GiveRewardVehicle()
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if timerActive then
            DrawTimer()
            DrawMarker(1, destination.x, destination.y, destination.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 150, false, false, 2, false, nil, nil, false)

            if activeVehicle and (not DoesEntityExist(activeVehicle) or GetEntityHealth(activeVehicle) <= 0) then
                ESX.ShowNotification("~s~Votre véhicule a été détruit ! Mission échouée, vous me décevez")
                RemoveVehicle()
            end

            local pCoords = GetEntityCoords(PlayerPedId())
            local pVehicle = GetVehiclePedIsIn(PlayerPedId(), false)

            if activeVehicle and #(vector3(pCoords.x, pCoords.y, pCoords.z) - vector3(destination.x, destination.y, destination.z)) < 10.0 then
                if pVehicle == activeVehicle then
                    TriggerServerEvent("gofast:reward")
                    RemoveVehicle()
                else
                    ESX.ShowNotification("~s~Vous devez arriver avec le véhicule fourni ! Mission échouée, vous me décevez")
                    RemoveVehicle()
                end
            elseif timer <= 0 then
                ESX.ShowNotification("~s~Temps écoulé ! Mission échouée, vous me décevez")
                RemoveVehicle()
            end
        end
    end
end)

function GiveRewardVehicle()
    local playerPed = PlayerPedId()
    local spawnCoords = GetEntityCoords(playerPed) + vector3(2.0, 0.0, 0.0) 
    local model = "bf400"

    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    local rewardVehicle = CreateVehicle(model, spawnCoords.x, spawnCoords.y, spawnCoords.z, GetEntityHeading(playerPed), true, false)
    SetVehicleOnGroundProperly(rewardVehicle)
    SetVehicleDoorsLocked(rewardVehicle, 1)
    SetVehicleDoorsLockedForAllPlayers(rewardVehicle, false)
    SetEntityAsMissionEntity(rewardVehicle, true, true)

    TaskWarpPedIntoVehicle(playerPed, rewardVehicle, -1) 
end


function DrawTimer()
    SetTextFont(4)
    SetTextScale(0.45, 0.45)
    SetTextColour(255, 255, 255, 255)
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString("Temps restant : " .. math.floor(timer / 60) .. " min " .. (timer % 60) .. " s")
    DrawText(0.60, 0.95)
end

function RemoveVehicle()
    if activeVehicle then
        DeleteEntity(activeVehicle)
        activeVehicle = nil
    end
    if deliveryBlip then
        RemoveBlip(deliveryBlip)
        deliveryBlip = nil
    end
    timerActive = false
end



local GoFast = {
    {x = 2462.088623, y = 1575.496460, z = 33.11260}
}

Citizen.CreateThread(function()
    while ESX == nil do Wait(100) end
    while ESX.GetPlayerData().job == nil do Wait(100) end
    ESX.PlayerData = ESX.GetPlayerData()

    while true do
        local razzou = 500
        local pCoords = GetEntityCoords(PlayerPedId())

        for _, v in ipairs(GoFast) do
            local distance = #(pCoords - vector3(v.x, v.y, v.z))

            if distance <= 10.0 then
                razzou = 1
                DrawMarker(6, v.x, v.y, v.z - 1.0, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 0, 0, 170, 0, 0, 0, 1, nil, nil, 0)

                if distance <= 1.5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour parler au gangster")
                    if IsControlJustPressed(0, 51) then
                        GoFastMenu()
                    end
                end
            end
        end
        Wait(razzou)
    end
end)

Citizen.CreateThread(function()
    while ESX == nil do Wait(100) end
    while ESX.GetPlayerData().job == nil do Wait(100) end
    ESX.PlayerData = ESX.GetPlayerData()

    local hash = GetHashKey("g_m_importexport_01")
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end

    ped = CreatePed(4, hash, 2461.183105, 1575.409424, 32.112591, 273.86447143555, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

