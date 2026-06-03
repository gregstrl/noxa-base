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
local isArmurerieOpened = false
local activeReports = {}
local reportBlips = {}
local unpaidFines = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local playerPed = PlayerPedId()
        if IsPedShooting(playerPed) then
            local coords = GetEntityCoords(playerPed)
            local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
            local street = GetStreetNameFromHashKey(streetHash)
            local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
            TriggerServerEvent('sasp:reportShooting', coords, street, zone)
            TriggerServerEvent('lsco:reportShooting', coords, street, zone)
            Citizen.Wait(10000)
        end
    end
end)

RegisterNetEvent('sasp:receiveReport')
AddEventHandler('sasp:receiveReport', function(report)
    if isInService then
        if report.type == "Vente de drogue" then
            local streetHash = GetStreetNameAtCoord(report.coords.x, report.coords.y, report.coords.z)
            report.street = GetStreetNameFromHashKey(streetHash)
        end
        
        table.insert(activeReports, report)
        ESX.ShowNotification('~s~Nouveau signalement~s~\nType: ' .. report.type .. '\nLieu: ' .. report.street .. '\nQuartier: ' .. report.zone)
        PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
    end
end)

RegisterNetEvent('sasp:reportTaken')
AddEventHandler('sasp:reportTaken', function(report)
    if reportBlips[report.id] then
        RemoveBlip(reportBlips[report.id])
    end
    
    local blip = AddBlipForCoord(report.coords)
    SetBlipSprite(blip, 161)
    SetBlipScale(blip, 1.2)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Signalement - " .. report.type)
    EndTextCommandSetBlipName(blip)
    SetNewWaypoint(report.coords.x, report.coords.y)
    
    reportBlips[report.id] = blip
    ESX.ShowNotification('~g~Vous avez pris le signalement~s~\nUn point GPS a été placé')
end)

RegisterNetEvent('sasp:updateReportStatus')
AddEventHandler('sasp:updateReportStatus', function(reportId, takenByName)
    for k, report in pairs(activeReports) do
        if report.id == reportId then
            report.taken = true
            report.takenByName = takenByName
            break
        end
    end
end)

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
    --[[for k,v in pairs(Config.Jobs.sasp.Blips) do
        local blip = AddBlipForCoord(v.coords)

		SetBlipSprite (blip, 60)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 29)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString("Station de sasp")
		EndTextCommandSetBlipName(blip)
    end]]

    for k,v in pairs(Config.Jobs.sasp.Peds) do
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

local objectsSASP = {   
    [0] = {
        model = "prop_roadcone02a",
        name = "Cônes"
    },
    [1] = {
        model = "prop_barrier_work05",
        name = "Barrière"
    },
}


