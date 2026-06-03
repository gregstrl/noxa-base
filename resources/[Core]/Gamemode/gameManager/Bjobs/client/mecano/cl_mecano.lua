--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

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

local CurrentlyTowedVehicle = nil

openMecanoF6 = function()
    local mainMenu = RageUI.CreateMenu("", "Actions mécano")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do
        RageUI.IsVisible(mainMenu, function()

            RageUI.Checkbox("Entreprise Ouverte", nil, Society.List["mecano"].state, {}, {
                onChecked = function()
                    TriggerServerEvent('entreprise:setStatus', "mecano", true)
                    TriggerServerEvent('Ouvre:Mecano')
                end,
                onUnChecked = function()
                    TriggerServerEvent('entreprise:setStatus', "mecano", false)
                    TriggerServerEvent('Ferme:Mecano')
                end
            })
            RageUI.Button("Annonce ~g~[Recrutement]", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Recrutement:Mecano')
                end
            })

            RageUI.Button("Annonce ~g~[Personnaliser]", nil, {}, true, {
                onSelected = function()
                    local input = exports.ox_lib:inputDialog('Message personnalisé', {
                        {type = 'input', label = 'Message', description = 'Entrez votre message (emojis autorisés)', required = true, min = 1, max = 200}
                    })
                    if input and input[1] then
                        TriggerServerEvent('Personnaliser:Mecano', input[1])
                    end
                end
            })

            RageUI.Line()

            RageUI.Separator("↓ Gestion Mécanique ~s~ ↓")
            RageUI.Button("Réparer le véhicule", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords = GetEntityCoords(playerPed)
                    local vehicle = nil
            
                    if IsPedInAnyVehicle(playerPed, false) then
                        vehicle = GetVehiclePedIsIn(playerPed, false)
                    else
                        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                    end
            
                    if DoesEntityExist(vehicle) then
                        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
                        exports["rprogress"]:Start('', 10000)
                        Citizen.SetTimeout(100, function()
                            -- Réparation du véhicule
                            SetVehicleFixed(vehicle)
                            SetVehicleDeformationFixed(vehicle)
                            SetVehicleUndriveable(vehicle, false)
                            SetVehicleEngineOn(vehicle, true, true)
            
                            -- Restauration de la carrosserie et des pare-chocs
                            SetVehicleBodyHealth(vehicle, 1000.0)
                            SetVehiclePetrolTankHealth(vehicle, 1000.0)
                            SetVehicleDirtLevel(vehicle, 0.0)
        
                            
                            -- Réparation des roues
                            for i = 0, 5 do
                                SetVehicleTyreFixed(vehicle, i)
                            end
            
                            -- Remise en place des pare-chocs et autres éléments détachables
                            SetVehicleWheelHealth(vehicle, 0, 1000.0)
                            SetVehicleWheelHealth(vehicle, 1, 1000.0)
                            SetVehicleWheelHealth(vehicle, 2, 1000.0)
                            SetVehicleWheelHealth(vehicle, 3, 1000.0)
            
                            -- Empêcher les parties du véhicule de tomber après réparation
                            SetVehicleCanBreak(vehicle, false) 
            
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("[~g~Succès~s~] Véhicule réparé !")
                        end)
                    else
                        ESX.ShowNotification("[~r~Impossible~s~] Aucun véhicule à proximité")
                    end
                end
            })
            
            

            RageUI.Button("Nettoyer le véhicule", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)

                    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

                        local vehicle = nil

                        if IsPedInAnyVehicle(playerPed, false) then
                            vehicle = GetVehiclePedIsIn(playerPed, false)
                        else
                            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                        end

                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                            Citizen.CreateThread(function()
                                exports["rprogress"]:Start('', 10000)
                               -- Wait(10000)

                                SetVehicleDirtLevel(vehicle, 0)
                                ClearPedTasksImmediately(playerPed)
                                ESX.ShowNotification("Véhicule nettoyé avec succès")
                            end)
                        end
                    end
                end
            })

            RageUI.Button("Mettre / Retirer le véhicule du plateau", "~g~Information\n~s~Vous devez mettre la voiture a cote de la dépaneuse", {}, true, {
                onSelected = function()
                    local vehicledepannage = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 5.0, 0, 70)
                    local playerPed = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(playerPed, true)
            
                    local towmodel = GetHashKey('flatbed')
                    local isVehicleTow = IsVehicleModel(vehicle, towmodel)
            
                    if isVehicleTow then
                        if CurrentlyTowedVehicle == nil then
                            if DoesEntityExist(vehicledepannage) then
                                if not IsPedInAnyVehicle(playerPed, true) then
                                    if vehicle ~= vehicledepannage then
                                        ClearPedTasks(playerPed)
                                        AttachEntityToEntity(vehicledepannage, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                        CurrentlyTowedVehicle = vehicledepannage
                                        ESX.ShowNotification("[~g~Succès~s~] Mise sur le plateau réussi")
                                    else
                                        ESX.ShowNotification("[~r~Impossible~h~] Vous ne pouvez pas attacher votre véhicule de dépannage")
                                    end
                                end
                            else
                                ESX.ShowNotification("[~r~Impossible~h~] Aucun véhicule à proximité")
                            end
                        else
                            AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                            DetachEntity(CurrentlyTowedVehicle, true, true)
                            CurrentlyTowedVehicle = nil
                            ESX.ShowNotification("~g~Véhicule retiré du plateau")
                        end
                    else
                        ESX.ShowNotification("[~r~Impossible~h~] Vous devez avoir un véhicule à plateau pour faire cela")
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
                            exports["rprogress"]:Start('', 10000)
                           -- Wait(10000)

                            ESX.Game.DeleteVehicle(vehicle)
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("Véhicule mis en fourrière")
                        end)
                    end
                end
            })

            RageUI.Separator("↓ Gestion Facture ~s~ ↓")
            RageUI.Button("Faire une ~o~Facture", nil, {RightLabel = ""}, true , {
                onSelected = function()
                    local montant = KeyboardInputsasp("Montant:", 'Indiquez un montant', '', 7)
                    if tonumber(montant) == nil then
                        ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                        return false
                    else
                        amount = (tonumber(montant))
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
                            ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'mecano', "Benny's", amount)
						end
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

openLsF6 = function()
    local mainMenu2 = RageUI.CreateMenu("", "Actions mécano")

    RageUI.Visible(mainMenu2, not RageUI.Visible(mainMenu2))

    while mainMenu2 do
        RageUI.IsVisible(mainMenu2, function()

            RageUI.Checkbox("Entreprise Ouverte", nil, Society.List["mecano2"].state, {}, {
                onChecked = function()
                    TriggerServerEvent('entreprise:setStatus', "mecano2", true)
                    TriggerServerEvent('Ouvre:Mecano2')
                end,
                onUnChecked = function()
                    TriggerServerEvent('entreprise:setStatus', "mecano2", false)
                    TriggerServerEvent('Ferme:Mecano2')
                end
            })
            RageUI.Button("Annonce ~g~[Recrutement]", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Recrutement:Mecano2')
                end
            })

            RageUI.Button("Annonce ~o~[Personnaliser]", nil, {}, true, {
                onSelected = function()
                    local input = exports.ox_lib:inputDialog('Message personnalisé', {
                        {type = 'input', label = 'Message', description = 'Entrez votre message (emojis autorisés)', required = true, min = 1, max = 200}
                    })
                    if input and input[1] then
                        TriggerServerEvent('Personnaliser:Mecano2', input[1])
                    end
                end
            })
            RageUI.Line()

            
            RageUI.Separator("↓ Gestion Mécanique ~s~ ↓")
            RageUI.Button("Réparer le véhicule", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords = GetEntityCoords(playerPed)
                    local vehicle = nil
            
                    if IsPedInAnyVehicle(playerPed, false) then
                        vehicle = GetVehiclePedIsIn(playerPed, false)
                    else
                        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                    end
            
                    if DoesEntityExist(vehicle) then
                        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
                        exports["rprogress"]:Start('', 10000)

                        Citizen.SetTimeout(100, function()
            
                            -- Réparation du véhicule
                            SetVehicleFixed(vehicle)
                            SetVehicleDeformationFixed(vehicle)
                            SetVehicleUndriveable(vehicle, false)
                            SetVehicleEngineOn(vehicle, true, true)
            
                            -- Restauration de la carrosserie et des pare-chocs
                            SetVehicleBodyHealth(vehicle, 1000.0)
                            SetVehiclePetrolTankHealth(vehicle, 1000.0)
                            SetVehicleDirtLevel(vehicle, 0.0)
        
                            
                            -- Réparation des roues
                            for i = 0, 5 do
                                SetVehicleTyreFixed(vehicle, i)
                            end
            
                            -- Remise en place des pare-chocs et autres éléments détachables
                            SetVehicleWheelHealth(vehicle, 0, 1000.0)
                            SetVehicleWheelHealth(vehicle, 1, 1000.0)
                            SetVehicleWheelHealth(vehicle, 2, 1000.0)
                            SetVehicleWheelHealth(vehicle, 3, 1000.0)
            
                            -- Empêcher les parties du véhicule de tomber après réparation
                            SetVehicleCanBreak(vehicle, false) 
            
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("[~g~Succès~s~] Véhicule réparé !")
                        end)
                    else
                        ESX.ShowNotification("[~r~Impossible~s~] Aucun véhicule à proximité")
                    end
                end
            })

            RageUI.Button("Nettoyer le véhicule", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)

                    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

                        local vehicle = nil

                        if IsPedInAnyVehicle(playerPed, false) then
                            vehicle = GetVehiclePedIsIn(playerPed, false)
                        else
                            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                        end

                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                            Citizen.CreateThread(function()
                                exports["rprogress"]:Start('', 10000)
                               -- Wait(10000)

                                SetVehicleDirtLevel(vehicle, 0)
                                ClearPedTasksImmediately(playerPed)
                                ESX.ShowNotification("Véhicule nettoyé avec succès")
                            end)
                        end
                    end
                end
            })

            RageUI.Button("Mettre / Retirer le véhicule du plateau", "~o~Information\n~s~Vous devez d'abord monter dans votre dépanneuse à plateau", {}, true, {
                onSelected = function()
                    local vehicledepannage = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 5.0, 0, 70)
                    local playerPed = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(playerPed, true)
            
                    local towmodel = GetHashKey('flatbed')
                    local isVehicleTow = IsVehicleModel(vehicle, towmodel)
            
                    if isVehicleTow then
                        if CurrentlyTowedVehicle == nil then
                            if DoesEntityExist(vehicledepannage) then
                                if not IsPedInAnyVehicle(playerPed, true) then
                                    if vehicle ~= vehicledepannage then
                                        ClearPedTasks(playerPed)
                                        AttachEntityToEntity(vehicledepannage, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                        CurrentlyTowedVehicle = vehicledepannage
                                        ESX.ShowNotification("~g~Mise sur le plateau réussi")
                                    else
                                        ESX.ShowNotification("[~r~Impossible~h~] Vous ne pouvez pas attacher votre véhicule de dépannage")
                                    end
                                end
                            else
                                ESX.ShowNotification("[~r~Impossible~h~] Aucun véhicule à proximité")
                            end
                        else
                            AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                            DetachEntity(CurrentlyTowedVehicle, true, true)
                            CurrentlyTowedVehicle = nil
                            ESX.ShowNotification("~s~Véhicule retiré du plateau")
                        end
                    else
                        ESX.ShowNotification("[~r~Impossible~h~] Vous devez avoir un véhicule à plateau pour faire cela")
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
                            exports["rprogress"]:Start('', 10000)
                          --  Wait(10000)

                            ESX.Game.DeleteVehicle(vehicle)
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("Véhicule mis en fourrière")
                        end)
                    end
                end
            })

            RageUI.Separator("↓ Gestion Facture ~s~ ↓")
            RageUI.Button("Faire une ~o~Facture", nil, {RightLabel = ""}, true , {
                onSelected = function()
                    local montant = KeyboardInputsasp("Montant:", 'Indiquez un montant', '', 7)
                    if tonumber(montant) == nil then
                        ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                        return false
                    else
                        amount = (tonumber(montant))
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
                            ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'mecano2', 'Ls Custom', amount)
						end
                    end
                end
            })
        end)
        if not RageUI.Visible(mainMenu2) then
            mainMenu2 = RMenu:DeleteType(mainMenu2, true)
        end
        Wait(0)
    end
