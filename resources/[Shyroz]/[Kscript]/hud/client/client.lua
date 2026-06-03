ESX = exports["Framework"]:getSharedObject()

local isMapExpanded = false
local isHudVisible = true
local isRunning = false
local isHealthVisible = true
local isHungerVisible = true
local isThirstVisible = true
local isShieldVisible = true

local function isDead()
    local ped = PlayerPedId()
    return IsEntityDead(ped)
end

local function GetMinimapAnchor()
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()

    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.width = xscale * (res_x / (4 * aspect_ratio))
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = (xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10))))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.right_x = Minimap.left_x + Minimap.width
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    return Minimap
end

Citizen.CreateThread(function()
    Citizen.Wait(500)
    SetRadarBigmapEnabled(true, false)
    Citizen.Wait(100)
    SetRadarBigmapEnabled(false, false)
    SetRadarZoom(1100)    
    DisplayRadar(true)
end)


Citizen.CreateThread(function()

    
    local minimap = RequestScaleformMovie("minimap")
    
    while true do
        Citizen.Wait(0)
        
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
        
        if IsControlJustPressed(0, 20) then
            isMapExpanded = not isMapExpanded
            SetRadarBigmapEnabled(isMapExpanded, false)
            
            if not isMapExpanded then
                SetRadarZoom(1100)
            end
        end
    end
end)

Citizen.CreateThread(function()
    local playerPed = PlayerPedId()
    local prevHealth = GetEntityHealth(playerPed)
    local hunger, thirst = 0, 0
    local shield = 0
    
    SendNUIMessage({
        source = 'hud',
        type = 'setVisible',
        value = true
    })
    
    SendNUIMessage({
        source = 'hud',
        type = 'setHealthVisible',
        value = isHealthVisible
    })
    
    SendNUIMessage({
        source = 'hud',
        type = 'setHungerVisible',
        value = isHungerVisible
    })
    
    SendNUIMessage({
        source = 'hud',
        type = 'setThirstVisible',
        value = isThirstVisible
    })
    
    SendNUIMessage({
        source = 'hud',
        type = 'setShieldVisible',
        value = isShieldVisible
    })
    
    while true do
        Citizen.Wait(500)
        
        if isDead() then
            if isHudVisible then
                isHudVisible = false
                SendNUIMessage({
                    source = 'hud',
                    type = 'setVisible',
                    value = false
                })
            end
            Citizen.Wait(1000)
        elseif not isHudVisible and not isDead() then
            isHudVisible = true
            SendNUIMessage({
                source = 'hud',
                type = 'setVisible',
                value = true
            })
        elseif not isHudVisible then
            Citizen.Wait(1000)
        else
            playerPed = PlayerPedId()
            local health = GetEntityHealth(playerPed) - 100
            shield = GetPedArmour(playerPed)
            isRunning = IsPedSprinting(playerPed)
            
            TriggerEvent('esx_status:getStatus', 'hunger', function(status)
                if status then
                    hunger = status.val / 10000
                end
            end)
            
            TriggerEvent('esx_status:getStatus', 'thirst', function(status)
                if status then
                    thirst = status.val / 10000
                end
            end)
            
            SendNUIMessage({
                source = 'hud',
                type = 'updateStats',
                stats = {
                    hunger = hunger,
                    thirst = thirst,
                    shield = shield,
                    health = health,
                    mapExpanded = isMapExpanded,
                    isRunning = isRunning,
                    isHealthVisible = isHealthVisible,
                    isHungerVisible = isHungerVisible,
                    isThirstVisible = isThirstVisible,
                    isShieldVisible = isShieldVisible
                }
            })
            
            if health ~= prevHealth then
                if health < prevHealth then
                    TriggerScreenblurFadeIn(100)
                    Citizen.Wait(300)
                    TriggerScreenblurFadeOut(1000)
                end
                prevHealth = health
            end
        end
    end
end)

RegisterCommand('togglehud', function()
    if not isHudVisible then
        isHudVisible = true
        DisplayHud(true)
        SendNUIMessage({
            source = 'hud',
            type = 'setVisible',
            value = true
        })
    else
        isHudVisible = false
        DisplayHud(false)
        SendNUIMessage({
            source = 'hud',
            type = 'setVisible',
            value = false
        })
    end
end)

RegisterNetEvent('hud:toggle')
AddEventHandler('hud:toggle', function(state)
    if state ~= nil then
        isHudVisible = state
    else
        isHudVisible = not isHudVisible
    end
    
    DisplayHud(isHudVisible)
    SendNUIMessage({
        source = 'hud',
        type = 'setVisible',
        value = isHudVisible
    })
end)

exports('toggleHealthDisplay', function(state)
    if state ~= nil then
        isHealthVisible = state
    else
        isHealthVisible = not isHealthVisible
    end
    
    SendNUIMessage({
        source = 'hud',
        type = 'setHealthVisible',
        value = isHealthVisible
    })
end)

exports('toggleHungerDisplay', function(state)
    if state ~= nil then
        isHungerVisible = state
    else
        isHungerVisible = not isHungerVisible
    end
    
    SendNUIMessage({
        source = 'hud',
        type = 'setHungerVisible',
        value = isHungerVisible
    })
end)

exports('toggleThirstDisplay', function(state)
    if state ~= nil then
        isThirstVisible = state
    else
        isThirstVisible = not isThirstVisible
    end
    
    SendNUIMessage({
        source = 'hud',
        type = 'setThirstVisible',
        value = isThirstVisible
    })
end)

exports('toggleShieldDisplay', function(state)
    if state ~= nil then
        isShieldVisible = state
    else
        isShieldVisible = not isShieldVisible
    end
    
    SendNUIMessage({
        source = 'hud',
        type = 'setShieldVisible',
        value = isShieldVisible
    })
end)

exports('toggleAllStatsDisplay', function(state)
    if state ~= nil then
        isHealthVisible = state
        isHungerVisible = state
        isThirstVisible = state
        isShieldVisible = state
    else
        local newState = not (isHealthVisible and isHungerVisible and isThirstVisible and isShieldVisible)
        isHealthVisible = newState
        isHungerVisible = newState
        isThirstVisible = newState
        isShieldVisible = newState
    end
    
    SendNUIMessage({
        source = 'hud',
        type = 'setAllStatsVisible',
        value = isHealthVisible
    })
end)

RegisterCommand('togglehealth', function()
    exports('toggleHealthDisplay')()
end)

RegisterCommand('togglehunger', function()
    exports('toggleHungerDisplay')()
end)

RegisterCommand('togglethirst', function()
    exports('toggleThirstDisplay')()
end)

RegisterCommand('toggleshield', function()
    exports('toggleShieldDisplay')()
end)

RegisterCommand('toggleallstats', function()
    exports('toggleAllStatsDisplay')()
end)