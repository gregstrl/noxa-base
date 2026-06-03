local isLoadoutLoaded, isPaused, disableUi, isPlayerSpawned, isDead, pickups, IsInPVP = false, false, false, false, false, {}, false;

-- Initialisation des paramètres audio et des relations
Citizen.CreateThread(function()
    StartAudioScene('CHARACTER_CHANGE_IN_SKY_SCENE')
    SetAudioFlag("PoliceScannerDisabled", true)
    
    -- Configuration initiale des relations
    local playerGroup = GetHashKey("PLAYER")
    local groups = {
        "CIVMALE", "CIVFEMALE", "SECURITY_GUARD", "PRIVATE_SECURITY", "DEALER",
        "HATES_PLAYER", "HEN", "WILD_ANIMAL", "SHARK", "COUGAR", "SPECIAL",
        "MISSION2", "MISSION3", "MISSION4", "MISSION5", "MISSION6", "MISSION7",
        "MISSION8", "ARMY", "GUARD_DOG", "AGGRESSIVE_INVESTIGATE", "CAT", "COP",
        "MEDIC", "FIREMAN", "GANG_1", "GANG_2", "GANG_9", "GANG_10",
        "AMBIENT_GANG_LOST", "AMBIENT_GANG_MEXICAN", "AMBIENT_GANG_FAMILY",
        "AMBIENT_GANG_BALLAS", "AMBIENT_GANG_MARABUNTE", "AMBIENT_GANG_CULT",
        "AMBIENT_GANG_SALVA", "AMBIENT_GANG_WEICHENG", "AMBIENT_GANG_HILLBILLY",
        "PRISONER"
    }
    
    for _, group in ipairs(groups) do
        SetRelationshipBetweenGroups(0, GetHashKey(group), playerGroup)
    end
end)

-- Désactivation des scénarios et des services de dispatch
Citizen.CreateThread(function()
    local scenarios = {
        'WORLD_VEHICLE_ATTRACTOR', 'WORLD_VEHICLE_AMBULANCE', 'WORLD_VEHICLE_BICYCLE_BMX',
        'WORLD_VEHICLE_BICYCLE_BMX_BALLAS', 'WORLD_VEHICLE_BICYCLE_BMX_FAMILY',
        'WORLD_VEHICLE_BICYCLE_BMX_HARMONY', 'WORLD_VEHICLE_BICYCLE_BMX_VAGOS',
        'WORLD_VEHICLE_BICYCLE_MOUNTAIN', 'WORLD_VEHICLE_BICYCLE_ROAD',
        'WORLD_VEHICLE_BIKE_OFF_ROAD_RACE', 'WORLD_VEHICLE_BIKER',
        'WORLD_VEHICLE_BOAT_IDLE', 'WORLD_VEHICLE_BOAT_IDLE_ALAMO',
        'WORLD_VEHICLE_BOAT_IDLE_MARQUIS', 'WORLD_VEHICLE_BROKEN_DOWN',
        'WORLD_VEHICLE_BUSINESSMEN', 'WORLD_VEHICLE_HELI_LIFEGUARD',
        'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER', 'WORLD_VEHICLE_CONSTRUCTION_SOLO',
        'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS', 'WORLD_VEHICLE_DRIVE_PASSENGERS',
        'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED', 'WORLD_VEHICLE_DRIVE_SOLO',
        'WORLD_VEHICLE_FIRE_TRUCK', 'WORLD_VEHICLE_EMPTY', 'WORLD_VEHICLE_MARIACHI',
        'WORLD_VEHICLE_MECHANIC', 'WORLD_VEHICLE_MILITARY_PLANES_BIG',
        'WORLD_VEHICLE_MILITARY_PLANES_SMALL', 'WORLD_VEHICLE_PARK_PARALLEL',
        'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN', 'WORLD_VEHICLE_PASSENGER_EXIT',
        'WORLD_VEHICLE_POLICE_BIKE', 'WORLD_VEHICLE_POLICE_CAR', 'WORLD_VEHICLE_POLICE',
        'WORLD_VEHICLE_POLICE_NEXT_TO_CAR', 'WORLD_VEHICLE_QUARRY', 'WORLD_VEHICLE_SALTON',
        'WORLD_VEHICLE_SALTON_DIRT_BIKE', 'WORLD_VEHICLE_SECURITY_CAR',
        'WORLD_VEHICLE_STREETRACE', 'WORLD_VEHICLE_TOURBUS', 'WORLD_VEHICLE_TOURIST',
        'WORLD_VEHICLE_TANDL', 'WORLD_VEHICLE_TRACTOR', 'WORLD_VEHICLE_TRACTOR_BEACH',
        'WORLD_VEHICLE_TRUCK_LOGS', 'WORLD_VEHICLE_TRUCKS_TRAILERS',
        'WORLD_VEHICLE_DISTANT_EMPTY_GROUND'
    }
    
    for _, scenario in ipairs(scenarios) do
        SetScenarioTypeEnabled(scenario, false)
    end
    
    for i = 1, 15 do
        EnableDispatchService(i, false)
    end
end)