end

-- AutoExotic

openExoticF6 = function()
    local mainMenu2 = RageUI.CreateMenu("", "Actions Auto Exotic")

    RageUI.Visible(mainMenu2, not RageUI.Visible(mainMenu2))

    while mainMenu2 do
        RageUI.IsVisible(mainMenu2, function()

            RageUI.Checkbox("Entreprise Ouverte", nil, Society.List["autoexotic"].state, {}, {
                onChecked = function()
                    TriggerServerEvent('entreprise:setStatus', "autoexotic", true)
                    TriggerServerEvent('Ouvre:AutoExotic')
                end,
                onUnChecked = function()
                    TriggerServerEvent('entreprise:setStatus', "autoexotic", false)
                    TriggerServerEvent('Ferme:AutoExotic')
                end
            })
            RageUI.Button("Annonce ~g~[Recrutement]", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Recrutement:AutoExotic')
                end
            })
            RageUI.Button("Annonce ~o~[Personnaliser]", nil, {}, true, {
                onSelected = function()
                    local input = exports.ox_lib:inputDialog('Message personnalisé', {
                        {type = 'input', label = 'Message', description = 'Entrez votre message (emojis autorisés)', required = true, min = 1, max = 200}
                    })
                    if input and input[1] then
                        TriggerServerEvent('Personnaliser:AutoExotic', input[1])
                    end
                end
            })
            RageUI.Line()

            RageUI.Separator("↓ Gestion Mécanique ~s~ ↓")
            RageUI.Button("Réparer le véhicule", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords = GetEntityCoords(playerPed)
                    local vehicle = nil
            
                    if IsPedInAnyVehicle(playerPed, false) then
                        vehicle = GetVehiclePedIsIn(playerPed, false)
                    else
                        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                    end
            
                    if DoesEntityExist(vehicle) then
                        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
                        exports["rprogress"]:Start('', 10000)
                        Citizen.SetTimeout(100, function()

                            -- Réparation du véhicule
                            SetVehicleFixed(vehicle)
                            SetVehicleDeformationFixed(vehicle)
                            SetVehicleUndriveable(vehicle, false)
                            SetVehicleEngineOn(vehicle, true, true)
            
                            -- Restauration de la carrosserie et des pare-chocs
                            SetVehicleBodyHealth(vehicle, 1000.0)
                            SetVehiclePetrolTankHealth(vehicle, 1000.0)
                            SetVehicleDirtLevel(vehicle, 0.0)
        
                            
                            -- Réparation des roues
                            for i = 0, 5 do
                                SetVehicleTyreFixed(vehicle, i)
                            end
            
                            -- Remise en place des pare-chocs et autres éléments détachables
                            SetVehicleWheelHealth(vehicle, 0, 1000.0)
                            SetVehicleWheelHealth(vehicle, 1, 1000.0)
                            SetVehicleWheelHealth(vehicle, 2, 1000.0)
                            SetVehicleWheelHealth(vehicle, 3, 1000.0)
            
                            -- Empêcher les parties du véhicule de tomber après réparation
                            SetVehicleCanBreak(vehicle, false) 
            
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("[~g~Succès~s~] Véhicule réparé !")
                        end)
                    else
                        ESX.ShowNotification("[~r~Impossible~s~] Aucun véhicule à proximité")
                    end
                end
            })
            
            RageUI.Button("Nettoyer le véhicule", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)

                    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

                        local vehicle = nil

                        if IsPedInAnyVehicle(playerPed, false) then
                            vehicle = GetVehiclePedIsIn(playerPed, false)
                        else
                            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                        end

                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                            Citizen.CreateThread(function()
                                exports["rprogress"]:Start('', 10000)

                               -- Wait(10000)

                                SetVehicleDirtLevel(vehicle, 0)
                                ClearPedTasksImmediately(playerPed)
                                ESX.ShowNotification("Véhicule nettoyé avec succès")
                            end)
                        end
                    end
                end
            })

            RageUI.Button("Mettre / Retirer le véhicule du plateau", "~o~Information\n~s~Vous devez d'abord monter dans votre dépanneuse à plateau", {}, true, {
                onSelected = function()
                    local vehicledepannage = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 5.0, 0, 70)
                    local playerPed = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(playerPed, true)
            
                    local towmodel = GetHashKey('flatbed')
                    local isVehicleTow = IsVehicleModel(vehicle, towmodel)
            
                    if isVehicleTow then
                        if CurrentlyTowedVehicle == nil then
                            if DoesEntityExist(vehicledepannage) then
                                if not IsPedInAnyVehicle(playerPed, true) then
                                    if vehicle ~= vehicledepannage then
                                        ClearPedTasks(playerPed)
                                        AttachEntityToEntity(vehicledepannage, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                        CurrentlyTowedVehicle = vehicledepannage
                                        ESX.ShowNotification("~g~Mise sur le plateau réussi")
                                    else
                                        ESX.ShowNotification("[~r~Impossible~h~] Vous ne pouvez pas attacher votre véhicule de dépannage")
                                    end
                                end
                            else
                                ESX.ShowNotification("[~r~Impossible~h~] Aucun véhicule à proximité")
                            end
                        else
                            AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                            DetachEntity(CurrentlyTowedVehicle, true, true)
                            CurrentlyTowedVehicle = nil
                            ESX.ShowNotification("~g~Véhicule retiré du plateau")
                        end
                    else
                        ESX.ShowNotification("[~r~Impossible~h~] Vous devez avoir un véhicule à plateau pour faire cela")
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
                            exports["rprogress"]:Start('', 10000)
                          --  Wait(10000)

                            ESX.Game.DeleteVehicle(vehicle)
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("Véhicule mis en fourrière")
                        end)
                    end
                end
            })

            RageUI.Separator("↓ Gestion Facture ~s~ ↓")
            RageUI.Button("Faire une ~o~Facture", nil, {RightLabel = ""}, true , {
                onSelected = function()
                    local montant = KeyboardInputsasp("Montant:", 'Indiquez un montant', '', 7)
                    if tonumber(montant) == nil then
                        ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                        return false
                    else
                        amount = (tonumber(montant))
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
                            ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'autoexotic', 'AutoExotic', amount)
						end
                    end
                end
            })
        end)
        if not RageUI.Visible(mainMenu2) then
            mainMenu2 = RMenu:DeleteType(mainMenu2, true)
        end
        Wait(0)
    end
