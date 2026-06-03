--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

local AllRapportsDesAmbulanciers = {}

local isInService = false

local letypeasendendb

local thetype

local theWeaponWhoKilled

local openambulanceF6 = false

local openGestion = false

local openPharma = false

local openClothes = false

local openSpawner = false

local appelsdesmorts = {}

local countofappels = 0

local IsInPVP = false;

local objectsEMS = {
    [0] = {
        model = "prop_roadcone02a",
        name = "Cônes"
    },
    [1] = {
        model = "prop_barrier_work06a",
        name = "Barrière"
    },
}

local doctorCoords = {x = -327.090942, y = -588.139221, z = 32.775528, h = 222.77139282227}
local ped = nil

local function InitializeESX()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
        Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end
    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end

local function CreateDoctor()
    local hash = GetHashKey("s_m_m_doctor_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(50) end
    ped = CreatePed(4, hash, doctorCoords.x, doctorCoords.y, doctorCoords.z, doctorCoords.h, false, true)
    SetEntityAsMissionEntity(ped, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end

local function HandleDoctorInteraction()
    local can = true
    while ped == nil or not DoesEntityExist(ped) do Wait(100) end
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local doctorCoords = GetEntityCoords(ped)
        if #(playerCoords - doctorCoords) < 3.0 then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour parler au docteur.")
            if IsControlJustPressed(1, 51) and can then
                TriggerEvent("ambulance:revive", GetPlayerServerId(PlayerId()))
                TriggerServerEvent('ambulance:payNPC')
                can = false
                Citizen.SetTimeout(120000, function() can = true end)
            elseif not can then
                ESX.ShowNotification("[~r~Impossible~h~] Vous devez attendre quelques minutes pour être à nouveau soigné")
            end
        else
            Wait(500)
        end
    end
end

local function HandleJobMarkers()
    while true do
        local interval = 500
        local plyPed = PlayerPedId()
        local coords = GetEntityCoords(plyPed)
        if type(ESX.PlayerData) == "table" and type(ESX.PlayerData.job) == "table" and type(ESX.PlayerData.job.name) == "string" and ESX.PlayerData.job.name == 'ambulance' then
            for k,v in pairs(Config.Jobs.Ambulance.Pharma) do
                if #(coords - v.pharma) <= 10 then
                    DrawMarker(Config.Get.Marker.Type, v.pharma, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    interval = 1
                    if #(coords - v.pharma) <= 3 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu")
                        if IsControlJustPressed(0, 51) then
                            openPharma = true
                            OpenAmbulancePharmacie()
                        end
                    end
                end
            end
            for k,v in pairs(Config.Jobs.Ambulance.Clothes) do
                if #(coords - v.clothes) <= 10 then
                    DrawMarker(Config.Get.Marker.Type, v.clothes, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    interval = 1
                    if #(coords - v.clothes) <= 3 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu")
                        if IsControlJustPressed(0, 51) then
                            openClothes = true
                            OpenAmbulanceClothesMenu()
                        end
                    end
                end
            end
            for k,v in pairs(Config.Jobs.Ambulance.Vehicle) do
                if #(coords - v.vehicle) <= 10 then
                    DrawMarker(Config.Get.Marker.Type, v.vehicle, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    interval = 1
                    if #(coords - v.vehicle) <= 3 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu")
                        if IsControlJustPressed(0, 51) then
                            openSpawner = true
                            OpenAmbulanceVehicleSpawnerMenu()
                        end
                    end
                end
            end
            for k,v in pairs(Config.Jobs.Ambulance.DeleteVeh) do
                local veh = GetVehiclePedIsIn(PlayerPedId())
                if #(coords - v.deleteveh) <= 10 then
                    DrawMarker(Config.Get.Marker.Type, v.deleteveh, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    interval = 1
                    if #(coords - v.deleteveh) <= 3 and DoesEntityExist(veh) then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                        if IsControlJustPressed(0, 51) then
                            ESX.Game.DeleteVehicle(veh)
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end

local function RespawnPed(ped, coords)
    if not coords.heading then coords.heading = 0.0 end
    
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.heading, true, false)
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
    SetPlayerInvincible(PlayerId(), false)
    ClearPedBloodDamage(ped)

    local respawnData = {
        coords = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        heading = coords.heading,
        model = GetEntityModel(ped)
    }

    TriggerEvent("playerSpawned", respawnData, false)
end

local function revive_player(callback)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    CreateThread(function()
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do Wait(0) end

        if not IsInPVP then
            ESX.SetPlayerData('lastPosition', {
                x = coords.x,
                y = coords.y,
                z = coords.z
            })

            TriggerServerEvent('esx:updateLastPosition', {
                x = coords.x,
                y = coords.y,
                z = coords.z
            })

            RespawnPed(playerPed, {
                x = coords.x,
                y = coords.y,
                z = coords.z
            })

            if callback then
                CreateThread(function()
                    while IsPedFatallyInjured(playerPed) do Wait(20) end
                    callback()
                end)
            end
        else
            RespawnPed(playerPed, {
                x = coords.x,
                y = coords.y,
                z = coords.z
            })

            local godCheck = true
            SetTimeout(2500, function()
                godCheck = false
                SetEntityAlpha(playerPed, 255)
                SetPlayerInvincible(PlayerId(), false)
                DisablePlayerFiring(PlayerId(), false)
            end)
        end

        StopScreenEffect('DeathFailOut')
        DoScreenFadeIn(800)
    end)
end

function verif(a, val)

    for name, value in ipairs(a) do

        if value == val then

            return true

        end

    end

    return false

end

function KeyboardInputAmbulance(entryTitle, textEntry, inputText, maxLength)

    AddTextEntry(entryTitle, textEntry)

    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do

      Wait(0)

    end

    if UpdateOnscreenKeyboard() ~= 2 then

      local result = GetOnscreenKeyboardResult()

      return result

    else

        return nil

    end

end

Citizen.CreateThread(InitializeESX)
Citizen.CreateThread(CreateDoctor)
Citizen.CreateThread(HandleDoctorInteraction)
Citizen.CreateThread(HandleJobMarkers)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)

    ESX.PlayerData.job = job

end)

RegisterNetEvent('ambulance:revive', revive_player)

RegisterNetEvent('ambulance:reviveAfterDie')
AddEventHandler('ambulance:reviveAfterDie', function()

    local playerPed = PlayerPedId();

    local coords = Config.RespawningPlace;

    Citizen.CreateThread(function()

      DoScreenFadeOut(500)

      while not IsScreenFadedOut() do

        Wait(0)

      end

      ESX.SetPlayerData('lastPosition', {

        x = coords.x,
        y = coords.y,
        z = coords.z

      })
      TriggerServerEvent('esx:updateLastPosition', {

        x = coords.x,
        y = coords.y,
        z = coords.z

      })
      RespawnPed(playerPed, {

        x = coords.x,
        y = coords.y,
        z = coords.z

      })

      StopScreenEffect('DeathFailOut')

      DoScreenFadeIn(500)

    end)

end)

RegisterNetEvent('ambulance:slay')
AddEventHandler('ambulance:slay', function()

    local playerPed = PlayerPedId();
    SetEntityHealth(playerPed, 0);

end)

RegisterNetEvent('ambulance:heal')
AddEventHandler('ambulance:heal', function(type)

	local playerPed = PlayerPedId()

	local maxHealth = GetEntityMaxHealth(playerPed)

	if type == 'small' then

		local health = GetEntityHealth(playerPed)

		local newHealth = math.min(maxHealth , math.floor(health + maxHealth/8))

		SetEntityHealth(playerPed, newHealth)

	elseif type == 'big' then

		SetEntityHealth(playerPed, maxHealth)

	end

    ESX.ShowNotification("Vous avez été soigné")

end)

function getAllRapports()

    ESX.TriggerServerCallback('getAllRapports', function(cb)

        if not cb then return end

        for i = 1, #cb, 1 do
            local d = cb[i]

            table.insert(AllRapportsDesAmbulanciers, {

                prenom = d.Prenom,
                nom = d.Nom,
                type = d.Type,
                montant = d.Montant

            })

        end

    end)

end

RegisterNetEvent('ambulance:InfoService')
AddEventHandler('ambulance:InfoService', function(service, nom)

	if service == 'prise' then

		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)

		ESX.ShowNotification('~s~Ambulancier : ~s~'..nom..'\n~s~Information : ~g~Prise de service.')

		Wait(1000)

		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)

	elseif service == 'fin' then

		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)

		ESX.ShowNotification('~s~Ambulancier : ~s~'..nom..'\n~s~Information : ~r~Fin de service.')

		Wait(1000)

		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)

    end

