--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil
local prenom = nil
local nom = nil
local date = nil
local raison = nil
local isInService = false
local nomdelemploye = nil
local gradedelemploye = nil
local Items = {}
local Armes = {}
local ArgentSale = {}
local infosvehicle = {}
local IsHandcuffed, DragStatus = false, {}
local openF6 = false
local openClothes = false
local openedGarage = false
--local openBureau = false
local isArmurerieOpened = false
local objectslsco = {   
    [0] = {
        model = "prop_roadcone02a",
        name = "Cônes"
    },
    [1] = {
        model = "prop_barrier_work05",
        name = "Barrière"
    },
}

local activeReports2 = {}
local reportBlips2 = {}

RegisterNetEvent('lsco:receiveReport')
AddEventHandler('lsco:receiveReport', function(report)
    if isInService then
        if report.type == "Vente de drogue" then
            local streetHash = GetStreetNameAtCoord(report.coords.x, report.coords.y, report.coords.z)
            report.street = GetStreetNameFromHashKey(streetHash)
        end
        
        table.insert(activeReports2, report)
        ESX.ShowNotification('~s~Nouveau signalement~s~\nType: ' .. report.type .. '\nLieu: ' .. report.street .. '\nQuartier: ' .. report.zone)
        PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
    end
end)

RegisterNetEvent('lsco:reportTaken')
AddEventHandler('lsco:reportTaken', function(report)
    if reportBlips2[report.id] then
        RemoveBlip(reportBlips2[report.id])
    end
    
    local blip = AddBlipForCoord(report.coords)
    SetBlipSprite(blip, 161)
    SetBlipScale(blip, 1.2)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Signalement - " .. report.type)
    EndTextCommandSetBlipName(blip)
    SetNewWaypoint(report.coords.x, report.coords.y)
    
    reportBlips2[report.id] = blip
    ESX.ShowNotification('~g~Vous avez pris le signalement~s~\nUn point GPS a été placé')
end)

RegisterNetEvent('lsco:updateReportStatus')
AddEventHandler('lsco:updateReportStatus', function(reportId, takenByName)
    for k, report in pairs(activeReports2) do
        if report.id == reportId then
            report.taken = true
            report.takenByName = takenByName
            break
        end
    end
end)

DragStatus.IsDragged = false

-- Décla + peds/blips

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
		Wait(100)
    end

    while ESX.GetPlayerData().job == nil do
		Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end

end)

Citizen.CreateThread(function()
    --[[for k,v in pairs(Config.Jobs.lsco.Blips) do
        local blip = AddBlipForCoord(v.coords)

		SetBlipSprite (blip, 60)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 29)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString("Station de lsco")
		EndTextCommandSetBlipName(blip)
    end]]

    for k,v in pairs(Config.Jobs.lsco.Peds) do
        local model = GetHashKey(v.ped[1])
		RequestModel(model)
		while not HasModelLoaded(model) do Wait(1) end
		local ped = CreatePed(4, model, v.ped[2], v.ped[3], false, true)
		FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_COP_IDLES", 0, true)
    end
end)


