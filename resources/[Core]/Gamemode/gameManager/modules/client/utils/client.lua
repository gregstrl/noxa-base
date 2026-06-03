--[[
  This file is part of wise RolePlay.
  Copyright (c) wise RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local ESX = nil

local IsInPVP = false;

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
        Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

--[[-- PNJ DENSITY
CreateThread(function()
    while true do
        Wait(0) -- Boucle infinie pour appliquer en continu
        SetPedDensityMultiplierThisFrame(0.05) -- 1% de la densité normale des PNJ
        SetVehicleDensityMultiplierThisFrame(0.06) -- Réduit la densité des voitures
        SetRandomVehicleDensityMultiplierThisFrame(0.03) -- Très peu de véhicules aléatoires
        SetParkedVehicleDensityMultiplierThisFrame(0.0) -- Très peu de véhicules garés
        SetScenarioPedDensityMultiplierThisFrame(0.01, 0.01) -- Réduit drastiquement les PNJ de scénarios
        SetGarbageTrucks(false) -- Désactive les camions poubelles
        SetRandomBoats(false) -- Désactive les bateaux aléatoires
        SetCreateRandomCops(false) -- Désactive les flics aléatoires
        SetCreateRandomCopsNotOnScenarios(false) -- Désactive les flics hors scénarios
        SetCreateRandomCopsOnScenarios(false) -- Désactive les flics en scénario
    end
end)

CreateThread(function()
    local trucks = {
        [`bus`] = true, [`airbus`] = true, [`coach`] = true, [`pbus`] = true
    }

    -- Bloquer le spawn des camions PNJ
    for model in pairs(trucks) do
        SetVehicleModelIsSuppressed(model, true)
    end

    while true do
        Wait(5000) -- Vérifie toutes les 10 secondes pour réduire la charge serveur

        local vehicles = GetGamePool("CVehicle") -- Récupère tous les véhicules existants

        for _, vehicle in ipairs(vehicles) do
            local model = GetEntityModel(vehicle)

            -- Vérifier si c'est un camion de la liste et qu'il est conduit par un PNJ
            if trucks[model] then
                local driver = GetPedInVehicleSeat(vehicle, -1)

                if driver ~= 0 and not IsPedAPlayer(driver) then
                    DeleteEntity(vehicle)
                end
            end
        end
    end
end)
]]


local IsCuffed = false
local isDead = false


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('esx:onPlayerDeath', function()
	isDead = true
end)

AddEventHandler('baseevents:onPlayerDied', function()
    isDead = true
end)

AddEventHandler('playerSpawned', function()
	isDead = false
end)


RegisterNetEvent('fow_handcuff:thecuff')
AddEventHandler('fow_handcuff:thecuff', function(NeedMove, _)
	if NeedMove then
		IsCuffed = true
	elseif not NeedMove then
		IsCuffed = false
	end
end)

local piggyBackInProgress = false
local holdingHostageInProgress, beingHeldHostage, holdingHostage = false, false
local takeHostageAnimNamePlaying, takeHostageAnimDictPlaying, takeHostageControlFlagPlaying = '', '', 0

local hostageAllowedWeapons = {
	'WEAPON_PISTOL',
	'WEAPON_GLOCK17',
	'WEAPON_PISTOL_MK2',
	'WEAPON_COMBATPISTOL',
	'WEAPON_PISTOL50',
	'WEAPON_SNSPISTOL',
	'WEAPON_SNSPISTOL_MK2',
	'WEAPON_HEAVYPISTOL',
	'WEAPON_VINTAGEPISTOL',
	'WEAPON_REVOLVER',
	'WEAPON_REVOLVER_MK2',
	'WEAPON_DOUBLEACTION',
	'WEAPON_APPISTOL'
}

function releaseHostage()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

	if closestDistance ~= -1 and closestDistance <= 3 then
		local target = GetPlayerServerId(closestPlayer)

		local lib = 'reaction@shove'
		local anim1 = 'shove_var_a'
		local lib2 = 'reaction@shove'
		local anim2 = 'shoved_back'
		local distans = 0.11
		local distans2 = -0.24
		local height = 0.0
		local spin = 0.0
		local length = 100000
		local controlFlagMe = 120
		local controlFlagTarget = 0
		local animFlagTarget = 1
		local attachFlag = false

		TriggerServerEvent('cmg3_animations:sync', lib, lib2, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget, attachFlag)
	end
end

RegisterNetEvent('carrying')
AddEventHandler('carrying', function()
	local plyPed = PlayerPedId()
	if not (SafeZone:playerIsIn())then
		if not (IsCuffed) then
			if not piggyBackInProgress and not exports.Gamemode:IsInTrunk() then

				if isDead == false then
					piggyBackInProgress = true
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	
					if closestDistance ~= -1 and closestDistance <= 3 then
						local target = GetPlayerServerId(closestPlayer)
	
						local lib = 'anim@arena@celeb@flat@paired@no_props@'
						local anim1 = 'piggyback_c_player_a'
						local anim2 = 'piggyback_c_player_b'
						local distans = -0.07
						local distans2 = 0.0
						local height = 0.45
						local length = 100000
						local spin = 0.0
						local controlFlagMe = 49
						local controlFlagTarget = 33
						local animFlagTarget = 1
	
						TriggerServerEvent('cmg2_animations:sync', lib, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget)
					end
				end
			else
				ESX.ShowNotification("Vous ne pouvez pas faire cela en etant porter")
		end
			else
			ESX.ShowNotification("Vous ne pouvez pas faire cela en etant menotter")
		end
	else
		ESX.ShowNotification("Vous ne pouvez pas porter en SafeZone")
	end
end)

IsInPorter = function()
	if piggyBackInProgress == true then
		return true
	else
		return false
	end
end


RegisterNetEvent('hostage')
AddEventHandler('hostage', function()
	local plyPed = PlayerPedId()
	if not (SafeZone:playerIsIn())then
		if not (IsCuffed) then
			if isDead == false then
			local currentWeapon = GetSelectedPedWeapon(plyPed)
			local canTakeHostage, foundWeapon = false, false

			ClearPedSecondaryTask(plyPed)
			DetachEntity(plyPed, true, false)

			for i = 1, #hostageAllowedWeapons do
				if currentWeapon == hostageAllowedWeapons[i] then
					canTakeHostage = true
					foundWeapon = hostageAllowedWeapons[i]
				end
			end

			if not foundWeapon then
				for i = 1, #hostageAllowedWeapons do
					if HasPedGotWeapon(plyPed, hostageAllowedWeapons[i], false) then
						if GetAmmoInPedWeapon(plyPed, hostageAllowedWeapons[i]) > 0 then
							canTakeHostage = true
							foundWeapon = hostageAllowedWeapons[i]
							break
						end
					end
				end
			end

			if canTakeHostage then
				if not holdingHostageInProgress then
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

					if closestDistance ~= -1 and closestDistance <= 3 then
						local target = GetPlayerServerId(closestPlayer)

						if IsPlayerDead(closestPlayer) then
							ESX.ShowNotification("Vous ne pouvez prendre en otage ce joueur")
						else
							local lib = 'anim@gangops@hostage@'
							local anim1 = 'perp_idle'
							local lib2 = 'anim@gangops@hostage@'
							local anim2 = 'victim_idle'
							local distans = 0.11
							local distans2 = -0.24
							local height = 0.0
							local spin = 0.0
							local length = 100000
							local controlFlagMe = 49
							local controlFlagTarget = 49
							local animFlagTarget = 50
							local attachFlag = true

							SetCurrentPedWeapon(plyPed, foundWeapon, true)
							holdingHostageInProgress = true
							holdingHostage = true
							TriggerServerEvent('cmg3_animations:sync', lib, lib2, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget, attachFlag)
						end
					else
						ESX.ShowNotification("Aucun joueur à proximité")
					end
				end
			else
				ESX.ShowNotification("Vous avez besoin d'un pistolet pour prendre un otage")
			end
		else
			ESX.ShowNotification("Vous ne pouvez pas faire cela en etant mort")
	end
		else
			ESX.ShowNotification("Vous ne pouvez pas prendre en étant menotter")
		end
	else
		ESX.ShowNotification("Vous ne pouvez pas prendre en otage en SafeZone")
	end
end)

RegisterNetEvent('cmg2_animations:syncTarget')
AddEventHandler('cmg2_animations:syncTarget', function(targetId, animationLib, animation2, distans, distans2, height, length, spin, controlFlag)
	local target = GetPlayerFromServerId(targetId)

	if target == PlayerId() or target < 1 then
		return
	end

	local plyPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)

	if piggyBackInProgress then
		piggyBackInProgress = false
	else
		piggyBackInProgress = true
	end

	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Wait(10)
	end

	spin = spin or 180.0

	AttachEntityToEntity(plyPed, targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	piggyBackInProgress = true

	if controlFlag == nil then
		controlFlag = 0
	end

	TaskPlayAnim(plyPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('cmg2_animations:syncMe')
AddEventHandler('cmg2_animations:syncMe', function(animationLib, animation, length, controlFlag, animFlag)
	local plyPed = PlayerPedId()
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Wait(10)
	end

	Wait(500)

	if controlFlag == nil then
		controlFlag = 0
	end

	TaskPlayAnim(plyPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	Wait(length)
end)

RegisterNetEvent('cmg2_animations:cl_stop')
AddEventHandler('cmg2_animations:cl_stop', function()
	local plyPed = PlayerPedId()
	ClearPedSecondaryTask(plyPed)
	DetachEntity(plyPed, true, false)
end)

RegisterNetEvent('cmg3_animations:syncTarget')
AddEventHandler('cmg3_animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length, spin, controlFlag, animFlagTarget, attach)
	local plyPed = PlayerPedId()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	if holdingHostageInProgress then
		holdingHostageInProgress = false
	else
		holdingHostageInProgress = true
	end

	beingHeldHostage = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Wait(10)
	end

	if spin == nil then
		spin = 180.0
	end

	if attach then
		AttachEntityToEntity(plyPed, targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	end

	if controlFlag == nil then
		controlFlag = 0
	end

	if animation2 == 'victim_fail' then
		SetEntityHealth(plyPed, 0)
		DetachEntity(plyPed, true, false)
		TaskPlayAnim(plyPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
		beingHeldHostage = false
		holdingHostageInProgress = false
	elseif animation2 == 'shoved_back' then
		holdingHostageInProgress = false
		DetachEntity(plyPed, true, false)
		TaskPlayAnim(plyPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
		beingHeldHostage = false
	else
		TaskPlayAnim(plyPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	end

	takeHostageAnimNamePlaying = animation2
	takeHostageAnimDictPlaying = animationLib
	takeHostageControlFlagPlaying = controlFlag
end)

RegisterNetEvent('cmg3_animations:syncMe')
AddEventHandler('cmg3_animations:syncMe', function(animationLib, animation, length, controlFlag, animFlag)
	local plyPed = PlayerPedId()

	ClearPedSecondaryTask(plyPed)
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Wait(10)
	end

	if controlFlag == nil then
		controlFlag = 0
	end

	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	takeHostageAnimNamePlaying = animation
	takeHostageAnimDictPlaying = animationLib
	takeHostageControlFlagPlaying = controlFlag

	if animation == 'perp_fail' then
		SetPedShootsAtCoord(plyPed, 0.0, 0.0, 0.0, 0)
		holdingHostageInProgress = false
	elseif animation == 'shove_var_a' then
		Wait(900)
		ClearPedSecondaryTask(plyPed)
		holdingHostageInProgress = false
	end
end)

RegisterNetEvent('cmg3_animations:cl_stop')
AddEventHandler('cmg3_animations:cl_stop', function()
	local plyPed = PlayerPedId()

	holdingHostageInProgress = false
	beingHeldHostage = false
	holdingHostage = false

	ClearPedSecondaryTask(plyPed)
	DetachEntity(plyPed, true, false)
end)

Citizen.CreateThread(function()
	while true do
		if (holdingHostage or beingHeldHostage) and takeHostageAnimDictPlaying ~= '' and takeHostageAnimNamePlaying ~= '' then
			while not IsEntityPlayingAnim(PlayerPedId(), takeHostageAnimDictPlaying, takeHostageAnimNamePlaying, 3) do
				TaskPlayAnim(PlayerPedId(), takeHostageAnimDictPlaying, takeHostageAnimNamePlaying, 8.0, -8.0, 100000, takeHostageControlFlagPlaying, 0, false, false, false)
				Wait(0)
			end
		end

		Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(2)

		if piggyBackInProgress then
			DisableControlAction(0, 21, true) -- INPUT_SPRINT
			DisableControlAction(2, 37, true) -- INPUT_weapon
			DisableControlAction(0, 22, true) -- INPUT_JUMP
			DisableControlAction(0, 24, true) -- INPUT_ATTACK
			DisableControlAction(0, 44, true) -- INPUT_COVER
			DisableControlAction(0, 45, true) -- INPUT_RELOAD
			DisableControlAction(0, 140, true) -- INPUT_MELEE_ATTACK_LIGHT
			DisableControlAction(0, 141, true) -- INPUT_MELEE_ATTACK_HEAVY
			DisableControlAction(0, 142, true) -- INPUT_MELEE_ATTACK_ALTERNATE
			DisableControlAction(0, 143, true) -- INPUT_MELEE_BLOCK
			DisableControlAction(0, 144, true) -- PARACHUTE DEPLOY
			DisableControlAction(0, 145, true) -- PARACHUTE DETACH
			DisableControlAction(0, 243, true) -- INPUT_ENTER_CHEAT_CODE
			DisableControlAction(0, 257, true) -- INPUT_ATTACK2
			DisableControlAction(0, 263, true) -- INPUT_MELEE_ATTACK1
			DisableControlAction(0, 264, true) -- INPUT_MELEE_ATTACK2
			DisableControlAction(0, 73, true) -- INPUT_X
			SetFlashLightKeepOnWhileMoving(true)
			SetWeaponsNoAutoswap(1)
			SetAmbientZoneStatePersistent("collision_ybmrar", false, true)
			N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.20)

		end
	end
end)

-- AUTO SWAP


local function AddLongString(txt)
	for i = 100, string.len(txt), 99 do
		local sub = string.sub(txt, i, i + 99)
		AddTextComponentSubstringPlayerName(sub)
	end
end

function FloatingHelpText(text, sound, loop)
	BeginTextCommandDisplayHelp("jamyfafi")
	AddTextComponentSubstringPlayerName(text)
	if string.len(text) > 99 then
		AddLongString(text)
	end
	EndTextCommandDisplayHelp(0, loop or 0, sound or true, -1)
end

RegisterCommand('porter', function()

	if not (IsInPVP) then

		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

		if (IsPedInAnyVehicle(PlayerPedId())) then return ESX.ShowNotification("Vous ne pouvez pas faire ceci en voiture") end
		if (closestDistance ~= -1 and closestDistance >= 3) then return ESX.ShowNotification("Aucun joueur à proximité") end

		if (holdingHostage) then return; end
		if (beingHeldHostage) then return; end
		if (holdingHostageInProgress) then return; end
		
		TriggerEvent('carrying');
	end

end)

RegisterCommand('otage', function()

	if not (IsInPVP) then

		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

		if (IsPedInAnyVehicle(PlayerPedId())) then return ESX.ShowNotification("Vous ne pouvez pas faire ceci en voiture") end
		if (closestDistance ~= -1 and closestDistance >= 3) then return ESX.ShowNotification("Aucun joueur à proximité") end

		if (piggyBackInProgress) then return; end
		if (beingHeldHostage) then return; end

		TriggerEvent('hostage');
	end

end)

local function StopSynced(closestPlayer, isOnGround, z, vehicle)
	piggyBackInProgress = false
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
	local target = GetPlayerServerId(closestPlayer);
	if (vehicle or isOnGround) then
		TriggerServerEvent('cmg2_animations:stop', target, 1, z);
	else
		TriggerServerEvent('cmg2_animations:stop', target, 0, z);
	end
end

Citizen.CreateThread(function()
	while true do
		if (piggyBackInProgress) then
			
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
			local ped = PlayerPedId();

			local coords = GetEntityCoords(ped);
			local _, z = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, true, false);
			local isOnGround = coords.z - z < 5.0 and coords.z - z > -5.0;

			if (IsPedInAnyVehicle(ped)) then StopSynced(closestPlayer, isOnGround, z, true); end

			if closestDistance ~= -1 and closestDistance <= 3 then

				FloatingHelpText("Appuyez sur ~INPUT_CONTEXT~ pour lacher l'individue.", true);
				if (IsControlJustPressed(0, 51) or IsDisabledControlPressed(0, 51)) then
					StopSynced(closestPlayer, isOnGround, z);
				end
				
			else
				StopSynced(closestPlayer, isOnGround, z);
			end
		end
		if (holdingHostage) then
			local plyPed = PlayerPedId()
			local plyCoords = GetEntityCoords(plyPed);
			local vehicle = GetVehiclePedIsTryingToEnter(plyPed);

			if (vehicle ~= 0) then 
				SetPlayerMayNotEnterAnyVehicle(PlayerId());
				holdingHostage = false
				holdingHostageInProgress = false

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3 then
					local target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent('cmg3_animations:stop', target)
				end

				Wait(100);
				releaseHostage();
			end

			if IsEntityDead(plyPed) then
				holdingHostage = false
				holdingHostageInProgress = false

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3 then
					local target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent('cmg3_animations:stop', target)
				end

				Wait(100)
				releaseHostage()
			end

			DisableControlAction(0, 24, true) -- disable attack
			DisableControlAction(0, 25, true) -- disable aim
			DisableControlAction(0, 47, true) -- disable weapon
			DisableControlAction(0, 58, true) -- disable weapon
			DisablePlayerFiring(plyPed, true)

			FloatingHelpText("Appuyer sur ~INPUT_CONTEXT~ pour relâcher.")
			if (IsControlJustPressed(0, 51) or IsDisabledControlPressed(0, 51)) then
				holdingHostage = false
				holdingHostageInProgress = false

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3 then
					local target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent('cmg3_animations:stop', target)
				end

				Wait(100)
				releaseHostage()
			end
		end

		if (beingHeldHostage) then
			DisableControlAction(0, 21, true) -- disable sprint
			DisableControlAction(0, 24, true) -- disable attack
			DisableControlAction(0, 25, true) -- disable aim
			DisableControlAction(0, 47, true) -- disable weapon
			DisableControlAction(0, 58, true) -- disable weapon
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 142, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 75, true) -- disable exit vehicle
			DisableControlAction(27, 75, true) -- disable exit vehicle
			DisableControlAction(0, 22, true) -- disable jump
			DisableControlAction(0, 32, true) -- disable move up
			DisableControlAction(0, 268, true)
			DisableControlAction(0, 33, true) -- disable move down
			DisableControlAction(0, 269, true)
			DisableControlAction(0, 34, true) -- disable move left
			DisableControlAction(0, 270, true)
			DisableControlAction(0, 35, true) -- disable move right
			DisableControlAction(0, 271, true)
		end

		Wait(0)
	end
end)

exports("IsInPorter", function()
	return piggyBackInProgress
end)

exports("IsInOtage", function()
	return holdingHostageInProgress
end)


-- EMPECHER LES CITOYEN DE VOLER LES VOITURE LSPD EMS

local vehicles = {
	"polbikeb", "polbikeb2", "bcpd10", "polalamop2", "polbuffalop", "polfugitivep",
	"polgauntletp", "polscoutp", "polbuffalop", "polstalkerp", "polstanierp",
	"poltorencep", "coach2", "halfback2", "inaugural2", "emsalamo", "emsamb3",
	"emsamb2", "emsscout", "r1200emsls", "gt3rspolice", "nscouttrafpol", "roadrunner3",
	"trualamo3", "trualamo4", "umkalamo", "usssflag", "bufsxtrafpol", "command",
	"hazard2", "polspeedop", "swatvanr2", "swatinsur", "swatstoc", "maverick2",
	"policejpheli", "amb_rox_sheriff", "amb_rox_sheriff2", "amb_rox_sheriffb",
	"amb_rox_swat",
}

local allowedJobs = {
	["sahp"] = true,
	["lsco"] = true,
	["ambulance"] = true,
	["usms"] = true,
	["gouv"] = true,
	["sasp"] = true,
}

local function isAllowedVehicle(vehicleModel)
	for _, model in ipairs(vehicles) do
		if GetHashKey(model) == vehicleModel then
			return true
		end
	end
	return false
end

AddEventHandler("gameEventTriggered", function(name, args)
	if name == "CEventNetworkPlayerEnteredVehicle" and args[1] == PlayerId() then
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(ped, false)

		if vehicle ~= 0 and args[2] == vehicle then
			local vehicleModel = GetEntityModel(vehicle)
			if isAllowedVehicle(vehicleModel) then
				if GetPedInVehicleSeat(vehicle, -1) == ped then
					local playerData = ESX.GetPlayerData()
					if playerData.job and allowedJobs[playerData.job.name] then
						SetVehicleUndriveable(vehicle, false)
					else
						ESX.ShowNotification("Un système de sécurité t'empêche de démarrer")
						while GetVehiclePedIsIn(ped, false) == vehicle do
							SetVehicleUndriveable(vehicle, true)
							Wait(5)
						end
					end
				end
			end
		end
	end
end)


RegisterCommand("co",function()
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    print(coords)
    print(heading)
end)

--local function CreateCamForShop()
--    CreateThread(function()
--        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
--
--        SetCamActive(cam, true)
--        SetCamCoord(cam, -2163.206, -413.7233, 14.0577)
--        SetCamFov(cam, 45.0)
--        PointCamAtCoord(cam, -2165.846, -420.18, 13.33516)
--
--        RenderScriptCams(1, 1, 1500, 0, 0)
--    end)
--end
--
--local function KillCam()
--    RenderScriptCams(0, 1, 1500, 0, 0)
--    SetCamActive(cam, false)
--    ClearPedTasks(PlayerPedId())
--    DestroyAllCams(true)
--end
--
--local function Repair(vehicle)
--
--	if (not DoesEntityExist(vehicle)) then
--		return
--	end
--
--	SetVehicleFixed(vehicle)
--	SetVehicleDeformationFixed(vehicle)
--	SetVehicleOnGroundProperly(vehicle)
--
--end
--
--RegisterNetEvent('boutique:repairVehicle', function(model)
--	Repair(model)
--end)
--
--active = false
--RegisterCommand("Camera", function(source)
--	active = not active
--	ESX.ShowNotification(("Camera : ~g~%s~s~"):format(active == true and "actif" or "inactif"))
--	if active then
--		CreateCamForShop()
--		SetEntityCoords(PlayerPedId(), -2166.725, -411.7843, 13.35174)
--		FreezeEntityPosition(PlayerPedId(), true)
--	else
--		KillCam()
--		FreezeEntityPosition(PlayerPedId(), false)
--	end
--end)
--
--RegisterCommand("photobou", function(source, args)
--	local lavoiture = args[1]
--	ExecuteCommand("dv 10")
--	Wait(500)
--	TriggerServerEvent("boutique:spawnVehicle", lavoiture)
--end)

-- MASK FIX



local buttonSeat = { [157] = -1, [158] = 0, [160] = 1, [164] = 2, [165] = 3, [159] = 4, [161] = 5, [162] = 6, [163] = 7 }
local blockShuffle = true

Citizen.CreateThread(function()

    while true do
        local attente = 1500

        local Player = PlayerPedId()
        local veh = GetVehiclePedIsIn(Player, false)
        local speed = GetEntitySpeed(veh)*3.6
    
        if IsPedInAnyVehicle(Player, false) then
            attente = 1
            for key, seat in pairs(buttonSeat) do
                if IsDisabledControlJustPressed(1, key) and IsVehicleSeatFree(veh, seat) then
                    if speed > 15 then 
                        ESX.ShowNotification("Vous ne pouvez pas changer de place, ralentissez !")
                    else
                        SetPedIntoVehicle(Player, veh, seat)
                        blockShuffle = seat == 0
                        Wait(2000)
                    end
                end
            end
        end
        Wait(attente)
    end
end)

-- NEIGE PERMANENTE

--[[Citizen.CreateThread(function()
    while true 
        do

        SetWeatherTypePersist("SNOW")
        SetWeatherTypeNowPersist("SNOW")
        SetWeatherTypeNow("SNOW")
        SetOverrideWeather("SNOW")

        Wait(1)
    end

end)]]
