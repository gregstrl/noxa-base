--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(100)
	end
end)

function tableHasKey(table,key)
    return table[key] ~= nil
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
	blockinput = true 

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
		Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() 
		Wait(500) 
		blockinput = false 
		return result 
	else
		Wait(500) 
		blockinput = false 
		return nil 
	end
end

function SpawnPed(pedname)
    local j1 = PlayerId()
    local p1 = GetHashKey(pedname)
    RequestModel(p1)
    while not HasModelLoaded(p1) do
        Wait(100)
    end
    SetPlayerModel(j1, p1)
    SetModelAsNoLongerNeeded(p1)
    isWPed = true
    -- Anti Spam
    TriggerEvent('esx:restoreLoadout')
    Wait(250)
end


function SetCus(ped, componentId, drawableId, textureId, paletteId)
    SetPedComponentVariation(ped, componentId, drawableId, textureId, paletteId)
end

function SetProp(ped,componentId,drawableId,TextureId,attach)
    SetPedPropIndex(ped,componentId,drawableId,TextureId,attach)
end

function Clear(ped,propId)
    ClearPedProp(ped,propId)
end

function ParticleMaker(asset, nomanim, scale)
    local player = PlayerPedId()
    local PlayerCoords = GetEntityCoords(player)
    if not HasNamedPtfxAssetLoaded(asset) then
        RequestNamedPtfxAsset(asset)
        while not HasNamedPtfxAssetLoaded(asset) do
            Wait(1)
        end
    end
    while true do
        Wait(1)
        UseParticleFxAssetNextCall(asset)
        local part = StartParticleFxNonLoopedAtCoord(nomanim, PlayerCoords, 0.0, 0.0, 0.0, scale, false, false, false, false)
        Wait(200)
        break
    end
end

function BourTonMarraineUnNeon(toggle)
    local me = PlayerPedId()
    local myCar = GetVehiclePedIsIn(me, false)
    SetVehicleNeonLightEnabled(myCar, 0, toggle)
    SetVehicleNeonLightEnabled(myCar, 1, toggle)
    SetVehicleNeonLightEnabled(myCar, 2, toggle)
    SetVehicleNeonLightEnabled(myCar, 3, toggle)
    SetVehicleNeonLightsColour(myCar, 222, 222, 222)
end

function ChangeCouleurNeon(r, g, b)
    local me = PlayerPedId()
    local myCar = GetVehiclePedIsIn(me, false)
    SetVehicleNeonLightsColour(myCar, r, g, b)
end

function ResetPed()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        local isMale = skin.sex == 0

        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                Wait(200)
                TriggerEvent('esx:restoreLoadout')
                isWPed = false
            end)
        end)
    end)
end

Advancednotif = function(title, subject, msg, icon, iconType)
    SetNotificationTextEntry('STRING')
    AddTextComponentSubstringPlayerName(msg)
    SetNotificationMessage(icon, icon, false, iconType, title, subject)
    DrawNotification(false, false)
end

ColoredNotif = function(msg, color)
	SetNotificationBackgroundColor(color)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringWebsite(msg)
	DrawNotification(false, true)
end

-- SPAWN OBJECT 

 ------------ FUNCTION MENU PROPS



 function SpawnObj2(obj)
    local playerPed = PlayerPedId()
    local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
    local objectCoords = (coords + forward * 3.0)
    local Ent = nil

    SpawnObject(obj, objectCoords, function(obj)
        SetEntityCoords(obj, objectCoords, 0.0, 0.0, 0.0, 0)
        SetEntityHeading(obj, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(obj)
        Ent = obj
        Wait(1)
    end)
    Wait(1)
    while Ent == nil do Wait(1) end
    SetEntityHeading(Ent, GetEntityHeading(playerPed))
    PlaceObjectOnGroundProperly(Ent)
    local placed = false
    while not placed do
        Wait(1)
        local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
        local objectCoords = (coords + forward * 3.0)
        SetEntityCoords(Ent, objectCoords, 0.0, 0.0, 0.0, 0)
        SetEntityHeading(Ent, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(Ent)
        SetEntityAlpha(Ent, 170, 170)

        if IsControlJustReleased(1, 38) then
            placed = true
        end
    end

    FreezeEntityPosition(Ent, true)
    SetEntityInvincible(Ent, true)
    ResetEntityAlpha(Ent)
    local NetId = NetworkGetNetworkIdFromEntity(Ent)
    table.insert(object, NetId)

end


function RemoveObj(id, k)
    Citizen.CreateThread(function()
        SetNetworkIdCanMigrate(id, true)
        local entity = NetworkGetEntityFromNetworkId(id)
        NetworkRequestControlOfEntity(entity)
        local test = 0
        while test > 100 and not NetworkHasControlOfEntity(entity) do
            NetworkRequestControlOfEntity(entity)
            Wait(1)
            test = test + 1
        end
        SetEntityAsNoLongerNeeded(entity)

        local test = 0
        while test < 100 and DoesEntityExist(entity) do 
            SetEntityAsNoLongerNeeded(entity)
            TriggerServerEvent("DeleteEntity", NetworkGetNetworkIdFromEntity(entity))
            DeleteEntity(entity)
            DeleteObject(entity)
            if not DoesEntityExist(entity) then 
                table.remove(object, k)
            end
            SetEntityCoords(entity, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0)
            Wait(1)
            test = test + 1
        end
    end)
end




function GoodName(hash)
    if hash == GetHashKey("prop_roadcone02a") then
        return "Cone"
    elseif hash == GetHashKey("prop_barrier_work05") then
        return "Barrière"
    else
        return hash
    end

end


function RequestModels(modelHash)
    if not HasModelLoaded(modelHash) and IsModelInCdimage(modelHash) then
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(1)
        end
    end
end


local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end

        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end

        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)

        local next = true
        repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
        until not next

        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end
