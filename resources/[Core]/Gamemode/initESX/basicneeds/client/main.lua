--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX          = nil
local IsDead = false
local IsAnimated = false
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(10)
	end
end)

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function()
	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#05ee7e', function(status)
		return true
	end, function(status)
		status.remove(100)
	end)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#00b6ff', function(status)
		return true
	end, function(status)
		status.remove(75)
	end)

	Citizen.CreateThread(function()
		while true do
			Wait(1000)

			local playerPed  = PlayerPedId()
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			if health ~= prevHealth then
				SetEntityHealth(playerPed, health)
			end
		end
	end)
end)

AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_burger_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
				exports["rprogress"]:Start('', 4000)

				--Wait(4000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ld_flow_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, -8, -1, 49, 0, 0, 0, 0)
				exports["rprogress"]:Start('', 4000)

			--	Wait(4000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:oncoffee')
AddEventHandler('esx_basicneeds:oncoffee', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'p_amb_coffeecup_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 2.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@world_human_drinking@coffee@male@idle_a', function()
				TaskPlayAnim(playerPed, 'amb@world_human_drinking@coffee@male@idle_a', 'idle_c', 8.0, -8, -1, 49, 0, 0, 0, 0)
				exports["rprogress"]:Start('', 6000)

			--	Wait(6000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onsoda')
AddEventHandler('esx_basicneeds:onsoda', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ecola_can'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.058, 0.004, 18.0, 1200.0, 180.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@pnq', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
				exports["rprogress"]:Start('', 3000)

				--Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)



RegisterNetEvent('esx_basicneeds:onDrogue')
AddEventHandler('esx_basicneeds:onDrogue', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_crackpipe'
		IsAnimated = true

		Citizen.CreateThread(function() 
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.05, 0.02, -50.0, 16.0, 60.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8, -1, 49, 0, 0, 0, 0)
				exports["rprogress"]:Start('', 8000)

				--Wait(8000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end 
end)


RegisterNetEvent('esx_basicneeds:onsandwich')
AddEventHandler('esx_basicneeds:onsandwich', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_sandwich_01'
		IsAnimated = true

		Citizen.CreateThread(function() 
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.05, 0.02, -50.0, 16.0, 60.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8, -1, 49, 0, 0, 0, 0)
				exports["rprogress"]:Start('', 8000)

				--Wait(8000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end 
end)

RegisterNetEvent('esx_basicneeds:onchocolat')
AddEventHandler('esx_basicneeds:onchocolat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_choc_ego'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 60309)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8, -1, 49, 0, 0, 0, 0)
				exports["rprogress"]:Start('', 8000)

				--Wait(8000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop) 
			end)
		end)

	end
end)



RegisterNetEvent('esx_basicneeds:ondonut')
AddEventHandler('esx_basicneeds:ondonut', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_amb_donut'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.05, 0.02, -50.0, 16.0, 60.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8, -1, 49, 0, 0, 0, 0)
				exports["rprogress"]:Start('', 5000)

				--Wait(5000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

--[[local staminaBoostActive = false
local staminaBoostEndTime = 0

RegisterNetEvent('stamina:useBoost')
AddEventHandler('stamina:useBoost', function()
    -- Vérifier si l'effet est déjà actif
    if staminaBoostActive then
        ESX.ShowNotification("Vous avez déjà activé votre endurance infinie.")
        return
    end

    staminaBoostActive = true
    staminaBoostEndTime = GetGameTimer() + 300000 -- 300000 ms = 5 minutes

    -- Activer l'endurance infinie
    ESX.ShowNotification("Endurance infinie activée pendant ~s~5 minutes~s~!")

    -- Créer une boucle qui vérifie régulièrement si les 2 minutes sont écoulées
    Citizen.CreateThread(function()
        while staminaBoostActive do
            -- Vérifier si le temps est écoulé
            if GetGameTimer() > staminaBoostEndTime then
                staminaBoostActive = false
                ESX.ShowNotification("Votre Endurance infinie est ~s~Terminée.~s~")
                break
            end

            -- Donner de l'endurance infinie (Réinitialiser la stamina et la définir à 100%)
            SetPlayerMaxStamina(PlayerId(), 100.0)
            ResetPlayerStamina(PlayerId())

            Wait(0)
        end
    end)
end)
]]





RegisterNetEvent('applyDrunkEffect')
AddEventHandler('applyDrunkEffect', function()
    local playerPed = PlayerPedId()
    local duration = 60000
    
    SetTimecycleModifier("Drunk")
    SetTimecycleModifierStrength(0.8)
    StartScreenEffect("DrugsMichaelAliensFight", 0, true)
    SetPedMotionBlur(playerPed, true)
    
    RequestAnimSet("move_m@drunk@verydrunk")
    while not HasAnimSetLoaded("move_m@drunk@verydrunk") do Wait(100) end
    SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", 1.0)
    
    for i = 1, 10 do
        SetTimecycleModifierStrength(i / 7)
        SetEntityHealth(playerPed, GetEntityHealth(playerPed) - 1) 
        SetPedMoveRateOverride(playerPed, 1.5)
        Wait(duration / 10)
    end
    
    Wait(5000)
    
    for i = 10, 1, -1 do
        SetTimecycleModifierStrength(i / 7)
        SetPedMoveRateOverride(playerPed, 1.0)
        Wait(duration / 10)
    end
    
    ClearTimecycleModifier()
    StopScreenEffect("DrugsMichaelAliensFight")
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(playerPed, 0.0)
end)

RegisterNetEvent('applyDrugEffect')
AddEventHandler('applyDrugEffect', function()
    local playerPed = PlayerPedId()
    local duration = 60000
    
    SetTimecycleModifier("drug_flying_base")
    SetTimecycleModifierStrength(1.5)
    StartScreenEffect("DrugsMichaelAliensFight", 0, true)
    SetPedMotionBlur(playerPed, true)
    
    RequestAnimSet("move_m@drunk@verydrunk")
    while not HasAnimSetLoaded("move_m@drunk@verydrunk") do Wait(100) end
    SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", 1.0)
    
    for i = 1, 10 do
        SetTimecycleModifierStrength(i / 7)
        SetEntityHealth(playerPed, GetEntityHealth(playerPed) - 1) 
        SetPedMoveRateOverride(playerPed, 1.5)
        Wait(duration / 10)
    end
    
    Wait(5000)
    
    for i = 10, 1, -1 do
        SetTimecycleModifierStrength(i / 7)
        SetPedMoveRateOverride(playerPed, 1.0)
        Wait(duration / 10)
    end
    
    ClearTimecycleModifier()
    StopScreenEffect("DrugsMichaelAliensFight")
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(playerPed, 0.0)
end)

-- Redbull

local staminaBoostActive = false
local staminaBoostEndTime = 0

RegisterNetEvent('stamina:useBoost')
AddEventHandler('stamina:useBoost', function()
    -- Vérifier si l'effet est déjà actif
    if staminaBoostActive then
        ESX.ShowNotification("Vous avez déjà activé votre endurance infinie.")
        return
    end

    staminaBoostActive = true
    staminaBoostEndTime = GetGameTimer() + 300000 -- 300000 ms = 5 minutes

    -- Activer l'endurance infinie
    ESX.ShowNotification("Endurance infinie activée pendant ~r~5 minutes~s~!")

    -- Créer une boucle qui vérifie régulièrement si les 2 minutes sont écoulées
    Citizen.CreateThread(function()
        while staminaBoostActive do
            -- Vérifier si le temps est écoulé
            if GetGameTimer() > staminaBoostEndTime then
                staminaBoostActive = false
                ESX.ShowNotification("Votre Endurance infinie est ~r~Terminée.~s~")
                break
            end

            -- Donner de l'endurance infinie (Réinitialiser la stamina et la définir à 100%)
            SetPlayerMaxStamina(PlayerId(), 100.0)
            ResetPlayerStamina(PlayerId())

            Citizen.Wait(0)
        end
    end)
end)
