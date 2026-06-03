
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("clearmap", function(source, args, rawCommand) 
	local player = ESX.GetPlayerFromId(source)
	local playerGroup = player.getGroup()

	if playerGroup == "founder" or source <= 0 then 
		TriggerClientEvent('okokDelVehicles:delete', -1)
	end
end)