end

--

openlarrysF6 = function()
    local mainMenu2 = RageUI.CreateMenu("", "Actions larrys Repair")

    RageUI.Visible(mainMenu2, not RageUI.Visible(mainMenu2))

    while mainMenu2 do
        RageUI.IsVisible(mainMenu2, function()

            RageUI.Checkbox("Entreprise Ouverte", nil, Society.List["larrys"].state, {}, {
                onChecked = function()
                    TriggerServerEvent('entreprise:setStatus', "larrys", true)
                    TriggerServerEvent('Ouvre:larrys')
                end,
                onUnChecked = function()
                    TriggerServerEvent('entreprise:setStatus', "larrys", false)
                    TriggerServerEvent('Ferme:larrys')
                end
            })
            RageUI.Button("Annonce ~g~[Recrutement]", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Recrutement:larrys')
                end
            })

            RageUI.Button("Annonce ~o~[Personnaliser]", nil, {}, true, {
                onSelected = function()
                    local input = exports.ox_lib:inputDialog('Message personnalisé', {
                        {type = 'input', label = 'Message', description = 'Entrez votre message (emojis autorisés)', required = true, min = 1, max = 200}
                    })
                    if input and input[1] then
                        TriggerServerEvent('Personnaliser:larrys', input[1])
                    end
                end
            })
            RageUI.Line()

            RageUI.Separator("↓ Gestion Mécanique ~s~ ↓")
            RageUI.Button("Réparer le véhicule", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords = GetEntityCoords(playerPed)
                    local vehicle = nil
            
                    if IsPedInAnyVehicle(playerPed, false) then
                        vehicle = GetVehiclePedIsIn(playerPed, false)
                    else
                        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                    end
            
                    if DoesEntityExist(vehicle) then
                        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
                        exports["rprogress"]:Start('', 10000)
                        Citizen.SetTimeout(100, function()

                            -- Réparation du véhicule
                            SetVehicleFixed(vehicle)
                            SetVehicleDeformationFixed(vehicle)
                            SetVehicleUndriveable(vehicle, false)
                            SetVehicleEngineOn(vehicle, true, true)
            
                            -- Restauration de la carrosserie et des pare-chocs
                            SetVehicleBodyHealth(vehicle, 1000.0)
                            SetVehiclePetrolTankHealth(vehicle, 1000.0)
                            SetVehicleDirtLevel(vehicle, 0.0)
        
                            
                            -- Réparation des roues
                            for i = 0, 5 do
                                SetVehicleTyreFixed(vehicle, i)
                            end
            
                            -- Remise en place des pare-chocs et autres éléments détachables
                            SetVehicleWheelHealth(vehicle, 0, 1000.0)
                            SetVehicleWheelHealth(vehicle, 1, 1000.0)
                            SetVehicleWheelHealth(vehicle, 2, 1000.0)
                            SetVehicleWheelHealth(vehicle, 3, 1000.0)
            
                            -- Empêcher les parties du véhicule de tomber après réparation
                            SetVehicleCanBreak(vehicle, false) 
            
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("[~g~Succès~s~] Véhicule réparé !")
                        end)
                    else
                        ESX.ShowNotification("[~r~Impossible~s~] Aucun véhicule à proximité")
                    end
                end
            })
            
            RageUI.Button("Nettoyer le véhicule", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)

                    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

                        local vehicle = nil

                        if IsPedInAnyVehicle(playerPed, false) then
                            vehicle = GetVehiclePedIsIn(playerPed, false)
                        else
                            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                        end

                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                            Citizen.CreateThread(function()
                                exports["rprogress"]:Start('', 10000)

                               -- Wait(10000)

                                SetVehicleDirtLevel(vehicle, 0)
                                ClearPedTasksImmediately(playerPed)
                                ESX.ShowNotification("Véhicule nettoyé avec succès")
                            end)
                        end
                    end
                end
            })

            RageUI.Button("Mettre / Retirer le véhicule du plateau", "~o~Information\n~s~Vous devez d'abord monter dans votre dépanneuse à plateau", {}, true, {
                onSelected = function()
                    local vehicledepannage = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 5.0, 0, 70)
                    local playerPed = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(playerPed, true)
            
                    local towmodel = GetHashKey('flatbed')
                    local isVehicleTow = IsVehicleModel(vehicle, towmodel)
            
                    if isVehicleTow then
                        if CurrentlyTowedVehicle == nil then
                            if DoesEntityExist(vehicledepannage) then
                                if not IsPedInAnyVehicle(playerPed, true) then
                                    if vehicle ~= vehicledepannage then
                                        ClearPedTasks(playerPed)
                                        AttachEntityToEntity(vehicledepannage, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                        CurrentlyTowedVehicle = vehicledepannage
                                        ESX.ShowNotification("~g~Mise sur le plateau réussi")
                                    else
                                        ESX.ShowNotification("[~r~Impossible~h~] Vous ne pouvez pas attacher votre véhicule de dépannage")
                                    end
                                end
                            else
                                ESX.ShowNotification("[~r~Impossible~h~] Aucun véhicule à proximité")
                            end
                        else
                            AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                            DetachEntity(CurrentlyTowedVehicle, true, true)
                            CurrentlyTowedVehicle = nil
                            ESX.ShowNotification("~g~Véhicule retiré du plateau")
                        end
                    else
                        ESX.ShowNotification("[~r~Impossible~h~] Vous devez avoir un véhicule à plateau pour faire cela")
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
                            exports["rprogress"]:Start('', 10000)
                          --  Wait(10000)

                            ESX.Game.DeleteVehicle(vehicle)
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("Véhicule mis en fourrière")
                        end)
                    end
                end
            })

            RageUI.Separator("↓ Gestion Facture ~s~ ↓")
            RageUI.Button("Faire une ~o~Facture", nil, {RightLabel = ""}, true , {
                onSelected = function()
                    local montant = KeyboardInputsasp("Montant:", 'Indiquez un montant', '', 7)
                    if tonumber(montant) == nil then
                        ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                        return false
                    else
                        amount = (tonumber(montant))
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
                            ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'larrys', 'larrys Repair', amount)
						end
                    end
                end
            })
        end)
        if not RageUI.Visible(mainMenu2) then
            mainMenu2 = RMenu:DeleteType(mainMenu2, true)
        end
        Wait(0)
    end