end)

RegisterNetEvent('ambulance:signal')
AddEventHandler('ambulance:signal', function(x,y,z)

    countofappels = countofappels + 1

    table.insert(appelsdesmorts, {

        x = x,
        y=y,
        countofappels = countofappels,

    })

end)

RegisterNetEvent('isInServiceCheck')
AddEventHandler('isInServiceCheck', function(args)

    if isInService and args == "+" then

        TriggerServerEvent('ambulance:sendAnnonce', "+")

    elseif isInService and args == "-" then

        TriggerServerEvent('ambulance:sendAnnonce', "-")

    end
end)


RegisterNetEvent('ambulance:deleteAppel')
AddEventHandler('ambulance:deleteAppel', function(k)
    table.remove(appelsdesmorts, k)
end)

function openF6Ambulance()

    local tableInfos = {}
    local mainMenu = RageUI.CreateMenu('', 'San Andreas Medical Center')
    local interaction = RageUI.CreateSubMenu(mainMenu, '', 'San Andreas Medical Center')
    local analyse = RageUI.CreateSubMenu(mainMenu, '', 'San Andreas Medical Center')
    local rapport = RageUI.CreateSubMenu(mainMenu, '', 'San Andreas Medical Center')
    local appels = RageUI.CreateSubMenu(mainMenu, '', 'Liste des rapports')
    local voirrapports = RageUI.CreateSubMenu(mainMenu, '', 'San Andreas Medical Center')
    local fairerapport = RageUI.CreateSubMenu(rapport, '', 'San Andreas Medical Center')
    local typedesoin = RageUI.CreateSubMenu(fairerapport, '', 'San Andreas Medical Center')
    local anoncesambulance = RageUI.CreateSubMenu(mainMenu, "", "San Andreas Medical Center")
    local props = RageUI.CreateSubMenu(mainMenu, "", "Intéractions : Objets")
    local propsList = RageUI.CreateSubMenu(props, "", "Intéractions : Gérer")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openambulanceF6 do

        RageUI.IsVisible(mainMenu, function()

            local grade = ESX.PlayerData.job.grade_name

            if isInService then

                    RageUI.Button("Intéractions citoyen", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interaction)

                    RageUI.Button("Mettre une facture", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            local montant = KeyboardInputAmbulance("Montant:", 'Indiquez un montant', '', 4)
                            if tonumber(montant) == nil then
                                ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                                return false
                            else
                                amount = (tonumber(montant))
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                                else
                                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'ambulance', 'ambulance', amount)
                                end
                            end
                        end
                    })

                    RageUI.Button("Consulter les appels", nil, {RightLabel = "→"}, true, {
                    }, appels)

                    RageUI.Button("Faire un rapport", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, rapport)

                    RageUI.Button("Anonces", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, anoncesambulance)

                    RageUI.Button("Objets", nil, { RightLabel = "→" }, true, {
                    }, props)

                    if grade == 'boss' then

                        RageUI.Button("Voir les rapports de vos employés", nil, {RightLabel = "→"}, true , {

                            onSelected = function()

                                getAllRapports()

                            end

                        }, voirrapports)

                    end

                else

                    RageUI.Separator("Vous devez être en service")

                end

            end)

        RageUI.IsVisible(appels, function()

            RageUI.Separator("~s~Appels disponibles : ")

            RageUI.Line()

            for k,v in pairs(appelsdesmorts) do

                RageUI.Button("Appel: "..v.countofappels, "Cette personne à besoin d'aide! Rejoignez sa position", {}, true, {
                    onSelected = function()
                        SetNewWaypoint(v.x, v.y)
                        TriggerServerEvent('ambulance:deleteCall', k)
                    end
                })

            end

        end)

        RageUI.IsVisible(anoncesambulance, function()
            RageUI.Separator("↓ Gestion Annonces ~s~ ↓")
            RageUI.Button("~g~[Ouvertures]~s~", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Ouvre:ambulance')
                end
            })
            RageUI.Button("~s~[Fermetures]~s~", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Ferme:ambulance')
                end
            })
            RageUI.Button("~o~[Recrutement]~s~", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Recrutement:ambulance')
                end
            })
            RageUI.Button("~b~[Personnaliser]~s~", nil, {}, true, {
                onSelected = function()
                    local input = exports.ox_lib:inputDialog('Message personnalisé', {
                        {type = 'input', label = 'Message', description = 'Entrez votre message (emojis autorisés)', required = true, min = 1, max = 200}
                    })
                    
                    if input and input[1] then
                        TriggerServerEvent('Personnaliser:ambulance', input[1])
                    end
                end
            })
        end)
    
        RageUI.IsVisible(interaction, function()

            RageUI.Button("Réanimer", "Cette action nécessite 1 ~s~medikit", {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('Personne autour de vous')
                    else
                        TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                        ESX.ShowNotification("Réanimation en cours")
                        exports["rprogress"]:Start('', 10000)
                        --Wait(10000)

                        TriggerServerEvent('ambulance:réanimer', GetPlayerServerId(closestPlayer))
                        ClearPedTasks(PlayerPedId())
                    end
                end
            })

            RageUI.Button("Prodiguer des soins intensifs", "Cette action nécessite 1 ~s~kit de soins", {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance =ESX.Game.GetClosestPlayer()
                    local closestPlayerPed = GetPlayerPed(closestPlayer)
                    local health = GetEntityHealth(closestPlayerPed)
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('Personne autour de vous')
                    else
                        if health > 0 then
                            local playerPed = PlayerPedId()
                            TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                            ESX.ShowNotification("Soins en cours")
                            exports["rprogress"]:Start('', 5000)
                            --Wait(10000)

                            ClearPedTasks(playerPed)
                            TriggerServerEvent('ambulance:healsomeone', GetPlayerServerId(closestPlayer), 'big')




                        else
                            ESX.ShowNotification("[~r~Impossible~h~] Vous n'avez aucune raison de soigner cette personne")
                        end
                    end   
                end
            })

            RageUI.Button("Forcer l'affichage des corps", "Rafraîchit les corps morts autour de vous pour les rendre visibles", {RightLabel = "→"}, true, {
                onSelected = function()
                    ExecuteCommand("debugcorp")
                end
            })

            RageUI.Button("Analyser un corps", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer = ESX.Game.GetClosestPlayer()
                    local closestPlayerPed = GetPlayerPed(closestPlayer)
                    local carkill = { 133987706, -1553120962 }
                    if IsPlayerDead(closestPlayer) then
                        local ReasonOfDead = GetPedCauseOfDeath(closestPlayerPed)
                        for key, value in pairs(TableWeapon) do
                            if value == ReasonOfDead then
                                ReasonOfDead = key
                                theWeaponWhoKilled = ESX.GetWeaponLabel(key)
                                key = "Meurtre par arme"
                                table.insert(tableInfos, {label = key, name = GetPlayerName(closestPlayer), weapon = theWeaponWhoKilled})
                            end
                        end
                        if verif(carkill, ReasonOfDead) then
                            table.insert(tableInfos, {name = GetPlayerName(closestPlayer), label = "Tué par un véhicule"})
                        end
                    end
                end
            }, analyse)

        end)

        RageUI.IsVisible(analyse, function()
            for k,v in pairs(tableInfos) do
                RageUI.Separator("Nom de la personne étudiée: "..v.name)
                RageUI.Button("Raison de la mort: "..v.label, nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                    end
                })
                if v.weapon ~= nil then
                    RageUI.Button("Arme utilisée: "..v.weapon, nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    })
                end
            end
        end)

        RageUI.IsVisible(props, function()
            RageUI.Button("~s~Gérer", nil, { RightLabel = "→" }, true, {
            }, propsList)
            RageUI.Line()
            for k,v in pairs(objectsEMS) do 
                RageUI.Button(v.name, v.model, { RightLabel = "→" }, true, {
                    onSelected = function()
                        SpawnObj(v.model)
                        -- print(v.name)
                    end
                })
            end
        end)

        RageUI.IsVisible(propsList, function()
            RageUI.Line()
            for k,v in pairs(object) do
                if GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(v))) == 0 then table.remove(object, k) end
                RageUI.Button("Objet : "..GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(v))), v, { RightLabel = "→" }, true, {
                    onActive = function()
                        local entity = NetworkGetEntityFromNetworkId(v)
                        local ObjCoords = GetEntityCoords(entity)
                        DrawMarker(2, ObjCoords.x, ObjCoords.y, ObjCoords.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 170, 1, 0, 2, 1, nil, nil, 0)
                    end,
                    onSelected = function()
                        RemoveObj(v, k)
                        -- print("ID : "..v, k)
                    end
                })
            end
        end)

        RageUI.IsVisible(rapport, function()

            RageUI.Button("Faire un rapport", nil, {RightLabel = "→"}, true, {

            }, fairerapport)

        end)

        RageUI.IsVisible(fairerapport, function()

            RageUI.Separator("Détaillez votre rapport →")

            RageUI.Button("Prénom du médecin", nil , {RightLabel = prenom}, true, {

                onSelected = function()

                    prenomInput = KeyboardInputAmbulance("prenom", 'Entrez votre prenom', '', 15)

                    prenom = (tostring(prenomInput))

                end

            })

            RageUI.Button("Nom du médecin", nil , {RightLabel = nom}, true, {

                onSelected = function()

                    nominput = KeyboardInputAmbulance("nom", 'Entrez votre nom', '', 15)

                    nom = (tostring(nominput))

                end
            })

            RageUI.Button("Type de soin donnés", nil , {RightLabel = thetype}, true, {

                onSelected = function()

                end

            }, typedesoin)


            RageUI.Button("Montant de la facture donnée", nil, {RightLabel = montant}, true, {

                onSelected = function()

                    montantInput = KeyboardInputAmbulance("montant", 'Entrez le montant', '', 15)

                    montant = tonumber(montantInput)

                end

            })

            RageUI.Button("Envoyez votre rapport", nil, {RightLabel = "→"}, true, {

                onSelected = function()

                    if not prenom or not nom or not letypeasendendb or not montant then

                        ESX.ShowNotification("[~r~Impossible~h~] Merci de remplir toutes les informations")

                    else

                        TriggerServerEvent('ambulance:sendrapport', prenom, nom, letypeasendendb, montant)

                        RageUI.GoBack()

                    end

                end

            })

        end)

        RageUI.IsVisible(typedesoin, function()

            RageUI.Button("Petit soin ?", nil, {RightLabel = "→"}, true, {

                onSelected = function()

                    letypeasendendb = 'petit'

                    thetype = "Petit soin"

                    RageUI.GoBack()

                end

            })

            RageUI.Button("Grand soin ?", nil, {RightLabel = "→"}, true, {

                onSelected = function()

                    letypeasendendb = 'grand'

                    thetype = "Grand soin"

                    RageUI.GoBack()

                end

            })

            RageUI.Button("Réanimation ?", nil, {RightLabel = "→"}, true, {

                onSelected = function()

                    letypeasendendb = 'rea'

                    thetype = "Réanimation"

                    RageUI.GoBack()

                end

            })

        end)

        RageUI.IsVisible(voirrapports, function()

            for k,v in pairs(AllRapportsDesAmbulanciers) do

                RageUI.Separator("Rapport de: "..v.prenom.." "..v.nom.."")

                RageUI.Button("Voici les détails du rapport:", "Type de soin donnée: "..v.type.." montant de la facture donnée: "..v.montant.."$", {RightLabel = "→"}, true, {

                    onSelected = function()

                        confirmInput = KeyboardInputAmbulance("confirm", 'Entrez oui pour supprimer ce rapport et non pour annuler', '', 15)

                        confirm = (tostring(confirmInput))

                        if confirm == 'oui' then
                            TriggerServerEvent('ambulance:deleterapport', v.prenom, v.nom, v.type, v.montant)

                            ESX.ShowNotification("Rapport supprimé avec succès")

                            RageUI.GoBack()

                        else

                            ESX.ShowNotification("Suppression annulée")

                            RageUI.GoBack()

                        end

                    end

                })

            end

        end)

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(appels) and not RageUI.Visible(interaction) and not RageUI.Visible(analyse) and not RageUI.Visible(rapport) and not RageUI.Visible(voirrapports) and not RageUI.Visible(fairerapport) and not RageUI.Visible(typedesoin) and not RageUI.Visible(props) and not RageUI.Visible(propsList) and not RageUI.Visible(anoncesambulance) then

            mainMenu = RMenu:DeleteType('mainMenu', true)

            openambulanceF6 = false

        end

        if not RageUI.Visible(voirrapports) then

            table.remove(AllRapportsDesAmbulanciers, k)

        end

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(interaction) and not RageUI.Visible(analyse) then

            table.remove(tableInfos, k)

        end

        Wait(0)

    end

