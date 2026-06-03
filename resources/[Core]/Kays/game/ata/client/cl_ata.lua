local isAtatActive = false
local atatDuration = 100 
local atatTextHandle = nil
local walkingStickProp = nil 

function UpdateAtatHUD()
    local currentTime = GetGameTimer()
    local remainingTime = math.ceil((atatEndTime - currentTime) / 1000)
    
    if remainingTime < 0 then
        remainingTime = 0
    end

    local minutes = math.floor(remainingTime / 60)
    local seconds = remainingTime % 60

    local message = string.format("~w~Vous êtes limité physiquement pendant : ~w~%d:%02d", minutes, seconds)

    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.4, 0.4)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 17, 17, 17, 255)
    SetTextEdge(1, 17, 17, 17, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(message)
    DrawText(0.5, 0.97)
end

function RemoveAtatHUD()
    if atatTextHandle ~= nil then
        RemoveBlip(atatTextHandle)
        atatTextHandle = nil
    end
end

RegisterNetEvent('atat:applyEffect')
AddEventHandler('atat:applyEffect', function(enable)
    isAtatActive = enable
    local playerPed = PlayerPedId()

    if enable then
        atatEndTime = GetGameTimer() + atatDuration * 3000

        if CFG_ATA.Canne then
            local boneIndex = GetPedBoneIndex(playerPed, 57005) 
            RequestModel("prop_cs_walking_stick")
            while not HasModelLoaded("prop_cs_walking_stick") do
                Wait(100)
            end
            walkingStickProp = CreateObject(GetHashKey("prop_cs_walking_stick"), 0, 0, 0, true, true, true)
            AttachEntityToEntity(walkingStickProp, playerPed, boneIndex, 0.08, 0.02, 0.0, 0.0, 270.0, 0.0, true, true, false, true, 1, true)
        end
        
        TriggerServerEvent('atat:saveState', atatEndTime)

        Citizen.CreateThread(function()
            while isAtatActive do
                Wait(0)
                DisableControlActions()

                DisablePlayerFiring(playerPed, true)
                SetPedCurrentWeaponVisible(playerPed, false, true, false, false)

                UpdateAtatHUD()

                if GetGameTimer() >= atatEndTime then
                    isAtatActive = false
                    TriggerServerEvent('atat:saveState', 0)
                end
            end

            if walkingStickProp then
                DeleteEntity(walkingStickProp)
                walkingStickProp = nil
            end

            RemoveAtatHUD()
        end)
    else
        EnableControlActions()

        DisablePlayerFiring(playerPed, false)
        SetPedCurrentWeaponVisible(playerPed, true, true, false, false)

        if walkingStickProp then
            DeleteEntity(walkingStickProp)
            walkingStickProp = nil
        end

        RemoveAtatHUD()
    end
end)



function DisableControlActions()
   -- DisableControlAction(0, 21, true)
    DisableControlAction(0, 22, true)
    DisableControlAction(0, 24, true)
    DisableControlAction(0, 25, true)
    DisableControlAction(0, 37, true)
    DisableControlAction(0, 44, true)
    DisableControlAction(0, 140, true)
    DisableControlAction(0, 141, true)
    DisableControlAction(0, 142, true)
    DisableControlAction(0, 143, true)
    --DisableControlAction(0, 71, true)
   -- DisableControlAction(0, 72, true)
    --DisableControlAction(27, 71, true)
    --DisableControlAction(27, 72, true)
end


function EnableControlActions()
  --  EnableControlAction(0, 21, true) 
    EnableControlAction(0, 22, true) 
    EnableControlAction(0, 23, true) 
    EnableControlAction(0, 24, true) 
    EnableControlAction(0, 25, true) 
    EnableControlAction(0, 37, true) 
    EnableControlAction(0, 44, true) 
    EnableControlAction(0, 140, true) 
    EnableControlAction(0, 141, true) 
    EnableControlAction(0, 142, true) 
    EnableControlAction(0, 143, true) 
end

RegisterNetEvent('atat:applyState')
AddEventHandler('atat:applyState', function(atatEndTime)
    if atatEndTime > GetGameTimer() then
        isAtatActive = true
        TriggerEvent('atat:applyEffect', true)
    else
        TriggerServerEvent('atat:saveState', 0)
    end
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('atat:loadState')
end)