-- Main
function openF6sasp()
    local mainMenu = RageUI.CreateMenu('', 'San Andreas State Police')
    local actions = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local interaction = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local interactionveh = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local renfort = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local objets = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local fouiller = RageUI.CreateSubMenu(interaction, "", "San Andreas State Police")
    local lesinfosduvehicle = RageUI.CreateSubMenu(interactionveh, "", "San Andreas State Police")
    local infoamende = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local amendesImpayees = RageUI.CreateSubMenu(mainMenu, "", "Amendes impayées")
    local chien = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local props = RageUI.CreateSubMenu(mainMenu, "", "Intéractions : Objets")
    local propsList = RageUI.CreateSubMenu(props, "", "Intéractions : Gérer")
    local anoncessasp = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local appelsurgences = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local reports = RageUI.CreateSubMenu(appelsurgences, "", "Signalements en cours")
    local reportManagement = RageUI.CreateSubMenu(reports, "", "Gestion de l'appel")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openF6 do
        Wait(1)
        RageUI.IsVisible(mainMenu, function()
            if isInService then
                if ESX.PlayerData.job.grade_name == 'recruit' then
                    RageUI.Button("Anonces", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, anoncessasp)
                    RageUI.Button("Intéractions citoyen", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interaction)
                    RageUI.Button("Intéractions véhicules", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interactionveh)
                    RageUI.Button("Demande de renforts", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, renfort)
                    RageUI.Button("Central d'urgence", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, appelsurgences)
                    RageUI.Button("Amendes impayées", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            TriggerServerEvent('sasp:getUnpaidFines')
                        end
                    }, amendesImpayees)
                else
                    RageUI.Button("Anonces", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, anoncessasp)
                    RageUI.Button("Intéractions citoyen", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interaction)
                    RageUI.Button("Intéractions véhicules", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interactionveh)
                    RageUI.Button("Demande de renforts", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, renfort)
                    RageUI.Button("Central d'urgence", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, appelsurgences)
                    RageUI.Button("Amendes impayées", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            TriggerServerEvent('sasp:getUnpaidFines')
                        end
                    }, amendesImpayees)
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
                    ESX.TriggerServerCallback('GetAllPropssasp', function(Objectsasp)
                        object = Objectsasp
                    end)
                end
            }, propsList)

            for k,v in pairs(objectsSASP) do 
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
        
            TriggerServerEvent('Koy:sasp:AddProps', NetId)
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
                        TriggerServerEvent('Koy:sasp:RemoveProps', id)
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


            RageUI.Checkbox("Sortir/Rentrer le chien", nil, chiensasp, {}, {
                onChecked = function(index, items)
                    chiensasp = true
                    if not DoesEntityExist(saspDog) then
                    RequestModel('a_c_shepherd')
                    while not HasModelLoaded('a_c_shepherd') do Wait(0) end
                    saspDog = CreatePed(4, 'a_c_shepherd', GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -0.98), 0.0, true, false)
                    SetEntityAsMissionEntity(saspDog, true, true)
                    ESX.ShowNotification("Chien sorti")
                    end
                end,
                onUnChecked = function(index, items)
                    chiensasp = false
                    ESX.ShowNotification("Chien rentré")
                    DeleteEntity(saspDog)
                end
            })
            
            
            RageUI.Button("Assis", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    if DoesEntityExist(saspDog) then
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(saspDog), true) <= 5.0 then
                            if IsEntityPlayingAnim(saspDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 3) then
                                ClearPedTasks(saspDog)
                            else
                                loadDict('rcmnigel1c')
                                TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
                                Wait(2000)
                                loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
                                TaskPlayAnim(saspDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
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
                        if DoesEntityExist(saspDog) then
                            if not IsPedDeadOrDying(saspDog) then
                                if GetDistanceBetweenCoords(GetEntityCoords(saspDog), GetEntityCoords(PlayerPedId()), true) <= 3.0 then
                                    local player, distance = ESX.Game.GetClosestPlayer()
                                    if distance ~= -1 then
                                        if distance <= 3.0 then
                                            local playerPed = GetPlayerPed(player)
                                            if not IsPedInCombat(saspDog, playerPed) then
                                                if not IsPedInAnyVehicle(playerPed, true) then
                                                    TaskCombatPed(saspDog, playerPed, 0, 16)
                                                end
                                            else
                                                ClearPedTasksImmediately(saspDog)
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
                            if DoesEntityExist(saspDog) then
                                if not IsPedInAnyVehicle(saspDog, false) then
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(saspDog)) <= 10.0 then
                                        local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 7.5, 0, 70)
                                        print(vehicle)
                                        if DoesEntityExist(vehicle) then
                                            for i = 0, GetVehicleMaxNumberOfPassengers(vehicle) do
                                                if IsVehicleSeatFree(vehicle, i) then
                                                    TaskEnterVehicle(saspDog, vehicle, 15.0, i, 1.0, 1, 0)
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
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(saspDog)) <= 5.0 then
                                        TaskLeaveVehicle(saspDog, GetVehiclePedIsIn(saspDog, false), 0)
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
                                if DoesEntityExist(saspDog) then
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(saspDog), true) <= 5.0 then
                                        TaskGoToEntity(saspDog, playerPed, -1, 1.0, 10.0, 1073741824, 1)
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
                        TriggerServerEvent("sasp:SendFacture", sID, i.price)
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

        RageUI.IsVisible(amendesImpayees, function()
            RageUI.Separator("↓ Amendes impayées ~s~ ↓")
            for _, fine in pairs(unpaidFines) do
                RageUI.Button(fine.label, nil, {RightLabel = "~s~"..fine.price.."$"}, true, {
                    onSelected = function()
                        local player, distance = ESX.Game.GetClosestPlayer()
                        local sID = GetPlayerServerId(player)

                        if player ~= -1 and distance <= 3.0 then
                            TriggerServerEvent("sasp:SendFacture", sID, fine.price)
                            RageUI.CloseAll()
                            open = false
                        else
                            ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(anoncessasp, function()
            RageUI.Separator("↓ Gestion Anonces ~s~ ↓")
            RageUI.Button("Annonce", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    OpenAnnouncementMenu()
                end
            })
            RageUI.Button("Demander un avocat", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    TriggerServerEvent('sasp:avocat')
                end
            })
        end)

        function OpenAnnouncementMenu()
            local annonce = KeyboardInputsasp('Entrez votre annonce', '','', 100)
            if annonce and annonce ~= "" then
                TriggerServerEvent('sasp:annonce', annonce)
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
                        getPlayerInvsasp(player)
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
                    local numplaque = KeyboardInputsasp('', '','', 10)
                    local length = string.len(numplaque)
                    if not numplaque or length < 2 or length > 8 then
                        ESX.ShowNotification("[~r~Impossible~h~] Cette plaque n'est pas enregistré dans les fichiers de la sasp")
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
               RageUI.Button("10-20", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demandesasp', coords, 'koy')
                    ExecuteCommand("Localisation de l'agent")
                end
            })
            RageUI.Button("Code 2", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demandesasp', coords, 'petite')
                    ExecuteCommand("me demande de renfort")
                end
            })
            RageUI.Button("Code 3", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demandesasp', coords, 'moyenne')
                    ExecuteCommand("me demande de renfort")
                end
            })
            RageUI.Button("Code 99", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demandesasp', coords, 'Grande')
                    ExecuteCommand("me demande de renfort")
                end
            })
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
                        local combien = KeyboardInputsasp("Combien ?", 'Indiquez un nombre', '', 10)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                        else
                            TriggerServerEvent('confiscatePlayerItemsasp', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end

            RageUI.Separator("↓ ~s~Items du joueur ~s~↓")

            for k,v in pairs(Items) do
                RageUI.Button("Nom: "..v.label, nil, {RightLabel = "~s~"..v.right.." exemplaires"}, true , {
                    onSelected = function()
                        local combien = KeyboardInputsasp("Combien ", 'Indiquez un nombre', '', 4)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                        else
                            TriggerServerEvent('confiscatePlayerItemsasp', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
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
                            local combien = KeyboardInputsasp("Nombre de munitions", 'Indiquez un nombre', '', 4)
                            if tonumber(combien) > 1 then
                                ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                            else
                                TriggerServerEvent('confiscatePlayerItemsasp', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                                RageUI.GoBack()
                            end
                        end
                    })
                end
            end

        end)

        RageUI.IsVisible(appelsurgences, function()
            RageUI.Separator("↓ Appels Urgences ~s~ ↓")
            RageUI.Button("Signalements en cours", nil, {RightLabel = "→"}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('sasp:getActiveReports', function(reports)
                        activeReports = reports
                    end)
                end
            }, reports)
            
            RageUI.Button("~r~Supprimer tous les appels", "Supprime tous les appels en cours", {RightLabel = "→"}, true, {
                onSelected = function()
                    TriggerServerEvent('sasp:clearAllReports')
                    ESX.ShowNotification("~g~Tous les appels ont été supprimés")
                end
            })
        end)

        RageUI.IsVisible(reports, function()
            local hasReports = false
            for k, report in pairs(activeReports) do
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
                                TriggerServerEvent('sasp:takeReport', report.id)
                            end
                        })
                    else
                        local canManage = (report.takenBy == GetPlayerServerId(PlayerId()))
                        RageUI.Button(buttonText, description .. "\nPris en charge par " .. report.takenByName, {RightLabel = canManage and "→" or "~g~Pris~s~"}, canManage, {
                            onSelected = function()
                                selectedReport = report
                            end
                        }, reportManagement)
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
                        if reportBlips[selectedReport.id] then
                            RemoveBlip(reportBlips[selectedReport.id])
                            reportBlips[selectedReport.id] = nil
                            ESX.ShowNotification("~g~Point GPS retiré")
                        end
                    end
                })

                RageUI.Button("Remettre le point GPS", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        if reportBlips[selectedReport.id] then
                            RemoveBlip(reportBlips[selectedReport.id])
                        end
                        local blip = AddBlipForCoord(selectedReport.coords)
                        SetBlipSprite(blip, 161)
                        SetBlipScale(blip, 1.2)
                        SetBlipColour(blip, 1)
                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentString("Signalement - " .. selectedReport.type)
                        EndTextCommandSetBlipName(blip)
                        SetNewWaypoint(selectedReport.coords.x, selectedReport.coords.y)
                        reportBlips[selectedReport.id] = blip
                        ESX.ShowNotification("~g~Point GPS replacé")
                    end
                })

                RageUI.Button("~s~Clôturer l'appel", "Supprimer définitivement cet appel", {RightLabel = "→"}, true, {
                    onSelected = function()
                        if reportBlips[selectedReport.id] then
                            RemoveBlip(reportBlips[selectedReport.id])
                            reportBlips[selectedReport.id] = nil
                        end
                        TriggerServerEvent('sasp:closeReport', selectedReport.id)
                        ESX.ShowNotification("~g~Appel clôturé")
                        RageUI.GoBack()
                    end
                })
            end
        end)

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(props) and not RageUI.Visible(propsList) and not RageUI.Visible(infoamende) and not RageUI.Visible(actions) and not RageUI.Visible(interaction) and not RageUI.Visible(anoncessasp) and not RageUI.Visible(interactionveh) and not RageUI.Visible(renfort) and not RageUI.Visible(objets) and not RageUI.Visible(fouiller) and not RageUI.Visible(lesinfosduvehicle) and not RageUI.Visible(chien) and not RageUI.Visible(appelsurgences) and not RageUI.Visible(reports) and not RageUI.Visible(reportManagement) and not RageUI.Visible(amendesImpayees) then
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
    local mainMenu = RageUI.CreateMenu('', 'San Andreas State Police')
    local rc = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local vr = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local pr = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")

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
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.sasp.Uniforms[job].male)

			if job == 'bullet_wear' then
				TriggerServerEvent("Kevlar:AddForJob", "sasp", "100")
			end
		else
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.sasp.Uniforms[job].female)

			if job == 'bullet_wear' then
				TriggerServerEvent("Kevlar:AddForJob", "sasp", "100")
			end
		end
	end)