-- Main
function openF6lsco()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')
    local actions = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local interaction = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local interactionveh = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local renfort = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local objets = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local fouiller = RageUI.CreateSubMenu(interaction, "", "Faites vos actions")
    local lesinfosduvehicle = RageUI.CreateSubMenu(interactionveh, "", "Faites vos actions")
    local infoamende = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local chien = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local props = RageUI.CreateSubMenu(mainMenu, "", "Intéractions : Objets")
    local propsList = RageUI.CreateSubMenu(props, "", "Intéractions : Gérer")
    local anonceslsco = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local appelsurgences = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local reports = RageUI.CreateSubMenu(appelsurgences, "", "Faites vos actions")
    local reportManagement = RageUI.CreateSubMenu(reports, "", "Faites vos actions")


    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openF6 do
        Wait(1)
        RageUI.IsVisible(mainMenu, function()
            if isInService then
                if ESX.PlayerData.job.grade_name == 'recruit' then
                    RageUI.Button("Intéractions citoyen", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interaction)
                    RageUI.Button("Anonces", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, anonceslsco)
                    RageUI.Button("Intéractions véhicules", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interactionveh)
                    RageUI.Button("Demande de renforts", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, renfort)
                    RageUI.Button("Appels D'urgences", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, appelsurgences)
                else
                    RageUI.Button("Intéractions citoyen", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interaction)
                    RageUI.Button("Anonces", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, anonceslsco)
                    RageUI.Button("Intéractions véhicules", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interactionveh)
                    RageUI.Button("Demande de renforts", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, renfort)
                    RageUI.Button("Appels D'urgences", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, appelsurgences)
                    RageUI.Button("Intéraction sur un chien", nil, {RightLabel = "→"}, true , {}, chien)
                    RageUI.Button("Objets", nil, { RightLabel = "→" }, true, {
                    }, props)
                end
            else
                RageUI.Separator("~s~Vous devez être en service")
            end
        end)        
        
        RageUI.IsVisible(props, function()
            RageUI.Button("~b~Gérer", nil, { RightLabel = "→" }, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('GetAllPropslsco', function(Objectlsco)
                        object = Objectlsco
                    end)
                end
            }, propsList)

            for k,v in pairs(objectslsco) do 
                RageUI.Button(v.name, v.model, { RightLabel = "→" }, true, {
                    onSelected = function()
                        SpawnObjPolice(v.model)
                    end
                })
            end
        end)

        RageUI.IsVisible(propsList, function()
            print(json.encode(object))
            for k, netId in pairs(object) do
                if GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(netId))) == 0 then 
                    table.remove(object, k) 
                end

                local entity = NetworkGetEntityFromNetworkId(netId)
                local ObjCoords = GetEntityCoords(entity)
                local PlyCoords = GetEntityCoords(PlayerPedId())
                local Dist = #(PlyCoords - ObjCoords)

                if (Dist < 10.0) then
                    RageUI.Button("Objet : "..GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(netId))), netId, { RightLabel = "→" }, true, {
                        onActive = function()
                            local entity = NetworkGetEntityFromNetworkId(netId)
                            local ObjCoords = GetEntityCoords(entity)
                            DrawMarker(2, ObjCoords.x, ObjCoords.y, ObjCoords.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 170, 1, 0, 2, 1, nil, nil, 0)
                        end,
                        onSelected = function()
                            RemoveObj(netId, k)
                            -- print("ID : "..v, k)
                        end
                    })
                end
            end
        end)

        local lockKeys = false
        function SpawnObjPolice(obj)
            local playerPed = PlayerPedId()
            local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
            local objectCoords = (coords + forward * 1.0)
            local Ent = nil
        
            SpawnObject(obj, objectCoords, function(obj)
                SetEntityCoords(obj, objectCoords, 0.0, 0.0, 0.0, 0)
                SetEntityHeading(obj, GetEntityHeading(playerPed))
                PlaceObjectOnGroundProperly(obj)
                Ent = obj
                Wait(1)
            end)
        
            Wait(1)
        
            while Ent == nil do Wait(1) end
        
            SetEntityHeading(Ent, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(Ent)
            local placed = false
            lockKeys = true
        
            CreateThread(function()
                while lockKeys do
                    Wait(1)
                    DisableControlAction(0, 22, true) 
                    DisableControlAction(0, 21, true)
                end
            end)
            
            local CoordsPlace = nil
        
            while not placed do
                Wait(1)
                local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
                local objectCoords = (coords + forward * 3.0)
                SetEntityCoords(Ent, objectCoords, 0.0, 0.0, 0.0, 0)
                SetEntityHeading(Ent, GetEntityHeading(playerPed))
                PlaceObjectOnGroundProperly(Ent)
                SetEntityAlpha(Ent, 170, 170)
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour placer l'objet")
                if IsControlJustReleased(1, 38) then
                    placed = true
        
                    CoordsPlace = objectCoords
                end
            end
        
            lockKeys = false
            FreezeEntityPosition(Ent, true)
            SetEntityInvincible(Ent, true)
            ResetEntityAlpha(Ent)
        
            local NetId = NetworkGetNetworkIdFromEntity(Ent)
            -- table.insert(object, NetId)
        
            TriggerServerEvent('Koy:lsco:AddProps', NetId)
        end
        
        
        function RemoveObj(id, k)
            Citizen.CreateThread(function()
                SetNetworkIdCanMigrate(id, true)
                local entity = NetworkGetEntityFromNetworkId(id)
                NetworkRequestControlOfEntity(entity)
                local test = 0
                while test > 100 and not NetworkHasControlOfEntity(entity) do
                    NetworkRequestControlOfEntity(entity)
                    Wait(1)
                    test = test + 1
                end
                SetEntityAsNoLongerNeeded(entity)
        
                local test = 0
                while test < 100 and DoesEntityExist(entity) do 
                    SetEntityAsNoLongerNeeded(entity)
                    DeleteEntity(entity)
                    DeleteObject(entity)
                    if not DoesEntityExist(entity) then 
                        -- table.remove(object, k)
                        TriggerServerEvent('Koy:lsco:RemoveProps', id)
                    end
                    SetEntityCoords(entity, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0)
                    Wait(1)
                    test = test + 1
                end
            end)
        end

        function GoodName(hash)
            if hash == GetHashKey("prop_roadcone02a") then
                return "Cone"
            elseif hash == GetHashKey("prop_barrier_work05") then
                return "Barrière"
            else
                return hash
            end
        
        end

        RageUI.IsVisible(chien,function()


            RageUI.Checkbox("Sortir/Rentrer le chien", nil, chienlsco, {}, {
                onChecked = function(index, items)
                    chienlsco = true
                    if not DoesEntityExist(lscoDog) then
                    RequestModel('a_c_shepherd')
                    while not HasModelLoaded('a_c_shepherd') do Wait(0) end
                    lscoDog = CreatePed(4, 'a_c_shepherd', GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -0.98), 0.0, true, false)
                    SetEntityAsMissionEntity(lscoDog, true, true)
                    ESX.ShowNotification("Chien sorti")
                    end
                end,
                onUnChecked = function(index, items)
                    chienlsco = false
                    ESX.ShowNotification("Chien rentré")
                    DeleteEntity(lscoDog)
                end
            })
            
            
            RageUI.Button("Assis", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    if DoesEntityExist(lscoDog) then
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(lscoDog), true) <= 5.0 then
                            if IsEntityPlayingAnim(lscoDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 3) then
                                ClearPedTasks(lscoDog)
                            else
                                loadDict('rcmnigel1c')
                                TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
                                Wait(2000)
                                loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
                                TaskPlayAnim(lscoDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
                            end
                        else
                            ESX.ShowNotification("[~r~Impossible~h~] Le chien est trop loin de vous")
                        end
                    else
                        ESX.ShowNotification("[~r~Impossible~h~] Vous n'avez pas de chien")
                    end
                end
                })
            
                RageUI.Button("Dire d'attaquer", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if DoesEntityExist(lscoDog) then
                            if not IsPedDeadOrDying(lscoDog) then
                                if GetDistanceBetweenCoords(GetEntityCoords(lscoDog), GetEntityCoords(PlayerPedId()), true) <= 3.0 then
                                    local player, distance = ESX.Game.GetClosestPlayer()
                                    if distance ~= -1 then
                                        if distance <= 3.0 then
                                            local playerPed = GetPlayerPed(player)
                                            if not IsPedInCombat(lscoDog, playerPed) then
                                                if not IsPedInAnyVehicle(playerPed, true) then
                                                    TaskCombatPed(lscoDog, playerPed, 0, 16)
                                                end
                                            else
                                                ClearPedTasksImmediately(lscoDog)
                                            end
                                        end
                                    else
                                        ESX.ShowNotification("[~r~Impossible~h~] Aucuns joueurs proche")
                                    end
                                else
                                    ESX.ShowNotification("[~r~Impossible~h~] Le chien est trop loin de vous")
                                end
                            else
                                ESX.ShowNotification("[~r~Impossible~h~] Le chien est mort")
                            end
                        else
                            ESX.ShowNotification("[~r~Impossible~h~] Vous n'avez pas de chien")
                        end
                    end
                    })
            
                    RageUI.Button("Monter/sortir du véhicule", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if DoesEntityExist(lscoDog) then
                                if not IsPedInAnyVehicle(lscoDog, false) then
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(lscoDog)) <= 10.0 then
                                        local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 7.5, 0, 70)
                                        print(vehicle)
                                        if DoesEntityExist(vehicle) then
                                            for i = 0, GetVehicleMaxNumberOfPassengers(vehicle) do
                                                if IsVehicleSeatFree(vehicle, i) then
                                                    TaskEnterVehicle(lscoDog, vehicle, 15.0, i, 1.0, 1, 0)
                                                    break
                                                end
                                            end
                                        else
                                            ESX.ShowNotification("[~r~Impossible~h~] Vous n'avez pas de véhicule")
                                        end
                                    else
                                        ESX.ShowNotification("[~r~Impossible~h~] Le chien est trop loin de vous")
                                    end
                                else
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(lscoDog)) <= 5.0 then
                                        TaskLeaveVehicle(lscoDog, GetVehiclePedIsIn(lscoDog, false), 0)
                                    else
                                        ESX.ShowNotification("[~r~Impossible~h~] Le chien est trop loin de vous")
                                    end
                                end
                            else
                                ESX.ShowNotification("[~r~Impossible~h~] Vous n'avez pas de chien")
                            end
                        end
                        })
            
                        RageUI.Button("Suis-moi", nil, {RightLabel = "→"}, true , {
                            onSelected = function()
                                local playerPed = PlayerPedId()
                                if DoesEntityExist(lscoDog) then
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(lscoDog), true) <= 5.0 then
                                        TaskGoToEntity(lscoDog, playerPed, -1, 1.0, 10.0, 1073741824, 1)
                                    else
                                        ESX.ShowNotification("[~r~Impossible~h~] Le chien est trop loin de vous")
                                    end
                                else
                                    ESX.ShowNotification("[~r~Impossible~h~] Vous n'avez pas de chien")
                                end
                            end
                            })
            
                        end)

        RageUI.IsVisible(infoamende,function()


            for k,v in pairs(PoliceConfigAAA.amende) do
            for _,i in pairs(v) do
            RageUI.Button(i.label, nil, {RightLabel = "~g~"..i.price.."$"}, true , {
                onSelected = function() 
                    local player, distance = ESX.Game.GetClosestPlayer()
                    local sID = GetPlayerServerId(player)

                    if player ~= -1 and distance <= 3.0 then
                        TriggerServerEvent("lsco:SendFacture", sID, i.price)
                        RageUI.CloseAll()
                        open = false
                    else
                        ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                    end
                end
            })

        end
        end
        end)

        RageUI.IsVisible(anonceslsco, function()
            RageUI.Separator("↓ Gestion Anonces ~s~ ↓")
            RageUI.Button("Annonce", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    OpenAnnouncementMenu()
                end
            })
            RageUI.Button("Demander un ~g~[avocat]~s~", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    TriggerServerEvent('lsco:avocat')
                end
            })
        end)

        function OpenAnnouncementMenu()
            local annonce = KeyboardInputlsco('Entrez votre annonce', '','', 100)
            if annonce and annonce ~= "" then
                TriggerServerEvent('lsco:annonce', annonce)
            end
        end

        RageUI.IsVisible(interaction, function()
            RageUI.Button("Mettre une amende", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                end
            }, infoamende)
            RageUI.Button("Prendre la carte d'identité", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local player, distance = ESX.Game.GetClosestPlayer()
                    local getPlayerSearch = GetPlayerPed(player)
                    if IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
                        if distance ~= -1 and distance <= 3.0 then
                            RageUI.CloseAll()
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
                            ExecuteCommand("me prend l'identité de la personne")
                        else
                            ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                        end
                    else
                        ESX.ShowNotification("[~r~Impossible~h~] La personne en face ne lève pas les mains en l'air")
                    end
                end
            })
            RageUI.Button("Fouiller", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local player, distance = ESX.Game.GetClosestPlayer()
                    if distance ~= -1 and distance <= 3.0 then
                        TriggerServerEvent('message', GetPlayerServerId(player))
                        getPlayerInvlsco(player)
                        ExecuteCommand('me fouille la personne')
                    else
                        ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                    end
                end
            }, fouiller)
            RageUI.Button("Menotter/Démenotter", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                    else
                        HandcuffAnimation()
                        ExecuteCommand("me menotte la personne")
                        TriggerServerEvent('menotterForsasp', GetPlayerServerId(closestPlayer))
                    end
                end
            })
            RageUI.Button("Escorter", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    playerheading = GetEntityHeading(PlayerPedId())
                    playerlocation = GetEntityForwardVector(PlayerPedId())
                    playerCoords = GetEntityCoords(PlayerPedId())
                    local target_id = GetPlayerServerId(target)
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                    else
                        ExecuteCommand("me escorte la personne")
                        TriggerServerEvent('escortersasp', GetPlayerServerId(closestPlayer))
                    end
                end
            })
            RageUI.Button("Mettre dans le véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                    else
                        ExecuteCommand("me mets la personne dans le véhicule")
                        TriggerServerEvent('sasp:putInVehicle', GetPlayerServerId(closestPlayer))
                    end
                end
            })

            RageUI.Button("Sortir du véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                    else
                        TriggerServerEvent('sasp:OutVehicle', GetPlayerServerId(closestPlayer))
                    end
                end
            })

            RageUI.Button('Saisir le permis d\'arme', nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                    else
                        TriggerServerEvent("esx_license:removeLicense", sID, "weapon")
                        ESX.ShowNotification("Vous avez retiré le permis de la personne")
                    end
                end
            })
        end)
        
        RageUI.IsVisible(interactionveh, function()
            RageUI.Button("Rechercher une plaque", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local numplaque = KeyboardInputlsco('', '','', 10)
                    local length = string.len(numplaque)
                    if not numplaque or length < 2 or length > 8 then
                        ESX.ShowNotification("[~r~Impossible~h~] Cette plaque n'est pas enregistré dans les fichiers de la lsco")
                        ExecuteCommand("me recherche une plaque")
                    else
                        Rechercherplaquevoiture(numplaque)
                        RageUI.CloseAll()
                    end
                end
            })
        

            RageUI.Button("Crocheter le véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local coords  = GetEntityCoords(PlayerPedId())
                    local vehicle = ESX.Game.GetVehicleInDirection()
                    if DoesEntityExist(vehicle) then
                        local plyPed = PlayerPedId()
    
                        TaskStartScenarioInPlace(plyPed, 'WORLD_HUMAN_WELDING', 0, true)
                        exports["rprogress"]:Start('', 20000)
                        --Wait(20000)

                        ClearPedTasksImmediately(plyPed)
    
                        SetVehicleDoorsLocked(vehicle, 1)
                        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                        ESX.ShowNotification("Véhicule dévérouillé")
                    else
                        ESX.ShowNotification("[~r~Impossible~h~] Aucun véhicule à proximité")
                    end
                end
            })

            RageUI.Button("Mettre le véhicule en fourrière", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)
                    local vehicle = nil
                    if IsPedInAnyVehicle(playerPed, false) then
                        vehicle = GetVehiclePedIsIn(playerPed, false)
                    else
                        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                    end
                    if DoesEntityExist(vehicle) then
                        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                        Citizen.CreateThread(function()
                            exports["rprogress"]:Start('', 5000)
                            ExecuteCommand("me met la voiture en fourrière")
                           -- Wait(5000)

                            ESX.Game.DeleteVehicle(vehicle)
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("Véhicule mis en fourrière")
                        end)
                    end
                end
            })
        end)

        RageUI.IsVisible(renfort, function()
            RageUI.Button("Petite demande", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demandelsco', coords, 'petite')
                    ExecuteCommand("me demande de renfort")
                end
            })
            RageUI.Button("Moyenne demande", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demandelsco', coords, 'moyenne')
                    ExecuteCommand("me demande de renfort")
                end
            })
            RageUI.Button("Grande demande", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demandelsco', coords, 'Grande')
                    ExecuteCommand("me demande de renfort")
                end
            })
        end)

        RageUI.IsVisible(appelsurgences, function()
            RageUI.Separator("↓ Appels Urgences ~s~ ↓")
            RageUI.Button("Signalements en cours", nil, {RightLabel = "→"}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('lsco:getActiveReports', function(reports)
                        activeReports = reports
                    end)
                end
            }, reports)
            
            RageUI.Button("~r~Supprimer tous les appels", "Supprime tous les appels en cours", {RightLabel = "→"}, true, {
                onSelected = function()
                    TriggerServerEvent('lsco:clearAllReports')
                    ESX.ShowNotification("~g~Tous les appels ont été supprimés")
                end
            })
        end)
        
        RageUI.IsVisible(reports, function()
            local hasReports = false
            
            if activeReports2 and type(activeReports2) == "table" then
                for k, report in pairs(activeReports2) do
                    if report and report.id then 
                        hasReports = true
                        local buttonText = "Urgence #" .. report.id
                        local description = "Type: " .. report.type .. "\nLieu: " .. report.street .. "\nQuartier: " .. report.zone
                        if report.description then
                            description = description .. "\n" .. report.description
                        end
                        
                        if not report.taken then
                            RageUI.Button(buttonText, description, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    TriggerServerEvent('lsco:takeReport', report.id)
                                end
                            })
                        else
                            local canManage = (report.takenBy == GetPlayerServerId(PlayerId()))
                            RageUI.Button(buttonText, description .. "\nPris en charge par " .. report.takenByName, 
                                {RightLabel = canManage and "→" or "~g~Pris~s~"}, canManage, {
                                onSelected = function()
                                    selectedReport = report
                                end
                            }, reportManagement)
                        end
                    end
                end
            end
            
            if not hasReports then
                RageUI.Separator("")
                RageUI.Separator("~s~Aucun signalement en cours")
                RageUI.Separator("")
            end
        end)
        
        RageUI.IsVisible(reportManagement, function()
            if selectedReport then
                RageUI.Separator("↓ Gestion de l'urgence #" .. selectedReport.id .. " ↓")
                
                RageUI.Button("Retirer le point GPS", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        if reportBlips2[selectedReport.id] then
                            RemoveBlip(reportBlips2[selectedReport.id])
                            reportBlips2[selectedReport.id] = nil
                            ESX.ShowNotification("~g~Point GPS retiré")
                        end
                    end
                })
        
                RageUI.Button("Remettre le point GPS", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        if reportBlips2[selectedReport.id] then
                            RemoveBlip(reportBlips2[selectedReport.id])
                        end
                        local blip = AddBlipForCoord(selectedReport.coords)
                        SetBlipSprite(blip, 161)
                        SetBlipScale(blip, 1.2)
                        SetBlipColour(blip, 1)
                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentString("Signalement - " .. selectedReport.type)
                        EndTextCommandSetBlipName(blip)
                        SetNewWaypoint(selectedReport.coords.x, selectedReport.coords.y)
                        reportBlips2[selectedReport.id] = blip
                        ESX.ShowNotification("~g~Point GPS replacé")
                    end
                })
        
                RageUI.Button("~s~Clôturer l'appel", "Supprimer définitivement cet appel", {RightLabel = "→"}, true, {
                    onSelected = function()
                        if reportBlips2[selectedReport.id] then
                            RemoveBlip(reportBlips2[selectedReport.id])
                            reportBlips2[selectedReport.id] = nil
                        end
                        TriggerServerEvent('lsco:closeReport', selectedReport.id)
                        ESX.ShowNotification("~g~Appel clôturé")
                        RageUI.GoBack()
                    end
                })
            end
        end)

        RageUI.IsVisible(fouiller, function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            local getPlayerSearch = GetPlayerPed(closestPlayer)
            if not IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
                RageUI.GoBack()
                ESX.ShowNotification("[~r~Impossible~h~] La personne en face ne lève pas les mains en l'air")
                return
            end

            if closestPlayer == -1 or closestDistance > 3.0 then
                RageUI.GoBack()
                return
            end
    
            RageUI.Separator("Vous Fouillez : " ..GetPlayerName(closestPlayer))

            RageUI.Separator("↓ ~s~Argent non déclaré ~s~↓")

            for k,v in pairs(ArgentSale) do
                RageUI.Button("Argent non déclaré :", nil, {RightLabel = "~s~"..v.label.."$"}, true , {
                    onSelected = function()
                        local combien = KeyboardInputlsco("Combien ?", 'Indiquez un nombre', '', 10)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                        else
                            TriggerServerEvent('confiscatePlayerItemlsco', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end

            RageUI.Separator("↓ ~s~Items du joueur ~s~↓")

            for k,v in pairs(Items) do
                RageUI.Button("Nom: "..v.label, nil, {RightLabel = "~s~"..v.right.." exemplaires"}, true , {
                    onSelected = function()
                        local combien = KeyboardInputlsco("Combien ", 'Indiquez un nombre', '', 4)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                        else
                            TriggerServerEvent('confiscatePlayerItemlsco', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end
            
            RageUI.Separator("↓ ~s~Armes du joueur ~s~↓")
            for k,v in pairs(Armes) do
                local isPermanent = ESX.IsWeaponPermanent(v.value);
                if (not isPermanent) then
                    RageUI.Button("Arme: "..v.label, nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            local combien = KeyboardInputlsco("Nombre de munitions", 'Indiquez un nombre', '', 4)
                            if tonumber(combien) > 1 then
                                ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                            else
                                TriggerServerEvent('confiscatePlayerItemlsco', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                                RageUI.GoBack()
                            end
                        end
                    })
                end
            end

        end)

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(props) and not RageUI.Visible(propsList) and not RageUI.Visible(infoamende) and not RageUI.Visible(actions) and not RageUI.Visible(interaction) and not RageUI.Visible(anonceslsco) and not RageUI.Visible(interactionveh) and not RageUI.Visible(renfort) and not RageUI.Visible(objets) and not RageUI.Visible(fouiller) and not RageUI.Visible(lesinfosduvehicle) and not RageUI.Visible(chien) and not RageUI.Visible(appelsurgences) and not RageUI.Visible(reportManagement) and not RageUI.Visible(reports) then
            mainMenu = RMenu:DeleteType('mainMenu', true)
            openF6 = false
        end

        if not RageUI.Visible(lesinfosduvehicle) then
            table.remove(infosvehicle, k)
        end

        if not RageUI.Visible(fouiller) then
            table.remove(ArgentSale, k)
            table.remove(Items, k)
            table.remove(Armes, k)
        end


    end
end

--[[function openBureau()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')
    local rc = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local vr = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local pr = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openBureau do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Recruter des employés", nil, {RightLabel = "→"}, true , {
            })
            RageUI.Button("Virer des employés", nil, {RightLabel = "→"}, true , {
            })
            RageUI.Button("Promouvoir des employés", nil, {RightLabel = "→"}, true , {
            })
        end)

        Wait(0)
        if not RageUI.Visible(mainMenu) and not RageUI.Visible(rc) and not RageUI.Visible(vr) and not RageUI.Visible(pr) then
            mainMenu = RMenu:DeleteType('mainMenu', true)
            openBureau = false
        end
    end


end]]

local function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.lsco.Uniforms[job].male)

			if job == 'bullet_wear' then
				TriggerServerEvent("Kevlar:AddForJob", "lsco", "100")
			end
		else
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.lsco.Uniforms[job].female)

			if job == 'bullet_wear' then
				TriggerServerEvent("Kevlar:AddForJob", "lsco", "100")
			end
		end
	end)