-- Thread principal pour la gestion du HUD et des PNJ
Citizen.CreateThread(function()
    local playerId = PlayerId()
    local hudComponents = {1, 3, 4, 6, 7, 8, 9, 13, 17, 20}
    local lastPedCheck = 0
    local pedCheckInterval = 500
    
    while true do
        local currentTime = GetGameTimer()
        
        -- Gestion du HUD (toutes les frames)
        for _, component in ipairs(hudComponents) do
            HideHudComponentThisFrame(component)
        end
        
        -- Vérification des PNJ (toutes les 500ms)
        if currentTime - lastPedCheck >= pedCheckInterval then
            local pool = GetGamePool("CPed")
            for i = 1, #pool do
                SetPedDropsWeaponsWhenDead(pool[i], false)
            end
            lastPedCheck = currentTime
        end
        
        -- Vérification du niveau de recherche
        if GetPlayerWantedLevel(playerId) ~= 0 then
            SetPlayerWantedLevel(playerId, 0, false)
            SetPlayerWantedLevelNow(playerId, false)
        end
        
        -- Ignorer les PNJ
        SetEveryoneIgnorePlayer(playerId, true)
        
        Wait(0)
    end
end)

-- Gestion des zones de police
Citizen.CreateThread(function()
    local PosBL = {
        vector3(406.7928, -1006.758, 29.26582),
        vector3(-453.9952, 6004.273, 31.34049)
    }
    
    local checkInterval = 2000
    local lastCheck = 0
    
    for i = 1, 15 do
        Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
    end
    
    while true do
        local currentTime = GetGameTimer()
        if currentTime - lastCheck >= checkInterval then
            local playerCoords = GetEntityCoords(PlayerPedId())
            local shouldClearArea = false
            
            for _, pos in ipairs(PosBL) do
                local distance = #(playerCoords - pos)
                if distance < 100 then
                    shouldClearArea = true
                    checkInterval = 0
                    break
                end
            end
            
            if shouldClearArea then
                ClearAreaOfCops(playerCoords.x, playerCoords.y, playerCoords.z, 400.0)
            else
                checkInterval = 2000
            end
            
            lastCheck = currentTime
        end
        Wait(0)
    end
end)

