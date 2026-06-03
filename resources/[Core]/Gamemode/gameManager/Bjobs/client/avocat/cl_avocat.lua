ESX = nil
local IsInPVP = false
local open = false
local codesCooldown5 = false
local nomprenom, numero, heurerdv, rdvmotif = nil, nil, nil, nil

local npc = {
    {hash="a_m_y_business_02", x = -594.031189, y = -345.451508, z = 35.04587, a = 105.10}
}

local function InitializeESX()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
        Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end

local function CreateNPC()
    for _, item in pairs(npc) do
        local hash = GetHashKey(item.hash)
        while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
        end
        local ped = CreatePed("PED_TYPE_CIVFEMALE", item.hash, item.x, item.y, item.z-0.92, item.a, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end
end
--[[
local function CreateBlip()
    local blip = AddBlipForCoord(-596.845459, -345.727203, 35.153980)
    SetBlipSprite(blip, 408)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7)
    SetBlipColour(blip, 37)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Cabinet d\'Avocat')
    EndTextCommandSetBlipName(blip)
end
]]--
local function HandleVehicleMarkers()
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob) do
            local mc = v.pointdelveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name and dif < 10 then
                interval = 1
                DrawMarker(20, mc.x, mc.y, mc.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 255, 0, 255, false, false, 0, true, nil, nil, false)
                if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                    if IsControlJustPressed(0, 51) then
                        local vehicle = GetVehiclePedIsIn(pPed, false)
                        ESX.Game.DeleteVehicle(vehicle)
                    end
                end
            end
        end
        Wait(interval)
    end
end

local function HandleAccueilMarkers()
    while true do
        local interval = 500
        local coords = GetEntityCoords(PlayerPedId())
        for _, v in pairs(Config.Jobs.Avocat.Accueil) do
            if #(coords - v.actions) <= 10 then
                interval = 1
                DrawMarker(Config.Get.Marker.Type, v.actions, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                if #(coords - v.actions) <= 3 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu")
                    if IsControlJustReleased(0, 38) then
                        OpenMenuAccueilAvocat()
                    end
                end
            end
        end
        Wait(interval)
    end
end

local function openAvocatF6()
    local mainMenu = RageUI.CreateMenu("", "Interaction")
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Checkbox("Entreprise Ouverte", nil, Society.List["avocat"].state, {}, {
                onChecked = function()
                    TriggerServerEvent('entreprise:setStatus', "avocat", true)
                    TriggerServerEvent('Ouvre:avocat')
                end,
                onUnChecked = function()
                    TriggerServerEvent('entreprise:setStatus', "avocat", false)
                    TriggerServerEvent('Ferme:avocat')
                end
            })

            RageUI.Button("Annonce ~o~[Recrutement]", nil, {RightLabel = "→"}, true, {
                onSelected = function()
                    TriggerServerEvent('Recru:avocat')
                end
            })

            RageUI.Button("Annonce ~b~[Personnaliser]", nil, {RightLabel = "→"}, true, {
                onSelected = function()
                    local input = exports.ox_lib:inputDialog('Message personnalisé', {
                        {type = 'input', label = 'Message', description = 'Entrez votre message (emojis autorisés)', required = true, min = 1, max = 200}
                    })
                    if input and input[1] then
                        TriggerServerEvent('Personnaliser:avocat', input[1])
                    end
                end
            })
            
            RageUI.Line()
            RageUI.Button("Faire une ~o~Facture", nil, {RightLabel = ""}, true, {
                onSelected = function()
                    local montant = KeyboardInputsasp("Montant:", 'Indiquez un montant', '', 7)
                    if tonumber(montant) == nil then
                        ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                        return
                    end
                    local amount = tonumber(montant)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                    else
                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'avocat', "avocat", amount)
                    end
                end
            })
        end)

        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
        end
        Wait(0)
    end
end

local mainMenu = RageUI.CreateMenu('', 'Avocat')
local subMenu1 = RageUI.CreateMenu('', 'Avocat')
mainMenu.Display.Header = true
mainMenu.Closed = function()
    open = false
    nomprenom, numero, heurerdv, rdvmotif = nil, nil, nil, nil