end

function openlscoArmurerie()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')
    local armes = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local paiement = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local achatArmes = {}

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    
    while isArmurerieOpened do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Acheter des armes", motif, {RightLabel = "→"}, true , {
            }, armes)
        end)

        RageUI.IsVisible(armes, function()
            if ESX.PlayerData.job.grade_name == 'recruit' then
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 5000,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)

            elseif ESX.PlayerData.job.grade_name == 'officer' then
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 5000,
                        })
                    end
                }, paiement)
            elseif ESX.PlayerData.job.grade_name == 'sergeant' then
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 5000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 10000,
                        })
                    end
                }, paiement)
            elseif ESX.PlayerData.job.grade_name == 'lieutenant' then
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 5000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 10000,
                        })
                    end
                }, paiement)
            elseif ESX.PlayerData.job.grade_name == 'capitaine' then
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 5000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 10000,
                        })
                    end
                }, paiement)
            elseif ESX.PlayerData.job.grade_name == 'commander' then
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 5000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 10000,
                        })
                    end
                }, paiement)
                RageUI.Button("Fusil à Pompe", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Fusil à Pompe",
                            hash = 'weapon_pumpshotgun',
                            prix = 2500,
                        })
                    end
                }, paiement)
            elseif ESX.PlayerData.job.grade_name == 'deputy' then
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 5000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 10000,
                        })
                    end
                }, paiement)
                RageUI.Button("Fusil à Pompe", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Fusil à Pompe",
                            hash = 'weapon_pumpshotgun',
                            prix = 2500,
                        })
                    end
                }, paiement)
            elseif ESX.PlayerData.job.grade_name == 'assistantboss' then
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 5000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 10000,
                        })
                    end
                }, paiement)
                RageUI.Button("Fusil à Pompe", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Fusil à Pompe",
                            hash = 'weapon_pumpshotgun',
                            prix = 2500,
                        })
                    end
                }, paiement)
            elseif ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 5000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 10000,
                        })
                    end
                }, paiement)
                RageUI.Button("Fusil à Pompe", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Fusil à Pompe",
                            hash = 'weapon_pumpshotgun',
                            prix = 2500,
                        })
                    end
                }, paiement)
            end
        end)

        RageUI.IsVisible(paiement, function()
            for k,v in pairs(achatArmes) do
                RageUI.Button("Arme: 1 "..v.label, nil, {RightLabel = ""}, true , {
                })
                RageUI.Button("Récupérer votre armement", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('buyWeaponForlsco', v.hash)
                        table.remove(achatArmes, k)
                        RageUI.CloseAll()
                    end
                })
            end
        end)

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(armes) and not RageUI.Visible(paiement) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            table.remove(achatArmes, k)
            isArmurerieOpened = false
        end


        Wait(0)
    end
end

