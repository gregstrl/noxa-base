local isDead = false
local LOOP_INTERVAL = 1000

local function PlayerKilledByPlayer(killerServerId, killerClientId, deathCause)
	local victimCoords = GetEntityCoords(PlayerPedId(), false)
	local killerCoords = GetEntityCoords(GetPlayerPed(killerClientId), false)
	local distance = #(victimCoords - killerCoords)

	local data = {
		victimCoords = {
			x = ESX.Math.Round(victimCoords.x, 1),
			y = ESX.Math.Round(victimCoords.y, 1),
			z = ESX.Math.Round(victimCoords.z, 1)
		},
		killerCoords = {
			x = ESX.Math.Round(killerCoords.x, 1),
			y = ESX.Math.Round(killerCoords.y, 1),
			z = ESX.Math.Round(killerCoords.z, 1)
		},
		killedByPlayer = true,
		deathCause = deathCause,
		distance = ESX.Math.Round(distance, 1),
		killerServerId = killerServerId,
		killerClientId = killerClientId
	}

	TriggerEvent('esx:onPlayerDeath', data)
	TriggerServerEvent('esx:onPlayerDeath', data)
end

local function PlayerKilled(deathCause)
	local plyPed = PlayerPedId()
	local victimCoords = GetEntityCoords(plyPed, false)

	local data = {
		victimCoords = {
			x = ESX.Math.Round(victimCoords.x, 1),
			y = ESX.Math.Round(victimCoords.y, 1),
			z = ESX.Math.Round(victimCoords.z, 1)
		},
		killedByPlayer = false,
		deathCause = deathCause
	}

	TriggerEvent('esx:onPlayerDeath', data)
	TriggerServerEvent('esx:onPlayerDeath', data)
end

CreateThread(function()
	while true do
		local ply = PlayerId()
		if NetworkIsPlayerActive(ply) then
			local plyPed = PlayerPedId()
			if IsPedFatallyInjured(plyPed) then
				if not isDead then
					isDead = true
					local killerEntity, deathCause = GetPedSourceOfDeath(plyPed), GetPedCauseOfDeath(plyPed)
					local killerClientId = NetworkGetPlayerIndexFromPed(killerEntity)

					if killerEntity ~= plyPed and killerClientId and NetworkIsPlayerActive(killerClientId) then
						PlayerKilledByPlayer(GetPlayerServerId(killerClientId), killerClientId, deathCause)
					else
						PlayerKilled(deathCause)
					end
				end
			elseif isDead then
				isDead = false
			end
		end
		Wait(LOOP_INTERVAL)
	end
end)