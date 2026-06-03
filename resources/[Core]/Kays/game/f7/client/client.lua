local ArgentSale = {}
local Items = {}
local Armes = {}
local infosvehicle = {}
DragStatus = {}
DragStatus.IsDragged          = false
local IsCuffedHands = false

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.ESX, function(obj) ESX = obj end)
        Wait(500)
    end
end)

Citizen.CreateThread(function()
    while ESX.GetPlayerData().job2 == nil do
		Wait(500)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job)
    ESX.PlayerData.job2 = job
end)

-- MENU F7
local CrewOptions = {
    InfosCrew = {},
    InfosTerritoires = {},
    InfosStatsPanel = {},
    ServerCrews = {},
    ShowTerritoires = false
}

openF7 = function()
    local mainMenu = RageUI.CreateMenu("", "Action Illégal")
    local f7territoires = RageUI.CreateSubMenu(mainMenu, "", "Informations sur les territoires")
    local interactveh = RageUI.CreateSubMenu(mainMenu, "", "Interactions avec un véhicule")

    local interaction = RageUI.CreateSubMenu(mainMenu, "", "Interactions avec le kidnappé")
    local fouiller = RageUI.CreateSubMenu(interaction, "", "Action Illégal")
    local lesinfosduvehicle = RageUI.CreateSubMenu(interactveh, "", "Action Illégal")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do

        RageUI.IsVisible(mainMenu, function()
            if GetResourceState("Territories") == "started" then
                RageUI.Button("Informations territoires", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback("Piwel_Territoires:GetAllTerritoires", function(cb)
                            CrewOptions.InfosTerritoires = cb
                            RageUI.Visible(f7territoires, not RageUI.Visible(f7territoires))
                        end)
                    end
                }, nil)
                RageUI.Button(((CrewOptions.ShowTerritoires and "Enlever") or (not CrewOptions.ShowTerritoires and "Afficher")).." les territoires sur la carte", nil, {RightLabel = ""}, true, {
                    onSelected = function()
                        CrewOptions.ShowTerritoires = not CrewOptions.ShowTerritoires
                        TriggerEvent('Piwel_Territoires:ShowTerritoires', CrewOptions.ShowTerritoires)
                    end
                })
            end
            if not exports.Gamemode:IsInSafeZone() and not exports.Gamemode:IsInMenotte() and not exports.Gamemode:IsInPorter() and not exports.Gamemode:IsInOtage() then
                RageUI.Button("Interaction avec le kidnappé", nil, {RightLabel = "→"}, true, {
                }, interaction)
                RageUI.Button("Interaction avec les voiture", nil, {RightLabel = "→"}, true, {
                }, interactveh)
            else
                RageUI.Button("Interaction avec le kidnappé", "Action impossible en safe zone", {RightLabel = RageUI.BadgeStyle.Lock}, false, {
                }, interaction)
                RageUI.Button("Interaction avec les voiture", "Action impossible en safe zone", {RiRightLabel = RageUI.BadgeStyle.Lock}, false, {
                }, interactveh)
            end
        end)

        RageUI.IsVisible(f7territoires, function()
            for k,v in pairs(CrewOptions.InfosTerritoires) do
                RageUI.Button(k, nil, {RightLabel = (((string.upper(ESX.PlayerData.job2.name)) == (v.id_crew_owner ~= nil and string.upper(v.id_crew_owner)) and "✅") or "❌")}, true, {
                    onActive = function()
                        CrewOptions.InfosStatsPanel.show = true
                        CrewOptions.InfosStatsPanel.zone = k
                        if v.id_crew_owner then
                            CrewOptions.InfosStatsPanel.control = string.upper(v.id_crew_owner)
                        else
                            CrewOptions.InfosStatsPanel.control = "Aucun"
                        end

                        if CrewOptions.InfosTerritoires[k].crews_points[tostring(v.id_crew_owner)] then
                            CrewOptions.InfosStatsPanel.owner_points = CrewOptions.InfosTerritoires[k].crews_points[tostring(v.id_crew_owner)]
                        else
                            CrewOptions.InfosStatsPanel.owner_points = 0
                        end

                        if CrewOptions.InfosTerritoires[k].crews_points[tostring(ESX.PlayerData.job2.name)] then
                            CrewOptions.InfosStatsPanel.crew_points = CrewOptions.InfosTerritoires[k].crews_points[tostring(ESX.PlayerData.job2.name)]
                        else
                            CrewOptions.InfosStatsPanel.crew_points = 0
                        end
                        CrewOptions.InfosStatsPanel.missing_points = CrewOptions.InfosStatsPanel.owner_points - CrewOptions.InfosStatsPanel.crew_points
                        CrewOptions.InfosStatsPanel.control2 = v.control1
                    end
                })
            end
        end, function()
            if CrewOptions.InfosStatsPanel.show and CrewOptions.InfosStatsPanel.control then
                RageUI.Info("Informations Zone", {"Nom de la zone", "Controlé par", "Nombre de points", "Vos Points", "Points manquants"}, {
                    CrewOptions.InfosStatsPanel.zone,
                    CrewOptions.InfosStatsPanel.control,
                    tostring(CrewOptions.InfosStatsPanel.owner_points),
                    tostring(CrewOptions.InfosStatsPanel.crew_points),
                    tostring(CrewOptions.InfosStatsPanel.missing_points)
                })
            end
        end)

        RageUI.IsVisible(interaction, function()
            -- RageUI.Button("Prendre la carte d'identité", nil, {RightLabel = "→"}, true , {
            --     onSelected = function()
            --         local player, distance = ESX.Game.GetClosestPlayer()
            --         local getPlayerSearch = GetPlayerPed(player)
            --         if IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
            --             if distance ~= -1 and distance <= 3.0 then
            --                 RageUI.CloseAll()
            --                 ExecuteCommand("me Prend la carte d'identité..")
            --                 TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
            --             else
            --                 ESX.ShowNotification(''..'Personne autour de vous')
            --             end
            --         else
            --             ESX.ShowNotification("Cette personne ne lève pas les mains")
            --         end
            --     end
            -- })
            RageUI.Button("Fouiller", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local player, distance = ESX.Game.GetClosestPlayer()
                    local getPlayerSearch = GetPlayerPed(player)
                    if IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
                        if player ~= -1 and distance <= 3.0 then
                            TriggerServerEvent('message', GetPlayerServerId(player))
                            getPlayerInv(player)
                        else
                            ESX.ShowNotification("Personne autour de vous")
                        end
                    else
                        ESX.ShowNotification("La personne en face ne lève pas les mains")
                    end
                end
            }, fouiller)
    