function openlscoGarage()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openedGarage do
        local grade = ESX.PlayerData.job.grade_name
        RageUI.IsVisible(mainMenu, function()
            if grade == 'recruit' then
                RageUI.Button("Moto lsco #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto lsco #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bcpd10", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polalamop2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbuffalop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polfugitivep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp #5", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polscoutp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polstalkerp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "poltorencep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'officer' then
                RageUI.Button("Moto lsco #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto lsco #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bcpd10", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polalamop2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbuffalop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polfugitivep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp #5", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polscoutp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polstalkerp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "poltorencep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "coach2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo3", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo4", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé #5", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "umkalamo", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'sergeant' then
                RageUI.Button("Moto lsco #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto lsco #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bcpd10", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polalamop2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbuffalop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polfugitivep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp #5", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polscoutp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polstalkerp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "poltorencep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "coach2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo3", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo4", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé #8", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "umkalamo", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé #9", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "usssflag", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'lieutenant' then
                RageUI.Button("Moto lsco #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto lsco #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bcpd10", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polalamop2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbuffalop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polfugitivep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp #5", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polscoutp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polstalkerp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "poltorencep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "coach2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo3", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo4", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé #8", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "umkalamo", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé #9", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "usssflag", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'capitaine' then
                RageUI.Button("Moto lsco #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto lsco #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bcpd10", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polalamop2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbuffalop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polfugitivep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp #5", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polscoutp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polstalkerp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "poltorencep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "coach2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo3", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo4", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé #8", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "umkalamo", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé #9", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "usssflag", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'commander' then
                RageUI.Button("Moto lsco #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto lsco #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bcpd10", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polalamop2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbuffalop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polfugitivep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp #5", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polscoutp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polstalkerp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "poltorencep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "coach2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo3", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo4", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé #8", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "umkalamo", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé #9", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "usssflag", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Command Camion #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "command", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Hazard2 Camion #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "hazard2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Polspeedop Camion #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polspeedop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatVanr Camion #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatvanr2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatInsur Blindé #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatinsur", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatStoc Blindé #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatstoc", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'deputy' then
                RageUI.Button("Moto lsco #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto lsco #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bcpd10", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polalamop2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbuffalop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polfugitivep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp #5", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polscoutp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polstalkerp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "poltorencep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "coach2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo3", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo4", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé #8", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "umkalamo", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé #9", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "usssflag", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bufsxtrafpol Camion #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bufsxtrafpol", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Command Camion #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "command", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Hazard2 Camion #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "hazard2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Polspeedop Camion #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polspeedop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatVanr Camion #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatvanr2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatInsur Blindé #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatinsur", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatStoc Blindé #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatstoc", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'assistantboss' then
                RageUI.Button("Moto lsco #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto lsco #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bcpd10", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polalamop2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbuffalop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polfugitivep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp #5", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polscoutp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polstalkerp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "poltorencep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "coach2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Halfback Banalisé #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "halfback2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo3", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo4", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé #8", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "umkalamo", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé #9", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "usssflag", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bufsxtrafpol Camion #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bufsxtrafpol", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Command Camion #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "command", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Hazard2 Camion #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "hazard2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Polspeedop Camion #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polspeedop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatVanr Camion #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatvanr2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatInsur Blindé #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatinsur", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatStoc Blindé #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatstoc", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'boss' then
                RageUI.Button("Moto lsco #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto lsco #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbikeb2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bcpd10", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polalamop2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polbuffalop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polfugitivep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp #5", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polscoutp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polstalkerp", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "poltorencep", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "coach2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Halfback Banalisé #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "halfback2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé #6", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo3", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé #7", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "trualamo4", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé #8", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "umkalamo", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé #9", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "usssflag", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bufsxtrafpol Camion #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "bufsxtrafpol", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Command Camion #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "command", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Hazard2 Camion #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "hazard2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Polspeedop Camion #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "polspeedop", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatVanr Camion #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatvanr2", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatInsur Blindé #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatinsur", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatStoc Blindé #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('lsco:spawnVehicle', "swatstoc", vector3(-456.698944, 5987.020508, 31.29), 46.74);
                        RageUI.CloseAll()
                    end
                })
            end
        end)

        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openedGarage = false
        end

        Wait(0)
    end
end

TS = true
Vetement2 = {

    Clothes = {},

    TshirtList = {},
    TshirtList2 = {},
    TorsoList = {},
    TorsoList2 = {},
    ArmsList = {},
    ArmsList2 = {},
    DecalsList = {},
    GiletList = {},
    GiletList2 = {},

    PantalonList = {},
    PantalonList2 = {},
    ChaussuresList = {},
    ChaussuresList2 = {},

    IndexGardeRobe = 1,
    TshirtIndex = 1,
    TshirtIndex2 = 1,
    TorsoIndex = 1,
    TorsoIndex2 = 1,
    ArmsIndex = 1,
    ArmsIndex2 = 1,
    DecalsIndex = 1,
    DecalsIndex2 = 1,
    GiletIndex = 1,
    GiletIndex2 = 1,

    PantalonIndex = 1,
    PantalonIndex2 = 1,
    ChaussuresIndex = 1,
    ChaussuresIndex2 = 1,

    Masque = {},
	Masque2 = {},
	Lunettes = {},
	Lunettes2 = {},
	Chapeau = {},
	Chapeau2 = {},
	Sac = {},
	Sac2 = {},
	Chaine = {},
	Chaine2 = {},
	Oreille = {},
	Oreille2 = {},
	MasqueIndex = 1,
	MasqueIndex2 = 1,
	LunetteIndex = 1,
	LunetteIndex2 = 1,
	ChapeauIndex = 1,
	ChapeauIndex2 = 1,
	SacIndex = 1,
	SacIndex2 = 1,
	ChaineIndex = 1,
	ChaineIndex2 = 1,
	OreilleIndex = 1,
	OreilleIndex2 = 1
}

Citizen.CreateThread(function()
	Wait(5000)
    for i = 0, 400 do
        table.insert(Vetement2.Masque, i)
    end
	for i = 0, 100 do
        table.insert(Vetement2.Lunettes, i)
    end
	for i = 0, 	300 do
        table.insert(Vetement2.Chapeau, i)
    end
	for i = 0, 200 do
        table.insert(Vetement2.Sac, i)
    end
	for i = 0, 400 do
        table.insert(Vetement2.Chaine, i)
    end
	for i = 0, 100 do
        table.insert(Vetement2.Oreille, i)
    end	
    Vetement2.DecalsList = {}
    for i = 0, 200 do
        table.insert(Vetement2.DecalsList, i)
    end
end)

function openlscoCloathroom()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')
    local vetements = RageUI.CreateSubMenu(mainMenu, "", "Voici les vêtements disponibles")
    local garderobe = RageUI.CreateSubMenu(mainMenu, "", "Voici toutes vos tenues")
    local tshirt = RageUI.CreateSubMenu(vetements, "", "Voici les T-Shirt disponibles")
    local tshirt2 = RageUI.CreateSubMenu(vetements, "", "Voici les variations de T-Shirt disponibles")
    local torse = RageUI.CreateSubMenu(vetements, "", "Voici les torses disponibles")
    local torse2 = RageUI.CreateSubMenu(vetements, "", "Voici les variations de torses disponibles")
    local bras = RageUI.CreateSubMenu(vetements, "", "Voici les bras disponibles")
    local calque = RageUI.CreateSubMenu(vetements, "", "Voici les calques disponibles")
    local calque2 = RageUI.CreateSubMenu(vetements, "", "Voici les calques disponibles")
    local bproof = RageUI.CreateSubMenu(vetements, "", "Voici les calques disponibles")
    local bproof2 = RageUI.CreateSubMenu(vetements, "", "Voici les calques disponibles")
    local pantalon = RageUI.CreateSubMenu(vetements, "", "Voici les pantalons disponibles")
    local pantalon2 = RageUI.CreateSubMenu(vetements, "", "Voici les variations des pantalons disponibles")
    local chaussures = RageUI.CreateSubMenu(vetements, "", "Voici les chaussures disponibles")
    local chaussures2 = RageUI.CreateSubMenu(vetements, "", "Voici les variations des chaussures disponibles")

    local mask = RageUI.CreateSubMenu(vetements, "", "Voici tout les masques disponibles")
	local lunette = RageUI.CreateSubMenu(vetements, "", "Voici tout les paires de lunettes disponibles")
	local chapeau = RageUI.CreateSubMenu(vetements, "", "Voici tout les chapeaux disponibles")
	local sac = RageUI.CreateSubMenu(vetements, "", "Voici tout les sacs disponibles")
	local chaine = RageUI.CreateSubMenu(vetements, "", "Voici toutes les chaines disponibles")
	local oreille = RageUI.CreateSubMenu(vetements, "", "Voici toutes les accésoires d'oreille disponibles")

	local variationsmasque = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations de masque disponibles")
	local variationslunette = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations de lunettes disponibles")
	local variationschapeau = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations de chapeau disponibles")
	local variationssac = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations de sacs disponibles")
	local variationschaine = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations de chaine disponibles")
	local variationsoreille = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations d'oreille disponibles")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    local NoTenueDispo = false

    while openClothes do
        local playerPed = PlayerPedId()
        local grade = ESX.PlayerData.job.grade_name
        RageUI.IsVisible(mainMenu, function()
            if grade == 'recruit' then
                 RageUI.Checkbox("Prendre son service", nil, isInService, {}, {
                     onChecked = function(index, items)
                         isInService = true
                         TriggerServerEvent('annonce:servicelsco', 'prise')
                     end,
                     onUnChecked = function(index, items)
                         isInService = false
                         TriggerServerEvent('annonce:servicelsco', 'fin')
                     end
                 })
                RageUI.Button("Vêtements", nil, {RightLabel = "→"}, true , {}, vetements)
                RageUI.Button("Enfiler sa tenue", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        local name = KeyboardInputlsco("Indiquer le nom de la tenue", "Indiquer le nom de la tenue", "", 10)
                        if name then 
                            local TempoSkin = {}
                            local ListVet = {
                                ["tshirt_1"] = true,
                                ["tshirt_2"] = true,
                                ["torso_1"] = true,
                                ["torso_2"] = true,
                                ["arms"] = true,
                                ["arms_2"] = true,
                                ["decals_1"] = true,
                                ["decals_2"] = true,
                                ["pants_1"] = true,
                                ["pants_2"] = true,
                                ["shoes_1"] = true,
                                ["shoes_2"] = true,
                                ["bproof_1"] = true,
                                ["bproof_2"] = true,
                                ["mask_1"] = true,
                                ["mask_2"] = true,
                                ["glasses_1"] = true,
                                ["glasses_2"] = true,
                                ["helmet_1"] = true,
                                ["helmet_1"] = true,
                                ["bags_1"] = true,
                                ["bags_2"] = true,
                                ["chain_1"] = true,
                                ["chain_2"] = true,
                                ["ears_1"] = true,
                                ["ears_2"] = true,
                            }
                            TriggerEvent("skinchanger:getSkin", function(skin)
                                TriggerServerEvent("esx_skin:save", skin)
                                for k,v in pairs(skin) do 
                                    if ListVet[k] ~= nil then
                                        TempoSkin[k] = v
                                    end
                                end
                                TriggerServerEvent("johnny:addtenue", name, TempoSkin)
                            end)
                        end
                    end
                })
           
                RageUI.Button("Garde Robe", nil, {RightLabel = "→"}, true, {}, garderobe)

                RageUI.Separator("↓ ------------ ↓")

                RageUI.Button("Enfiler sa tenue", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if grade == 'recruit' then
                            setUniform('recruit_wear', playerPed)
                            isInService = true
                        elseif grade == 'officer' then
                            setUniform('officer_wear', playerPed)
                            isInService = true
                        elseif grade == 'sergeant' then
                            setUniform('sergeant_wear', playerPed)
                            isInService = true
                        elseif grade == 'lieutenant' then
                            setUniform('lieutenant_wear', playerPed)
                            isInService = true
                        elseif grade == 'capitaine' then
                            setUniform('capitaine_wear', playerPed)
                            isInService = true
                        elseif grade == 'commander' then
                            setUniform('commander_wear', playerPed)
                            isInService = true
                        elseif grade == 'deputy' then
                            setUniform('deputy_wear', playerPed)
                            isInService = true
                        elseif grade == 'assistantboss' then
                            setUniform('sassistantboss_wear', playerPed)
                            isInService = true
                        elseif grade == 'boss' then
                            setUniform('boss_wear', playerPed)
                            isInService = true
                        end
                        TriggerServerEvent('annonce:servicelsco', 'prise')
                    end
                })
                RageUI.Button("Reprendre ses vêtements", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end)
                        isInService = false
                        TriggerServerEvent('annonce:servicelsco', 'fin')
                    end
                })
            else
                RageUI.Checkbox("Prendre son service", nil, isInService, {}, {
                    onChecked = function(index, items)
                        isInService = true
                        TriggerServerEvent('annonce:servicelsco', 'prise')
                    end,
                    onUnChecked = function(index, items)
                        isInService = false
                        TriggerServerEvent('annonce:servicelsco', 'fin')
                    end
                })
                RageUI.Button("Vêtements", nil, {RightLabel = "→"}, true , {}, vetements)
                RageUI.Button("Valider la tenue sans l'enregister", nil, {RightLabel = "→"}, true, {
                    onSelected = function()  
                        TriggerEvent("skinchanger:getSkin", function(skin)
                            TriggerServerEvent("esx_skin:save", skin)
                        end)
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Valider la tenue et l'enregister", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        local name = KeyboardInputlsco("Indiquer le nom de la tenue", "Indiquer le nom de la tenue", "", 10)
                        if name then 
                            local TempoSkin = {}
                            local ListVet = {
                                ["tshirt_1"] = true,
                                ["tshirt_2"] = true,
                                ["torso_1"] = true,
                                ["torso_2"] = true,
                                ["arms"] = true,
                                ["arms_2"] = true,
                                ["decals_1"] = true,
                                ["decals_2"] = true,
                                ["pants_1"] = true,
                                ["pants_2"] = true,
                                ["shoes_1"] = true,
                                ["shoes_2"] = true,
                                ["bproof_1"] = true,
                                ["bproof_2"] = true,
                                ["mask_1"] = true,
                                ["mask_2"] = true,
                                ["glasses_1"] = true,
                                ["glasses_2"] = true,
                                ["helmet_1"] = true,
                                ["helmet_1"] = true,
                                ["bags_1"] = true,
                                ["bags_2"] = true,
                                ["chain_1"] = true,
                                ["chain_2"] = true,
                                ["ears_1"] = true,
                                ["ears_2"] = true,
                            }
                            TriggerEvent("skinchanger:getSkin", function(skin)
                                TriggerServerEvent("esx_skin:save", skin)
                                for k,v in pairs(skin) do 
                                    if ListVet[k] ~= nil then
                                        TempoSkin[k] = v
                                    end
                                end
                                TriggerServerEvent("johnny:addtenue", name, TempoSkin)
                            end)
                        end
                    end
                })
            
                RageUI.Button("Garde Robe", "Accéder à la garde robe", {RightLabel = "→"}, true, {}, garderobe)

                RageUI.Separator("↓ ------------ ~s~ ↓")


                RageUI.Button("Enfiler sa tenue", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if grade == 'recruit' then
                            setUniform('recruit_wear', playerPed)
                            isInService = true
                        elseif grade == 'officer' then
                            setUniform('officer_wear', playerPed)
                            isInService = true
                        elseif grade == 'sergeant' then
                            setUniform('sergeant_wear', playerPed)
                            isInService = true
                        elseif grade == 'lieutenant' then
                            setUniform('lieutenant_wear', playerPed)
                            isInService = true
                        elseif grade == 'capitaine' then
                            setUniform('capitaine_wear', playerPed)
                            isInService = true
                        elseif grade == 'commander' then
                            setUniform('commander_wear', playerPed)
                            isInService = true
                        elseif grade == 'deputy' then
                            setUniform('deputy_wear', playerPed)
                            isInService = true
                        elseif grade == 'assistantboss' then
                            setUniform('sassistantboss_wear', playerPed)
                            isInService = true
                        elseif grade == 'boss' then
                            setUniform('boss_wear', playerPed)
                            isInService = true
                        end
                        TriggerServerEvent('annonce:servicelsco', 'prise')
                    end
                })
                RageUI.Button("Reprendre ses vêtements", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end)
                        isInService = false
                        TriggerServerEvent('annonce:servicelsco', 'fin')
                    end
                })
            end
        end)
        RageUI.IsVisible(vetements, function()

            RageUI.Button("T-Shirt", nil, {RightLabel = "→"}, true, {}, tshirt)

            RageUI.Button("Variations T-Shirt", nil, {RightLabel = "→"}, true, {}, tshirt2)

            RageUI.Button("Torses", nil, {RightLabel = "→"}, true, {}, torse)

            RageUI.Button("Variations Torses", nil, {RightLabel = "→"}, true, {}, torse2)

            RageUI.Button("Gilet Pare-Balle", nil, {RightLabel = "→"}, true, {}, bproof)

            RageUI.Button("Variations Gilet Pare-Balle", nil, {RightLabel = "→"}, true, {}, bproof2)

            RageUI.Button("Bras", nil, {RightLabel = "→"}, true, {}, bras)

            RageUI.Button("Calques", nil, {RightLabel = "→"}, true, {}, calque)

            RageUI.Button("Variations Calques", nil, {RightLabel = "→"}, true, {}, calque2)

            RageUI.Button("Pantalon", nil, {RightLabel = "→"}, true, {}, pantalon)

            RageUI.Button("Variations Pantalon", nil, {RightLabel = "→"}, true, {}, pantalon2)

            RageUI.Button("Chaussures", nil, {RightLabel = "→"}, true, {}, chaussures)

            RageUI.Button("Variations Chaussures", nil, {RightLabel = "→"}, true, {}, chaussures2)

            RageUI.Button("Masques",  nil, {RightLabel = "→"}, true, {}, mask)

            RageUI.Button("Variation Masques",  nil, {RightLabel = "→"}, true, {}, variationsmasque)

			RageUI.Button("Lunettes",  nil, {RightLabel = "→"}, true, {}, lunette)
            
            RageUI.Button("Variation Lunettes",  nil, {RightLabel = "→"}, true, {}, variationslunette)

			RageUI.Button("Chapeaux",  nil, {RightLabel = "→"}, true, {}, chapeau)

            RageUI.Button("Variation Chapeaux",  nil, {RightLabel = "→"}, true, {}, variationschapeau)

			RageUI.Button("Sac",  nil, {RightLabel = "→"}, true, {
				onSelected = function()
					SetEntityHeading(PlayerPedId() , 155.0)
				end
			}, sac)

            RageUI.Button("Vaiation Sac",  nil, {RightLabel = "→"}, true, {}, variationssac)

			RageUI.Button("Chaînes",  nil, {RightLabel = "→"}, true, {}, chaine)

            RageUI.Button("Variation Chaînes",  nil, {RightLabel = "→"}, true, {}, variationschaine)

			RageUI.Button("Boucle d'oreille",  nil, {RightLabel = "→"}, true, {
				onSelected = function()
					SetEntityHeading(PlayerPedId() , 70.0)
				end
			}, oreille)

            RageUI.Button("Variation Boucle d'oreille",  nil, {RightLabel = "→"}, true, {}, variationsoreille)

        end, function()
        end)

        RageUI.IsVisible(garderobe, function()

            if ClothesPlayer ~= nil then 
                for k, v in pairs(ClothesPlayer) do 
                    if v.equip == "n" and v.type == "vetement" then 
                        NoTenueDispo = true
                        RageUI.List("Tenue "..v.label, {"Equiper", "Renomer", "Supprimer"}, Vetement2.IndexGardeRobe, nil, {}, true, {
                            onListChange = function(Index)
                                Vetement2.IndexGardeRobe = Index
                            end,
                            onSelected = function(Index)
                                if Index == 1 then 
                                    CreateThread(function()
                                        TriggerEvent('skinchanger:getSkin', function(skin)
                                            TriggerEvent('skinchanger:loadClothes', skin, json.decode(v.skin))
                                            Wait(50)
                                            TriggerEvent('skinchanger:getSkin', function(skin)
                                                TriggerServerEvent('esx_skin:save', skin)
                                            end)
                                        end)
                                    end)
                                    ESX.ShowNotification("Vous avez enfilé la tenue : "..v.label)
                                elseif Index == 2 then
                                    local newname = KeyboardInputlsco("Nouveau nom","Nouveau nom", "", 15)
                                    if newname then 
                                        TriggerServerEvent("johnny:RenameTenue", v.id, newname)
                                    end
                                elseif Index == 3 then 
                                    TriggerServerEvent('johnny:deletetenue', v.id)
                                end
                            end
                        })
                    else
                        NoTenueDispo = false
                    end
                end
                if not NoTenueDispo then 
                    RageUI.Separator("~s~Aucune tenue disponible")
                end
            else
                RageUI.Separator("[~r~Impossible~h~] Vous n'avez pas de tenue")
            end
        end)  
        
        RageUI.IsVisible(tshirt, function()
            RageUI.Button("T-Shirt 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.TshirtList2 = {}
                    TriggerEvent('skinchanger:change', 'tshirt_1', 0)
                    TriggerEvent('skinchanger:change', 'tshirt_2', 0)
                    Vetement2.TshirtIndex = 0
                    for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 8, 0) -2 do
                        table.insert(Vetement2.TshirtList2, i)
                    end
                end
            })
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) - 1, 1 do
                RageUI.Button("T-Shirt "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.TshirtList2 = {}
                        Vetement2.TshirtIndex = i
                        TriggerEvent('skinchanger:change', 'tshirt_1', i)
                        TriggerEvent('skinchanger:change', 'tshirt_2', 0)
                        for n = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 8, i) -2 do
                            table.insert(Vetement2.TshirtList2, n)
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(tshirt2, function()
            RageUI.Button("Variation T-Shirt 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.TshirtIndex2 = 0
                    TriggerEvent('skinchanger:change', 'tshirt_2', 0)
                end
            })
            for k, v in pairs(Vetement2.TshirtList2) do
                RageUI.Button("Variation T-Shirt "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.TshirtIndex2 = k
                        TriggerEvent('skinchanger:change', 'tshirt_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(torse, function()
            RageUI.Button("Torse 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.TorsoList2 = {}
                    Vetement2.TorsoIndex = 0
                    TriggerEvent('skinchanger:change', 'torso_1', 0)
                    TriggerEvent('skinchanger:change', 'torso_2', 0)
                    for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 11, 0) -2 do
                        table.insert(Vetement2.TorsoList2, i)
                    end
                end
            })
            -- Torses
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) - 1, 1 do
                RageUI.Button("Torse "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.TorsoList2 = {}
                        Vetement2.TorsoIndex = i
                        TriggerEvent('skinchanger:change', 'torso_2', 0)
                        TriggerEvent('skinchanger:change', 'torso_1', i)
                        for n = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 11, i) -2 do
                            table.insert(Vetement2.TorsoList2, i)
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(torse2, function()
            RageUI.Button("Variations Torse 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.TorsoIndex2 = 0
                    TriggerEvent('skinchanger:change', 'torso_2', 0)
                end
            })
            for k, v in pairs(Vetement2.TorsoList2) do
                RageUI.Button("Variations Torse "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.TorsoIndex2 = k
                        TriggerEvent('skinchanger:change', 'torso_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(bras, function()
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) - 1, 1 do
                RageUI.Button("Bras "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.ArmsIndex = i
                        TriggerEvent('skinchanger:change', 'arms', i)
                    end
                })
            end
        end)

        RageUI.IsVisible(calque, function()
            RageUI.Button("Calques 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.DecalsIndex = 0
                    TriggerEvent('skinchanger:change', 'decals_1', 0)
                end
            })
            for k, v in pairs(Vetement2.DecalsList) do
                RageUI.Button("Calques "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.DecalsIndex = k
                        TriggerEvent('skinchanger:change', 'decals_1', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(calque2, function()
            RageUI.Button("Variations Calques 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.DecalsIndex2 = 0
                    TriggerEvent('skinchanger:change', 'decals_2', 0)
                end
            })
            for k, v in pairs(Vetement2.DecalsList) do
                RageUI.Button("Variations Calques "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.DecalsIndex2 = k
                        TriggerEvent('skinchanger:change', 'decals_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(bproof, function()
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) - 1, 1 do
                RageUI.Button("Gilet Pare-Balle "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        TriggerEvent('skinchanger:change', 'bproof_1', i)
                        TriggerEvent('skinchanger:change', 'bproof_2', 0)
                        Vetement2.GiletList2 = {}
                        Vetement2.GiletIndex = i
                        for n = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 4, i) -2 do
                            table.insert(Vetement2.GiletList2, n)
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(bproof2, function()
            RageUI.Button("Variation Gilet Pare-Balle 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.GiletIndex2 = 0
                    TriggerEvent('skinchanger:change', 'bproof_2', 0)
                end
            })
            for k, v in pairs(Vetement2.GiletList2) do 
                RageUI.Button("Variation Gilet Pare-Balle "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.GiletIndex2 = k
                        TriggerEvent('skinchanger:change', 'bproof_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(pantalon, function()
            RageUI.Button("Pantalon 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    TriggerEvent('skinchanger:change', 'pants_1', 0)
                    TriggerEvent('skinchanger:change', 'pants_2', 0)
                    Vetement2.PantalonList2 = {}
                    Vetement2.PantalonIndex = 0
                    for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 4, 0) -2 do
                        table.insert(Vetement2.PantalonList2, i)
                    end
                end
            })
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) - 1, 1 do
                RageUI.Button("Pantalon "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        TriggerEvent('skinchanger:change', 'pants_1', i)
                        TriggerEvent('skinchanger:change', 'pants_2', 0)
                        Vetement2.PantalonList2 = {}
                        Vetement2.PantalonIndex = i
                        for n = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 4, i) -2 do
                            table.insert(Vetement2.PantalonList2, n)
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(pantalon2, function()
            RageUI.Button("Variation Pantalon 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.PantalonIndex2 = 0
                    TriggerEvent('skinchanger:change', 'pants_2', 0)
                end
            })
            for k, v in pairs(Vetement2.PantalonList2) do 
                RageUI.Button("Variation Pantalon "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.PantalonIndex2 = k
                        TriggerEvent('skinchanger:change', 'pants_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(chaussures, function()
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) - 1, 1 do
                RageUI.Button("Chaussure "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.ChaussuresIndex = i
                        TriggerEvent('skinchanger:change', 'shoes_1', i)
                        TriggerEvent('skinchanger:change', 'shoes_2', 0)
                        Vetement2.ChaussuresList2 = {}
                        for n = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 6, i) -2 do
                            table.insert(Vetement2.ChaussuresList2, n)
                        end                    
                    end
                })
            end
        end)

        RageUI.IsVisible(chaussures2, function()
            RageUI.Button("Variation Chaussure 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.ChaussuresIndex2 = 0
                    TriggerEvent('skinchanger:change', 'shoes_2', 0)
                end
            })
            for k, v in pairs(Vetement2.ChaussuresList2) do 
                RageUI.Button("Variation Chaussure "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.ChaussuresIndex2 = k
                        TriggerEvent('skinchanger:change', 'shoes_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(mask, function()
			RageUI.Button("Aucun Masque ", nil, {}, true, {
				onActive = function()
					Vetement2.MasqueIndex = 0
					TriggerEvent('skinchanger:change', 'mask_1', 0)
					TriggerEvent('skinchanger:change', 'mask_2', 0)
					Vetement2.Masque2 = {}
					for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 1, 0)-2 do
						table.insert(Vetement2.Masque2, i)
					end
				end,
				onSelected = function()
					RageUI.Visible(mask, false)
					RageUI.Visible(lunette, true)
				end
			})

			for k, v in pairs(Vetement2.Masque) do 
				RageUI.Button("Masque "..k, nil, {}, true, {
					onActive = function()
						Vetement2.MasqueIndex = k
						TriggerEvent('skinchanger:change', 'mask_1', k)
						TriggerEvent('skinchanger:change', 'mask_2', 0)
						Vetement2.Masque2 = {}
						for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 1, k)-2 do
							table.insert(Vetement2.Masque2, i)
						end

					end,
				})
			end
		end)

		RageUI.IsVisible(variationsmasque, function()

			RageUI.Button("Variation Masque 0", nil, {}, true, {
				onActive = function()
					Vetement2.MasqueIndex2 = 0
					TriggerEvent('skinchanger:change', 'mask_2', 0)
				end,
			})
			for k, v in pairs(Vetement2.Masque2) do 
				RageUI.Button("Variation Masque "..k, nil, {}, true, {
					onActive = function()
						Vetement2.MasqueIndex2 = k
						TriggerEvent('skinchanger:change', 'mask_2', k)
					end,
				})
			end

		end)

		-- Lunettes
		RageUI.IsVisible(lunette, function()

			RageUI.Button("Aucune Lunette ", nil, {}, true, {
				onActive = function()
					Vetement2.LunetteIndex = 0
					TriggerEvent('skinchanger:change', 'glasses_1', 0)
					TriggerEvent('skinchanger:change', 'glasses_2', 0)
					Vetement2.Lunettes2 = {}
					for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 1, 0)-2 do
						table.insert(Vetement2.Lunettes2, i)
					end
				end,
			})
			for k, v in pairs(Vetement2.Lunettes) do 
				RageUI.Button("Lunette "..k, nil, {}, true, {
					onActive = function()
						Vetement2.LunetteIndex = k
						TriggerEvent('skinchanger:change', 'glasses_1', k)
						TriggerEvent('skinchanger:change', 'glasses_2', 0)
						Vetement2.Lunettes2 = {}
						for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 1, k)-2 do
							table.insert(Vetement2.Lunettes2, i)
						end

					end,
				})
			end

		end)

		RageUI.IsVisible(variationslunette, function()
		
			RageUI.Button("Variation Lunette 0", nil, {}, true, {
				onActive = function()
					Vetement2.LunetteIndex2 = 0
					TriggerEvent('skinchanger:change', 'glasses_2', 0)
				end,
			})
			for k, v in pairs(Vetement2.Lunettes2) do 
				RageUI.Button("Variation Masque "..k, nil, {}, true, {
					onActive = function()
						Vetement2.LunetteIndex2 = k
						TriggerEvent('skinchanger:change', 'glasses_2', k)
					end,
				})
			end

		end)

		-- Chapeau 
		RageUI.IsVisible(chapeau, function()

			RageUI.Button("Aucun Chapeau ", nil, {}, true, {
				onActive = function()
					Vetement2.ChapeauIndex = 0
					TriggerEvent('skinchanger:change', 'helmet_1', 0)
					TriggerEvent('skinchanger:change', 'helmet_2', 0)
					Vetement2.Chapeau2 = {}
					for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, 0)- 1 do
						table.insert(Vetement2.Chapeau2, i)
					end
				end,
			})
			for k, v in pairs(Vetement2.Chapeau) do 
				RageUI.Button("Chapeau "..k, nil, {}, true, {
					onActive = function()
						Vetement2.ChapeauIndex = k
						TriggerEvent('skinchanger:change', 'helmet_1', k)
						TriggerEvent('skinchanger:change', 'helmet_2', 0)
						Vetement2.Chapeau2 = {}
						for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, k) - 1 do
							table.insert(Vetement2.Chapeau2, i)
						end

					end,
				})
			end
		end)

		RageUI.IsVisible(variationschapeau, function()

			RageUI.Button("Variation Chapeau 0", nil, {}, true, {
				onActive = function()
					Vetement2.ChapeauIndex2 = 0
					TriggerEvent('skinchanger:change', 'helmet_2', 0)
				end,
			})
			for k, v in pairs(Vetement2.Chapeau2) do 
				RageUI.Button("Variation Chapeau "..k, nil, {}, true, {
					onActive = function()
						Vetement2.ChapeauIndex2 = k
						TriggerEvent('skinchanger:change', 'helmet_2', k)
					end,
				})
			end
		end)

		-- Sac
		RageUI.IsVisible(sac, function()
			RageUI.Button("Aucun Sac ", nil, {}, true, {
				onActive = function()
					Vetement2.SacIndex = 0
					TriggerEvent('skinchanger:change', 'bags_1', 0)
					TriggerEvent('skinchanger:change', 'bags_2', 0)
					Vetement2.Sac2 = {}
					for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 5, 0) -1 do
						table.insert(Vetement2.Sac2, i)
					end
				end,
			})
			for k, v in pairs(Vetement2.Sac) do 
				RageUI.Button("Sac "..k, nil, {}, true, {
					onActive = function()
						Vetement2.SacIndex = k
						TriggerEvent('skinchanger:change', 'bags_1', k)
						TriggerEvent('skinchanger:change', 'bags_2', 0)
						Vetement2.Sac2 = {}
						for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 5, k) - 2 do
							table.insert(Vetement2.Sac2, i)
						end

					end,
				})
			end
		
		end)

		RageUI.IsVisible(variationssac, function()
		
			RageUI.Button("Variation Sac 0", nil, {}, true, {
				onActive = function()
					Vetement2.SacIndex2 = 0
					TriggerEvent('skinchanger:change', 'bags_2', 0)
				end,
				onSelected = function()
					RageUI.Visible(variationssac, false)
					RageUI.Visible(paidsac, true)
				end
			})
			for k, v in pairs(Vetement2.Sac2) do 
				RageUI.Button("Variation Sac "..k, nil, {}, true, {
					onActive = function()
						Vetement2.SacIndex2 = k
						TriggerEvent('skinchanger:change', 'bags_2', k)
					end,
				})
			end
		end)

		-- Chaîne 
		RageUI.IsVisible(chaine, function()
			RageUI.Button("Aucune Chaine ", nil, {}, true, {
				onActive = function()
					Vetement2.ChaineIndex = 0
					TriggerEvent('skinchanger:change', 'chain_1', 0)
					TriggerEvent('skinchanger:change', 'chain_2', 0)
					Vetement2.Chaine2 = {}
					for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), 7, 0)-2 do
						table.insert(Vetement2.Chaine2, i)
					end
				end,
			})
			for k, v in pairs(Vetement2.Chaine) do 
				RageUI.Button("Chaine "..k, nil, {}, true, {
					onActive = function()
						Vetement2.ChaineIndex = k
						TriggerEvent('skinchanger:change', 'chain_1', k)
						TriggerEvent('skinchanger:change', 'chain_2', 0)
						Vetement2.Chaine2 = {}
						for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 7, k)-2 do
							table.insert(Vetement2.Chaine2, i)
						end

					end,
				})
			end
		
		end)

		RageUI.IsVisible(variationschaine, function()

			RageUI.Button("Variation Chaine 0", nil, {}, true, {
				onActive = function()
					Vetement2.ChaineIndex2 = 0
					TriggerEvent('skinchanger:change', 'chain_2', 0)
				end,
				onSelected = function()
					RageUI.Visible(variationschaine, false)
					RageUI.Visible(paidchaine, true)
				end
			})
			for k, v in pairs(Vetement2.Chaine2) do 
				RageUI.Button("Variation Chaine "..k, nil, {}, true, {
					onActive = function()
						Vetement2.ChaineIndex2 = k
						TriggerEvent('skinchanger:change', 'chain_2', k)
					end,
				})
			end
		
		end)
		
		-- Accesoires d'oreille
		RageUI.IsVisible(oreille, function()
			RageUI.Button("Aucune Accesoire d'oreille ", nil, {}, true, {
				onActive = function()
					Vetement2.OreilleIndex = 0
					TriggerEvent('skinchanger:change', 'ears_1', 0)
					TriggerEvent('skinchanger:change', 'ears_2', 0)
					Vetement2.Oreille2 = {}
					for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), 2, 0) -2 do
						table.insert(Vetement2.Oreille2, i)
					end
				end,
			})
			for k, v in pairs(Vetement2.Oreille) do 
				RageUI.Button("Accesoire d'oreille "..k, nil, {}, true, {
					onActive = function()
						Vetement2.OreilleIndex = k
						TriggerEvent('skinchanger:change', 'ears_1', k)
						TriggerEvent('skinchanger:change', 'ears_2', 0)
						Vetement2.Oreille2 = {}
						for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), 2, k)-2 do
							table.insert(Vetement2.Oreille2, i)
						end
					end,
				})
			end
		end)

		RageUI.IsVisible(variationsoreille, function()

			RageUI.Button("Variation Accesoire d'oreille 0", nil, {}, true, {
				onActive = function()
					Vetement2.OreilleIndex2 = 0
					TriggerEvent('skinchanger:change', 'ears_2', 0)
				end,
			})
			for k, v in pairs(Vetement2.Oreille2) do 
				RageUI.Button("Variation Chaine "..k, nil, {}, true, {
					onActive = function()
						Vetement2.OreilleIndex2 = k
						TriggerEvent('skinchanger:change', 'ears_2', k)
					end,
				})
			end
		
		end)

        if not RageUI.Visible(mainMenu) and
            not RageUI.Visible(garderobe) and
            not RageUI.Visible(tshirt) and 
            not RageUI.Visible(tshirt2) and 
            not RageUI.Visible(torse) and 
            not RageUI.Visible(torse2) and 
            not RageUI.Visible(bras) and 
            not RageUI.Visible(calque) and 
            not RageUI.Visible(calque2) and

            not RageUI.Visible(bproof) and 
            not RageUI.Visible(bproof2) and 

            not RageUI.Visible(pantalon) and 
            not RageUI.Visible(pantalon2) and 
            not RageUI.Visible(chaussures) and 
            not RageUI.Visible(chaussures2) and 

            not RageUI.Visible(mask) and 
		    not RageUI.Visible(lunette) and
            not RageUI.Visible(chapeau) and 
            not RageUI.Visible(sac) and 
            not RageUI.Visible(chaine) and 
            not RageUI.Visible(oreille) and 

            not RageUI.Visible(variationsmasque) and 
            not RageUI.Visible(variationslunette) and 
            not RageUI.Visible(variationschapeau) and 
            not RageUI.Visible(variationssac) and 
            not RageUI.Visible(variationschaine) and 
            not RageUI.Visible(variationsoreille) and 

            not RageUI.Visible(vetements) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openClothes = false
        end
        Wait(0)
    end
