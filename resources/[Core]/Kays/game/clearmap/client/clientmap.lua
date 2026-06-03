ESX = nil

Citizen.CreateThread(function() 
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(100)
	end
end)

RegisterNetEvent("okokDelVehicles:delete")
AddEventHandler("okokDelVehicles:delete", function()
	local minuteCalculation = 60000
	local minutesPassed = 0
	local minutesLeft = 5

	ESX.ShowNotification("[~r~Alerte~s~] Tous les vehicules abandonnés du serveur vont être supprimé dans "..math.floor(minutesLeft).." ~b~minutes~s~!")

	while minutesPassed < 5 do
		Wait(1*minuteCalculation)
		minutesPassed = minutesPassed + 1
		minutesLeft = minutesLeft - 1
		if minutesLeft == 0 then
			ESX.ShowNotification("[~r~Alerte~s~] Tous les véhicules sans chauffeur ont été supprimés !")
		elseif minutesLeft == 1 then
			ESX.ShowNotification("[~r~Alerte~s~] Tous les véhicules sans chauffeur seront supprimés dans "..math.floor(minutesLeft).." ~b~minutes~s~ !")
		else
			ESX.ShowNotification("[~r~Alerte~s~] Tous les véhicules sans chauffeur seront supprimés dans "..math.floor(minutesLeft).." ~b~minutes~s~ !")
		end
	end
	for vehicle in EnumerateVehicles() do
		local canDelete = true
		local carCoords = GetEntityCoords(vehicle)

		if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
			if not MapYnS_DeleteVehiclesIfInSafeZone then
				for i = 1, #MapYnS_SafeZones, 1 do
					dist = Vdist(MapYnS_SafeZones[i].x, MapYnS_SafeZones[i].y, MapYnS_SafeZones[i].z, carCoords.x, carCoords.y, carCoords.z)
					if dist < MapYnS_SafeZones[i].radius then
						canDelete = false
					end
				end
			end
			if canDelete then
				SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
				SetEntityAsMissionEntity(vehicle, false, false) 
				DeleteVehicle(vehicle)
				if (DoesEntityExist(vehicle)) then 
					DeleteVehicle(vehicle) 
				end
			end
		end
	end
end)

local entityEnumerator = {
	__gc = function(enum)
	if enum.destructor and enum.handle then
		enum.destructor(enum.handle)
	end
	enum.destructor = nil
	enum.handle = nil
end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end