local scenarios = {
    'WORLD_VEHICLE_ATTRACTOR',
    'WORLD_VEHICLE_AMBULANCE',
    'WORLD_VEHICLE_BICYCLE_BMX',
    'WORLD_VEHICLE_BICYCLE_BMX_BALLAS',
    'WORLD_VEHICLE_BICYCLE_BMX_FAMILY',
    'WORLD_VEHICLE_BICYCLE_BMX_HARMONY',
    'WORLD_VEHICLE_BICYCLE_BMX_VAGOS',
    'WORLD_VEHICLE_BICYCLE_MOUNTAIN',
    'WORLD_VEHICLE_BICYCLE_ROAD',
    'WORLD_VEHICLE_BIKE_OFF_ROAD_RACE',
    'WORLD_VEHICLE_BIKER',
    'WORLD_VEHICLE_BOAT_IDLE',
    'WORLD_VEHICLE_BOAT_IDLE_ALAMO',
    'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
    'WORLD_VEHICLE_BROKEN_DOWN',
    'WORLD_VEHICLE_BUSINESSMEN',
    'WORLD_VEHICLE_HELI_LIFEGUARD',
    'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER',
    'WORLD_VEHICLE_CONSTRUCTION_SOLO',
    'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS',
    'WORLD_VEHICLE_DRIVE_PASSENGERS',
    'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED',
    'WORLD_VEHICLE_DRIVE_SOLO',
    'WORLD_VEHICLE_FIRE_TRUCK',
    'WORLD_VEHICLE_EMPTY',
    'WORLD_VEHICLE_MARIACHI',
    'WORLD_VEHICLE_MECHANIC',
    'WORLD_VEHICLE_MILITARY_PLANES_BIG',
    'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
    'WORLD_VEHICLE_PARK_PARALLEL',
    'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN',
    'WORLD_VEHICLE_PASSENGER_EXIT',
    'WORLD_VEHICLE_POLICE_BIKE',
    'WORLD_VEHICLE_POLICE_CAR',
    'WORLD_VEHICLE_POLICE',
    'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
    'WORLD_VEHICLE_QUARRY',
    'WORLD_VEHICLE_SALTON',
    'WORLD_VEHICLE_SALTON_DIRT_BIKE',
    'WORLD_VEHICLE_SECURITY_CAR',
    'WORLD_VEHICLE_STREETRACE',
    'WORLD_VEHICLE_TOURBUS',
    'WORLD_VEHICLE_TOURIST',
    'WORLD_VEHICLE_TANDL',
    'WORLD_VEHICLE_TRACTOR',
    'WORLD_VEHICLE_TRACTOR_BEACH',
    'WORLD_VEHICLE_TRUCK_LOGS',
    'WORLD_VEHICLE_TRUCKS_TRAILERS',
    'WORLD_VEHICLE_DISTANT_EMPTY_GROUND'
  }

for i, v in ipairs(scenarios) do
    SetScenarioTypeEnabled(v, false)
end


-- Désactivation du service de dispatch au démarrage
Citizen.CreateThread(function()
    for i = 1, 15 do
        EnableDispatchService(i, false)
    end
end)

-- Vérification et suppression du niveau de recherche
Citizen.CreateThread(function()
    local playerId = PlayerId()
    while true do
        Wait(100) -- Vérification toutes les 100 ms

        -- Ignorer tous les PNJ pour le joueur
        SetEveryoneIgnorePlayer(playerId, true)

        -- Réinitialiser le niveau de recherche si nécessaire
        if GetPlayerWantedLevel(playerId) ~= 0 then
            SetPlayerWantedLevel(playerId, 0, false)
            SetPlayerWantedLevelNow(playerId, false)
        end
    end
end)

-- Masquage des composants HUD
Citizen.CreateThread(function()
    while true do
        Wait(3) -- Doit être effectué chaque frame pour le HUD

        -- Masquer les composants spécifiques du HUD
        HideHudComponentThisFrame(1)
        HideHudComponentThisFrame(3)
        HideHudComponentThisFrame(4)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(13)
        HideHudComponentThisFrame(17)
        HideHudComponentThisFrame(20)
    end
end)

CreateThread(function()
    while true do -- OPTIMIZED
        local pool = GetGamePool("CPed")
        for i = 1, #pool do
            local ped = pool[i]
            SetPedDropsWeaponsWhenDead(ped, false)
        end
        Wait(500)
    end
end);

Citizen.CreateThread(function()
    local SCENARIO_GROUPS = {
        2017590552,
        2141866469,
        1409640232,
        "ng_planes",
    }
    local SUPPRESSED_MODELS = {
        "SHAMAL",
        "LUXOR",
        "LUXOR2",
        "JET",
        "LAZER",
        "TITAN",
        "BARRACKS",
        "BARRACKS2",
        "CRUSADER",
        "RHINO",
        "AIRTUG",
        "RIPLEY",
		"POLMAV",
		"LGUARD",
		"BUZZARD",
		"BUZZARD2",
		"FROGGER",
		"FROGGER2",
		"SWIFT",
		"SWIFT2",
		"SUPERVOLITO",
		"SUPERVOLITO2",
		"CARGOBOB",
		"CARGOBOB2",
		"CARGOBOB3",
		"CARGOBOB4",
		"MAVERICK",
		"SOVEREIGN",
		"STOCKADE",
		"FIRETRUK",
		"AMBULANCE",
		"AIRBUS",
		"BUS",
		"COACH",
    }
    while true do -- OPTIMIZED
        for _, scgrp in next, SCENARIO_GROUPS do
            SetScenarioGroupEnabled(scgrp, false)
        end
        for _, model in next, SUPPRESSED_MODELS do
            SetVehicleModelIsSuppressed(GetHashKey(model), true)
        end
        Wait(5000)
    end
end)

