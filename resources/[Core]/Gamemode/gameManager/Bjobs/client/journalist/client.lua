ESX = exports["Framework"]:getSharedObject()

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    playerJob = xPlayer.job.name
end)

RegisterNetEvent('esx:setJob', function(job)
    playerJob = job.name
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
        Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

OpenJournalist = function()
    local mainMenu = RageUI.CreateMenu("", "Interaction")
    local submenu1 = RageUI.CreateSubMenu(mainMenu, "", "Annonce")
    local submenu2 = RageUI.CreateSubMenu(mainMenu, "", "Annonce")
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    CreateThread(function()
        while mainMenu do
            Wait(1)

            RageUI.IsVisible(mainMenu, function()
                RageUI.Button("Annonce", nil, {RightLabel = "→"}, true, {}, submenu1)

                RageUI.Button("Outils de métier", nil, {RightLabel = "→"}, true, {}, submenu2)

                RageUI.Button("Faire une Facture", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        local montant = KeyboardInput("Veuillez indiquer le montant de la facture", '', '', 5)
                        if tonumber(montant) == nil then
                            ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                            return
                        end
                        local amount = tonumber(montant)
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer == -1 or closestDistance > 3.0 then
                            ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                        else
                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'journalist', "journalist", amount)
                        end
                    end
                })
            end)

            RageUI.IsVisible(submenu2, function()
                RageUI.Separator("↓ ~m~Caméra ~s~↓")
                RageUI.Button("Sortir une caméra (Petite)", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ExecuteCommand("e camera")
                    end
                })
                RageUI.Button("Sortir une caméra (Grande)", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ExecuteCommand("e newscam")
                    end
                })
                RageUI.Separator("↓ ~m~Micro~s~ ↓")
                RageUI.Button("Sortir un micro (Client)", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ExecuteCommand("e microcki")
                    end
                })
                RageUI.Button("Sortir un micro (Personelle)", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ExecuteCommand("e newsmic")
                    end
                })
                RageUI.Button("Sortir un micro perche", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ExecuteCommand("e newsbmic")
                    end
                })
                RageUI.Separator("↓ ~m~Autre~s~ ↓")
                RageUI.Button("Prendre des notes", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ExecuteCommand("e notepad")
                    end
                })
            end)

            RageUI.IsVisible(submenu1, function()
                RageUI.Button("Annonce ~g~[Ouvertures]~s~", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        TriggerServerEvent('Ouvre:journalist')
                    end
                })
                RageUI.Button("Annonce ~s~[Fermetures]~s~", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        TriggerServerEvent('Ferme:journalist')
                    end
                })
                RageUI.Button("Annonce ~b~[Recrutement]", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        TriggerServerEvent('Recru:journalist')
                    end
                })
                RageUI.Button("Annonce ~s~[Personnaliser]", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        OpenAnnouncementMenu()
                    end
                })
            end)

            if not RageUI.Visible(mainMenu) and not RageUI.Visible(submenu1) and not RageUI.Visible(submenu2) then
                mainMenu = RMenu:DeleteType(mainMenu, true)
                break
            end
        end
    end)
end

function OpenAnnouncementMenu()
    local annonce = KeyboardInput("Entrez votre annonce", "", 100)
    if annonce and annonce ~= "" then
        TriggerServerEvent('journalist:annonce', annonce)
    end
end

RegisterCommand("journalistmenu", function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'journalist' then
        OpenJournalist()
    end
end, false)

RegisterKeyMapping("journalistmenu", "Menu job journalist", "keyboard", "F6")

----- Gargae ----
local spawnedVehicle = nil
local spawnedVehicleModel = nil
local vehicleSpawnLocation = vector4(-532.14483642578, -889.32745361328, 24.889684677124,181.07962036132812)

local positionGarage = vector3(-537.1072, -887.0605, 25.18275)
local positionDV = vector3(-543.9933, -889.8096, 26.02444)
local markerDistance = 3.0