end


function OpenAmbulancePharmacie()

    mainMenu = RageUI.CreateMenu("", "San Andreas Medical Center")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openPharma do

        RageUI.IsVisible(mainMenu, function()

            RageUI.Button("Prendre des bandages", nil, {RightLabel = "→"}, true , {

                onSelected = function()

                    TriggerServerEvent('ambulance:takebandage')

                end

            })

            RageUI.Button("Prendre des kits de soin", nil, {RightLabel = "→"}, true , {

                onSelected = function()

                    TriggerServerEvent('ambulance:takemedikits')

                end

            })

        end)

        if not RageUI.Visible(mainMenu) then

            mainMenu = RMenu:DeleteType('mainMenu', true)

            openPharma = false

        end

        Wait(0)

    end

end

local function setUniformAmbulance(job, playerPed)

	TriggerEvent('skinchanger:getSkin', function(skin)

		if skin.sex == 0 then

			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.Ambulance.Uniforms.male)

		else

			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.Ambulance.Uniforms.female)

		end

	end)

end

function OpenAmbulanceClothesMenu()

    local mainMenu = RageUI.CreateMenu("", "San Andreas Medical Center")


    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openClothes do

        RageUI.IsVisible(mainMenu, function()

            RageUI.Button("Reprendre votre tenue civile", nil, {RightLabel = "→"}, true , {

                onSelected = function()

                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)

                        TriggerEvent('skinchanger:loadSkin', skin)

                    end)

                    isInService = false

                    TriggerServerEvent('annonce:serviceAmbulance', 'fin')

                end

            })
            RageUI.Button("Prendre votre tenue", nil, {RightLabel = "→"}, true , {

                onSelected = function()

                    setUniformAmbulance('ambulancier', PlayerPedId())

                    isInService = true

                    TriggerServerEvent('annonce:serviceAmbulance', 'prise')

                end

            })

        end)

        local onPos = false

        for _, v in pairs(Config.Jobs.Ambulance.Clothes) do

            if #(GetEntityCoords(PlayerPedId()) - v.clothes) <= 10 then

                onPos = true

            end

        end

        if not RageUI.Visible(mainMenu) or onPos == false then

            mainMenu = RMenu:DeleteType('mainMenu', true)

            openClothes = false

        end

        Wait(0)

    end