end

function OpenMenuAccueilAvocat()
    if open then
        open = false
        RageUI.Visible(mainMenu, false)
        return
    end
    open = true
    RageUI.Visible(mainMenu, true)
    CreateThread(function()
        while open do
            RageUI.IsVisible(mainMenu, function()
                RageUI.Button("Appeler un Avocat", nil, {RightLabel = "→→"}, not codesCooldown5, {
                    onSelected = function()
                        codesCooldown5 = true
                        TriggerServerEvent('Appel:avocat')
                        ESX.ShowNotification("Votre message a bien été envoyé aux avocats")
                        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
                    end
                })

                RageUI.Button("Prendre Rendez-Vous", nil, {RightLabel = "→→"}, true, {
                    onSelected = function() end
                }, subMenu1)
            end)

            RageUI.IsVisible(subMenu1, function()
                RageUI.Button("Nom & Prénom", nil, {RightLabel = nomprenom}, true, {
                    onSelected = function()
                        local result = KeyboardInput("FMMC_MPM_NA", "Prénom & Nom", "Prénom & Nom", "", "", "", 20)
                        if result then nomprenom = result end
                    end
                })

                RageUI.Button("Numéro de Téléphone", nil, {RightLabel = numero}, true, {
                    onSelected = function()
                        local result = KeyboardInput("FMMC_MPM_NA", "555-", "555-", "", "", "", 10)
                        if result then numero = result end
                    end
                })

                RageUI.Button("Heure du Rendez-vous", nil, {RightLabel = heurerdv}, true, {
                    onSelected = function()
                        local result = KeyboardInput("FMMC_MPM_NA", "15h40", "15h40", "", "", "", 10)
                        if result then heurerdv = result end
                    end
                })
                
                RageUI.Button("Motif du Rendez-vous", nil, {RightLabel = "→→"}, true, {
                    onSelected = function()
                        local result = KeyboardInput("FMMC_MPM_NA", "Motif", "Motif", "", "", "", 120)
                        if result then rdvmotif = result end
                    end
                })

                RageUI.Button("Valider la Demande", "", { Color = {BackgroundColor = { 76, 175, 80, 50}} }, true, {
                    onSelected = function()
                        if not nomprenom or nomprenom == '' then
                            ESX.showNotification("[~r~Impossible~h~] Vous n\'avez pas rempli votre Nom/Prénom")
                        elseif not numero or numero == '' then
                            ESX.showNotification("[~r~Impossible~h~] Vous n\'avez pas rempli votre Numéro")
                        elseif not heurerdv or heurerdv == '' then
                            ESX.showNotification("[~r~Impossible~h~] Vous n\'avez pas rempli l'heure de votre Rendez-vous")
                        elseif not rdvmotif or rdvmotif == '' or rdvmotif == "Motif" then
                            ESX.showNotification("[~r~Impossible~h~] Vous n\'avez pas rempli le motif de votre Rendez-vous")
                        else
                            RageUI.CloseAll()
                            TriggerServerEvent("Rdv:Avocat", nomprenom, numero, heurerdv, rdvmotif)
                            ESX.showNotification("Votre Demande de Rendez-vous a bien été envoyée")
                            nomprenom, numero, heurerdv, rdvmotif = nil, nil, nil, nil
                        end
                    end
                })
            end)
            Wait(0)
        end
    end)
end

local function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        DisableAllControlActions(0)
        Wait(1)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        return GetOnscreenKeyboardResult()
    end
    return nil
end

Citizen.CreateThread(InitializeESX)
Citizen.CreateThread(CreateNPC)
Citizen.CreateThread(CreateBlip)
Citizen.CreateThread(HandleVehicleMarkers)
Citizen.CreateThread(HandleAccueilMarkers)

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP
end)

Keys.Register('F6','InteractionsJobAvocat', "Menu job Avocat", function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'avocat' and not IsInPVP then
        openAvocatF6()
    end
end)
