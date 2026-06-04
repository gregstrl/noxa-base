ESX = nil
local PlayerData = {}

local silencers = {
	'COMPONENT_AT_PI_SUPP',
	'COMPONENT_AT_SR_SUPP',
	'COMPONENT_AT_AR_SUPP',
	'COMPONENT_AT_AR_SUPP_02',
	'COMPONENT_AT_PI_SUPP_02',

	'w_at_ar_a15rc_supp',
	'w_at_ar_lr300_supp',
	'w_at_sb_h2smg_supp',
	'w_at_pi_fn502_supp',
	'w_at_pi_cz75_supp',
	'w_at_ar_acwr_supp',
	'w_at_ar_anarchy_supp',
	'w_at_ar_ak47_supp',
	'w_at_ar_g3_2_supp',
	'w_at_ar_howa_2_supp',
	'w_at_ar_scarsc_supp',
	'w_at_pi_pl14_supp',
	'w_at_ar_g36_supp'
}	

local grips = {
	'COMPONENT_AT_AR_AFGRIP', -- Most Weapons 
	'COMPONENT_AT_AR_AFGRIP_02', -- MK2 Weapons

	'w_at_ar_a15rc_grip',
	'w_at_ar_lr300_grip',
	'w_at_ar_acwr_grip',
	'w_at_ar_anarchy_grip',
	'w_at_ar_ak47_grip',
	'w_at_ar_g3_2_grip',
	'w_at_ar_howa_2_grip',
	'w_at_ar_scarsc_grip',
	'w_at_ar_g36_grip'

}

local flashlights = {
	'COMPONENT_AT_PI_FLSH', 
	'COMPONENT_AT_PI_FLSH_03',
	'COMPONENT_AT_PI_FLSH_02',
	'COMPONENT_AT_AR_FLSH',

	'w_at_pi_knr_flsh',
	'w_at_pi_pl14_flsh'
}

local scopes = {
	'COMPONENT_AT_SCOPE_MACRO_MK2',
	'COMPONENT_AT_PI_RAIL_02',
	'COMPONENT_AT_SCOPE_MACRO',
	'COMPONENT_AT_SCOPE_MACRO_02',
	'COMPONENT_AT_SCOPE_MACRO_02_MK2',
	'COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2',
	'COMPONENT_AT_SCOPE_SMALL',
	'COMPONENT_AT_SCOPE_MEDIUM',

	'w_at_ar_a15rc_scope',
	'w_at_ar_lr300_scope',
	'w_at_sb_h2smg_scope',
	'w_at_pi_knr_scope',
	'w_at_ar_acwr_scope',
	'w_at_ar_anarchy_scope',
	'w_at_ar_ak47_scope',
	'w_at_ar_g3_2_scope',
	'w_at_ar_howa_2_scope',
	'w_at_ar_scarsc_scope',
	'w_at_ar_g36_scope'
}
local magazines = {
	'COMPONENT_SMG_CLIP_03',
	'COMPONENT_MACHINEPISTOL_CLIP_03',
	'COMPONENT_COMBATPDW_CLIP_03',
	'COMPONENT_HEAVYSHOTGUN_CLIP_03',
	'COMPONENT_ASSAULTRIFLE_CLIP_03',
	'COMPONENT_CARBINERIFLE_CLIP_03',
	'COMPONENT_SPECIALCARBINE_CLIP_03',
	'COMPONENT_COMPACTRIFLE_CLIP_03'

}
local extended_clips = {
	'COMPONENT_PISTOL_CLIP_02',
	'COMPONENT_COMBATPISTOL_CLIP_02',
	'COMPONENT_APPISTOL_CLIP_02',
	'COMPONENT_PISTOL50_CLIP_02',
	'COMPONENT_SNSPISTOL_CLIP_02',
	'COMPONENT_HEAVYPISTOL_CLIP_02',
	'COMPONENT_SNSPISTOL_MK2_CLIP_02',
	'COMPONENT_PISTOL_MK2_CLIP_02',
	'COMPONENT_VINTAGEPISTOL_CLIP_02',
	'COMPONENT_MICROSMG_CLIP_02',
	'COMPONENT_ASSAULTSMG_CLIP_02',
	'COMPONENT_MINISMG_CLIP_02',
	'COMPONENT_SMG_MK2_CLIP_02',
	'COMPONENT_MACHINEPISTOL_CLIP_02',
	'COMPONENT_COMBATPDW_CLIP_02',
	'COMPONENT_ASSAULTSHOTGUN_CLIP_02',
	'COMPONENT_HEAVYSHOTGUN_CLIP_02',
	'COMPONENT_ASSAULTRIFLE_CLIP_02',
	'COMPONENT_CARBINERIFLE_CLIP_02',
	'COMPONENT_ADVANCEDRIFLE_CLIP_02',
	'COMPONENT_SPECIALCARBINE_CLIP_02',
	'COMPONENT_BULLPUPRIFLE_CLIP_02',
	'COMPONENT_BULLPUPRIFLE_MK2_CLIP_02',
	'COMPONENT_SPECIALCARBINE_MK2_CLIP_02',
	'COMPONENT_ASSAULTRIFLE_MK2_CLIP_02',
	'COMPONENT_CARBINERIFLE_MK2_CLIP_02',
	'COMPONENT_COMPACTRIFLE_CLIP_02',
	'COMPONENT_MILITARYRIFLE_CLIP_02',
	'COMPONENT_MG_CLIP_02',
	'COMPONENT_COMBATMG_CLIP_02',
	'COMPONENT_COMBATMG_MK2_CLIP_02',
	'COMPONENT_GUSENBERG_CLIP_02',
	'COMPONENT_MARKSMANRIFLE_MK2_CLIP_02',
	'COMPONENT_HEAVYSNIPER_MK2_CLIP_02',
	'COMPONENT_MARKSMANRIFLE_CLIP_02'
	
}
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(100)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('components:useSilencer')
AddEventHandler('components:useSilencer', function()
	local ped = PlayerPedId()
	local found = false
	local index = 0
	currWea = GetSelectedPedWeapon(ped)
	for i= 1 , #silencers, 1 do
		if DoesWeaponTakeWeaponComponent(currWea,GetHashKey(silencers[i])) then
			found = true 
			index = i
			break 
		end 
	end
	if found then 
		if not HasPedGotWeaponComponent(ped, currWea ,GetHashKey(silencers[index])) then 
			GiveWeaponComponentToPed(ped, currWea, GetHashKey(silencers[index]))
			ESX.ShowNotification("Added silencer to weapon")
		else
			ESX.ShowNotification("Silencieux déjà installé")
		end
	else
		ESX.ShowNotification("Cette arme ne prend pas de silencieux")
	end
end)

