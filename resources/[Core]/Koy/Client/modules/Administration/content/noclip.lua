local NoClipSpeed = 0.5
local noclipActive = false
local followCamMode = true
local showHelpCommands = true
local index = 1
local playerGroup = nil
local closestPlayer = nil
local closestDistance = -1
local scaleform = nil 
local isScaleformRendered = false

local configNoClip = {
    Controls = {
        openKey = 170, 
        goUp = 22, 
        goDown = 61, 
        turnLeft = 34, 
        turnRight = 35, 
        goForward = 32,  
        goBackward = 33, 
        changeSpeed = 335, 
        changeSpeedDown = 336, 
        camMode = 74, 
        hideInstructions = 47, 
    },

    Speeds = {
        { label = 'Very Slow', speed = 0},
        { label = 'Slow', speed = 0.5},
        { label = 'Normal', speed = 2},
        { label = 'Fast', speed = 5},
        { label = 'Very Fast', speed = 10},
        { label = 'Max', speed = 15},
    },

    Offsets = {
        y = 0.5, 
        z = 0.2, 
        h = 3, 
    },

    EnableHUD = true,
    FrozenPosition = false,
    DisableWeaponWheel = true,
}

function saveNoclipState()
    if Client and Client.Admin and Client.Admin.SetPreferenceFromName then
        Client.Admin:SetPreferenceFromName("noclip_advanced_active", _G.noclipAdvancedActive)
    end
end

function loadNoclipState()
    if Client and Client.Admin and Client.Admin.GetPreferenceFromName then
        local prefNoclipActive = Client.Admin:GetPreferenceFromName("noclip_advanced_active")
        if prefNoclipActive ~= nil then
            _G.noclipAdvancedActive = prefNoclipActive
        end
    end
end

if _G.noclipAdvancedActive == nil then
    _G.noclipAdvancedActive = false
    loadNoclipState()
end

if _G.preferAdvancedNoclip == nil then
    _G.preferAdvancedNoclip = false
    if Client and Client.Admin and Client.Admin.GetPreferenceFromName then
        _G.preferAdvancedNoclip = Client.Admin:GetPreferenceFromName("prefer_advanced_noclip") or false
    end
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    Wait(2000) 
    if Client and Client.Admin then
        local preferAdvancedNoclip = Client.Admin:GetPreferenceFromName("prefer_advanced_noclip")
        if preferAdvancedNoclip ~= nil then
            _G.preferAdvancedNoclip = preferAdvancedNoclip
            SetResourceKvp("admin:preferences:prefer_advanced_noclip", tostring(preferAdvancedNoclip))
        end
    end
end)

Citizen.CreateThread(function()
    scaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(0)
    end
    
    if HasScaleformMovieLoaded(scaleform) then
        BeginScaleformMovieMethod(scaleform, "CLEAR_ALL")
        EndScaleformMovieMethod()
    end
end)

local function ShowNotification(msg)
    ESX.ShowNotification(msg)
end

function cleanAllScaleforms()
    if scaleform ~= nil and HasScaleformMovieLoaded(scaleform) then
        BeginScaleformMovieMethod(scaleform, "CLEAR_ALL")
        EndScaleformMovieMethod()
    end
    
    local tempScaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
    if HasScaleformMovieLoaded(tempScaleform) and tempScaleform ~= scaleform then
        BeginScaleformMovieMethod(tempScaleform, "CLEAR_ALL")
        EndScaleformMovieMethod()
        SetScaleformMovieAsNoLongerNeeded(tempScaleform)
    end
    
    isScaleformRendered = false
end