end

function OpenAmbulanceVehicleSpawnerMenu()

    local mainMenu = RageUI.CreateMenu("", "San Andreas Medical Center")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openSpawner do

        RageUI.IsVisible(mainMenu, function()
            
            RageUI.Button("Sortir une Chaise Roulante", nil, {RightLabel = "→"}, true , {

                onSelected = function()

                    TriggerServerEvent('ambulance:spawnVehicle', "iak_wheelchair");

                    RageUI.CloseAll()

                end

            })

            RageUI.Button("Sortir une Ambulance #1", nil, {RightLabel = "→"}, true , {

                onSelected = function()

                    TriggerServerEvent('ambulance:spawnVehicle', "emsalamo");

                    RageUI.CloseAll()

                end

            })
    
            RageUI.Button("Sortir une Ambulance #2", nil, {RightLabel = "→"}, true , {

                onSelected = function()

                    TriggerServerEvent('ambulance:spawnVehicle', "emsamb3");

                    RageUI.CloseAll()

                end

            })

            RageUI.Button("Sortir une Ambulance #3", nil, {RightLabel = "→"}, true , {

                onSelected = function()

                    TriggerServerEvent('ambulance:spawnVehicle', "emsamb2");

                    RageUI.CloseAll()

                end

            })

            RageUI.Button("Sortir une Ambulance #4", nil, {RightLabel = "→"}, true , {

                onSelected = function()

                    TriggerServerEvent('ambulance:spawnVehicle', "emsscout");

                    RageUI.CloseAll()

                end

            })

            RageUI.Button("Sortir une Ambulance #5", nil, {RightLabel = "→"}, true , {

                onSelected = function()

                    TriggerServerEvent('ambulance:spawnVehicle', "r1200emsls");

                    RageUI.CloseAll()

                end

            })

        end)

        if not RageUI.Visible(mainMenu) then

            openSpawner = false

            mainMenu = RMenu:DeleteType('mainMenu', true)

        end

        Wait(0)

    end

