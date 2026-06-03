ESX = exports['Framework']:getSharedObject()

AddEventHandler('esx:setPlayerData', function(key, val, last)
    if GetInvokingResource() == 'Framework' then
        ESX.PlayerData[key] = val
        if OnPlayerData then
            OnPlayerData(key, val, last)
        end
    end
end)

local FirstSpawn, PlayerLoaded = true, false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer, isNew)
    ESX.PlayerData = xPlayer
    ESX.PlayerLoaded = true
    PlayerLoaded = true
end)

AddEventHandler('playerSpawned', function()
    CreateThread(function()
        while not PlayerLoaded do
            Wait(10)
        end

        if FirstSpawn then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                if skin == nil then
                    TriggerEvent("Creator:openMenu")
                else
                    TriggerEvent('skinchanger:loadSkin', skin)
                    Wait(1000)
                    TriggerEvent('Backpack:SetOntoPlayer')
                end
            end)
            FirstSpawn = false
        end
    end)
end)


RegisterNetEvent('esx:onPlayerLogout', function()
    ESX.PlayerLoaded = false
    ESX.PlayerData = {}
end)

function createCharcreator()
    local ped = PlayerPedId()

    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local offset = offsetPosition(coords.x, coords.y, GetEntityHeading(ped), 2.4)
    local targetPositionFly = vector3(offset.x, offset.y, coords.z + 0.2)
    local targetPositionPoint = vector3(coords.x, coords.y, coords.z + 0.2)

    cam = CreateCam('DEFAULT_SCRIPTED_CAMERA')

    SetCamCoord(cam, targetPositionFly)
    PointCamAtCoord(cam, targetPositionPoint)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 500, true, true)

    SetNuiFocus(true, true)

    SendNUIMessage({
        action = 'pushpages',
    })

    SendNUIMessage({
        action = 'setCategories',
        categories = json.encode(Config_charcreator.categories, {indent = true})
    })

    SendNUIMessage({
        action = 'setdata',
        data = json.encode(getCharacter())
    })
end

RegisterNUICallback('change', function(data)
    if Config_charcreator.refreshComponent[data.key] then
        for k,v in pairs(Config_charcreator.refreshComponent[data.key]) do
            SendNUIMessage({
                action = 'refreshComponent',
                component = v,
                data = json.encode(getCharacter()[v])
            })    
        end
    end

    TriggerEvent('skinchanger:change', data.key, tonumber(data.value))

    Wait(500)
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:save', skin)
    end)

    if data.key == 'sex' then
        Wait(500) 
        if tonumber(data.value) == 0 then -- Homme
            local maleSkin = {
                sex = 0,
                tshirt_1 = 23,
                tshirt_2 = 0,
                torso_1 = 3,
                torso_2 = 2,
                arms = 6,
                pants_1 = 388,
                pants_2 = 0,
                shoes_1 = 160,
                shoes_2 = 2
            }
            TriggerEvent('skinchanger:loadSkin', maleSkin)
            Wait(500)
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerServerEvent('esx_skin:save', skin)
            end)
        elseif tonumber(data.value) == 1 then -- Femme
            local femaleSkin = {
                sex = 1,
                tshirt_1 = 16,
                tshirt_2 = 0,
                torso_1 = 732,
                torso_2 = 0,
                arms = 30,
                pants_1 = 29,
                pants_2 = 0,
                shoes_1 = 4,
                shoes_2 = 0
            }
            TriggerEvent('skinchanger:loadSkin', femaleSkin)
            Wait(500)
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerServerEvent('esx_skin:save', skin)
            end)
        end
    end
end)

function getCharacter()
    local Character = {}

    TriggerEvent('skinchanger:getData', function(components, maxVals)
        for k,v in pairs(components) do
            Character[v.name] = {}
            Character[v.name].min = tostring(v.min)
            Character[v.name].value = tostring(v.value)
            Character[v.name].label = v.label
        end

        for k,v in pairs(maxVals) do
            Character[k].max = v
        end

        TriggerEvent('skinchanger:getSkin', function(skin)
            for k,v in pairs(skin) do
                Character[k].value = tostring(v)
            end
            
            if skin.sex == 0 then -- Homme
                local maleSkin = {
                    sex = 0,
                    tshirt_1 = 23,
                    tshirt_2 = 0,
                    torso_1 = 3,
                    torso_2 = 2,
                    arms = 6,
                    pants_1 = 388,
                    pants_2 = 0,
                    shoes_1 = 160,
                    shoes_2 = 2
                }
                TriggerEvent('skinchanger:loadSkin', maleSkin)
                Wait(500)
                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                end)
            elseif skin.sex == 1 then -- Femme
                local femaleSkin = {
                    sex = 1,
                    tshirt_1 = 16,
                    tshirt_2 = 0,
                    torso_1 = 732,
                    torso_2 = 0,
                    arms = 30,
                    pants_1 = 29,
                    pants_2 = 0,
                    shoes_1 = 4,
                    shoes_2 = 0
                }
                TriggerEvent('skinchanger:loadSkin', femaleSkin)
                Wait(500)
                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                end)
            end
        end)    
    end)

    return Character
