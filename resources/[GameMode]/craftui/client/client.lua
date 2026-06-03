ESX = exports['Framework']:getSharedObject()
local isOpen = false
local currentCraft = nil
local PlayerData = {}
local isNearMarker = false
local currentJob = nil
CRAFT_RECIPES = {}

CreateThread(function()
    while not ESX.IsPlayerLoaded() do
        Wait(100)
    end
    
    PlayerData = ESX.GetPlayerData()
    TriggerServerEvent('craft:getPlayerInventory')
end)

local function LoadRecipes()
    local configFile = LoadResourceFile(GetCurrentResourceName(), 'html/config.js')
    if not configFile then return {} end

    local recipesStr = configFile:match("window%.CRAFT_RECIPES%s*=%s*({.-});")
    if not recipesStr then return {} end

    recipesStr = recipesStr:gsub("/%*.-%*/", ""):gsub("//[^\n]*[\n]?", "")
    
    local success, recipes = pcall(json.decode, recipesStr)
    if success and recipes then
        return recipes
    end
    return {}
end

local function GetAllowedRecipes()
    if not PlayerData.job then return {} end
    local jobConfig = Config.JobRecipes[PlayerData.job.name]
    if not jobConfig then return {} end
    return jobConfig.recipes
end

local function HasAccessToRecipe(recipeName)
    if not PlayerData or not PlayerData.job or not PlayerData.job.name then 
        return false 
    end
    
    local jobConfig = Config.JobRecipes[PlayerData.job.name]
    if not jobConfig then 
        return false 
    end

    recipeName = string.lower(recipeName)

    for _, allowedRecipe in ipairs(jobConfig.recipes) do
        if string.lower(allowedRecipe) == recipeName then
            return true
        end
    end
    return false
end

function OpenCraftUI()
    if not PlayerData or not PlayerData.job or not PlayerData.job.name then
        ESX.ShowNotification('Vous n\'avez pas accès à ce craft !')
        return
    end

    local jobConfig = Config.JobRecipes[PlayerData.job.name]
    if not jobConfig then
        ESX.ShowNotification('Vous n\'avez pas accès à ce craft')
        return
    end

    isOpen = true
    TriggerServerEvent('craft:getPlayerInventory')
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'openUI'
    })
end

function CloseCraftUI()
    isOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "closeUI"
    })
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local wait = 1000
        isNearMarker = false

        if PlayerData.job then
            local jobConfig = Config.JobRecipes[PlayerData.job.name]
            if jobConfig and jobConfig.marker then
                local marker = jobConfig.marker
                local distance = #(playerCoords - marker.coords)

                if distance < marker.drawDistance then
                    wait = 0
                    DrawMarker(marker.type, 
                        marker.coords.x, marker.coords.y, marker.coords.z, 
                        0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
                        marker.size.x, marker.size.y, marker.size.z, 
                        marker.color.r, marker.color.g, marker.color.b, marker.color.a, 
                        false, true, 2, false, nil, nil, false)

                    if distance < marker.interactDistance then
                        isNearMarker = true
                        ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour accéder au craft')
                        
                        if IsControlJustReleased(0, 38) then
                            OpenCraftUI()
                        end
                    end
                end
            end
        end

        Wait(wait)
    end
end)

RegisterNetEvent('craft:receiveInventory')
AddEventHandler('craft:receiveInventory', function(inventory, recipes)
    CRAFT_RECIPES = recipes
    
    SendNUIMessage({
        type = 'updateInventory',
        inventory = inventory,
        recipes = recipes
    })
end)

function UpdateCraftUI()
    if isOpen then
        SendNUIMessage({
            type = "update",
            data = {
                currentCraft = currentCraft
            }
        })
    end
end

RegisterNetEvent('craft:updateInterface')
AddEventHandler('craft:updateInterface', function(data)
    if data then
        currentCraft = data.currentCraft
        SendNUIMessage({
            type = "updateInterface",
            data = {
                currentCraft = currentCraft,
                inventory = data.inventory
            }
        })
    end
end)

RegisterNetEvent('craft:openUI')
AddEventHandler('craft:openUI', function()
    OpenCraftUI()
end)

RegisterNetEvent('craft:closeUI')
AddEventHandler('craft:closeUI', function()
    CloseCraftUI()
end)

RegisterNUICallback('removeMaterials', function(data, cb)
    if currentCraft then
        TriggerEvent('esx:showNotification', 'Un craft est déjà en cours')
        cb('error')
        return
    end

    if data and data.recipe then
        if not HasAccessToRecipe(data.recipe.name) then
            TriggerEvent('esx:showNotification', 'Vous n\'avez pas accès à ce craft')
            cb('error')
            return
        end

        TriggerServerEvent('craft:removeMaterials', {
            recipe = {
                name = data.recipe.name,
                label = data.recipe.label,
                image = data.recipe.image,
                time = data.recipe.time,
                materials = data.recipe.materials
            },
            quantity = data.quantity or 1
        })
        
        currentCraft = {
            recipe = data.recipe,
            progress = 0,
            timeLeft = tonumber(data.recipe.time)
        }
        
        SendNUIMessage({
            type = "updateInterface",
            data = {
                currentCraft = currentCraft
            }
        })
    end
    cb('ok')
end)

RegisterNUICallback('cancelCraft', function(data, cb)
    if data and data.recipe then
        TriggerServerEvent('craft:cancelCraft', data.recipe)
    end
    
    currentCraft = nil
    
    SendNUIMessage({
        type = "updateInterface",
        data = {
            currentCraft = nil
        }
    })
    
    cb('ok')
end)

RegisterNUICallback('closeUI', function(data, cb)
    CloseCraftUI()
    cb('ok')
end)

RegisterNUICallback('notification', function(data, cb)
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {"CRAFT", data.message}
    })
    cb('ok')
end)

RegisterNetEvent('craft:updateInventory')
AddEventHandler('craft:updateInventory', function(inventory)
    if isOpen then
        SendNUIMessage({
            type = "updateInventory",
            inventory = inventory
        })
    end
end)

CreateThread(function()
    Wait(1000)
    LoadRecipes()
end)

RegisterNetEvent('craft:addCraftHistory')
AddEventHandler('craft:addCraftHistory', function(craft)
    SendNUIMessage({
        type = 'addCraftHistory',
        craft = craft
    })
end) 