local PosBL = {
    {pos = vector3(406.7928, -1006.758, 29.26582)},
    {pos = vector3(-453.9952, 6004.273, 31.34049)},
}

local WaitZonePDP = 2000

Citizen.CreateThread(function()
    for i = 1, 15 do
        Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
    end
    while true do -- OPTIMIZED
        Wait(WaitZonePDP)
        local playerLocalisation = GetEntityCoords(PlayerPedId())
        for k,v in pairs(PosBL) do
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.pos, true) < 100 then
                WaitZonePDP = 0
                ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
            else
                WaitZonePDP = 2000
            end
        end
    end
end)

local function HasWeapon(weaponHash)

	local hasWeapon = false;

	for _, weapon in pairs(ESX.PlayerData.loadout) do

		if (type(weapon) == "table") then

			if (type(weapon.name) == "string") then
				if (GetHashKey(weapon.name) == weaponHash) then
					hasWeapon = true;
				end
			end

		end
	end

	return hasWeapon;

end

---@param weaponName string
---@return table, number | boolean, nil
local function GetWeaponInLoadout(weaponName)

	for i = 1, #ESX.PlayerData.loadout do

		local weapon = ESX.PlayerData.loadout[i];

		if (type(weapon) == "table") then

			if (type(weapon.name) == "string") then

				if (weapon.name == weaponName) then

					return weapon, i

				end

			end

		end

	end

	return false, nil;

end

local function handleWeapons()

	CreateThread(function()

		while (ESX.PlayerLoaded) do

			Wait(2000);

			local ped = PlayerPedId();

			for i = 1, #Config.Weapons do
					
				local name = Config.Weapons[i].name;
				local hash = GetHashKey(name)
				local _hasWeapon = HasWeapon(hash);
				local _hasGameWeapon = HasPedGotWeapon(ped, hash, false);

				if (_hasGameWeapon and not _hasWeapon) then

					RemoveWeaponFromPed(ped, hash);
					SetPedInfiniteAmmo(ped, false, hash);

				elseif (_hasWeapon and not _hasGameWeapon) then

					GiveWeaponToPed(ped, hash, 0, false, false);

					local weaponType = ESX.GetWeaponType(name);

					if (weaponType) then

						local ammo = ESX.PlayerData.ammo[weaponType];
						SetPedAmmo(ped, hash, type(ammo) == "number" and ammo or 0);

						if (IsInPVP) then
							SetPedInfiniteAmmo(ped, true, hash);
						else
							SetPedInfiniteAmmo(ped, false, hash);
						end

					end

				end

				local playerWeapon = GetWeaponInLoadout(name);

				if (playerWeapon) then

					for j = 1, #playerWeapon.components do
						local weaponComponent = playerWeapon.components[j];
						local component = ESX.GetWeaponComponent(name, weaponComponent);
						local componentHash = component.hash;

						if (not HasPedGotWeaponComponent(ped, hash, componentHash)) then
							GiveWeaponComponentToPed(ped, hash, componentHash);
						end

					end

				end

			end
		end

	end);

end

local function KoyStartAmmoSaveLoop()

	CreateThread(function()

		local currentWeapon = {Ammo = 0}

		while ESX.PlayerLoaded do

			local sleep = 2000
			local ped = PlayerPedId();

			if (GetSelectedPedWeapon(ped) ~= -1569615261) then

				sleep = 1000;
				local _, weaponHash = GetCurrentPedWeapon(ped, true);

				local weapon = ESX.GetWeaponFromHash(weaponHash);

				if (weapon) then

					if (not IsInPVP) then

						local ammoCount = GetAmmoInPedWeapon(ped, weaponHash)

						if (weapon.name ~= currentWeapon.name) then

							currentWeapon.Ammo = ammoCount
							currentWeapon.name = weapon.name

						else

							if (ammoCount ~= currentWeapon.Ammo) then
								currentWeapon.Ammo = ammoCount
								TriggerServerEvent('Koy:updateWeaponAmmo', weapon.name, ammoCount);
							end

						end

					end

				end
			end

			Wait(sleep)

		end

	end);