end

--

local IsInPVP = false;

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F6','InteractionsJobMecano', "Menu job Benny's", function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'mecano' then

        if (not IsInPVP) then
            openMecanoF6()
        end

    end
end)

Keys.Register('F6','InteractionsJobMecano2', 'Menu job Ls Custom', function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'mecano2' then

        if (not IsInPVP) then
            openLsF6()
        end

    end
end)

Keys.Register('F6','InteractionsJobAutoExotic', 'Menu job Auto Exotic', function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'autoexotic' then

        if (not IsInPVP) then
            openExoticF6()
        end

    end
end)

Keys.Register('F6','InteractionsJoblarrys', 'Menu job Larrys Repair', function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'larrys' then

        if (not IsInPVP) then
            openlarrysF6()
        end

    end
end)

local openedGarage = false
local openedLSGarage = false
local openedAutoExoticGarage = false
local openedlarrysGarage = false

CustomJob = {
    {name = "mecano" , label = "Benny's", pointveh = vector3(-981.9352, -2051.3210, 9.4062), pointdelveh = vector3(-988.3901, -2054.1946, 9.4054)},
}

CustomJob2 = {
    {name = "mecano2" , label = "Ls Custom", pointveh = vector3(-360.9627, -153.4936, 38.7070), pointdelveh = vector3(-365.3309, -146.1785, 38.2704)},
}

