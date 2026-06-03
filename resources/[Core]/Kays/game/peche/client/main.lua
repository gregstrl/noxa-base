local ESX, currentFishing

RegisterNetEvent("setFishingState")
AddEventHandler("setFishingState", function(state, message)
    currentFishing = state
    if message then ESX.ShowNotification(message) end
end)

RegisterNetEvent("startFishing")
AddEventHandler("startFishing", function(fishingZoneId, banane)
    if banane then
        currentFishing = true
        local heading = Config.Peche.fishingZones[fishingZoneId].heading
        TaskStartScenarioAtPosition(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", GetEntityCoords(PlayerPedId()), heading, -1, false, true)
        ESX.ShowNotification("Vous commencez à pêcher...")

        -- Désactive les contrôles de mouvement du joueur
        while currentFishing do
            Wait(1)
            DisableControlAction(0, 30, true) -- W (avance)
            DisableControlAction(0, 31, true) -- S (recule)
            DisableControlAction(0, 32, true) -- A (gauche)
            DisableControlAction(0, 33, true) -- D (droite)
            DisableControlAction(0, 44, true) -- EKay (sauter)
            DisableControlAction(0, 45, true) -- CTRL (s'accroupir)
        end

        -- Une fois la pêche terminée, réactive les contrôles
        SetEntityInvincible(PlayerPedId(), false)
        ClearPedTasks(PlayerPedId())  -- Arrête l'animation de pêche
    end
end)

RegisterNetEvent("stopFishing")
AddEventHandler("stopFishing", function(message)
    if not currentFishing then return end
    if message then ESX.ShowNotification(message) end
    currentFishing = false
    ClearPedTasksImmediately(PlayerPedId())
    local obj, dst = ESX.Game.GetClosestObject()
    local isFishingRod = (GetEntityModel(obj) == -1910604593)
    if isFishingRod then
        NetworkRequestControlOfEntity(obj)
        while not NetworkHasControlOfEntity(obj) do
            Wait(10)
        end
        SetEntityAsMissionEntity(obj, 0,0)
        DeleteEntity(obj)
    end
end)

Citizen.CreateThread(function()
    TriggerEvent(Config.ESX, function(obj)
        ESX = obj
    end)
    currentFishing = false

    while true do
        local interval = 250
        local playerPos = GetEntityCoords(PlayerPedId())
        if not currentFishing then
            for k,v in pairs(Config.Peche.fishingZones) do
                local zoneCenter = v.zoneCenter
                local dst = #(playerPos-zoneCenter)
                if dst <= v.radius then
                    interval = 0
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour commencer à pêcher dans cette zone")
                    if IsControlJustPressed(0, 51) then
                        currentFishing = true
                        TriggerServerEvent("startFishing", k)
                    end
                end
            end

            local vendorZone = Config.Peche.vendor.position
            local dst = #(playerPos-vendorZone)
            if dst <= 30.0 then
                interval = 0
                DrawMarker(22, vendorZone, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255, 0, 0, 255, 55555, false, true, 2, false, false, false, false)
                if dst <= 1.0 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour vendre tous vos poissons")
                    if IsControlJustPressed(0, 51) then
                        TriggerServerEvent("sellfishs")
                    end
                end
            end
        end
        Wait(interval)
    end
end)


Citizen.CreateThread(function()
	local vendeurBlips = AddBlipForCoord(-1499.611, -933.3877, 10.18)

	SetBlipSprite(vendeurBlips, 480)
	SetBlipDisplay(vendeurBlips, 4)
	SetBlipScale(vendeurBlips, 0.6)
	SetBlipColour(vendeurBlips, 51)
	SetBlipAsShortRange(vendeurBlips, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName('[Activité] Acheteur de poisson')
	EndTextCommandSetBlipName(vendeurBlips)
end) 