RegisterNetEvent('components:useGrip')
AddEventHandler('components:useGrip', function()
	local ped = PlayerPedId()
	local found = false
	local index = 0
	currWea = GetSelectedPedWeapon(ped)
	for i= 1 , #grips, 1 do
		if DoesWeaponTakeWeaponComponent(currWea,GetHashKey(grips[i])) then
			found = true 
			index = i
			break 
		end 
	end
	if found then 
		if not HasPedGotWeaponComponent(ped, currWea ,GetHashKey(grips[index])) then 
			GiveWeaponComponentToPed(ped, currWea, GetHashKey(grips[index]))
			ESX.ShowNotification("Ajout de la poignée à l'arme")
		else
			ESX.ShowNotification("Grip déjà équipé")
		end
	else
		ESX.ShowNotification("Cette arme ne prend pas de grip")
	end
end)
RegisterNetEvent('components:useFlashlight')
AddEventHandler('components:useFlashlight', function()
	local ped = PlayerPedId()
	local found = false
	local index = 0
	currWea = GetSelectedPedWeapon(ped)
	for i= 1 , #flashlights, 1 do
		if DoesWeaponTakeWeaponComponent(currWea,GetHashKey(flashlights[i])) then
			found = true 
			index = i
			break 
		end 
	end
	if found then 
		if not HasPedGotWeaponComponent(ped, currWea ,GetHashKey(flashlights[index])) then 
			GiveWeaponComponentToPed(ped, currWea, GetHashKey(flashlights[index]))
			ESX.ShowNotification("Ajout d'une lampe torche à l'arme")
		else
			ESX.ShowNotification("Lampe torche déjà équipée")
		end
	else
		ESX.ShowNotification("Cette arme ne supporte pas de lampe de poche")
	end
end)

RegisterNetEvent('components:useScope')
AddEventHandler('components:useScope', function()
	local ped = PlayerPedId()
	local found = false
	local index = 0
	currWea = GetSelectedPedWeapon(ped)
	for i= 1 , #scopes, 1 do
		if DoesWeaponTakeWeaponComponent(currWea,GetHashKey(scopes[i])) then
			found = true 
			index = i
			break 
		end 
	end
	if found then 
		if not HasPedGotWeaponComponent(ped, currWea ,GetHashKey(scopes[index])) then 
			GiveWeaponComponentToPed(ped, currWea, GetHashKey(scopes[index]))
			ESX.ShowNotification("Ajout d'une lunette à l'arme")
		else
			ESX.ShowNotification("Lunette de visée déjà équipé")
		end
	else
		ESX.ShowNotification("Cette arme ne prend pas de lunette de visée")
	end
end)

RegisterNetEvent('components:useMagazine')
AddEventHandler('components:useMaganize', function()
	local ped = PlayerPedId()
	local found = false
	local index = 0
	currWea = GetSelectedPedWeapon(ped)
	for i= 1 , #magazines, 1 do
		if DoesWeaponTakeWeaponComponent(currWea,GetHashKey(magazines[i])) then
			found = true 
			index = i
			break 
		end 
	end
	if found then 
		if not HasPedGotWeaponComponent(ped, currWea ,GetHashKey(magazines[index])) then 
			GiveWeaponComponentToPed(ped, currWea, GetHashKey(magazines[index]))
			ESX.ShowNotification("Ajout d'un chargeur à une arme")
		else
			ESX.ShowNotification("Magazine déjà équipé")
		end
	else
		ESX.ShowNotification("Cette arme ne prend pas de chargeur")
	end
end)

RegisterNetEvent('components:useExtendedClip')
AddEventHandler('components:useExtendedClip', function()
	local ped = PlayerPedId()
	local found = false
	local index = 0
	currWea = GetSelectedPedWeapon(ped)
	for i= 1 , #extended_clips, 1 do
		if DoesWeaponTakeWeaponComponent(currWea,GetHashKey(extended_clips[i])) then
			found = true 
			index = i
			break 
		end 
	end
	if found then 
		if not HasPedGotWeaponComponent(ped, currWea ,GetHashKey(extended_clips[index])) then 
			GiveWeaponComponentToPed(ped, currWea, GetHashKey(extended_clips[index]))
			ESX.ShowNotification("Ajout d'un chargeur étendu à l'arme")
		else
			ESX.ShowNotification("Extended Clip déjà équipé")
		end
	else
		ESX.ShowNotification("Cette arme n'accepte pas de chargeur prolongé")
	end
end)