--[[            RageUI.Button("Menotter/Démenotter", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    local getPlayerSearch = GetPlayerPed(closestPlayer)
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('Personne autour de vous')
                    else
                        if IsEntityPlayingAnim(getPlayerSearch, 'mp_arresting', 'idle', 3) then
                            TriggerServerEvent('illegal:menotter', GetPlayerServerId(closestPlayer))
                        else
                            if not IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
                                ESX.ShowNotification("La personne en face lève pas les mains en l'air")
                            else
                                TriggerServerEvent('illegal:menotter', GetPlayerServerId(closestPlayer))
                            end
                        end
                    end
                end
            })
]]
    
--[[            RageUI.Button("Escorter", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    playerheading = GetEntityHeading(PlayerPedId())
                    playerlocation = GetEntityForwardVector(PlayerPedId())
                    playerCoords = GetEntityCoords(PlayerPedId())
                    local target_id = GetPlayerServerId(target)
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('Personne autour de vous')
                    else
                        TriggerServerEvent('illegal:escorter', GetPlayerServerId(closestPlayer))
                    end
                end
            })
    
            RageUI.Button("Jeter dans le véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('Personne autour de vous')
                    else
                        TriggerServerEvent('illegal:putInVehicle', GetPlayerServerId(closestPlayer))
                    end
                end
            })

            RageUI.Button("Sortir du véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('Personne autour de vous')
                    else
                        TriggerServerEvent('illegal:OutVehicle', GetPlayerServerId(closestPlayer))
                    end
                end
            })]]
        end)

        RageUI.IsVisible(interactveh, function()
            RageUI.Button("Informations du véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local coords  = GetEntityCoords(PlayerPedId())
                    local vehicle = ESX.Game.GetVehicleInDirection()
                    local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
                    if DoesEntityExist(vehicle) then
                        getInfosVehicle(vehicleData)
                    else
                        ESX.ShowNotification("[~r~Impossible~s~] Aucun véhicule à proximité")
                    end
                end
            }, lesinfosduvehicle)
            --[[RageUI.Button("Crocheter le véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local coords  = GetEntityCoords(PlayerPedId())
                    local vehicle = ESX.Game.GetVehicleInDirection()
                    if DoesEntityExist(vehicle) then
                        local plyPed = PlayerPedId()
    
                        TaskStartScenarioInPlace(plyPed, 'WORLD_HUMAN_WELDING', 0, true)
                        Wait(20000)
                        ClearPedTasksImmediately(plyPed)
    
                        SetVehicleDoorsLocked(vehicle, 1)
                        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                        ESX.ShowNotification("Véhicule dévérouillé")
                    else
                        ESX.ShowNotification("Aucun véhicule à proximité")
                    end
                end
            })]]
        end)

        RageUI.IsVisible(fouiller, function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            local getPlayerSearch = GetPlayerPed(closestPlayer)
            if not IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
                RageUI.GoBack()
                ESX.ShowNotification("La personne en face ne lève pas les mains")
                return
            end

            if closestPlayer == -1 or closestDistance > 3.0 then
                RageUI.GoBack()
                return
            end
    
            RageUI.Separator("Vous Fouillez : " ..GetPlayerName(closestPlayer))

            RageUI.Separator("↓ ~b~Argent non déclaré ~s~↓")

            for k,v in pairs(ArgentSale) do
                RageUI.Button("Argent non déclaré :", nil, {RightLabel = "~g~"..v.label.."$"}, true , {
                    onSelected = function()
                        local combien = KeyboardInputOrga("Combien ?", 'Indiquez un nombre', '', 4)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification("Montant invalide")
                        else
                            TriggerServerEvent('confiscatePlayerItemF7', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end

            RageUI.Separator("↓ ~b~Items du joueur ~s~↓")

            for k,v in pairs(Items) do
                RageUI.Button("Nom: "..v.label, nil, {RightLabel = "~g~"..v.right.." exemplaires"}, true , {
                    onSelected = function()
                        local combien = KeyboardInputOrga("Combien ", 'Indiquez un nombre', '', 10)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification("Montant invalide")
                        else
                            TriggerServerEvent('confiscatePlayerItemF7', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end
            
            RageUI.Separator("↓ ~b~Armes du joueur ~s~↓")
            for k,v in pairs(Armes) do
                local isPermanent = ESX.IsWeaponPermanent(v.value)
                if not isPermanent then
                    RageUI.Button("Arme: "..v.label, nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            local combien = KeyboardInputOrga("Nombre de munitions", 'Indiquez un nombre', '', 4)
                            if tonumber(combien) > 1 then
                                ESX.ShowNotification("Montant invalide")
                            else
                                TriggerServerEvent('confiscatePlayerItemF7', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                                RageUI.GoBack()
                            end
                        end
                    })
                end
            end

        end)

        RageUI.IsVisible(lesinfosduvehicle, function()
            local vehicle = ESX.Game.GetVehicleInDirection()
            if not DoesEntityExist(vehicle) then
                RageUI.GoBack()
                return
            end
            for k,v in pairs(infosvehicle) do
                RageUI.Button("Propriétaire: "..v.label, nil, {RightLabel = "→"}, isInService , {
                })
                RageUI.Button("Plaque: "..v.plaque, nil, {RightLabel = "→"}, isInService , {
                })
            end
        end)

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(f7territoires) and not RageUI.Visible(interaction) and not RageUI.Visible(lesinfosduvehicle) and not RageUI.Visible(fouiller) and not RageUI.Visible(interactveh) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
        end

        if not RageUI.Visible(lesinfosduvehicle) then
            table.remove(infosvehicle, k)
        end

        if not RageUI.Visible(fouiller) then
            table.remove(ArgentSale, k)
            table.remove(Items, k)
            table.remove(Armes, k)
        end

        Wait(0)
    end
end

Citizen.CreateThread(function()
    while true do
        local sleepThread = 1000
        if IsCuffedHands then
            sleepThread = 0
            if not IsEntityPlayingAnim(PlayerPedId(), 'mp_arresting', 'idle', 3) then
                TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
            end
            DisableControlAction(2, 37, true)
            SetEnableHandcuffs(PlayerPedId(), true)
            SetPedCanPlayGestureAnims(PlayerPedId(), false)
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, 37, true) -- Select Weapon
            DisableControlAction(0, 47, true)  -- Disable weapon
        end
        Wait(sleepThread)
    end
end)

RegisterNetEvent('illegal:menotterlejoueur')
AddEventHandler('illegal:menotterlejoueur', function()
    RequestAnimDict('mp_arresting')
    while not HasAnimDictLoaded('mp_arresting') do
        Wait(100)
    end
    IsCuffedHands = not IsCuffedHands;
    if IsCuffedHands then
        TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
    else
        ClearPedSecondaryTask(PlayerPedId())
        SetEnableHandcuffs(PlayerPedId(), false)
        SetPedCanPlayGestureAnims(PlayerPedId(),  true)
    end
end)

RegisterNetEvent('putInVehicle')
AddEventHandler('putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if not IsCuffedHands then
		return
	end

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				dragStatus.isDragged = false
			end
		end
	end
end)

RegisterNetEvent('outofVehicle')
AddEventHandler('outofVehicle', function()
    local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

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

function getPlayerInv(player)
    
    ESX.TriggerServerCallback('getOtherPlayerData', function(data)
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

Citizen.CreateThread(function()
    while true do
        local interval = 750
        if IsCuffedHands then
            interval = 0
            if IsDragged then
                local ped = GetPlayerPed(GetPlayerFromServerId(GangPed))
                local myped = PlayerPedId()
                AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
            else
                DetachEntity(PlayerPedId(), true, false)
            end
        end
        Wait(interval)
    end
end)

function KeyboardInputOrga(entryTitle, textEntry, inputText, maxLength)
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

Keys.Register('F7','Interactgang', 'Actions gangs', function()
    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.name ~= "unemployed2" and ESX.PlayerData.job2.name ~= "unemployed" then
        
        openF7()
    end
end)

RegisterNetEvent('OpenVehicleCrochetage')
AddEventHandler('OpenVehicleCrochetage', function()
    -- Bloque l'action si le joueur est en safezone, menotté, porté ou otage
    if exports.Gamemode:IsInSafeZone() or exports.Gamemode:IsInMenotte() or exports.Gamemode:IsInPorter() or exports.Gamemode:IsInOtage() then
        ESX.ShowNotification("Action impossible dans cette zone ou dans votre état actuel.")
        return
    end

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle = ESX.Game.GetVehicleInDirection()

    if DoesEntityExist(vehicle) then
        TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
        ESX.ShowNotification("Crochetage en cours...")
        ExecuteCommand('me utilise un outils de crochetage')
        Wait(15000)
        ClearPedTasksImmediately(playerPed)

        local success = math.random(1, 100)

        if success <= 80 then -- 60% de chance de réussir
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            ESX.ShowNotification("[~g~Succès~s~] Le véhicule est déverrouillé.")
        else
            ESX.ShowNotification("[~r~Échec~s~] Le kit a été utilisé sans succès.")
        end

        -- Retire le kit dans tous les cas
        TriggerServerEvent("CheckCrochetage")
    else
        ESX.ShowNotification("Aucun véhicule en face de vous.")
    end
end)
