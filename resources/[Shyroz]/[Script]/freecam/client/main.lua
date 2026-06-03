local SETTINGS = _G.CONTROL_SETTINGS
local CONTROLS = _G.CONTROL_MAPPING

local MAX_FREECAM_DISTANCE = 10.0

-------------------------------------------------------------------------------

local function GetSpeedMultiplier()
  local fastNormal = GetSmartControlNormal(CONTROLS.MOVE_FAST)
  local slowNormal = GetSmartControlNormal(CONTROLS.MOVE_SLOW)

  local baseSpeed = SETTINGS.BASE_MOVE_MULTIPLIER
  local fastSpeed = 1 + ((SETTINGS.FAST_MOVE_MULTIPLIER - 1) * fastNormal)
  local slowSpeed = 1 + ((SETTINGS.SLOW_MOVE_MULTIPLIER - 1) * slowNormal)

  local frameMultiplier = GetFrameTime() * 60
  local speedMultiplier = baseSpeed * fastSpeed / slowSpeed

  return speedMultiplier * frameMultiplier
end

local function GetPlayerPosition()
  return GetEntityCoords(PlayerPedId())
end

local function CheckWallCollision(startPos, endPos)
    local rayHandle = StartShapeTestRay(
        startPos.x, startPos.y, startPos.z,
        endPos.x, endPos.y, endPos.z,
        1, -- Raycast flags (1 = everything)
        PlayerPedId(),
        0
    )
    local _, hit, _, _, entityHit = GetShapeTestResult(rayHandle)
    return hit ~= 0
end

local function IsPositionValid(pos)
    local playerPos = GetPlayerPosition()
    local distance = #(pos - playerPos)
    
    if distance > MAX_FREECAM_DISTANCE then
        return false
    end
    
    if CheckWallCollision(playerPos, pos) then
        return false
    end
    
    return true
end

local function UpdateCamera()
  if not IsFreecamActive() or IsPauseMenuActive() then
    return
  end

  if not IsFreecamFrozen() then
    local vecX, vecY = GetFreecamMatrix()
    local vecZ = vector3(0, 0, 1)

    local pos = GetFreecamPosition()
    local rot = GetFreecamRotation()

    -- Get speed multiplier for movement
    local speedMultiplier = GetSpeedMultiplier()

    -- Get rotation input
    local lookX = GetSmartControlNormal(CONTROLS.LOOK_X)
    local lookY = GetSmartControlNormal(CONTROLS.LOOK_Y)

    -- Get position input
    local moveX = GetSmartControlNormal(CONTROLS.MOVE_X)
    local moveY = GetSmartControlNormal(CONTROLS.MOVE_Y)
    local moveZ = GetSmartControlNormal(CONTROLS.MOVE_Z)

    -- Calculate new rotation.
    local rotX = rot.x + (-lookY * SETTINGS.LOOK_SENSITIVITY_X)
    local rotZ = rot.z + (-lookX * SETTINGS.LOOK_SENSITIVITY_Y)
    local rotY = rot.y

    -- Calculate new position with smaller increments for better collision detection
    local moveStep = 0.1
    local newPos = pos
    
    -- Move in smaller steps to detect collisions
    for i = 1, math.ceil(speedMultiplier / moveStep) do
        local stepPos = newPos + (vecX * moveX * moveStep)
        stepPos = stepPos + (vecY * -moveY * moveStep)
        stepPos = stepPos + (vecZ * moveZ * moveStep)
        
        if IsPositionValid(stepPos) then
            newPos = stepPos
        else
            break
        end
    end

    -- Only update position if it's valid
    if IsPositionValid(newPos) then
        pos = newPos
    end

    -- Adjust new rotation
    rot = vector3(rotX, rotY, rotZ)

    -- Update camera
    SetFreecamPosition(pos.x, pos.y, pos.z)
    SetFreecamRotation(rot.x, rot.y, rot.z)
  end

  -- Trigger a tick event. Resources depending on the freecam position can
  -- make use of this event.
  TriggerEvent('freecam:onTick')
end

-------------------------------------------------------------------------------

Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(0)
    UpdateCamera()
  end
end)

--------------------------------------------------------------------------------

-- When the resource is stopped, make sure to return the camera to the player.
AddEventHandler('onResourceStop', function (resourceName)
  if resourceName == GetCurrentResourceName() then
    SetFreecamActive(false)
  end
end)