end

RegisterNUICallback("submit", function(data)
    local ped = PlayerPedId()

    SetPlayerControl(PlayerId(), true, 12)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "close" })
    SetEntityCoordsNoOffset(ped, Config_charcreator.spawnpoint.x, Config_charcreator.spawnpoint.y, Config_charcreator.spawnpoint.z)
    SetEntityHeading(ped, Config_charcreator.spawnpoint.h)
    RenderScriptCams(false, false, 750, true, true)

    TriggerServerEvent("Creator:removeBucket")

    if data.sex == 'm' then
        local skin = {
            sex = 0,
            tshirt_1 = 23,
            tshirt_2 = 0,
            torso_1 = 3,
            torso_2 = 2,
            arms = 6,
            pants_1 = 388,
            pants_2 = 0,
            shoes_1 = 160,
            shoes_2 = 2
        }
        TriggerEvent('skinchanger:loadSkin', skin)
        Wait(500)
        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerServerEvent('esx_skin:save', skin)
        end)
    elseif data.sex == 'f' then
        local skin = {
            sex = 1,
            tshirt_1 = 16,
            tshirt_2 = 0,
            torso_1 = 732,
            torso_2 = 0,
            arms = 30,
            pants_1 = 29,
            pants_2 = 0,
            shoes_1 = 4,
            shoes_2 = 0
        }
        TriggerEvent('skinchanger:loadSkin', skin)
        Wait(500)
        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerServerEvent('esx_skin:save', skin)
        end)
    end

    TriggerServerEvent('Creator:save', data.firstname, data.lastname, data.date, data.sex, data.height)
end)


RegisterNUICallback("moveCam", function(data)
    local coords = GetEntityCoords(PlayerPedId())

    local get = getMovementData(data.slot)
    local offset = offsetPosition(coords.x, coords.y, get.heading + data.offset, get.distance)
    local targetPositionFly = vector3(offset.x, offset.y, get.camPos.z)
    local targetPositionPoint = vector3(coords.x, coords.y, get.pointPos.z)
    SetCamCoord(cam, targetPositionFly)
    PointCamAtCoord(cam, targetPositionPoint)
end)

RegisterNUICallback('zoom', function(data)
    zoomToSlot(data.slot)
end)

RegisterNUICallback("error", function()
    ESX.ShowNotification("~s~Vous n'avez pas correctement rempli votre identité.")
end)

function zoomToSlot(slot)
    local coords = GetEntityCoords(PlayerPedId())

    local data = getMovementData(slot)
    local offset = offsetPosition(coords.x, coords.y, data.heading, data.distance)
    local targetPositionFly = vector3(offset.x, offset.y, data.camPos.z)
    local targetPositionPoint = vector3(coords.x, coords.y, data.pointPos.z)
    SetCamCoord(cam, targetPositionFly)
    PointCamAtCoord(cam, targetPositionPoint)
end

function getMovementData(slot)
    local data = {
        heading = GetEntityHeading(PlayerPedId()),
        distance = 1,
        camPos = {
            z = GetEntityCoords(PlayerPedId()).z,
            y = GetEntityCoords(PlayerPedId()).y
        },
        pointPos = {
            z = GetEntityCoords(PlayerPedId()).z,
            y = GetEntityCoords(PlayerPedId()).y
        }
    }

    if slot == "identity" or slot == "clothes" then
        data.distance = 2.4
        data.camPos.z = data.camPos.z + 0.2
        data.pointPos.z = data.pointPos.z + 0.2
    else
        data.camPos.z = data.camPos.z + 0.5
        data.pointPos.z = data.pointPos.z + 0.5
    end
    
    return data
end

function offsetPosition(x, y, rot, distance)
    local obj = {
        x = x + math.sin(-rot * math.pi / 180) * distance,
        y = y + math.cos(-rot * math.pi / 180) * distance
    }
    return obj
end

RegisterNetEvent("Creator:openMenu")
AddEventHandler("Creator:openMenu", function()
    local ped = PlayerPedId()
    TriggerServerEvent("Creator:setBucket")
    SetPlayerControl(PlayerId(), false, 12)
    SetEntityCoords(ped, Config_charcreator.spawnpoint.x, Config_charcreator.spawnpoint.y, Config_charcreator.spawnpoint.z)
    SetEntityHeading(ped, Config_charcreator.spawnpoint.h)
    Wait(1000)
    DisplayRadar(false)
    
    createCharcreator()
end)

RegisterNetEvent("Creator:teleportPlayer")
AddEventHandler("Creator:teleportPlayer", function(spawnLocation)
    local ped = PlayerPedId()

    RenderScriptCams(false, false, 750, true, true)
    DestroyCam(cam, false)
    SetEntityCoordsNoOffset(ped, spawnLocation.x, spawnLocation.y, spawnLocation.z, false, false, false)
    SetEntityHeading(ped, 0.0)
    DisplayRadar(true)
    SetPlayerControl(PlayerId(), true, 12)
end)