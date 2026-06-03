ESX = exports["Framework"]:getSharedObject()

local cagouled = false
local displayBlackScreen = false

RegisterNetEvent('cagoule:applyToTarget')
AddEventHandler('cagoule:applyToTarget', function()
    cagouled = true
    displayBlackScreen = true
    
    local playerPed = PlayerPedId()
    
    RequestAnimDict('mp_arresting')
    while not HasAnimDictLoaded('mp_arresting') do
        Wait(10)
    end
    
    TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
    
    SetPedComponentVariation(playerPed, 1, 52, 0, 2)
    
    Citizen.CreateThread(function()
        while displayBlackScreen do
            Citizen.Wait(0)
            DrawRect(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 255)
            
            DisableControlAction(0, 22, true)
            DisableControlAction(0, 24, true) 
            DisableControlAction(0, 25, true) 
            DisableControlAction(0, 47, true) 
            DisableControlAction(0, 58, true) 
            DisableControlAction(0, 263, true) 
            DisableControlAction(0, 264, true) 
            DisableControlAction(0, 257, true) 
            DisableControlAction(0, 140, true) 
            DisableControlAction(0, 141, true) 
            DisableControlAction(0, 142, true) 
            DisableControlAction(0, 143, true) 
        end
    end)
end)

RegisterNetEvent('cagoule:removeFromTarget')
AddEventHandler('cagoule:removeFromTarget', function()
    cagouled = false
    displayBlackScreen = false
    
    local playerPed = PlayerPedId()
    ClearPedSecondaryTask(playerPed)
    
    SetPedComponentVariation(playerPed, 1, 0, 0, 2)
end)

RegisterNetEvent('cagoule:toggleHelp')
AddEventHandler('cagoule:toggleHelp', function(display)
    if display then
        ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour enlever la cagoule')
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if IsControlJustPressed(0, 38) then 
            local playerPed = PlayerPedId()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
            if closestPlayer ~= -1 and closestDistance <= 2.0 then
                TriggerServerEvent('cagoule:removeHood', GetPlayerServerId(closestPlayer))
            end
        end
    end
end)

RegisterNetEvent('cagoule:useItem')
AddEventHandler('cagoule:useItem', function()
    local playerPed = PlayerPedId()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
    if closestPlayer ~= -1 and closestDistance <= 2.0 then
        local targetPed = GetPlayerPed(closestPlayer)
        
        if IsEntityPlayingAnim(targetPed, 'random@mugging3', 'handsup_standing_base', 3) then
            TriggerServerEvent('cagoule:applyHood', GetPlayerServerId(closestPlayer))
        else
            ESX.ShowNotification('La personne doit lever les mains pour lui mettre la cagoule')
        end
    else
        ESX.ShowNotification('Personne à proximité')
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if not cagouled then
            local player = PlayerPedId()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
            if closestPlayer ~= -1 and closestDistance <= 2.0 then
                local serverId = GetPlayerServerId(closestPlayer) 
                TriggerServerEvent('cagoule:checkPlayerHood', serverId)
            end
        end
    end
end)