end

RegisterNetEvent('esx:playerLoaded', function(xPlayer)

	ESX.PlayerLoaded = true;
	ESX.PlayerData = xPlayer;

	KoyStartAmmoSaveLoop();
	handleWeapons();

end);





RegisterNetEvent('esx:setMaxWeight')
AddEventHandler('esx:setMaxWeight', function(newMaxWeight)
	ESX.PlayerData.maxWeight = newMaxWeight
end)

AddEventHandler('playerSpawned', function(_, isFirstSpawn)
	while not ESX.PlayerLoaded do
		Wait(5)
	end

	TriggerEvent('esx:restoreLoadout')

	if (isFirstSpawn) then
		TriggerServerEvent('esx:positionSaveReady');
	end

	isLoadoutLoaded, isPlayerSpawned, isDead = true, true, false
	SetCanAttackFriendly(PlayerPedId(), true, true)
	NetworkSetFriendlyFireOption(true)
end)

AddEventHandler('esx:onPlayerDeath', function() isDead = true; end);

AddEventHandler('skinchanger:loadDefaultModel', function() isLoadoutLoaded = false end);

local function restoreLoadout()

	local ammoTypes = {};

	RemoveAllPedWeapons(PlayerPedId());

	for _, weapon in pairs(Config.Weapons) do

		if (type(weapon) == "table" and type(weapon.name) == "string") then

			local name = string.upper(weapon.name);
			local hash = GetHashKey(name);

			if (HasWeapon(hash)) then

				local ped = PlayerPedId();

				GiveWeaponToPed(ped, hash, 0, false, false);

				if (not IsInPVP) then

					local weaponType = ESX.GetWeaponType(name);

					if (weaponType) then

						if (not ammoTypes[weaponType]) then
							ammoTypes[weaponType] = type(ESX.PlayerData.ammo[weaponType]) == "number" and ESX.PlayerData.ammo[weaponType] or 0;
						end

						SetPedAmmo(ped, hash, ammoTypes[weaponType]);
						SetPedInfiniteAmmo(ped, false, hash);

						local playerWeapon = GetWeaponInLoadout(name);

						if (playerWeapon) then

							for j = 1, #playerWeapon.components, 1 do
								local weaponComponent = playerWeapon.components[j];
								local component = ESX.GetWeaponComponent(name, weaponComponent);
								local componentHash = component.hash;
								GiveWeaponComponentToPed(ped, hash, componentHash);
							end

						end

					end

				else

					SetPedAmmo(ped, hash, 250);
					SetPedInfiniteAmmo(ped, true, hash);

				end

			end

		end

	end

	isLoadoutLoaded = true;
end

AddEventHandler('esx:restoreLoadout', restoreLoadout);

AddEventHandler('skinchanger:modelLoaded', function()
	while not ESX.PlayerLoaded do
		Wait(1)
	end

	restoreLoadout();
end);

RegisterNetEvent("esx:refreshLoadout", function(playerLoadout, playerAmmo)

	ESX.PlayerData.loadout = playerLoadout;
	ESX.PlayerData.ammo = playerAmmo;
	restoreLoadout();
end);

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for i = 1, #ESX.PlayerData.accounts, 1 do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end

	ESX.UI.HUD.UpdateElement('account_' .. account.name, {
		money = ESX.Math.GroupDigits(account.money)
	});
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item)
    local found = false

    -- Rechercher l'objet dans l'inventaire
    for i = 1, #ESX.PlayerData.inventory, 1 do
        if ESX.PlayerData.inventory[i].name == item.name then
            ESX.PlayerData.inventory[i].count = ESX.PlayerData.inventory[i].count + item.count
            found = true
            break
        end
    end

    -- Si l'objet n'existe pas, l'ajouter
    if not found then
        table.insert(ESX.PlayerData.inventory, item)
    end

    -- Afficher la notification
    ESX.UI.ShowInventoryItemNotification(true, item.label, item.count)
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, identifier)
    for i = 1, #ESX.PlayerData.inventory, 1 do
        if ESX.PlayerData.inventory[i].name == item.name and (not identifier or (item.unique and ESX.PlayerData.inventory[i].extra.identifier and ESX.PlayerData.inventory[i].extra.identifier == identifier)) then
            
            -- Vérifier la quantité à retirer
            if ESX.PlayerData.inventory[i].count >= item.count then
                ESX.PlayerData.inventory[i].count = ESX.PlayerData.inventory[i].count - item.count
                ESX.UI.ShowInventoryItemNotification(false, item.label, item.count)

                -- Supprimer l'objet si sa quantité tombe à 0
                if ESX.PlayerData.inventory[i].count == 0 then
                    table.remove(ESX.PlayerData.inventory, i)
                end
            else
                print('Erreur : tentative de retirer plus d\'objets que disponible.')
            end
            break
        end
    end