CustomJob3 = {
    {name = "autoexotic" , label = "Auto Exotic", pointveh = vector3(-385.24,-102.06,38.68), pointdelveh = vector3(-381.19,-108.44,38.69)},
}

CustomJob4 = {
    {name = "larrys" , label = "Larrys Repair", pointveh = vector3(1245.787231, 2721.610107, 38.00), pointdelveh = vector3(1244.250488, 2710.802246, 38.00)},
}


CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob) do
            local mc = v.pointveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(39,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,247,247,247,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder a la ~g~sortie véhicule~w~.")
                        if IsControlJustPressed(0, 51) then
                            openedGarage = true
                            openBennyGarage()
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)

CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob2) do
            local mc = v.pointveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(39,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,247,247,247,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder a la ~g~sortie véhicule~w~.")
                        if IsControlJustPressed(0, 51) then
                            openedLSGarage = true
                            openLSGarage()
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)

CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob3) do
            local mc = v.pointveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(39,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,247,247,247,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder a la ~g~sortie véhicule~w~.")
                        if IsControlJustPressed(0, 51) then
                            openedautoexoticGarage = true
                            openAutoExoticGarage()
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)

-- larrys Repair

CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob4) do
            local mc = v.pointveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(39,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,247,247,247,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder a la ~g~sortie véhicule~w~.")
                        if IsControlJustPressed(0, 51) then
                            openedlarrysGarage = true
                            openlarrysGarage()
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)