function toggleNoClip(args)
    local removeInvisibility = args
    noclipActive = not noclipActive
    _G.noclipAdvancedActive = noclipActive
    
    saveNoclipState()
    
    cleanAllScaleforms()
    
    if noclipActive then
        showHelpCommands = true
        
        local noclipEntity = nil
        
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            noclipEntity = GetVehiclePedIsIn(PlayerPedId(), false)
        else
            noclipEntity = PlayerPedId()
        end
        
        SetEntityVisible(noclipEntity, false, false)
        SetEntityAlpha(PlayerPedId(), 150, false)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            SetEntityAlpha(noclipEntity, 150, false)
        end
        
        if configNoClip.DisableWeaponWheel then
            DisableControlAction(0, 37, true)
        end

        SetEntityCollision(noclipEntity, false, false)
        FreezeEntityPosition(noclipEntity, true)
        SetEntityInvincible(noclipEntity, true)
        SetVehicleRadioEnabled(noclipEntity, false)
        SetEveryoneIgnorePlayer(PlayerPedId(), true)
        SetPoliceIgnorePlayer(PlayerPedId(), true)

        if not IsPedSittingInAnyVehicle(PlayerPedId()) then
            ClearPedTasksImmediately(PlayerPedId())
        end

        Citizen.CreateThread(function()
            local currentSpeed = configNoClip.Speeds[2].speed
            
            while noclipActive do
                Wait(0)
                
                HideHudComponentThisFrame(19)
                HideHudComponentThisFrame(20)
                HideHudComponentThisFrame(21)
                HideHudComponentThisFrame(22)
                
                if IsControlJustPressed(0, configNoClip.Controls.changeSpeed) then
                    if currentSpeed > 19 then
                        currentSpeed = 20
                    else
                        currentSpeed = currentSpeed + 1
                    end
                end

                if IsControlJustPressed(0, configNoClip.Controls.changeSpeedDown) then
                    if currentSpeed < 1 then
                        currentSpeed = 0
                    else
                        currentSpeed = currentSpeed - 1
                    end
                end
                
                DisableControlAction(0, 30, true)
                DisableControlAction(0, 31, true)
                DisableControlAction(0, 32, true)
                DisableControlAction(0, 33, true)
                DisableControlAction(0, 34, true)
                DisableControlAction(0, 35, true)
                DisableControlAction(0, 266, true)
                DisableControlAction(0, 267, true)
                DisableControlAction(0, 268, true)
                DisableControlAction(0, 269, true)
                DisableControlAction(0, 44, true)
                DisableControlAction(0, 20, true)
                DisableControlAction(0, 75, true)
                DisableControlAction(0, 74, true)
                
                if showHelpCommands then
                    BeginScaleformMovieMethod(scaleform, "CLEAR_ALL")
                    EndScaleformMovieMethod()
                    
                    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
                    ScaleformMovieMethodAddParamInt(4)
                    PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, configNoClip.Controls.camMode, true))
                    PushScaleformMovieMethodParameterString("Mode de caméra")
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
                    ScaleformMovieMethodAddParamInt(3)
                    PushScaleformMovieMethodParameterString("~INPUT_DETONATE~")
                    PushScaleformMovieMethodParameterString("Cacher les instructions")
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
                    ScaleformMovieMethodAddParamInt(2)
                    PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, configNoClip.Controls.goDown, true))
                    PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, configNoClip.Controls.goUp, true))
                    PushScaleformMovieMethodParameterString("Monter / descendre")
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
                    ScaleformMovieMethodAddParamInt(1)
                    PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, configNoClip.Controls.changeSpeed, true))
                    PushScaleformMovieMethodParameterString("Vitesse du noclip ("..currentSpeed..")")
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
                    ScaleformMovieMethodAddParamInt(0)
                    EndScaleformMovieMethod()

                    DrawScaleformMovieFullscreen(scaleform)
                    isScaleformRendered = true
                elseif isScaleformRendered then
                    cleanAllScaleforms()
                end
                
                if IsDisabledControlJustPressed(0, configNoClip.Controls.camMode) then
                    followCamMode = not followCamMode
                    if followCamMode then
                        ESX.ShowNotification("[~g~Succès~s~] Mode caméra: Vue relative")
                    else
                        ESX.ShowNotification("[~g~Succès~s~] Mode caméra: Vue fixe")
                    end
                end
                
                if IsControlJustPressed(0, 47) then
                    showHelpCommands = not showHelpCommands
                end
                
                local yoff = 0.0
                local zoff = 0.0
                
                if IsDisabledControlPressed(0, configNoClip.Controls.goForward) then
                    yoff = configNoClip.Offsets.y
                end
                
                if IsDisabledControlPressed(0, configNoClip.Controls.goBackward) then
                    yoff = -configNoClip.Offsets.y
                end
                
                if not followCamMode and IsDisabledControlPressed(0, configNoClip.Controls.turnLeft) then
                    SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())+configNoClip.Offsets.h)
                end
                
                if not followCamMode and IsDisabledControlPressed(0, configNoClip.Controls.turnRight) then
                    SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())-configNoClip.Offsets.h)
                end
                
                if IsDisabledControlPressed(0, configNoClip.Controls.goUp) then
                    zoff = configNoClip.Offsets.z
                end
                
                if IsDisabledControlPressed(0, configNoClip.Controls.goDown) then
                    zoff = -configNoClip.Offsets.z
                end
                
                local newPos = GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))
                local heading = GetEntityHeading(noclipEntity)
                
                SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
                SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, false)
                
                if followCamMode then
                    SetEntityHeading(noclipEntity, GetGameplayCamRelativeHeading())
                else
                    SetEntityHeading(noclipEntity, heading)
                end
                
                SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, true, true, true)
                SetLocalPlayerVisibleLocally(true)
            end
        end)
    else
        local noclipEntity = nil
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            noclipEntity = GetVehiclePedIsIn(PlayerPedId(), false)
        else
            noclipEntity = PlayerPedId()
        end
        
        showHelpCommands = false
        cleanAllScaleforms()
        
        SetEntityVisible(noclipEntity, true, false)
        ResetEntityAlpha(PlayerPedId())
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            ResetEntityAlpha(noclipEntity)
        end
        
        SetEntityCollision(noclipEntity, true, true)
        FreezeEntityPosition(noclipEntity, false)
        SetEntityInvincible(noclipEntity, false)
        SetVehicleRadioEnabled(noclipEntity, true)
        SetEveryoneIgnorePlayer(PlayerPedId(), false)
        SetPoliceIgnorePlayer(PlayerPedId(), false)
        
        if not IsPedSittingInAnyVehicle(PlayerPedId()) then
            ClearPedTasksImmediately(PlayerPedId())
        end
    end
end

function getCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()
    local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0))
    local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))

    if len ~= 0 then
        coords = coords / len
    end

    return coords
end

function GetPlayersInCameraView()
    local playersInCamera = {}
    local cameraCoords = GetGameplayCamCoord()
    local cameraRotation = GetGameplayCamRot(2)

    for _, playerId in ipairs(GetActivePlayers()) do
        local playerPed = GetPlayerPed(playerId)
        local playerCoords = GetEntityCoords(playerPed)

        if HasEntityClearLosToEntity(playerPed, PlayerPedId(), 17) and
           IsEntityOnScreen(playerPed) then
            table.insert(playersInCamera, playerId)
        end
    end

    return playersInCamera
end 