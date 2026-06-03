local isInJail = false
local jailStay = 0
local JailStayX = 0
local hasAPointToDo = false
local Choosen = nil
local motif
local jailMenuCreated = false

Pos = {
    {nb=1, x=-2169.70, y=5196.82, z=16.88},
    {nb=2, x=-2171.86, y=5184.78, z=16.35},
    {nb=3, x=-2173.62, y=5196.14, z=16.88},
    {nb=4, x=-2166.34, y=5177.04, z=15.12},
    {nb=5, x=-2181.53, y=5183.77, z=16.65},
    {nb=6, x=-2167.75, y=5205.69, z=16.93}
}

RegisterNetEvent("Kays", function(eventName, ...)
    TriggerServerEvent(eventName, ...);
end);

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(100)
    end
    
    Citizen.SetTimeout(3000, function()
        TriggerServerEvent('jail:checkJailStatus')
    end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    while ESX.GetPlayerData()['job'] == nil do
        Wait(100)
    end
    
    Citizen.SetTimeout(3000, function()
        TriggerServerEvent('jail:checkJailStatus')
    end)
end)

RegisterNetEvent('jail:PutIn')
AddEventHandler('jail:PutIn', function(jailNb, reason)
    isInJail = true
    jailStay = tonumber(jailNb)
    JailStayX = jailStay
    motif = reason
    TriggerServerEvent('jail:SetInJail', jailStay, reason)
    beInJail()
    SetEntityCoords(PlayerPedId(), vector3(-2166.768799, 5186.172852, 15.74))
end)

RegisterNetEvent('jail:PutInBack')
AddEventHandler('jail:PutInBack', function(jailNb, reason)
    if jailMenuCreated then
        isInJail = true
        jailStay = tonumber(jailNb)
        JailStayX = jailStay
        motif = reason
        
        SetEntityCoords(PlayerPedId(), vector3(-2166.768799, 5186.172852, 15.74))
        
        if not hasAPointToDo then
            Citizen.SetTimeout(1500, function()
                hasAPointToDo = false
                ForceNewTaskPoint()
            end)
        end
        return
    end
    
    isInJail = true
    jailStay = tonumber(jailNb)
    JailStayX = jailStay
    motif = reason
    TriggerServerEvent('jail:SetInJailBack', jailStay)
    beInJail()
    Wait(1000)
    SetEntityCoords(PlayerPedId(), vector3(-2166.768799, 5186.172852, 15.74))
    
    Citizen.SetTimeout(1500, function()
        hasAPointToDo = false
        ForceNewTaskPoint()
    end)
end)

RegisterNetEvent('jail:UnPut')
AddEventHandler('jail:UnPut', function()
    
    if CurrentBlip then
        RemoveBlip(CurrentBlip)
        CurrentBlip = nil
    end
    
    
    hasAPointToDo = false
    isInJail = false
    jailStay = 0
    JailStayX = 0
    Choosen = nil
    x, y, z = nil, nil, nil
    jailMenuCreated = false
    
    TriggerServerEvent('jail:updateState', jailStay)
    Wait(500)
    TriggerServerEvent('jail:remove', JailStayX)
    
    SetEntityInvincible(PlayerPedId(), false)
    
    RageUI.CloseAll()
    
    SetEntityCoords(PlayerPedId(), vector3(-262.6586, -900.7338, 32.31084))
    
    Wait(1000)
    ESX.ShowNotification("~g~Vous avez été libéré de prison")
    
end)

RegisterNetEvent('jail:finishAll')
AddEventHandler('jail:finishAll', function()
    
    if CurrentBlip then
        RemoveBlip(CurrentBlip)
        CurrentBlip = nil
    end
    
    hasAPointToDo = false
    isInJail = false
    jailStay = 0
    JailStayX = 0
    Choosen = nil
    x, y, z = nil, nil, nil
    jailMenuCreated = false
    
    SetEntityCoords(PlayerPedId(), vector3(-262.6586, -900.7338, 32.31084))
    
    SetEntityInvincible(PlayerPedId(), false)
    
    RageUI.CloseAll()
    
    TriggerServerEvent('Koy:Jail:CheckIsRealyFinish')
    
    Wait(1000)
    ESX.ShowNotification("~g~Vous avez terminé votre peine et êtes libre")
    
end)