end)

RegisterNetEvent('esx:updateItemCount', function(itemName, count)
    for i = 1, #ESX.PlayerData.inventory, 1 do
        if ESX.PlayerData.inventory[i].name == itemName then
            local currentCount = ESX.PlayerData.inventory[i].count
            local difference = math.abs(currentCount - count)
            local isAddition = count > currentCount

            -- Afficher la notification
            ESX.UI.ShowInventoryItemNotification(isAddition, ESX.PlayerData.inventory[i].label, difference)

            -- Mettre à jour la quantité
            ESX.PlayerData.inventory[i].count = count
            break
        end
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	ESX.UI.HUD.UpdateElement('job', {
		job_label = job.label,
		grade_label = job.grade_label
	})
	TriggerServerEvent('verifPossible', job.label)
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	ESX.PlayerData.job2 = job2

	ESX.UI.HUD.UpdateElement('job2', {
		job2_label = job2.label,
		grade2_label = job2.grade_label
	})
	TriggerServerEvent('verifPossible2', job2.label)
end)

RegisterNetEvent('esx:setGroup')
AddEventHandler('esx:setGroup', function(group, lastGroup)
	ESX.PlayerData.group = group
end)

RegisterNetEvent('esx:addWeapon')
AddEventHandler('esx:addWeapon', function(weaponName, weaponAmmo)
	local found = false

	local weaponType = ESX.GetWeaponType(weaponName);

	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			found = true
			break
		end
	end

	if not found then
		local playerPed = PlayerPedId()
		local weaponHash = GetHashKey(weaponName)
		local weaponLabel = ESX.GetWeaponLabel(weaponName)
		ESX.UI.ShowInventoryItemNotification(true, weaponLabel, false)

		table.insert(ESX.PlayerData.loadout, {
			name = weaponName,
			label = weaponLabel,
			components = {}
		})

		GiveWeaponToPed(playerPed, weaponHash, 0, false, false);

		if (weaponType) then

			ESX.PlayerData.ammo[weaponType] = weaponAmmo;
			SetPedAmmo(playerPed, weaponHash, weaponAmmo);

		else
			SetPedAmmo(playerPed, weaponHash, 0);
		end
	end
end)

RegisterNetEvent('esx:addWeaponComponent')
AddEventHandler('esx:addWeaponComponent', function(weaponName, weaponComponent)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

			if component then
				local found = false

				for j = 1, #ESX.PlayerData.loadout[i].components, 1 do
					if ESX.PlayerData.loadout[i].components[j] == weaponComponent then
						found = true
						break
					end
				end

				if not found then
					local playerPed = PlayerPedId()
					local weaponHash = GetHashKey(weaponName)

					ESX.UI.ShowInventoryItemNotification(true, component.label, false)
					table.insert(ESX.PlayerData.loadout[i].components, weaponComponent)
					GiveWeaponComponentToPed(playerPed, weaponHash, component.hash)
				end
			end
		end
	end
end)

RegisterNetEvent('esx:setWeaponAmmo', function(weaponName, weaponAmmo)

	local weaponType = ESX.GetWeaponType(weaponName);

	if (weaponType) then

		ESX.PlayerData.ammo[weaponType] = weaponAmmo;
		SetPedAmmo(PlayerPedId(), GetHashKey(weaponName), weaponAmmo);

	end

end)