function openBennyGarage()
    local mainMenu = RageUI.CreateMenu('', 'Benny’s Original Motor Works')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openedGarage do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Dépanneuse", nil, {RightLabel = "→"}, true, {
                onSelected = function()
                    TriggerServerEvent('benny:spawnVehicle', "flatbed")
                    RageUI.CloseAll()
                end
            })
            
        end)
        
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openedGarage = false
        end

        Wait(0)
    end
end

function openLSGarage()
    local mainMenu = RageUI.CreateMenu('', 'Benny’s Original Motor Works')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openedLSGarage do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Dépanneuse", nil, {RightLabel = "→"}, true, {
                onSelected = function()
                    TriggerServerEvent('ls:spawnVehicle', "flatbed")
                    RageUI.CloseAll()
                end
            })
            
        end)
        
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openedLSGarage = false
        end

        Wait(0)
    end
end

function openAutoExoticGarage()
    local mainMenu = RageUI.CreateMenu('', 'Benny’s Original Motor Works')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openedautoexoticGarage do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Dépanneuse", nil, {RightLabel = "→"}, true, {
                onSelected = function()
                    TriggerServerEvent('autoexotic:spawnVehicle', "flatbed")
                    RageUI.CloseAll()
                end
            })
            
        end)
        
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openedautoexoticGarage = false
        end

        Wait(0)
    end