Citizen.CreateThread(function()
    while true do
        local wait = 750
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if ESX.PlayerData.job and ESX.PlayerData.job.name == "journalist" then
            if #(playerCoords - positionGarage) < 15.0 then
                wait = 0
                DrawMarker(23, positionGarage.x, positionGarage.y, positionGarage.z - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.3, 247,247,247, 120, false, false, nil, false, false, false, false)
                if #(playerCoords - positionGarage) < markerDistance then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le garage.")
                    if IsControlJustPressed(1, 51) then
                        OpenJournalistGarage()
                    end
                end
            end

            if IsPedInAnyVehicle(playerPed, false) and #(playerCoords - positionDV) < 15.0 then
                wait = 0
                DrawMarker(36, positionDV.x, positionDV.y, positionDV.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.3, 255, 0, 0, 255, true, true, 2, false, nil, nil, false)

                if #(playerCoords - positionDV) < markerDistance then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger le véhicule.")
                    if IsControlJustPressed(1, 51) then
                        DeleteVehicleAtMarker()
                    end
                end
            end
        end

        Wait(wait)
    end
end)

function OpenJournalistGarage()
    local mainMenu = RageUI.CreateMenu("", "Interaction")
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))


    CreateThread(function()
        while mainMenu do
            Wait(1)

            RageUI.IsVisible(mainMenu, function()
                RageUI.Button("Faire apparaitre un Rumpo", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        SpawnRumpo()
                        RageUI.CloseAll()
                    end
                })
            end)

            if not RageUI.Visible(mainMenu) then
                RMenu:DeleteType(mainMenu, true)
                break
            end
        end
    end)
end

function SpawnRumpo()
    local vehicleModel = GetHashKey("rumpo")

    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do
        Wait(10)
    end

    if spawnedVehicle and DoesEntityExist(spawnedVehicle) then
        ESX.Game.DeleteVehicle(spawnedVehicle)
    end

    spawnedVehicle = CreateVehicle(vehicleModel, vehicleSpawnLocation.x, vehicleSpawnLocation.y, vehicleSpawnLocation.z, vehicleSpawnLocation.w, true, false)
    spawnedVehicleModel = vehicleModel
    
    SetVehicleNumberPlateText(spawnedVehicle, "JOURNAL")
    SetVehicleEngineOn(spawnedVehicle, true, true, false)
    TaskWarpPedIntoVehicle(PlayerPedId(), spawnedVehicle, -1)

    SetModelAsNoLongerNeeded(vehicleModel)

    ESX.ShowNotification("🚗 Vous avez bien récupéré le véhicule du Weazel News !")
end

function DeleteVehicleAtMarker()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then
        local vehicleModel = GetEntityModel(vehicle)

        if vehicle == spawnedVehicle and vehicleModel == spawnedVehicleModel then
            ESX.ShowNotification("🚗 ~g~Votre véhicule a été rangé !")
            ESX.Game.DeleteVehicle(vehicle)
            spawnedVehicle = nil
            spawnedVehicleModel = nil
        else
            ESX.ShowNotification("[~r~Impossible~s~] Ceci n'est pas le véhicule de l'entreprise !")
        end
    else
        ESX.ShowNotification("[~r~Impossible~s~] Vous n'êtes pas dans un véhicule !")
    end
end

 local GlobalPeds = {
    Ped = {
        {hash = "g_m_y_korlieut_01", coords = vector4(-592.41131591797, -929.92718505859, 22.86961555481,89.49701690673828)}, -- acceuilmdmqd
        {hash = "g_m_y_korlieut_01", coords = vector4(-537.08044433594, -886.46789550781, 24.210382461548,177.10870361328125)}, --garage
    }
}

Citizen.CreateThread(function()
    for _,v in pairs(GlobalPeds.Ped) do
        local hash = GetHashKey(v.hash)
        while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
        end
        ped = CreatePed("KaysLePlusBeauLePlusFort", v.hash, v.coords, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
    end
end)