RegisterNetEvent('esx:removeWeapon')
AddEventHandler('esx:removeWeapon', function(weaponName, ammo)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local weaponType = ESX.GetWeaponType(weaponName);
			local playerPed = PlayerPedId()
			local weaponHash = GetHashKey(weaponName)
			local weaponLabel = ESX.GetWeaponLabel(weaponName)

			ESX.UI.ShowInventoryItemNotification(false, weaponLabel, false)
			table.remove(ESX.PlayerData.loadout, i)
			RemoveWeaponFromPed(playerPed, weaponHash);

			if (ammo) then

				if (weaponType) then

					ESX.PlayerData.ammo[weaponType] = ammo;
					SetPedAmmo(playerPed, weaponHash, ammo);

				else

					SetPedAmmo(playerPed, weaponHash, 0);

				end

			else
				SetPedAmmo(playerPed, weaponHash, 0);
			end

			break
		end
	end
end)

RegisterNetEvent('esx:removeWeaponComponent')
AddEventHandler('esx:removeWeaponComponent', function(weaponName, weaponComponent)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

			if component then
				for j = 1, #ESX.PlayerData.loadout[i].components, 1 do
					if ESX.PlayerData.loadout[i].components[j] == weaponComponent then
						local playerPed = PlayerPedId()
						local weaponHash = GetHashKey(weaponName)

						ESX.UI.ShowInventoryItemNotification(false, component.label, false)
						table.insert(ESX.PlayerData.loadout[i].components, j)
						RemoveWeaponComponentFromPed(playerPed, weaponHash, component.hash)
						break
					end
				end
			end
		end
	end
end)

-- Commands
RegisterNetEvent('esx:teleport')
AddEventHandler('esx:teleport', function(coords)
	ESX.Game.Teleport(PlayerPedId(), coords)
end)

RegisterNetEvent("Koy:CanFight", function(canFight)
	ESX.PlayerData.canFight = canFight;
end);


AddEventHandler('tempui:toggleUi', function(value)
	disableUi = value
end)

-- Last position
CreateThread(function()
	while true do -- OPTIMIZED
		Wait(1000)

		local playerPed = PlayerPedId()

		if ESX.PlayerLoaded and isPlayerSpawned then
			if not IsEntityDead(playerPed) then
				ESX.PlayerData.lastPosition = GetEntityCoords(playerPed, false)
			end
		end

		if IsEntityDead(playerPed) and isPlayerSpawned then
			isPlayerSpawned = false
		end
	end
end)


Citizen.CreateThread(function()
    while true do -- NO OPTIMIZED
        Wait(5)
        DisablePlayerVehicleRewards(PlayerId())
    end
end)

Citizen.CreateThread(function()
	while not ESX.PlayerLoaded do
		Wait(10)
	end

	local playerPed = PlayerPedId()

	if playerPed and playerPed ~= -1 then
		while GetResourceState('Gamemode') ~= 'started' do
			Wait(10)
		end

		TriggerEvent('spawnmanager:spawnPlayer', {model = GetHashKey("mp_m_freemode_01"), coords = ESX.PlayerData.lastPosition, heading = 0.0})
		return
	end
end)

Citizen.CreateThread(function()
	while true do -- OPTIMIZED
		Wait(5)

		if NetworkIsSessionStarted() then
			TriggerServerEvent('esx:firstJoinProper')
			return
		end
	end
end)

local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10) -- Vérifie toutes les 500 ms au lieu de 10 ms
        if disableShuffle and IsPedInAnyVehicle(PlayerPedId(), false) then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if GetPedInVehicleSeat(veh, 0) == PlayerPedId() and GetIsTaskActive(PlayerPedId(), 165) then
                SetPedIntoVehicle(PlayerPedId(), veh, 0)
            end
        end
    end
end)

------------------------------------COUP DE CROSS
CreateThread(function()
    while true do
		local interval = 1000

        if (not IsPedArmed(PlayerPedId(), 1)) and (GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('weapon_unarmed')) then
			interval = 0

			SetPlayerTargetingMode(3);
            DisableControlAction(0, 140, true); 
            DisableControlAction(0, 141, true);
            DisableControlAction(0, 142, true); 
        end
		
        Wait(interval)
    end
end)