end

Citizen.CreateThread(function()
    Wait(3000)
    TriggerServerEvent("RecieveVetement")
end)

RegisterNetEvent("johnny:recieveclientsidevetement", function(Info)
    ClothesPlayer = Info
end)


RegisterNetEvent('putInVehicle')
AddEventHandler('putInVehicle', function()
    local playerPed = PlayerPedId()
    local vehicle = GetClosestVehicle(GetEntityCoords(playerPed), 5.0, 0, 71)
    if vehicle ~= 0 then
        local seats = GetVehicleMaxNumberOfPassengers(vehicle)
        for i = 0, seats do
            if IsVehicleSeatFree(vehicle, i) then
                TaskWarpPedIntoVehicle(playerPed, vehicle, i)
                break
            end
        end
    end
end)

RegisterNetEvent('outofVehicle') 
AddEventHandler('outofVehicle', function()
    local playerPed = PlayerPedId()
    if IsPedSittingInAnyVehicle(playerPed) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        TaskLeaveVehicle(playerPed, vehicle, 16)
    end
end)

RegisterNetEvent('addTransactions')
AddEventHandler('addTransactions', function(source)
    for k,v in pairs(tableachat) do
        table.remove(achatArmes, k)
    end
end)


Citizen.CreateThread(function()
    while ESX.GetPlayerData().job == nil do
        Wait(10)
    end
    while true do
        local interval = 100
        --for k,v in pairs(Config.Jobs.lsco.Bureau) do
          --  local coords = GetEntityCoords(PlayerPedId(), false)
            --local dist = Vdist(coords.x, coords.y, coords.z, v.Bureau)
           -- if #(coords - v.Bureau) <= 10 then
              --  DrawMarker(Config.Get.Marker.Type, v.Bureau, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                --if #(coords - v.Bureau) <= 3 then
                   -- if ESX.PlayerData.job.name == 'lsco' and ESX.PlayerData.job.grade_name == 'boss' then
                      --  interval = 0
                     --   if IsControlJustPressed(0, 51) then
                       --     openBureau = true
                       --     openBureau()
                       -- end
                      --  ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~  pour intéragir")
                        --DrawMarker(Config.Get.Marker.Type, v.Bureau, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                  --  end
               -- end
              --  interval = 1
           -- end
        --end
        for k,v in pairs(Config.Jobs.lsco.RangerVehicule) do
            local coords = GetEntityCoords(PlayerPedId())
            if #(coords - v.pos) <= 10 then
                interval = 1
                DrawMarker(Config.Get.Marker.Type, v.pos, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                if #(coords - v.pos) <= 3 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                    if IsControlJustPressed(0, 51) then
                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                        ESX.Game.DeleteVehicle(vehicle)
                    end
                end
            end
        end
        for k,v in pairs(Config.Jobs.lsco.Zones3) do
            local coords = GetEntityCoords(PlayerPedId(), false)
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'lsco' then
                if #(coords - v.Armurerie3) <= 10 then
                    if isInService then
                        interval = 1
                        DrawMarker(Config.Get.Marker.Type, v.Armurerie3, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                        if #(coords - v.Armurerie3) <= 3 then
                            if IsControlJustPressed(0, 51) then
                                isArmurerieOpened = true
                                openlscoArmurerie()
                            end
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder à l'armurerie")
                        end
                    end
                    if #(coords - v.Vestiaire3) <= 10 then
                        interval = 1
                        DrawMarker(Config.Get.Marker.Type, v.Vestiaire3, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                        if #(coords - v.Vestiaire3) <= 3 then
                            if IsControlJustPressed(0, 51) then
                                openClothes = true
                                openlscoCloathroom()
                            end
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder aux vestiaires")
                        end
                    end
                elseif #(coords - v.PosGarage3) <= 10 then
                        interval = 1
                    DrawMarker(Config.Get.Marker.Type, v.PosGarage3, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    if #(coords - v.PosGarage3) <= 3 then
                            if IsControlJustPressed(0, 51) then
                                openedGarage = true
                                openlscoGarage()
                            end
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au garage")
                    end
                end
            end
        end
       -- for k,v in pairs(Config.Jobs.lsco.Garage) do
        --end
        Wait(interval)
    end
end)


function getPlayerInvlsco(player)
    
    ESX.TriggerServerCallback('getOtherPlayerDatalsco', function(data)
        for i=1, #data.accounts, 1 do
            if data.accounts[i].name == 'dirtycash' and data.accounts[i].money > 0 then
                table.insert(ArgentSale, {
                    label    = ESX.Math.Round(data.accounts[i].money),
                    value    = 'dirtycash',
                    itemType = 'item_account',
                    amount   = data.accounts[i].money
                })
    
            end
        end
    
        for i=1, #data.inventory, 1 do
            if data.inventory[i].count > 0 then
                table.insert(Items, {
                    label    = data.inventory[i].label,
                    right    = data.inventory[i].count,
                    value    = data.inventory[i].name,
                    itemType = 'item_standard',
                    amount   = data.inventory[i].count
                })
            end
        end

        for i=1, #data.weapons, 1 do
           -- if data.weapons[i].count > 0 then
                table.insert(Armes, {
                    label    = ESX.GetWeaponLabel(data.weapons[i].name),
                    right    = data.weapons[i].ammo,
                    value    = data.weapons[i].name,
                    itemType = 'item_weapon',
                    amount   = data.weapons[i].ammo
                })   
           -- end
        end

    end, GetPlayerServerId(player))
end

function getInfosVehicle(vehicleData)
    ESX.TriggerServerCallback('getVehicleInfos', function(retrivedInfo)
        if retrivedInfo.owner == nil then
            table.insert(infosvehicle, {
                label = "inconnu",
                plaque = vehicleData.plate
            })
        else
            table.insert(infosvehicle, {
                label = retrivedInfo.owner,
                plaque = retrivedInfo.plate
            })
        end
    end)
end


function KeyboardInputlsco(entryTitle, textEntry, inputText, maxLength)
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

function spawnObject(name)
	local plyPed = PlayerPedId()
	local coords = GetEntityCoords(plyPed, false) + (GetEntityForwardVector(plyPed) * 1.0)

    ESX.Game.SpawnObject(name, coords, function(obj)
        SetEntityHeading(obj, GetEntityPhysicsHeading(plyPed))
        PlaceObjectOnGroundProperly(obj)
    end)

end


RegisterNetEvent('renfort:setBlip')
AddEventHandler('renfort:setBlip', function(coords, raison)
	if raison == 'petite' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowNotification('Demande de renfort demandé.\nRéponse: ~g~CODE-2\nImportance: ~g~Légère.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 2
	elseif raison == 'moyenne' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowNotification('Demande de renfort demandé.\nRéponse: ~o~CODE-3\nImportance: ~o~Importante.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 47
	elseif raison == 'Grande' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
		ESX.ShowNotification('Demande de renfort demandé.\nRéponse: ~s~CODE-99\nImportance: ~s~URGENTE !\nDANGER IMPORTANT')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
		color = 1
	end
	local blipId = AddBlipForCoord(coords)
	SetBlipSprite(blipId, 161)
	SetBlipScale(blipId, 1.2)
	SetBlipColour(blipId, color)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Demande renfort')
	EndTextCommandSetBlipName(blipId)
	Wait(80 * 1000)
	RemoveBlip(blipId)
end)

RegisterNetEvent('lsco:InfoService')
AddEventHandler('lsco:InfoService', function(service, nom)
	if service == 'prise' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowNotification('Agent : ~s~'..nom..'\n~s~Code : ~s~10-8\n~s~Information : ~g~Prise de service.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'fin' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowNotification('Agent : ~s~'..nom..'\n~s~Code : ~s~10-10\n~s~Information : ~r~Fin de service.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'pause' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowNotification('Agent : ~s~'..nom..'\nCode : ~s~10-7\nInformation : ~y~Pause de service.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'standby' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowNotification('Agent : ~s~'..nom..'\nCode : ~s~10-12\nInformation : ~o~Standby, en attente de dispatch.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'control' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowNotification('Agent : ~s~'..nom..'\nCode : ~s~10-48\nInformation : ~o~Control routier en cours.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'refus' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowNotification('Agent : ~s~'..nom..'\nCode : ~s~10-30\nInformation : ~s~Refus d\'obtemperer / Delit de fuite en cours.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'crime' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowNotification('Agent : ~s~'..nom..'\nCode : ~s~10-31\nInformation : ~s~Crime en cours / poursuite en cours.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	end
end)

RegisterNetEvent('menotterlejoueurlsco')
AddEventHandler('menotterlejoueurlsco', function()
    IsHandcuffed = not IsHandcuffed
    local playerPed = PlayerPedId()

    if IsHandcuffed then
        RequestAnimDict('mp_arresting')
        while not HasAnimDictLoaded('mp_arresting') do
            Wait(100)
        end

        TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
        DisableControlAction(2, 37, true)
        SetEnableHandcuffs(playerPed, true)
        SetPedCanPlayGestureAnims(playerPed, false)
        FreezeEntityPosition(playerPed, true)
        DisableControlAction(0, 24, true) -- Attack
        DisableControlAction(0, 257, true) -- Attack 2
        DisableControlAction(0, 25, true) -- Aim
        DisableControlAction(0, 263, true) -- Melee Attack 1
        DisableControlAction(0, 37, true) -- Select Weapon
        DisableControlAction(0, 47, true)  -- Disable weapon
    else
        ClearPedSecondaryTask(playerPed)
        SetEnableHandcuffs(playerPed, false)
        SetPedCanPlayGestureAnims(playerPed, true)
        FreezeEntityPosition(playerPed, false)
    end
end)

IsInMenotte = function()
	if IsHandcuffed == true then
		return true
	else
		return false
	end
end

RegisterNetEvent('actionescorterlsco')
AddEventHandler('actionescorterlsco', function(cop)
  IsDragged = not IsDragged
  CopPed = tonumber(cop)
end)

Citizen.CreateThread(function()
  while true do
    Wait(0)
    if IsHandcuffed then
      if IsDragged then
        local ped = GetPlayerPed(GetPlayerFromServerId(CopPed))
        local myped = PlayerPedId()
        AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
      else
        DetachEntity(PlayerPedId(), true, false)
      end
    end
  end
end)

IsInEscorte = function()
	if IsDragged == true then
		return true
	else
		return false
	end
end

local IsInPVP = false;

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F6','InteractionsJoblsco', 'Menu job lsco', function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'lsco' then
        
        if (not IsInPVP) then
            
            openF6= true
            openF6lsco()
        end

    end
end)

local function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

---------------------------------------------------------------------------------------------------------------------------------------


function Rechercherplaquevoiture(plaquerechercher)
    local PlaqueMenu = RageUI.CreateMenu("", "Informations")
    ESX.TriggerServerCallback('johnny:getVehicleInfos', function(retrivedInfo)
    RageUI.Visible(PlaqueMenu, not RageUI.Visible(PlaqueMenu))
        while PlaqueMenu do
            Wait(0)
					RageUI.IsVisible(PlaqueMenu,function()
                            RageUI.Button("Numéro de plaque : ", nil, {RightLabel = retrivedInfo.plate}, true, {
                                	onSelected = function()
                                    end
                                })
						
                            if not retrivedInfo.owner then
                                RageUI.Button("Propriétaire : ", nil, {RightLabel = "Inconnu"}, true, {
                                    	onSelected = function()
                                		end
                                    })
                            else
                                RageUI.Button("Propriétaire : ", nil, {RightLabel = retrivedInfo.owner}, true, {
                                    	onSelected = function()
										end
                                    })

								local hashvoiture = retrivedInfo.vehicle.model
								local nomvoituremodele = GetDisplayNameFromVehicleModel(hashvoiture)
								local nomvoituretexte  = GetLabelText(nomvoituremodele)

                                RageUI.Button("Modèle du véhicule : ", nil, {RightLabel = nomvoituretexte}, true, {
                                    	onSelected = function()
										end
                                    })
                            end
                end, function()
                end)
            if not RageUI.Visible(PlaqueMenu) then
            PlaqueMenu = RMenu:DeleteType("plaque d'immatriculation", true)
        end
    end
end, plaquerechercher)
end

RegisterNetEvent('lsco:reportClosed')
AddEventHandler('lsco:reportClosed', function(reportId)
    for k, report in pairs(activeReports2) do
        if report.id == reportId then
            table.remove(activeReports2, k)
            break
        end
    end
    
    if reportBlips2[reportId] then
        RemoveBlip(reportBlips2[reportId])
        reportBlips2[reportId] = nil
    end
end)

exports('SendDrugSaleReportLSCO', function(coords)
    if isInService then
        local locationName = zones[GetNameOfZone(coords)]
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            local sex = nil
            if skin.sex == 0 then
                sex = "par un homme"
            else
                sex = "par une femme"
            end
            TriggerServerEvent("DealDeDrogueEnCoursLSCO", coords, sex, locationName)
        end)
    end
end)

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

RegisterNetEvent('lsco:handcuffAnimation')
AddEventHandler('lsco:handcuffAnimation', function()
    local playerPed = PlayerPedId()
    loadAnimDict("mp_arrest_paired")
    TaskPlayAnim(playerPed, "mp_arrest_paired", "cop_p2_back_right", 8.0, -8, 3000, 2, 0, 0, 0, 0)
    Wait(3000)
end)

RegisterNetEvent('lsco:getArrested')
AddEventHandler('lsco:getArrested', function(copId)
    local playerPed = PlayerPedId()
    loadAnimDict("mp_arrest_paired")
    AttachEntityToEntity(playerPed, GetPlayerPed(GetPlayerFromServerId(copId)), 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
    TaskPlayAnim(playerPed, "mp_arrest_paired", "crook_p2_back_rightcop_p2_back_right", 8.0, -8, 3000, 2, 0, 0, 0, 0)
    Wait(3000)
    DetachEntity(playerPed, true, false)
end)

function HandcuffAnimation()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local targetPed = GetPlayerPed(closestPlayer)
        if IsEntityPlayingAnim(targetPed, 'mp_arresting', 'idle', 3) then
            local playerPed = PlayerPedId()
            loadAnimDict("mp_arresting")
            TaskPlayAnim(playerPed, "mp_arresting", "a_uncuff", 8.0, -8, 3000, 2, 0, 0, 0, 0)
        end
        TriggerServerEvent('lsco:requestArrest', GetPlayerServerId(closestPlayer))
    end
end

RegisterNetEvent('lsco:allReportsCleared')
AddEventHandler('lsco:allReportsCleared', function()
    for _, blip in pairs(reportBlips) do
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    activeReports = {}
    reportBlips = {}
end)