end

function openlarrysGarage()
    local mainMenu = RageUI.CreateMenu('', 'Benny’s Original Motor Works')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openedlarrysGarage do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Dépanneuse", nil, {RightLabel = "→"}, true, {
                onSelected = function()
                    TriggerServerEvent('larrys:spawnVehicle', "flatbed")
                    RageUI.CloseAll()
                end
            })
            
        end)
        
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openedlarrysGarage = false
        end

        Wait(0)
    end
end

CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob) do
            local mc = v.pointdelveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(20,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,247,247,247,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                        if IsControlJustPressed(0, 51) then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)

CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob2) do
            local mc = v.pointdelveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(20,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,247,247,247,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                        if IsControlJustPressed(0, 51) then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)

CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob3) do
            local mc = v.pointdelveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(20,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,247,247,247,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                        if IsControlJustPressed(0, 51) then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)


CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob4) do
            local mc = v.pointdelveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(20,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,247,247,247,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                        if IsControlJustPressed(0, 51) then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)

local jobs = {
    "mecano",
    "autoexotic",
    "larrys",
    "mecano2"
}

-- Blips à afficher pour tous les jobs listés ci-dessus
local sharedBlipsData = {
    {x = 2403.674072, y = 3127.705322, z = 48.15, blipSprite = 446, blipScale = 0.7, blipColor = 5, blipName = "[Farm] Création kit carroserie"},
    {x = -122.360611, y = 6205.425293, z = 32.38, blipSprite = 446, blipScale = 0.7, blipColor = 5, blipName = "[Farm] Création kit nettoyage"}
}