beInJail = function()
    if jailMenuCreated then
        return
    end
    
    jailMenuCreated = true
    Citizen.CreateThread(function()
        local mainMenu = RageUI.CreateMenu("", "Vous êtes en prison")
        mainMenu.Closed = function() 
        end
        
        RageUI.Visible(mainMenu, true)
        
        Citizen.SetTimeout(1000, function()
            if not hasAPointToDo then
                ForceNewTaskPoint()
            end
        end)

        while jailStay > 0 and isInJail do
            SetEntityInvincible(PlayerPedId(), true)

            RageUI.IsVisible(mainMenu, function()
                RageUI.Line()
                local myUID = exports['uid']:UIDClient1(GetPlayerServerId(PlayerId()))
                RageUI.Separator("ID Unique: ~s~"..myUID)
                RageUI.Separator("Raison: ~s~"..motif)
                RageUI.Separator("Tâches restantes: ~s~"..jailStay)
                RageUI.Line()            
            end)
            
            if not RageUI.Visible(mainMenu) and isInJail then
                RageUI.Visible(mainMenu, true)
            end

            local coords = GetEntityCoords(PlayerPedId())
            if #(coords - vector3(-2166.768799, 5186.172852, 15.74)) > 50 then
                SetEntityCoords(PlayerPedId(), vector3(-2166.768799, 5186.172852, 15.74))
            end
            
            if not hasAPointToDo and isInJail then
                ForceNewTaskPoint()
            end
            
            if hasAPointToDo then
                local coords = GetEntityCoords(PlayerPedId())
                if #(coords - vector3(x,y,z)) < 1.5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour réaliser votre tâche")
                    if IsControlJustPressed(0, 51) then
                        TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", -1, false)
                        Wait(5000)
                        ClearPedTasksImmediately(PlayerPedId())
                        
                        hasAPointToDo = false
                        RemoveBlip(CurrentBlip)
                        CurrentBlip = nil
                        
                        jailStay = jailStay - 1
                        JailStayX = jailStay
                        TriggerServerEvent('jail:removeTask', jailStay)
                        
                        Citizen.SetTimeout(1000, function()
                            if jailStay > 0 and isInJail and not hasAPointToDo then
                                ForceNewTaskPoint()
                            end
                        end)
                    end
                end
                
                if x and y and z then
                    DrawMarker(22, x, y, z, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, 0.6, 0.6, 0.6, 255, 0, 0, 170, 0, 1, 0, 0, nil, nil, 0)
                end
            end
            Wait(1)
        end
        
        if jailStay <= 0 and isInJail then
            Wait(1000)
            if CurrentBlip then
                RemoveBlip(CurrentBlip)
                CurrentBlip = nil
            end
            TriggerServerEvent('jail:finish')
            ESX.ShowNotification("Vous avez terminé vos tâches et sortez par conséquent de prison")
        end
        
        if not isInJail then
            if mainMenu then
                RageUI.CloseAll()
                mainMenu = RMenu:DeleteType(mainMenu, true)
                jailMenuCreated = false
            end
        end
    end)
end

function ForceNewTaskPoint()
    local attempts = 0
    local maxAttempts = 10
    
    
    while not hasAPointToDo and attempts < maxAttempts do
        attempts = attempts + 1
        
        local availablePoints = {}
        for k, v in pairs(Pos) do
            if Choosen ~= v.nb then
                table.insert(availablePoints, v)
            end
        end
        
        if #availablePoints > 0 then
            local selectedPoint = availablePoints[math.random(1, #availablePoints)]
            hasAPointToDo = true
            x, y, z = selectedPoint.x, selectedPoint.y, selectedPoint.z
            
            if CurrentBlip then
                RemoveBlip(CurrentBlip)
            end
            
            CurrentBlip = AddBlipForCoord(x, y, z)
            SetBlipRoute(CurrentBlip, true)
            Choosen = selectedPoint.nb
            
            return true
        end
        
        Wait(100)
    end
    
    if not hasAPointToDo then
        local fallbackPoint = Pos[1]
        hasAPointToDo = true
        x, y, z = fallbackPoint.x, fallbackPoint.y, fallbackPoint.z
        
        if CurrentBlip then
            RemoveBlip(CurrentBlip)
        end
        
        CurrentBlip = AddBlipForCoord(x, y, z)
        SetBlipRoute(CurrentBlip, true)
        Choosen = nil
        
    end
    
    return hasAPointToDo
end

Citizen.CreateThread(function()
	while true do
        if isInJail then
		    TriggerServerEvent('jail:HealPlayer')
        end
		Wait(15000)
    end
end)

RegisterNetEvent('jail:refreshJailStatus')
AddEventHandler('jail:refreshJailStatus', function(inJail, remainingTasks, jailReason)
    if inJail then
        
        isInJail = false
        jailMenuCreated = false
        
        if CurrentBlip then
            RemoveBlip(CurrentBlip)
            CurrentBlip = nil
        end
        hasAPointToDo = false
        
        Wait(200)
        TriggerEvent('jail:PutInBack', remainingTasks, jailReason)
    else
        isInJail = false
        jailMenuCreated = false
    end
end)