end

Keys.Register('F6','InteractionsJobAmbulance', 'Menu job Ambulance', function()

    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then

        if (not IsInPVP) then

            openambulanceF6 = true

            openF6Ambulance()

        end

    end

end)


-- Animaton Use item Bandage & Medikit

RegisterNetEvent('ambulance:useMedikit')
AddEventHandler('ambulance:useMedikit', function()
    local playerPed = PlayerPedId()
    local animDict = "amb@medic@standing@kneel@idle_a"
    local animName = "idle_a"

    -- Freeze le joueur pour qu'il ne puisse pas bouger
    FreezeEntityPosition(playerPed, true)
    -- Charger l'animation
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(10)
    end

    -- Jouer l'animation
    TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, 5000, 49, 0, false, false, false)

    -- Attendre pour terminer l'animation
    exports["rprogress"]:Start('', 10000)


    -- Appliquer le soin complet
    local maxHealth = GetEntityMaxHealth(playerPed)
    SetEntityHealth(playerPed, maxHealth)

    -- Arrêter l'animation
    ClearPedTasks(playerPed)

    -- Défreeze le joueur après l'animation
    FreezeEntityPosition(playerPed, false)
end)

RegisterNetEvent('ambulance:useBandage')
AddEventHandler('ambulance:useBandage', function()
    local playerPed = PlayerPedId()
    local animDict = "amb@world_human_bum_wash@male@high@idle_a"
    local animName = "idle_a"

    -- Freeze le joueur pour qu'il ne puisse pas bouger
    FreezeEntityPosition(playerPed, true)

    -- Charger l'animation
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(10)
    end

    -- Jouer l'animation
    TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, 5000, 49, 0, false, false, false)

    -- Attendre pour terminer l'animation
    exports["rprogress"]:Start('', 10000)

    -- Appliquer un soin partiel
    local maxHealth = GetEntityMaxHealth(playerPed)
    local currentHealth = GetEntityHealth(playerPed)
    local newHealth = math.min(maxHealth, math.floor(currentHealth + maxHealth / 8))
    SetEntityHealth(playerPed, newHealth)

    -- Arrêter l'animation
    ClearPedTasks(playerPed)

    -- Défreeze le joueur après l'animation
    FreezeEntityPosition(playerPed, false)
end)