local activeBlips = {}
local blipsVisible = false

Citizen.CreateThread(function()
    while true do
        if ESX.PlayerData and ESX.PlayerData.job then
            local currentJobName = ESX.PlayerData.job.name

            -- Vérifie si le job est dans la liste autorisée
            local isAllowed = false
            for _, job in pairs(jobs) do
                if currentJobName == job then
                    isAllowed = true
                    break
                end
            end

            if isAllowed then
                if not blipsVisible then
                    for _, v in pairs(sharedBlipsData) do
                        local blip = AddBlipForCoord(v.x, v.y, v.z)
                        SetBlipSprite(blip, v.blipSprite)
                        SetBlipScale(blip, v.blipScale)
                        SetBlipColour(blip, v.blipColor)
                        SetBlipAsShortRange(blip, true)
                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentString(v.blipName)
                        EndTextCommandSetBlipName(blip)

                        table.insert(activeBlips, blip)
                    end
                    blipsVisible = true
                end
            else
                if blipsVisible then
                    for _, blip in pairs(activeBlips) do
                        RemoveBlip(blip)
                    end
                    activeBlips = {}
                    blipsVisible = false
                end
            end
        end
        Wait(1000)
    end
end)


Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local coordsPed = GetEntityCoords(ped)
            for k,v in pairs(jobs) do 
                if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == v then
                    if GetDistanceBetweenCoords(coordsPed.x, coordsPed.y, coordsPed.z, -122.155136, 6205.111328, 32.38) < 10 then
                        DrawMarker(2, -122.155136, 6205.111328, 33.38 - 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 180.0, 0.3, 0.3, 0.3, 0, 85, 255, 100, false, true, 2, nil, nil, false)
                    end
                    if GetDistanceBetweenCoords(coordsPed.x, coordsPed.y, coordsPed.z, -122.155136, 6205.111328, 32.38) < 3 then 
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ créer un kit de nettoyage")
                        if IsControlJustPressed(50, 38) then
                            FreezeEntityPosition(PlayerPedId(), true)
                            exports["rprogress"]:Start('', 2500)
                            FreezeEntityPosition(PlayerPedId(), false)
                            TriggerServerEvent("craftMecano", "cleankit")
                        end
                    else
                        Wait(1000)
                    end
                end
            end
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local coordsPed = GetEntityCoords(ped)
            for k,v in pairs(jobs) do 
                if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == v then
                    if GetDistanceBetweenCoords(coordsPed.x, coordsPed.y, coordsPed.z, 2403.696289, 3127.770752, 48.15) < 10 then
                        DrawMarker(2, 2403.696289, 3127.770752, 49.15 - 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 180.0, 0.3, 0.3, 0.3, 0, 85, 255, 100, false, true, 2, nil, nil, false)
                    end
                    if GetDistanceBetweenCoords(coordsPed.x, coordsPed.y, coordsPed.z, 2403.696289, 3127.770752, 48.15) < 3 then 
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ créer un kit de carrosserie")
                        if IsControlJustPressed(50, 38) then
                            FreezeEntityPosition(PlayerPedId(), true)
                            exports["rprogress"]:Start('', 2500)
                            FreezeEntityPosition(PlayerPedId(), false)
                            TriggerServerEvent("craftMecano", "carokit")
                        end
                    else
                        Wait(1000)
                    end
                end
            end
        Wait(0)
    end
end)