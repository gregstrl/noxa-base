ESX = nil
local sitting
local currentScenario
local disableControls = false
local currentObj
local currentChairCoords

CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

-- CreateThread: This function creates a new thread to run the specified function
-- The function initializes the Sitables table and iterates through the OXSitConfig.Interactables to get the model hash key
-- It then adds the model hash keys to the Sitables table and waits for 100 milliseconds
-- Finally, it calls the addModel function from the ox_target module with the Sitables table and a table containing icon, label, event, and Distance properties
-- @param {function} func - The function to be executed in the new thread
CreateThread(function()
	local Sitables = {} -- Initialize a table to store model hash keys
	for _,v in pairs(OXSitConfig.Interactables) do
		local model = GetHashKey(v) -- Get the model hash key for each item in OXSitConfig.Interactables
		table.insert(Sitables, model) -- Add the model hash key to the Sitables table
	end
	Wait(100) -- Wait for 100 milliseconds
	exports.ox_target:addModel(Sitables, { -- Call the addModel function from the ox_target module
		{
			icon = OXSitConfig.Visual.icon, -- The icon property from the OXSitConfig.Visual table
			label = OXSitConfig.Visual.label, -- The label property from the OXSitConfig.Visual table
			event = "ox_sit:sit", -- The event property with value "ox_sit:sit"
			Distance = OXSitConfig.MaxDistance -- The Distance property from the OXSitConfig table
		},
	})
end)

-- Function to find the nearest interactable sitable object.
--@return object, distance - The nearest sitable object and its distance
function GetNearChair()
    local object, distance
    local coords = GetEntityCoords(PlayerPedId())

    -- Loop through each interactable object in the configuration
    for i=1, #OXSitConfig.Interactables do
        -- Get the closest object of the specified type
        object = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, GetHashKey(OXSitConfig.Interactables[i]), false, false, false)
        distance = #(coords - GetEntityCoords(object))
        -- Check if the object is within the maximum distance
        if distance < OXSitConfig.MaxDistance then
            return object, distance
        end
    end
    -- Return nil if no suitable object is found
    return 0, nil
end

-- Function to make the player character sit down on a specified object
-- @param object The object the player will sit on
-- @param modelName The name of the model of the object
-- @param data Additional data related to the object
function SitDown(object, data)
    -- Check if the player character has clear line of sight to the object within a radius of 17 units
    if not HasEntityClearLosToEntity(PlayerPedId(), object, 17) then
        return
    end

    disableControls = true  -- Variable used to disable controls during the sitting process
    currentObj = object  -- Store the current object the player is sitting on
    FreezeEntityPosition(object, true)  -- Freeze the position of the object
    PlaceObjectOnGroundProperly(object)  -- Place the object on the ground properly

    local pos = GetEntityCoords(object)  -- Get the coordinates of the object
    local playerPos = GetEntityCoords(PlayerPedId())  -- Get the coordinates of the player character
    local objectCoords = vec3(pos.x, pos.y, pos.z)  -- Create a vector3 object with the coordinates of the object

	-- Check if the player is already sitting on this chair
    if currentChairCoords == objectCoords then
        --lib.notify({
        --    title = OXSitConfig.Visual.error,
        --    type = 'error'
        --})
        ESX.ShowNotification(OXSitConfig.Visual.error)
        return
    end

    -- Check if the place is already occupied
    lib.callback('ox_sit:getPlace', objectCoords, function(occupied)
        if occupied then
            --lib.notify({
            --    title = OXSitConfig.Visual.notification,
            --    type = 'info'
            --})
            ESX.ShowNotification(OXSitConfig.Visual.notification)
        else
			currentChairCoords = objectCoords
            -- Trigger the server event to reserve the place for sitting
            TriggerServerEvent('ox_sit:takePlace', objectCoords, currentObj)
            currentScenario = data.scenario  -- Set the current scenario based on the provided data
            -- Make the player character perform a sitting scenario at the position of the object
            TaskStartScenarioAtPosition(PlayerPedId(), currentScenario, pos.x, pos.y, pos.z + (playerPos.z - pos.z)/2, GetEntityHeading(object) + 180.0, 0, true, false)
            Citizen.Wait(2500)  -- Wait for 2500 milliseconds
            -- Check if the player character is moving
            if GetEntitySpeed(PlayerPedId()) > 0 then
                ClearPedTasks(PlayerPedId())  -- Clear the current task of the player character
                -- Make the player character perform a sitting scenario at the position of the object
                TaskStartScenarioAtPosition(PlayerPedId(), currentScenario, pos.x, pos.y, pos.z + (playerPos.z - pos.z)/2, GetEntityHeading(object) + 180.0, 0, true, true)
            end
            sitting = true  -- Set the sitting flag to true
        end
    end, objectCoords)
end


--- Stand up from the current scenario
function StandUp()
    if (sitting) then
        -- Start the scenario at a specified position
        TaskStartScenarioAtPosition(PlayerPedId(), currentScenario, 0.0, 0.0, 0.0, 180.0, 2, true, false)
        -- Wait until the scenario is no longer in use
        while IsPedUsingScenario(PlayerPedId(), currentScenario) do
            Wait(100)
        end
        -- Clear the tasks of the player
        ClearPedTasks(PlayerPedId())
        -- Unfreeze the position of the player
        FreezeEntityPosition(PlayerPedId(), false)
        -- Unfreeze the position of the current object
        FreezeEntityPosition(currentObj, false)
        -- Trigger the server event to leave the place
        TriggerServerEvent('ox_sit:leavePlace', currentChairCoords)
        -- Reset the current scenario
        currentScenario = nil
        -- Set sitting status to false
        sitting = false
        -- Enable controls
        disableControls = false
        -- Reset the current chair coordinates
        currentChairCoords = nil
    end
end

-- Add an event handler for the 'ox_sit:sit' event
RegisterNetEvent("ox_sit:sit")
AddEventHandler("ox_sit:sit", function()
	-- Check if the player is already sitting and not in the current scenario, then make the player stand up
	if sitting and not IsPedUsingScenario(PlayerPedId(), currentScenario) then
		StandUp()
	end
	-- If controls are disabled, then disable the control action for input 37 (E key)
	if disableControls then
		DisableControlAction(1, 37, true)
	end
	-- Get the nearest chair and its distance
	local object, distance = GetNearChair()
	-- If a chair is found within the maximum distance specified in the OXSitConfig, then attempt to sit down on it
	if distance and distance < OXSitConfig.MaxDistance then
		-- Get the model hash of the chair object
		local hash = GetEntityModel(object)
		-- Iterate through the Sitable objects in the OXSitConfig and find a matching hash for the chair
		for k,v in pairs(OXSitConfig.Sitable) do
			-- If a matching hash is found, sit down on the chair and break the loop
			if GetHashKey(k) == hash then
				SitDown(object, v)
				break
			end
		end
	end
end)


RegisterCommand('StandUp', function()
	StandUp()
end, false)
RegisterKeyMapping('StandUp', 'Se lever', 'keyboard', OXSitConfig.Keyboard)

CreateThread(function()
    while true do
        Wait(0)

        if sitting then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_VEH_DROP_PROJECTILE~ pour vous lever")
        else
            Wait(500)
        end
    end
end)