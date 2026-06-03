ESX = exports["Framework"]:getSharedObject()

local blips = {}
local isHarvesting = false
local autoHarvesting = false
local shouldStopHarvesting = false

function LoadBlips()
    for _, blip in pairs(blips) do
        RemoveBlip(blip)
    end
    blips = {}

    if not ESX.PlayerData or not ESX.PlayerData.job or not ESX.PlayerData.job.name then
        return
    end

    local playerJob = ESX.PlayerData.job.name

    for zoneType, zoneData in pairs(ConfigFarms.FarmZones) do
        if table.contains(zoneData.jobs, playerJob) then
            for _, pos in ipairs(zoneData.positions) do
                local blip = AddBlipForCoord(pos.coords.x, pos.coords.y, pos.coords.z)
                SetBlipSprite(blip, zoneData.blip.sprite)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, zoneData.blip.scale)
                SetBlipColour(blip, zoneData.blip.color)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(zoneData.blip.name)
                EndTextCommandSetBlipName(blip)
                table.insert(blips, blip)
            end
        end
    end
end

Citizen.CreateThread(function()
    while ESX.GetPlayerData().job == nil do
        Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
    LoadBlips()
end)

local function IsPlayerInHarvestZone()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    if not ESX.PlayerData or not ESX.PlayerData.job or not ESX.PlayerData.job.name then
        return nil, nil
    end
    
    local playerJob = ESX.PlayerData.job.name

    for zoneType, zoneData in pairs(ConfigFarms.FarmZones) do
        if table.contains(zoneData.jobs, playerJob) then
            for _, pos in ipairs(zoneData.positions) do
                local distance = #(playerCoords - pos.coords)
                if distance < 10.0 then
                    return zoneType, pos
                end
            end
        end
    end
    return nil, nil
end

local function PlayHarvestAnimation(dict, anim)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
end

local function StopHarvesting()
    autoHarvesting = false
    isHarvesting = false
    shouldStopHarvesting = false
    ClearPedTasks(PlayerPedId())
    ESX.ShowNotification("Récolte ~r~arrêtée")
end

local function StartHarvesting(zoneType, position)
    if isHarvesting then 
        shouldStopHarvesting = true
        return 
    end
    
    autoHarvesting = not autoHarvesting
    shouldStopHarvesting = false
    
    if not autoHarvesting then
        StopHarvesting()
        return
    end

    Citizen.CreateThread(function()
        while autoHarvesting and not shouldStopHarvesting do
            if not isHarvesting then
                isHarvesting = true
                local currentZoneType, currentPosition = IsPlayerInHarvestZone()
                
                if not currentZoneType then
                    StopHarvesting()
                    ESX.ShowNotification("Vous êtes trop loin de la zone de récolte")
                    break
                end

                local zoneData = ConfigFarms.FarmZones[currentZoneType]
                local itemData = currentPosition.item

                PlayHarvestAnimation(itemData.animation.dict, itemData.animation.anim)
                
                local harvestTime = itemData.time
                local timeElapsed = 0
                local interval = 100

                while timeElapsed < harvestTime and not shouldStopHarvesting do
                    Wait(interval)
                    timeElapsed = timeElapsed + interval
                end

                if not shouldStopHarvesting then
                    local randomAmount = math.random(1, 3)
                    TriggerServerEvent('farm:harvest', currentZoneType, itemData.name, randomAmount, itemData.label)
                end
                
                if shouldStopHarvesting then
                    StopHarvesting()
                    break
                end
                
                isHarvesting = false
            end
            Wait(100)
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        local wait = 1000
        local zoneType, position = IsPlayerInHarvestZone()
        if zoneType and position then
            wait = 0
            if not autoHarvesting then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour commencer la récolte")
            else
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour arrêter la récolte")
            end
            if IsControlJustPressed(0, 38) then
                StartHarvesting(zoneType, position)
            end
        else
            if autoHarvesting then
                StopHarvesting()
                ESX.ShowNotification("Récolte ~r~arrêtée~s~ - Trop loin de la zone")
            end
        end
        Wait(wait)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    LoadBlips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    LoadBlips()
end)

function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end