end

function openArmurerie()
    local mainMenu = RageUI.CreateMenu('', 'San Andreas State Police')
    local armes = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
    local paiement = RageUI.CreateSubMenu(mainMenu, "", "San Andreas State Police")
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
                            prix = 3000,
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
                            prix = 3000,
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
                            prix = 3000,
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
                            prix = 3000,
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
                            prix = 3000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 3000,
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
                            prix = 3000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 3000,
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
                            prix = 3000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 3000,
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
                            prix = 3000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 3000,
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
                            prix = 3000,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 3000,
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
                        TriggerServerEvent('buyWeaponForSASP', v.hash)
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

function opensaspGarage()
    local mainMenu = RageUI.CreateMenu('', 'San Andreas State Police')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openedGarage do
        local grade = ESX.PlayerData.job.grade_name
        RageUI.IsVisible(mainMenu, function()
            if grade == 'recruit' then
                RageUI.Button("Moto SASP 1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto SASP 2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bcpd10", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polalamop2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbuffalop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polfugitivep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polscoutp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polstalkerp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "poltorencep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'officer' then
                RageUI.Button("Moto SASP 1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto SASP 2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bcpd10", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polalamop2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbuffalop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polfugitivep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polscoutp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polstalkerp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "poltorencep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "coach2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo3", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo4", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé #5", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "umkalamo", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'sergeant' then
                RageUI.Button("Moto SASP 1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto SASP 2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bcpd10", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polalamop2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbuffalop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polfugitivep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polscoutp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polstalkerp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "poltorencep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "coach2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo3", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo4", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "umkalamo", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "usssflag", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'lieutenant' then
                RageUI.Button("Moto SASP 1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto SASP 2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bcpd10", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polalamop2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbuffalop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polfugitivep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polscoutp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polstalkerp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "poltorencep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "coach2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo3", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo4", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "umkalamo", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "usssflag", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'capitaine' then
                RageUI.Button("Moto SASP 1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto SASP 2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bcpd10", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polalamop2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbuffalop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polfugitivep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polscoutp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polstalkerp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "poltorencep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "coach2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo3", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo4", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "umkalamo", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "usssflag", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'commander' then
                RageUI.Button("Moto SASP 1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto SASP 2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bcpd10", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polalamop2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbuffalop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polfugitivep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polscoutp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polstalkerp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "poltorencep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "coach2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo3", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo4", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "umkalamo", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "usssflag", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Command", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "command", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Hazard2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "hazard2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Polspeedop", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polspeedop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatVanr", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatvanr2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatInsur", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatinsur", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatStoc", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatstoc", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'deputy' then
                RageUI.Button("Moto SASP", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto SASP", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bcpd10", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polalamop2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbuffalop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polfugitivep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polscoutp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polstalkerp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "poltorencep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "coach2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo3", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo4", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "umkalamo", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "usssflag", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bufsxtrafpol", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bufsxtrafpol", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Command", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "command", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Hazard2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "hazard2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Polspeedop", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polspeedop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatVanr", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatvanr2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatInsur", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatinsur", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatStoc", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatstoc", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'assistantboss' then
                RageUI.Button("Moto SASP", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto SASP", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bcpd10", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polalamop2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbuffalop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polfugitivep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polscoutp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polstalkerp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "poltorencep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "coach2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Halfback Banalisé #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "halfback2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo3", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo4", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "umkalamo", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "usssflag", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bufsxtrafpol Camion #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bufsxtrafpol", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Command Camion #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "command", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Hazard2 Camion #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "hazard2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Polspeedop Camion #4", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polspeedop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatVanr Camion #1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatvanr2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatInsur Blindé #2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatinsur", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatStoc Blindé #3", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatstoc", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'boss' then
                RageUI.Button("Moto SASP 1", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto SASP 2", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbikeb2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Felon", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bcpd10", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Lamop", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polalamop2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polbuffalop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Fugitive", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polfugitivep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Scoutp", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polscoutp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Stalker", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polstalkerp", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Poltorence", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "poltorencep", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coach Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "coach2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Halfback Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "halfback2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo3 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo3", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Trualamo4 Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "trualamo4", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Umkalamo Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "umkalamo", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("UssFlag Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "usssflag", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bufsxtrafpol Camion", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "bufsxtrafpol", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Command Camion", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "command", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Hazard2 Camion", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "hazard2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Polspeedop Camion", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "polspeedop", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatVanr Camion", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatvanr2", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatInsur Blindé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatinsur", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("SwatStoc Blindé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('sasp:spawnVehicle', "swatstoc", vector3(433.964813, -980.660950, 25.705233), 88.545639038086);
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

function opensaspCloathroom()
    local mainMenu = RageUI.CreateMenu('', 'San Andreas State Police')
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
                         TriggerServerEvent('annonce:servicesasp', 'prise')
                     end,
                     onUnChecked = function(index, items)
                         isInService = false
                         TriggerServerEvent('annonce:servicesasp', 'fin')
                     end
                 })
                RageUI.Button("Vêtements", nil, {RightLabel = "→"}, true , {}, vetements)
                RageUI.Button("Enfiler sa tenue", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        local name = KeyboardInputsasp("Indiquer le nom de la tenue", "Indiquer le nom de la tenue", "", 10)
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
                        TriggerServerEvent('annonce:servicesasp', 'prise')
                    end
                })
                RageUI.Button("Prendre ca fin de service", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end)
                        isInService = false
                        TriggerServerEvent('annonce:servicesasp', 'fin')
                    end
                })
            else
                RageUI.Checkbox("Prendre son service", nil, isInService, {}, {
                    onChecked = function(index, items)
                        isInService = true
                        TriggerServerEvent('annonce:servicesasp', 'prise')
                    end,
                    onUnChecked = function(index, items)
                        isInService = false
                        TriggerServerEvent('annonce:servicesasp', 'fin')
                    end
                })
                RageUI.Button("Ajouter une Tenue", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        local name = KeyboardInputsasp("Indiquer le nom de la tenue", "Indiquer le nom de la tenue", "", 10)
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
            
                RageUI.Button("Prendre son Uniforme", "Accéder à la garde robe", {RightLabel = "→"}, true, {}, garderobe)

                RageUI.Button("Fin de service", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end)
                        isInService = false
                        TriggerServerEvent('annonce:servicesasp', 'fin')
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
                                    local newname = KeyboardInputsasp("Nouveau nom","Nouveau nom", "", 15)
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
                    RageUI.Separator("~y~Aucune tenue disponible")
                end
            else
                RageUI.Separator("~y~Aucune tenue n'a étais ajoutées")
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
        --for k,v in pairs(Config.Jobs.sasp.Bureau) do
          --  local coords = GetEntityCoords(PlayerPedId(), false)
            --local dist = Vdist(coords.x, coords.y, coords.z, v.Bureau)
           -- if #(coords - v.Bureau) <= 10 then
              --  DrawMarker(Config.Get.Marker.Type, v.Bureau, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                --if #(coords - v.Bureau) <= 3 then
                   -- if ESX.PlayerData.job.name == 'sasp' and ESX.PlayerData.job.grade_name == 'boss' then
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
        for k,v in pairs(Config.Jobs.sasp.RangerVehicule) do
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
        for k,v in pairs(Config.Jobs.sasp.Zones2) do
            local coords = GetEntityCoords(PlayerPedId(), false)
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'sasp' then
                if #(coords - v.Armurerie2) <= 10 then
                    if isInService then
                        interval = 1
                        DrawMarker(Config.Get.Marker.Type, v.Armurerie2, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                        if #(coords - v.Armurerie2) <= 3 then
                            if IsControlJustPressed(0, 51) then
                                isArmurerieOpened = true
                                openArmurerie()
                            end
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder à l'armurerie")
                        end
                    end
                elseif #(coords - v.Vestiaire2) <= 10 then
                    interval = 1
                    DrawMarker(Config.Get.Marker.Type, v.Vestiaire2, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    if #(coords - v.Vestiaire2) <= 3 then
                        if IsControlJustPressed(0, 51) then
                            openClothes = true
                            opensaspCloathroom()
                        end
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder aux vestiaires")
                    end
                elseif #(coords - v.PosGarage2) <= 10 then
                        interval = 1
                    DrawMarker(Config.Get.Marker.Type, v.PosGarage2, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    if #(coords - v.PosGarage2) <= 3 then
                            if IsControlJustPressed(0, 51) then
                                openedGarage = true
                                opensaspGarage()
                            end
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au garage")
                    end
                end
            end
        end
       -- for k,v in pairs(Config.Jobs.sasp.Garage) do
        --end
        Wait(interval)
    end
end)


function getPlayerInvsasp(player)
    
    ESX.TriggerServerCallback('getOtherPlayerDatasasp', function(data)
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


function KeyboardInputsasp(entryTitle, textEntry, inputText, maxLength)
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
    if raison == 'koy' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowNotification('Demande de renfort demandé.\nRéponse: ~g~10-20\nLocalisation de l agent.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 3
	elseif raison == 'petite' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowNotification('Demande de renfort demandé.\nRéponse: ~g~CODE-2\nImportance: ~g~Légère.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 2
	elseif raison == 'moyenne' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowNotification('Demande de renfort demandé.\nRéponse: ~y~CODE-3\nImportance: ~y~Importante.')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 47
	elseif raison == 'Grande' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
		ESX.ShowNotification('Demande de renfort demandé.\nRéponse: ~r~CODE-99\nImportance: ~r~URGENTE !\nDANGER IMPORTANT')
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

RegisterNetEvent('sasp:InfoService')
AddEventHandler('sasp:InfoService', function(service, nom)
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

RegisterNetEvent('menotterlejoueursasp')
AddEventHandler('menotterlejoueursasp', function()
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

function HandcuffAnimation()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local targetPed = GetPlayerPed(closestPlayer)
        if IsEntityPlayingAnim(targetPed, 'mp_arresting', 'idle', 3) then
            local playerPed = PlayerPedId()
            loadAnimDict("mp_arresting")
            TaskPlayAnim(playerPed, "mp_arresting", "a_uncuff", 8.0, -8, 3000, 2, 0, 0, 0, 0)
        end
        TriggerServerEvent('sasp:requestArrest', GetPlayerServerId(closestPlayer))
    end
end

IsInMenotte = function()
	if IsHandcuffed == true then
		return true
	else
		return false
	end
end

RegisterNetEvent('actionescortersasp')
AddEventHandler('actionescortersasp', function(cop)
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

Keys.Register('F6','InteractionsJobsasp', 'Menu job sasp', function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'sasp' then
        
        if (not IsInPVP) then
            
            openF6= true
            openF6sasp()
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

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    
    for _, blip in pairs(reportBlips) do
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    
    activeReports = {}
    reportBlips = {}
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    
    activeReports = {}
    reportBlips = {}
end)

RegisterNetEvent('sasp:reportClosed')
AddEventHandler('sasp:reportClosed', function(reportId)
    for k, report in pairs(activeReports) do
        if report.id == reportId then
            table.remove(activeReports, k)
            break
        end
    end
    
    if reportBlips[reportId] then
        RemoveBlip(reportBlips[reportId])
        reportBlips[reportId] = nil
    end
end)

exports('SendDrugSaleReport', function(coords)
    if isInService then
        local locationName = zones[GetNameOfZone(coords)]
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            local sex = nil
            if skin.sex == 0 then
                sex = "par un homme"
            else
                sex = "par une femme"
            end
            TriggerServerEvent("DealDeDrogueEnCours", coords, sex, locationName)
        end)
    end
end)

function cleanupReports()
    local newReports = {}
    for k, report in pairs(activeReports) do
        if report and report.id then
            table.insert(newReports, report)
        end
    end
    activeReports = newReports
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        cleanupReports()
    end
end)

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

RegisterNetEvent('sasp:handcuffAnimation')
AddEventHandler('sasp:handcuffAnimation', function()
    local playerPed = PlayerPedId()
    loadAnimDict("mp_arrest_paired")
    TaskPlayAnim(playerPed, "mp_arrest_paired", "cop_p2_back_right", 8.0, -8, 3000, 2, 0, 0, 0, 0)
    Wait(3000)
end)

RegisterNetEvent('sasp:getArrested')
AddEventHandler('sasp:getArrested', function(copId)
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
        TriggerServerEvent('sasp:requestArrest', GetPlayerServerId(closestPlayer))
    end
end

RegisterNetEvent('sasp:receiveUnpaidFines')
AddEventHandler('sasp:receiveUnpaidFines', function(fines)
    unpaidFines = fines
end)

RegisterNetEvent('sasp:allReportsCleared')
AddEventHandler('sasp:allReportsCleared', function()
    for _, blip in pairs(reportBlips) do
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    activeReports = {}
    reportBlips = {}
end)