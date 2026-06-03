ESX = exports['Framework']:getSharedObject()

local activeCrafts = {}

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

CRAFT_RECIPES = LoadRecipes()

local function GetPlayerInventory(xPlayer)
    local inventory = {}
    for _, item in pairs(xPlayer.getInventory()) do
        if item.count > 0 then
            inventory[item.name] = item.count
        end
    end
    return inventory
end

local function hasRequiredMaterials(xPlayer, materials)
    for _, material in ipairs(materials) do
        local item = xPlayer.getInventoryItem(material.name)
        if not item or item.count < material.quantity then
            return false
        end
    end
    return true
end

local function HasAccessToRecipe(xPlayer, recipeName)
    if not xPlayer or not xPlayer.job then return false end
    local jobConfig = Config.JobRecipes[xPlayer.job.name]
    if not jobConfig then return false end

    recipeName = string.lower(recipeName)

    for _, allowedRecipe in ipairs(jobConfig.recipes) do
        if string.lower(allowedRecipe) == recipeName then
            return true
        end
    end
    return false
end

RegisterServerEvent('craft:startCraft')
AddEventHandler('craft:startCraft', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    if not xPlayer or not HasAccessToRecipe(xPlayer, data.recipe) then
        TriggerClientEvent('esx:showNotification', _source, Config.Messages.noAccess)
        return
    end
    
    if xPlayer then
        if hasRequiredMaterials(xPlayer, data.materials) then
            for _, material in ipairs(data.materials) do
                xPlayer.removeInventoryItem(material.name, material.quantity)
            end
            
            TriggerClientEvent('craft:updateInventory', _source, GetPlayerInventory(xPlayer))
        else
            TriggerClientEvent('esx:showNotification', _source, 'Ingrédients insuffisants')
        end
    end
end)

RegisterServerEvent('craft:finishCraft')
AddEventHandler('craft:finishCraft', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    if xPlayer then
        local itemName = string.lower(data.recipe)
        xPlayer.addInventoryItem(itemName, 1)
        
        local inventory = {}
        for _, item in pairs(xPlayer.getInventory()) do
            if item.count > 0 then
                inventory[item.name] = item.count
            end
        end
        
        TriggerClientEvent('craft:updateInventory', _source, inventory)
        TriggerClientEvent('esx:showNotification', _source, 'Craft terminé avec succès !')
    end
end)

RegisterServerEvent('craft:getPlayerInventory')
AddEventHandler('craft:getPlayerInventory', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    if xPlayer then
        local inventory = GetPlayerInventory(xPlayer)
        local jobConfig = Config.JobRecipes[xPlayer.job.name]
        
        if jobConfig then
            local allowedRecipes = {}
            for recipeName, recipeData in pairs(CRAFT_RECIPES) do
                if HasAccessToRecipe(xPlayer, recipeName) then
                    allowedRecipes[recipeName] = recipeData
                end
            end
            
            TriggerClientEvent('craft:receiveInventory', _source, inventory, allowedRecipes)
        end
    end
end)

RegisterNetEvent('craft:removeMaterials')
AddEventHandler('craft:removeMaterials', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    if not data or not data.recipe or not data.recipe.name then
        TriggerClientEvent('esx:showNotification', source, 'Données de recette invalides')
        return
    end

    if not HasAccessToRecipe(xPlayer, data.recipe.name) then
        TriggerClientEvent('esx:showNotification', source, Config.Messages.noAccess)
        return
    end
    
    local canCraft = true
    local materialsToRemove = {}
    
    for _, material in ipairs(data.recipe.materials) do
        local item = xPlayer.getInventoryItem(material.name)
        if not item or item.count < material.quantity then
            canCraft = false
            break
        end
        table.insert(materialsToRemove, {name = material.name, quantity = material.quantity})
    end
    
    if canCraft then
        for _, material in ipairs(materialsToRemove) do
            xPlayer.removeInventoryItem(material.name, material.quantity)
        end
        
        local craftData = {
            recipe = data.recipe,
            progress = 0,
            timeLeft = tonumber(data.recipe.time),
            startTime = os.time(),
            materials = materialsToRemove,
            isCancelled = false
        }
        
        activeCrafts[source] = {
            data = craftData,
            thread = nil
        }
        
        TriggerClientEvent('craft:updateInterface', source, {
            currentCraft = craftData,
            inventory = GetPlayerInventory(xPlayer)
        })
        
        local craftThread = CreateThread(function()
            local endTime = os.time() + craftData.timeLeft
            
            while os.time() < endTime do
                if not activeCrafts[source] or activeCrafts[source].data.isCancelled then
                    return
                end
                
                craftData.timeLeft = endTime - os.time()
                craftData.progress = ((data.recipe.time - craftData.timeLeft) / data.recipe.time) * 100
                
                TriggerClientEvent('craft:updateInterface', source, {
                    currentCraft = craftData,
                    inventory = GetPlayerInventory(xPlayer)
                })
                
                Wait(1000)
            end
            
            if activeCrafts[source] and not activeCrafts[source].data.isCancelled then
                local itemName = data.recipe.name
                if data.recipe.itemId then
                    itemName = data.recipe.itemId
                end
                
                itemName = string.lower(string.gsub(itemName, " ", "_"))
                
                local item = xPlayer.getInventoryItem(itemName)
                if item then
                    xPlayer.addInventoryItem(itemName, 1)
                    TriggerClientEvent('esx:showNotification', source, 'Craft terminé !')

                    TriggerClientEvent('craft:addCraftHistory', source, {
                        item = data.recipe.label or data.recipe.name,
                        quantity = 1,
                        date = os.time()
                    })
                else
                    TriggerClientEvent('esx:showNotification', source, 'Erreur: Item introuvable')
                end
            end
            
            activeCrafts[source] = nil
            
            TriggerClientEvent('craft:updateInterface', source, {
                currentCraft = nil,
                inventory = GetPlayerInventory(xPlayer)
            })
        end)
        
        activeCrafts[source].thread = craftThread
    else
        TriggerClientEvent('esx:showNotification', source, 'Ingrédients insuffisants')
    end
end)

RegisterNetEvent('craft:cancelCraft')
AddEventHandler('craft:cancelCraft', function(recipe)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    
    if activeCrafts[source] then
        activeCrafts[source].data.isCancelled = true
        
        if activeCrafts[source].data.materials then
            for _, material in ipairs(activeCrafts[source].data.materials) do
                xPlayer.addInventoryItem(material.name, material.quantity)
            end
        end
        
        activeCrafts[source] = nil
        
        TriggerClientEvent('craft:updateInterface', source, {
            currentCraft = nil,
            inventory = GetPlayerInventory(xPlayer)
        })
        
        TriggerClientEvent('esx:showNotification', source, 'Craft annulé')
    end
end)

RegisterNetEvent('craft:reloadRecipes')
AddEventHandler('craft:reloadRecipes', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.getGroup() == 'admin' then
        CRAFT_RECIPES = LoadRecipes()
        TriggerClientEvent('esx:showNotification', source, 'Recettes rechargées')
    end
end) 