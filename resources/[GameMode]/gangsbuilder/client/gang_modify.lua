SelectedGang = nil
local gangPositions = nil
local lastJob2Name = nil
local cachedGang = nil
local highestGradeChecked = false
local lastHighestGradeCheck = 0

local isGarageMenuOpen = false
local isVestiaireMenuOpen = false
local isCoffreMenuOpen = false
local isBossMenuOpen = false

local gangBlips = {}

local garageMenu = RageUI.CreateMenu("Garage", "Garage du gang")
local vestiaireMenu = RageUI.CreateMenu("Vestiaire", "Vestiaire du gang")
local coffreMenu = RageUI.CreateMenu("Coffre", "Coffre du gang")
local coffreDepositMenu = RageUI.CreateSubMenu(coffreMenu, "Déposer", "Déposer des objets")
local coffreWithdrawMenu = RageUI.CreateSubMenu(coffreMenu, "Retirer", "Retirer des objets")
local bossMenu = RageUI.CreateMenu("Patron", "Actions du patron")
local bossEmployeesMenu = RageUI.CreateSubMenu(bossMenu, "Gestion employés", "Gérer les employés")

function CreateGangBlip(pos, sprite, color, scale, name, shortRange)
    local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, color)
    SetBlipScale(blip, scale)
    SetBlipAsShortRange(blip, shortRange)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(blip)
    return blip
end

function RemoveGangBlips()
    for _, blip in pairs(gangBlips) do
        RemoveBlip(blip)
    end
    gangBlips = {}
end

function CreateGangBlips(gang)
    RemoveGangBlips()
    
    if gangPositions then
        if gangPositions.Coffre then
            gangBlips.coffre = CreateGangBlip(gangPositions.Coffre, 478, 1, 0.5, gang.label .. " - Coffre", true)
        end
        
        if gangPositions.Garage then
            gangBlips.garage = CreateGangBlip(gangPositions.Garage, 524, 3, 0.5, gang.label .. " - Garage", true)
        end
        
        if gangPositions.Vestiaire then
            gangBlips.vestiaire = CreateGangBlip(gangPositions.Vestiaire, 366, 11, 0.5, gang.label .. " - Vestiaire", true)
        end
        
        if gangPositions.Patron then
            gangBlips.patron = CreateGangBlip(gangPositions.Patron, 525, 26, 0.5, gang.label .. " - Patron", true)
        end
        
        if gangPositions.SuppressionVehicule then
            gangBlips.supprVehicule = CreateGangBlip(gangPositions.SuppressionVehicule, 318, 1, 0.5, gang.label .. " - Ranger véhicule", true)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        RageUI.IsVisible(listeMenu, function()
            RageUI.Separator("Liste des Groupes actifs")
            
            if GangsList and #GangsList > 0 then
                for i = 1, #GangsList do
                    RageUI.Button(GangsList[i].label, nil, {RightLabel = "< Modifier >"}, true, {
                        onSelected = function()
                            SelectedGang = GangsList[i]
                            RageUI.Visible(modifyMenu, true)
                        end
                    })
                end
            else
                RageUI.Button("Aucun gang disponible", nil, {}, false, {})
            end
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        
        if PlayerData and PlayerData.job2 and PlayerData.job2.name ~= 'unemployed2' then
            if lastJob2Name ~= PlayerData.job2.name or gangPositions == nil then
                lastJob2Name = PlayerData.job2.name
                
                ESX.TriggerServerCallback('gangsbuilder:getGangByJob', function(gang)
                    if gang and gang.positions then
                        gangPositions = gang.positions
                        cachedGang = gang
                        CreateGangBlips(gang)
                    else
                        gangPositions = nil
                        cachedGang = nil
                        RemoveGangBlips()
                    end
                end, PlayerData.job2.name)
                
                Citizen.Wait(500)
            end
        else
            if gangPositions ~= nil then
                gangPositions = nil
                cachedGang = nil
                lastJob2Name = nil
                RemoveGangBlips()
            end
            Citizen.Wait(1000)
        end
        
        if gangPositions then
            if gangPositions.Coffre and #(coords - vector3(gangPositions.Coffre.x, gangPositions.Coffre.y, gangPositions.Coffre.z)) < 20.0 then
                DrawMarker(22, gangPositions.Coffre.x, gangPositions.Coffre.y, gangPositions.Coffre.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9, 0.9, 255, 0, 0, 100, false, true, 2, false, nil, nil, false)
                
                if #(coords - vector3(gangPositions.Coffre.x, gangPositions.Coffre.y, gangPositions.Coffre.z)) < 1.5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au coffre")
                    
                    if IsControlJustReleased(0, 38) then
                        OpenCoffreMenu(cachedGang)
                    end
                end
            end
            
            if gangPositions.Patron and PlayerData.job2.grade_name == 'boss' and #(coords - vector3(gangPositions.Patron.x, gangPositions.Patron.y, gangPositions.Patron.z)) < 20.0 then
                DrawMarker(22, gangPositions.Patron.x, gangPositions.Patron.y, gangPositions.Patron.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9, 0.9, 0, 0, 255, 100, false, true, 2, false, nil, nil, false)
                
                if #(coords - vector3(gangPositions.Patron.x, gangPositions.Patron.y, gangPositions.Patron.z)) < 1.5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu patron")
                    
                    if IsControlJustReleased(0, 38) then
                        OpenBossMenu(cachedGang)
                    end
                end
            end
            
            if gangPositions.Garage and #(coords - vector3(gangPositions.Garage.x, gangPositions.Garage.y, gangPositions.Garage.z)) < 20.0 then
                DrawMarker(36, gangPositions.Garage.x, gangPositions.Garage.y, gangPositions.Garage.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9, 0.9, 0, 255, 0, 100, false, true, 2, false, nil, nil, false)
                
                if #(coords - vector3(gangPositions.Garage.x, gangPositions.Garage.y, gangPositions.Garage.z)) < 1.5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au garage")
                    
                    if IsControlJustReleased(0, 38) then
                        OpenGarageMenu(cachedGang)
                    end
                end
            end
            
            if gangPositions.SuppressionVehicule then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                
                if DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
                    if #(coords - vector3(gangPositions.SuppressionVehicule.x, gangPositions.SuppressionVehicule.y, gangPositions.SuppressionVehicule.z)) < 20.0 then
                        DrawMarker(1, gangPositions.SuppressionVehicule.x, gangPositions.SuppressionVehicule.y, gangPositions.SuppressionVehicule.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 255, 0, 0, 100, false, true, 2, false, nil, nil, false)
                        
                        if #(coords - vector3(gangPositions.SuppressionVehicule.x, gangPositions.SuppressionVehicule.y, gangPositions.SuppressionVehicule.z)) < 3.0 then
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger le véhicule")
                            
                            if IsControlJustReleased(0, 38) then
                                local plate = GetVehicleNumberPlateText(vehicle)
                                
                                ESX.Game.DeleteVehicle(vehicle)
                                
                                TriggerServerEvent('gangsbuilder:deleteGangVehicle', plate)
                            end
                        end
                    end
                end
            end
            
            if gangPositions.Vestiaire and #(coords - vector3(gangPositions.Vestiaire.x, gangPositions.Vestiaire.y, gangPositions.Vestiaire.z)) < 20.0 then
                DrawMarker(20, gangPositions.Vestiaire.x, gangPositions.Vestiaire.y, gangPositions.Vestiaire.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9, 0.9, 255, 255, 0, 100, false, true, 2, false, nil, nil, false)
                
                if #(coords - vector3(gangPositions.Vestiaire.x, gangPositions.Vestiaire.y, gangPositions.Vestiaire.z)) < 1.5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au vestiaire")
                    
                    if IsControlJustReleased(0, 38) then
                        OpenVestiaireMenu(cachedGang)
                    end
                end
            end
        end
    end
end)

function OpenGarageMenu(gang)
    if isGarageMenuOpen then return end
    isGarageMenuOpen = true
    
    if not gang then 
        isGarageMenuOpen = false
        return 
    end
    
    local currentGrade = PlayerData.job2 and PlayerData.job2.grade or 0
    
    ESX.TriggerServerCallback('gangsbuilder:getGradePermissions', function(permissions)
        if not permissions or permissions.garage_access ~= 1 then
            ESX.ShowNotification("Vous n'avez pas accès au garage")
            isGarageMenuOpen = false
            return
        end
        
        local isMenuOpen = true
        local markerPos = vector3(gangPositions.Garage.x, gangPositions.Garage.y, gangPositions.Garage.z)
        local allowedVehicles = permissions.vehicles or {}
    
        ESX.TriggerServerCallback('gangsbuilder:getGangVehicles', function(vehicles)
            RageUI.Visible(garageMenu, true)
            
            Citizen.CreateThread(function()
                while isMenuOpen do
                    Citizen.Wait(1)
                    
                    local playerPos = GetEntityCoords(PlayerPedId())
                    local distance = #(playerPos - markerPos)
                    
                    if distance > 2.0 then
                        RageUI.CloseAll()
                        isMenuOpen = false
                        isGarageMenuOpen = false
                        return
                    end
                    
                    RageUI.IsVisible(garageMenu, function()
                        RageUI.Separator("Garage - " .. gang.label)
                        
                        if IsPedInAnyVehicle(PlayerPedId(), false) then
                            RageUI.Separator("↓ ~b~Véhicule actuel~s~ ↓")
                            RageUI.Separator("Utilisez le cercle rouge pour ranger le véhicule et le revoir ici !")
                            RageUI.Separator("")
                        end
                        
                        RageUI.Separator("↓ ~g~Véhicules disponibles~s~ ↓")
                        
                        if vehicles and #vehicles > 0 then
                            for i = 1, #vehicles do
                                local v = vehicles[i]
                                local props = json.decode(v.properties or '{}')
                                local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(v.model))
                                if vehicleName == "NULL" then
                                    vehicleName = GetDisplayNameFromVehicleModel(v.model)
                                end
                                
                                local hasVehicleAccess = true
                                if type(allowedVehicles) == 'table' and #allowedVehicles > 0 then
                                    hasVehicleAccess = false
                                    for _, plate in ipairs(allowedVehicles) do
                                        if plate == v.plate then
                                            hasVehicleAccess = true
                                            break
                                        end
                                    end
                                end
                                
                                RageUI.Button(
                                    vehicleName .. " [" .. v.plate .. "]", 
                                    hasVehicleAccess and "Disponible" or "~r~Accès refusé par votre grade", 
                                    {
                                        RightLabel = hasVehicleAccess and "Sortir →" or ""
                                    }, 
                                    hasVehicleAccess, 
                                    {
                                        onSelected = function()
                                            if hasVehicleAccess then
                                                SpawnGangVehicle(v.model, v.plate, props, gang)
                                                RageUI.CloseAll()
                                                isMenuOpen = false
                                                isGarageMenuOpen = false
                                            end
                                        end
                                    }
                                )
                            end
                        else
                            RageUI.Button("Aucun véhicule disponible", nil, {}, false, {})
                        end
                    end)
                    
                    if not RageUI.Visible(garageMenu) then
                        garageMenu = RageUI.CreateMenu("Garage", "Garage du gang")
                        isMenuOpen = false
                        isGarageMenuOpen = false
                        break
                    end
                end
            end)
        end, gang.name, currentGrade)
    end, gang.name)
end

function SpawnGangVehicle(model, plate, properties, gang)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    
    if gangPositions and gangPositions.SpawnVehicule then
        coords = vector3(gangPositions.SpawnVehicule.x, gangPositions.SpawnVehicule.y, gangPositions.SpawnVehicule.z)
        heading = gangPositions.SpawnVehicule.heading or heading
    end
    
    ESX.TriggerServerCallback('gangsbuilder:takeOutGangVehicle', function(success)
        if success then
            ESX.Game.SpawnVehicle(model, coords, heading, function(vehicle)
                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                SetVehicleNumberPlateText(vehicle, plate)
                
                if properties then
                    if properties.color then
                        SetVehicleColours(vehicle, properties.color, properties.color)
                    end
                end
                
                SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                
                ESX.ShowNotification("Ce véhicule ne sera à nouveau disponible que dans 30 minutes s'il n'est pas rangé au garage.")
            end)
        else
            ESX.ShowNotification("Impossible de sortir ce véhicule")
        end
    end, gang.name, plate)
end

function OpenVestiaireMenu(gang)
    if isVestiaireMenuOpen then return end
    isVestiaireMenuOpen = true
    
    if not gang then 
        isVestiaireMenuOpen = false
        return 
    end
    
    local currentGrade = PlayerData.job2 and PlayerData.job2.grade or 0
    local isBoss = PlayerData.job2 and PlayerData.job2.grade_name == 'boss'
    
    ESX.TriggerServerCallback('gangsbuilder:getGradePermissions', function(permissions)
        if not permissions or permissions.vestiaire_access ~= 1 then
            ESX.ShowNotification("Vous n'avez pas accès au vestiaire")
            isVestiaireMenuOpen = false
            return
        end
        
        local isMenuOpen = true
        local markerPos = vector3(gangPositions.Vestiaire.x, gangPositions.Vestiaire.y, gangPositions.Vestiaire.z)
        local allowedClothes = permissions.clothes or {}
        
        local canCreateOutfits = isBoss
        
        if not canCreateOutfits and permissions.vestiaire_create ~= nil then
            canCreateOutfits = permissions.vestiaire_create == 1
        end
        
        ESX.TriggerServerCallback('gangsbuilder:getGangClothes', function(clothes)
            RageUI.Visible(vestiaireMenu, true)
            
            Citizen.CreateThread(function()
                while isMenuOpen do
                    Citizen.Wait(1)
                    
                    local playerPos = GetEntityCoords(PlayerPedId())
                    local distance = #(playerPos - markerPos)
                    
                    if distance > 2.0 then
                        RageUI.CloseAll()
                        isMenuOpen = false
                        isVestiaireMenuOpen = false
                        return
                    end
                    
                    RageUI.IsVisible(vestiaireMenu, function()
                        RageUI.Separator("Vestiaire - " .. gang.label)
                        
                        RageUI.Button("Remettre sa tenue civile", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                    TriggerEvent('skinchanger:loadSkin', skin)
                                end)
                            end
                        })
                        
                        RageUI.Separator("↓ ~b~Tenues disponibles~s~ ↓")
                        
                        if clothes and #clothes > 0 then
                            for i = 1, #clothes do
                                local c = clothes[i]
                                
                                local hasClothesAccess = true
                                if type(allowedClothes) == 'table' and #allowedClothes > 0 then
                                    hasClothesAccess = false
                                    for _, id in ipairs(allowedClothes) do
                                        if id == c.id then
                                            hasClothesAccess = true
                                            break
                                        end
                                    end
                                end
                                
                                RageUI.Button(c.label, c.creator and "Créée par: " .. c.creator or nil, {RightLabel = hasClothesAccess and "Porter →" or "~r~Non autorisé"}, hasClothesAccess, {
                                    onSelected = function()
                                        if hasClothesAccess then
                                            TriggerEvent('skinchanger:loadSkin', json.decode(c.skin))
                                        end
                                    end
                                })
                            end
                        else
                            RageUI.Button("Aucune tenue disponible", nil, {}, false, {})
                        end
                        
                        if canCreateOutfits then
                            RageUI.Separator("↓ ~g~Options supplémentaires~s~ ↓")
                            RageUI.Button("Sauvegarder une tenue", nil, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    local label = KeyboardInput("Nom de la tenue:", "", 20)
                                    if label and label ~= "" then
                                        local existingTenue = false
                                        for i = 1, #clothes do
                                            if clothes[i].label == label then
                                                existingTenue = true
                                                break
                                            end
                                        end
                                        
                                        if existingTenue then
                                            ESX.ShowNotification("Une tenue avec ce nom existe déjà")
                                            return
                                        end
                                        
                                        if #clothes >= gang.maxTenues then
                                            ESX.ShowNotification("Nombre maximum de tenues atteint (" .. gang.maxTenues .. ")")
                                            return
                                        end
                                        
                                        TriggerEvent('skinchanger:getSkin', function(skin)
                                            TriggerServerEvent('gangsbuilder:saveGangClothes', gang.name, label, json.encode(skin))
                                            ESX.ShowNotification("Tenue sauvegardée")
                                            
                                            Citizen.Wait(500)
                                            ESX.TriggerServerCallback('gangsbuilder:getGangClothes', function(updatedClothes)
                                                clothes = updatedClothes
                                            end, gang.name)
                                        end)
                                    else
                                        ESX.ShowNotification("Nom de tenue invalide")
                                    end
                                end
                            })
                        end
                    end)
                    
                    if not RageUI.Visible(vestiaireMenu) then
                        vestiaireMenu = RageUI.CreateMenu("Vestiaire", "Vestiaire du gang")
                        isMenuOpen = false
                        isVestiaireMenuOpen = false
                        break
                    end
                end
            end)
        end, gang.name, currentGrade)
    end, gang.name, currentGrade)
end

function OpenCoffreMenu(gang)
    if isCoffreMenuOpen then return end
    isCoffreMenuOpen = true
    
    if not gang then 
        isCoffreMenuOpen = false
        return 
    end
    
    local currentGrade = PlayerData.job2 and PlayerData.job2.grade or 0
    
    ESX.TriggerServerCallback('gangsbuilder:getGradePermissions', function(permissions)
        if not permissions or permissions.coffre_access ~= 1 then
            ESX.ShowNotification("Vous n'avez pas accès au coffre")
            isCoffreMenuOpen = false
            return
        end
        
        local isMenuOpen = true
        local markerPos = vector3(gangPositions.Coffre.x, gangPositions.Coffre.y, gangPositions.Coffre.z)
        local canDeposit = permissions.coffre_deposit == 1
        local canTake = permissions.coffre_take == 1
        local canTakeWeapons = permissions.coffre_weapons == 1
        local canTakeItems = permissions.coffre_items == 1
        local canTakeMoney = permissions.coffre_money == 1
        
        local gangInventory = nil
        local playerInventory = nil
        local lastInventoryUpdate = 0
        local lastPlayerInventoryUpdate = 0
        local needsInventoryRefresh = true
        local needsPlayerInventoryRefresh = true
        local depositMenuOpened = false
        local withdrawMenuOpened = false
        
        local function loadGangInventory(callback)
            if needsInventoryRefresh or GetGameTimer() - lastInventoryUpdate > 5000 then
                ESX.TriggerServerCallback('gangsbuilder:getGangInventory', function(inventory)
                    gangInventory = inventory
                    lastInventoryUpdate = GetGameTimer()
                    needsInventoryRefresh = false
                    if callback then callback() end
                end, gang.name)
            else
                if callback then callback() end
            end
        end
        
        local function loadPlayerInventory(callback)
            if needsPlayerInventoryRefresh or GetGameTimer() - lastPlayerInventoryUpdate > 5000 then
                ESX.TriggerServerCallback('gangsbuilder:getPlayerInventory', function(inventory)
                    playerInventory = inventory
                    lastPlayerInventoryUpdate = GetGameTimer()
                    needsPlayerInventoryRefresh = false
                    if callback then callback() end
                end)
            else
                if callback then callback() end
            end
        end
        
        loadGangInventory(function()
            RageUI.Visible(coffreMenu, true)
            
            Citizen.CreateThread(function()
                while isMenuOpen do
                    Citizen.Wait(1)
                    
                    local playerPos = GetEntityCoords(PlayerPedId())
                    local distance = #(playerPos - markerPos)
                    
                    if distance > 2.0 then
                        RageUI.CloseAll()
                        isMenuOpen = false
                        isCoffreMenuOpen = false
                        return
                    end
                    
                    RageUI.IsVisible(coffreMenu, function()
                        RageUI.Separator("Coffre - " .. gang.label)
                        
                        RageUI.Button("Déposer des objets", canDeposit and nil or "Vous n'avez pas la permission", {RightLabel = "→"}, canDeposit, {
                            onSelected = function()
                                needsPlayerInventoryRefresh = true
                                depositMenuOpened = true
                                loadPlayerInventory()
                            end
                        }, coffreDepositMenu)
                        
                        RageUI.Button("Retirer des objets", canTake and nil or "Vous n'avez pas la permission", {RightLabel = "→"}, canTake, {
                            onSelected = function()
                                needsInventoryRefresh = true
                                withdrawMenuOpened = true
                                loadGangInventory()
                            end
                        }, coffreWithdrawMenu)
                    end)
                    
                    RageUI.IsVisible(coffreDepositMenu, function()
                        RageUI.Separator("Votre inventaire")
                        
                        if not playerInventory and depositMenuOpened then
                            RageUI.Button("Chargement...", nil, {}, false, {})
                            loadPlayerInventory()
                            depositMenuOpened = false
                        elseif playerInventory then
                            if canTakeItems and playerInventory.items and #playerInventory.items > 0 then
                                for i = 1, #playerInventory.items do
                                    local item = playerInventory.items[i]
                                    if item and item.count and item.count > 0 then
                                        RageUI.Button(item.label .. " x" .. item.count, nil, {RightLabel = "Déposer →"}, true, {
                                            onSelected = function()
                                                local count = NumberInput("Quantité à déposer:", nil, 5)
                                                if count and count > 0 and count <= item.count then
                                                    TriggerServerEvent('gangsbuilder:putItemInGangInventory', gang.name, 'item_standard', item.name, count)
                                                    needsPlayerInventoryRefresh = true
                                                    needsInventoryRefresh = true
                                                    Citizen.Wait(300)
                                                    loadPlayerInventory()
                                                else
                                                    ESX.ShowNotification("Quantité invalide")
                                                end
                                            end
                                        })
                                    end
                                end
                            elseif canTakeItems and playerInventory.items then
                                RageUI.Button("Inventaire vide", nil, {}, false, {})
                            end
                            
                            if canTakeMoney and playerInventory.blackMoney and playerInventory.blackMoney > 0 then
                                RageUI.Button("Argent sale: $" .. playerInventory.blackMoney, nil, {RightLabel = "Déposer →"}, true, {
                                    onSelected = function()
                                        local count = NumberInput("Montant à déposer:", nil, 8)
                                        if count and count > 0 and count <= playerInventory.blackMoney then
                                            TriggerServerEvent('gangsbuilder:putItemInGangInventory', gang.name, 'item_account', 'black_money', count)
                                            needsPlayerInventoryRefresh = true
                                            needsInventoryRefresh = true
                                            Citizen.Wait(300)
                                            loadPlayerInventory()
                                        else
                                            ESX.ShowNotification("Montant invalide")
                                        end
                                    end
                                })
                            end
                            
                            if canTakeWeapons and playerInventory.weapons and type(playerInventory.weapons) == 'table' and #playerInventory.weapons > 0 then
                                RageUI.Separator("Armes")
                                for i = 1, #playerInventory.weapons do
                                    local weapon = playerInventory.weapons[i]
                                    if weapon and type(weapon) == 'table' then
                                        local ammoDisplay = (weapon.ammo ~= nil) and weapon.ammo or 0
                                        RageUI.Button((weapon.label or "Arme") .. " [" .. ammoDisplay .. " munitions]", nil, {RightLabel = "Déposer →"}, true, {
                                            onSelected = function()
                                                TriggerServerEvent('gangsbuilder:putItemInGangInventory', gang.name, 'item_weapon', weapon.name, ammoDisplay)
                                                needsPlayerInventoryRefresh = true
                                                needsInventoryRefresh = true
                                                Citizen.Wait(300)
                                                loadPlayerInventory()
                                            end
                                        })
                                    end
                                end
                            end
                        end
                    end)
                    
                    RageUI.IsVisible(coffreWithdrawMenu, function()
                        RageUI.Separator("Contenu du coffre")
                        
                        if not gangInventory and withdrawMenuOpened then
                            RageUI.Button("Chargement...", nil, {}, false, {})
                            loadGangInventory()
                            withdrawMenuOpened = false
                        elseif gangInventory then
                            if canTakeItems and gangInventory.items and #gangInventory.items > 0 then
                                for i = 1, #gangInventory.items do
                                    local item = gangInventory.items[i]
                                    if item and item.count and item.count > 0 then
                                        RageUI.Button(item.label .. " x" .. item.count, nil, {RightLabel = "Retirer →"}, true, {
                                            onSelected = function()
                                                local count = NumberInput("Quantité à retirer:", nil, 5)
                                                if count and count > 0 and count <= item.count then
                                                    TriggerServerEvent('gangsbuilder:getItemFromGangInventory', gang.name, 'item_standard', item.name, count)
                                                    needsPlayerInventoryRefresh = true
                                                    needsInventoryRefresh = true
                                                    Citizen.Wait(300)
                                                    loadGangInventory()
                                                else
                                                    ESX.ShowNotification("Quantité invalide")
                                                end
                                            end
                                        })
                                    end
                                end
                            elseif canTakeItems then
                                RageUI.Button("Aucun item", nil, {}, false, {})
                            end
                            
                            if canTakeWeapons and gangInventory.weapons and type(gangInventory.weapons) == 'table' and #gangInventory.weapons > 0 then
                                RageUI.Separator("Armes")
                                for i = 1, #gangInventory.weapons do
                                    local weapon = gangInventory.weapons[i]
                                    if weapon and type(weapon) == 'table' then
                                        local ammoDisplay = (weapon.ammo ~= nil) and weapon.ammo or 0
                                        RageUI.Button((weapon.label or "Arme") .. " [" .. ammoDisplay .. " munitions]", nil, {RightLabel = "Retirer →"}, true, {
                                            onSelected = function()
                                                TriggerServerEvent('gangsbuilder:getItemFromGangInventory', gang.name, 'item_weapon', weapon.name, ammoDisplay)
                                                needsPlayerInventoryRefresh = true
                                                needsInventoryRefresh = true
                                                Citizen.Wait(300)
                                                loadGangInventory()
                                            end
                                        })
                                    end
                                end
                            end
                        end
                    end)
                    
                    if not RageUI.Visible(coffreMenu) and not RageUI.Visible(coffreDepositMenu) and not RageUI.Visible(coffreWithdrawMenu) then
                        coffreMenu = RageUI.CreateMenu("Coffre", "Coffre du gang")
                        coffreDepositMenu = RageUI.CreateSubMenu(coffreMenu, "Déposer", "Déposer des objets")
                        coffreWithdrawMenu = RageUI.CreateSubMenu(coffreMenu, "Retirer", "Retirer des objets")
                        isMenuOpen = false
                        isCoffreMenuOpen = false
                        
                        playerInventory = nil
                        gangInventory = nil
                        collectgarbage("collect")
                        
                        break
                    end
                end
            end)
        end)
    end, gang.name, currentGrade)
end

function KeyboardInput(title, defaultText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', title)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", defaultText or "", "", "", "", maxLength or 20)
    
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

function OpenBossMenu(gang)
    if isBossMenuOpen then return end
    isBossMenuOpen = true
    
    if not gang then 
        isBossMenuOpen = false
        return 
    end
    
    local currentGrade = PlayerData.job2 and PlayerData.job2.grade or 0
    
    local isMenuOpen = true
    local markerPos = vector3(gangPositions.Patron.x, gangPositions.Patron.y, gangPositions.Patron.z)
    
    local bossGradesMenu = RageUI.CreateSubMenu(bossMenu, "Gestion des grades", "Permissions des grades")
    local gradePermissionsMenu = RageUI.CreateSubMenu(bossGradesMenu, "Permissions", "Configurer les permissions")
    local vehiclesPermissionsMenu = RageUI.CreateSubMenu(gradePermissionsMenu, "Véhicules autorisés", "Sélectionner les véhicules")
    local clothesPermissionsMenu = RageUI.CreateSubMenu(gradePermissionsMenu, "Tenues autorisées", "Sélectionner les tenues")
    
    local gangMoney = 0
    local gangGrades = {}
    local selectedGrade = nil
    local selectedGradePermissions = nil
    local gangVehicles = {}
    local gangClothes = {}
    local employeesLoaded = false
    local employees = {}
    
    ESX.TriggerServerCallback('gangsbuilder:getSocietyMoney', function(money)
        gangMoney = money
    end, 'society_' .. gang.name)
    
    ESX.TriggerServerCallback('gangsbuilder:getGangGrades', function(grades)
        gangGrades = grades
    end, gang.name)
    
    ESX.TriggerServerCallback('gangsbuilder:getConfiguredGangVehicles', function(vehicles)
        gangVehicles = vehicles
    end, gang.name)
    
    ESX.TriggerServerCallback('gangsbuilder:getGangClothes', function(clothes)
        gangClothes = clothes
    end, gang.name)
    
    local permValues = {
        coffre_access = true,
        coffre_deposit = true,
        coffre_take = true,
        coffre_weapons = true,
        coffre_items = true,
        coffre_money = true,
        garage_access = true,
        vestiaire_access = true,
        vestiaire_create = true
    }
    
    local selectedVehicles = {}
    local selectedClothes = {}
    
    RageUI.Visible(bossMenu, true)
    
    Citizen.CreateThread(function()
        while isMenuOpen do
            Citizen.Wait(1)
            
            local playerPos = GetEntityCoords(PlayerPedId())
            local distance = #(playerPos - markerPos)
            
            if distance > 3.0 then
                RageUI.CloseAll()
                isMenuOpen = false
                isBossMenuOpen = false
                return
            end
            
            RageUI.IsVisible(bossMenu, function()
                RageUI.Separator("↓ ~g~Actions du patron~s~ ↓")
                
                RageUI.Button("Gestion des employés", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        if not employeesLoaded then
                            ESX.TriggerServerCallback('gangsbuilder:getEmployees', function(gangEmployees)
                                employees = gangEmployees
                                employeesLoaded = true
                            end, gang.name)
                        end
                    end
                }, bossEmployeesMenu)
                
                RageUI.Button("Gestion des grades", "Configurer les permissions des grades", {RightLabel = "→"}, true, {}, bossGradesMenu)
                
                RageUI.Separator("↓ ~b~Gestion de l'argent~s~ ↓")
                RageUI.Separator("Argent en banque: ~g~$" .. gangMoney)
                
                RageUI.Button("Déposer de l'argent", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        local amount = NumberInput("Montant à déposer:", nil, 8)
                        if amount and amount > 0 then
                                TriggerServerEvent('gangsbuilder:depositMoney', 'society_' .. gang.name, amount)
                                Citizen.Wait(200)
                                ESX.TriggerServerCallback('gangsbuilder:getSocietyMoney', function(money)
                                    gangMoney = money
                                end, 'society_' .. gang.name)
                            else
                                ESX.ShowNotification("Montant invalide")
                        end
                    end
                })
                
                RageUI.Button("Retirer de l'argent", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        local amount = NumberInput("Montant à retirer:", nil, 8)
                        if amount and amount > 0 then
                                TriggerServerEvent('gangsbuilder:withdrawMoney', 'society_' .. gang.name, amount)
                                Citizen.Wait(200)
                                ESX.TriggerServerCallback('gangsbuilder:getSocietyMoney', function(money)
                                    gangMoney = money
                                end, 'society_' .. gang.name)
                            else
                                ESX.ShowNotification("Montant invalide")
                        end
                    end
                })
            end)
            
            RageUI.IsVisible(bossEmployeesMenu, function()
                RageUI.Separator("Liste des employés")
                
                if #employees > 0 then
                    for i = 1, #employees do
                        RageUI.Button(employees[i].name, "Grade: " .. employees[i].grade_label, {RightLabel = "Action →"}, true, {
                                onSelected = function()
                                local actionMenu = RageUI.CreateMenu("Actions Employé", "Actions pour " .. employees[i].name)
                                    RageUI.Visible(actionMenu, true)
                                    
                                    Citizen.CreateThread(function()
                                        while true do
                                        Citizen.Wait(1)
                                            
                                            RageUI.IsVisible(actionMenu, function()
                                            RageUI.Button("Promouvoir", nil, {}, true, {
                                                    onSelected = function()
                                                    TriggerServerEvent('gangsbuilder:promoteEmployee', employees[i].identifier, gang.name)
                                                        RageUI.CloseAll()
                                                    Citizen.Wait(300)
                                                    OpenBossMenu(gang)
                                                        employeesLoaded = false
                                                    end
                                                })
                                                
                                            RageUI.Button("Rétrograder", nil, {}, true, {
                                                    onSelected = function()
                                                    TriggerServerEvent('gangsbuilder:demoteEmployee', employees[i].identifier, gang.name)
                                                        RageUI.CloseAll()
                                                    Citizen.Wait(300)
                                                    OpenBossMenu(gang)
                                                        employeesLoaded = false 
                                                    end
                                                })
                                                
                                            RageUI.Button("Virer", nil, {RightBadge = RageUI.BadgeStyle.Alert}, true, {
                                                    onSelected = function()
                                                    TriggerServerEvent('gangsbuilder:fireEmployee', employees[i].identifier, gang.name)
                                                        RageUI.CloseAll()
                                                    Citizen.Wait(300)
                                                    OpenBossMenu(gang)
                                                        employeesLoaded = false 
                                                    end
                                                })
                                            end)
                                            
                                            if not RageUI.Visible(actionMenu) then
                                            actionMenu = RageUI.CreateMenu("Actions Employé", "Actions pour " .. employees[i].name)
                                                break
                                            end
                                        end
                                    end)
                                end
                            })
                        end
                else
                    RageUI.Button("Aucun employé", nil, {}, false, {})
                    end
                
                    RageUI.Separator("")
                    RageUI.Button("Recruter un joueur proche", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                                TriggerServerEvent('gangsbuilder:recruitPlayer', GetPlayerServerId(closestPlayer), gang.name)
                                employeesLoaded = false 
                            else
                                ESX.ShowNotification("Aucun joueur à proximité")
                            end
                        end
                    })
            end)
            
            RageUI.IsVisible(bossGradesMenu, function()
                RageUI.Separator("Grades du gang")
                
                if #gangGrades > 0 then
                    for i = 1, #gangGrades do
                        local isBossGrade = (gangGrades[i].name == "boss")
                        local rightLabel = isBossGrade and "~g~Grade Patron" or "Configurer →"
                        
                        RageUI.Button(gangGrades[i].label .. " (Grade " .. gangGrades[i].grade .. ")", 
                            isBossGrade and "Les permissions du patron ne peuvent pas être modifiées" or nil, 
                            {RightLabel = rightLabel}, 
                            not isBossGrade, 
                            {
                                onSelected = function()
                                    if not isBossGrade then
                                        selectedGrade = gangGrades[i]
                                        ESX.TriggerServerCallback('gangsbuilder:getGradePermissions', function(permissions)
                                            selectedGradePermissions = permissions
                                            if selectedGradePermissions then
                                                permValues.coffre_access = selectedGradePermissions.coffre_access == 1
                                                permValues.coffre_deposit = selectedGradePermissions.coffre_deposit == 1
                                                permValues.coffre_take = selectedGradePermissions.coffre_take == 1
                                                permValues.coffre_weapons = selectedGradePermissions.coffre_weapons == 1
                                                permValues.coffre_items = selectedGradePermissions.coffre_items == 1
                                                permValues.coffre_money = selectedGradePermissions.coffre_money == 1
                                                permValues.garage_access = selectedGradePermissions.garage_access == 1
                                                permValues.vestiaire_access = selectedGradePermissions.vestiaire_access == 1
                                                
                                                if selectedGradePermissions.vestiaire_create ~= nil then
                                                    permValues.vestiaire_create = selectedGradePermissions.vestiaire_create == 1
                                                else
                                                    permValues.vestiaire_create = false
                                                end
                                                
                                                selectedVehicles = selectedGradePermissions.vehicles or {}
                                                selectedClothes = selectedGradePermissions.clothes or {}
                                            end
                                        end, gang.name, gangGrades[i].grade)
                                    end
                                end
                            }, 
                            isBossGrade and nil or gradePermissionsMenu
                        )
                    end
                else
                    RageUI.Button("Aucun grade disponible", nil, {}, false, {})
                end
            end)
            
            RageUI.IsVisible(gradePermissionsMenu, function()
                if selectedGrade then
                    RageUI.Separator("Permissions pour: " .. selectedGrade.label)
                    
                    RageUI.Separator("↓ ~b~Accès au coffre~s~ ↓")
                    RageUI.Checkbox("Accès au coffre", "Autoriser l'accès au coffre", permValues.coffre_access, {}, {
                        onChecked = function()
                            permValues.coffre_access = true
                        end,
                        onUnChecked = function()
                            permValues.coffre_deposit = false
                            permValues.coffre_take = false
                            permValues.coffre_weapons = false
                            permValues.coffre_items = false
                            permValues.coffre_money = false
                        end
                    })
                    
                    RageUI.Checkbox("Déposer des objets", "Autoriser le dépôt d'objets", permValues.coffre_deposit, {}, {
                        onChecked = function()
                            permValues.coffre_deposit = true
                            permValues.coffre_access = true
                        end,
                        onUnChecked = function()
                            permValues.coffre_deposit = false
                        end
                    })
                    
                    RageUI.Checkbox("Récupérer des objets", "Autoriser la récupération d'objets", permValues.coffre_take, {}, {
                        onChecked = function()
                            permValues.coffre_take = true
                            permValues.coffre_access = true
                        end,
                        onUnChecked = function()
                            permValues.coffre_take = false
                        end
                    })
                    
                    RageUI.Checkbox("Armes", "Autoriser l'accès aux armes", permValues.coffre_weapons, {}, {
                        onChecked = function()
                            permValues.coffre_weapons = true
                            permValues.coffre_access = true
                        end,
                        onUnChecked = function()
                            permValues.coffre_weapons = false
                        end
                    })
                    
                    RageUI.Checkbox("Items", "Autoriser l'accès aux items", permValues.coffre_items, {}, {
                        onChecked = function()
                            permValues.coffre_items = true
                            permValues.coffre_access = true
                        end,
                        onUnChecked = function()
                            permValues.coffre_items = false
                        end
                    })
                    
                    RageUI.Checkbox("Argent sale", "Autoriser l'accès à l'argent sale", permValues.coffre_money, {}, {
                        onChecked = function()
                            permValues.coffre_money = true
                            permValues.coffre_access = true
                        end,
                        onUnChecked = function()
                            permValues.coffre_money = false
                        end
                    })
                    
                    RageUI.Separator("↓ ~g~Accès au garage~s~ ↓")
                    RageUI.Checkbox("Accès au garage", "Autoriser l'accès au garage", permValues.garage_access, {}, {
                        onChecked = function()
                            permValues.garage_access = true
                        end,
                        onUnChecked = function()
                            permValues.garage_access = false
                        end
                    })
                    
                    if permValues.garage_access then
                        RageUI.Separator("~y~Véhicules autorisés~s~")
                        
                        local allVehiclesAllowed = #selectedVehicles == 0
                        RageUI.Checkbox("Autoriser tous les véhicules", nil, allVehiclesAllowed, {}, {
                            onChecked = function()
                                selectedVehicles = {}
                            end,
                            onUnChecked = function()
                                selectedVehicles = {}
                                for i = 1, #gangVehicles do
                                end
                            end
                        })
                        
                        if #gangVehicles > 0 then
                            for i = 1, #gangVehicles do
                                local v = gangVehicles[i]
                                local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(v.model))
                                if vehicleName == "NULL" then
                                    vehicleName = GetDisplayNameFromVehicleModel(v.model)
                                end
                                
                                local isAllowed = false
                                if not allVehiclesAllowed then
                                    for _, plate in ipairs(selectedVehicles) do
                                        if plate == v.plate then
                                            isAllowed = true
                                            break
                                        end
                                    end
                                else
                                    isAllowed = true
                                end
                                
                                RageUI.Checkbox(vehicleName .. " [" .. v.plate .. "]", nil, isAllowed, {}, {
                                    onChecked = function()
                                        if not allVehiclesAllowed then
                                            table.insert(selectedVehicles, v.plate)
                                        end
                                    end,
                                    onUnChecked = function()
                                        if not allVehiclesAllowed then
                                            for j = #selectedVehicles, 1, -1 do
                                                if selectedVehicles[j] == v.plate then
                                                    table.remove(selectedVehicles, j)
                                                    break
                                                end
                                            end
                                        else
                                            selectedVehicles = {}
                                            for k = 1, #gangVehicles do
                                                if k ~= i then
                                                    table.insert(selectedVehicles, gangVehicles[k].plate)
                                                end
                                            end
                                        end
                                    end
                                })
                            end
                        else
                            RageUI.Button("Aucun véhicule configuré", nil, {}, false, {})
                        end
                    end
                    
                    RageUI.Separator("↓ ~y~Accès au vestiaire~s~ ↓")
                    RageUI.Checkbox("Accès au vestiaire", "Autoriser l'accès au vestiaire", permValues.vestiaire_access, {}, {
                        onChecked = function()
                            permValues.vestiaire_access = true
                        end,
                        onUnChecked = function()
                            permValues.vestiaire_access = false
                            permValues.vestiaire_create = false
                        end
                    })
                    
                    RageUI.Checkbox("Autoriser création des tenues", "Autoriser la création de tenues personnalisées", permValues.vestiaire_create, {}, {
                        onChecked = function()
                            permValues.vestiaire_create = true
                            permValues.vestiaire_access = true
                        end,
                        onUnChecked = function()
                            permValues.vestiaire_create = false
                        end
                    })
                    
                    RageUI.Separator("")
                    RageUI.Button("~g~Sauvegarder les permissions", "Appliquer ces permissions au grade", {}, true, {
                        onSelected = function()
                            local perms = {
                                coffre_access = permValues.coffre_access and 1 or 0,
                                coffre_deposit = permValues.coffre_deposit and 1 or 0,
                                coffre_take = permValues.coffre_take and 1 or 0,
                                coffre_weapons = permValues.coffre_weapons and 1 or 0,
                                coffre_items = permValues.coffre_items and 1 or 0,
                                coffre_money = permValues.coffre_money and 1 or 0,
                                garage_access = permValues.garage_access and 1 or 0,
                                vestiaire_access = permValues.vestiaire_access and 1 or 0,
                                vestiaire_create = permValues.vestiaire_create and 1 or 0,
                                vehicles = selectedVehicles,
                                clothes = selectedClothes
                            }
                            
                            TriggerServerEvent('gangsbuilder:updateGradePermissions', gang.name, selectedGrade.grade, perms)
                            ESX.ShowNotification("Permissions sauvegardées")
                        end
                    })
                else
                    RageUI.Button("Erreur: Aucun grade sélectionné", nil, {}, false, {})
                end
            end)
            
            if not RageUI.Visible(bossMenu) and not RageUI.Visible(bossEmployeesMenu) and not RageUI.Visible(bossGradesMenu) and not RageUI.Visible(gradePermissionsMenu) then
                bossMenu = RageUI.CreateMenu("Patron", "Actions du patron")
                bossEmployeesMenu = RageUI.CreateSubMenu(bossMenu, "Gestion employés", "Gérer les employés")
                isMenuOpen = false
                isBossMenuOpen = false
                break
            end
        end
    end)
end

RegisterNetEvent('gangsbuilder:refreshPlayerData')
AddEventHandler('gangsbuilder:refreshPlayerData', function()
    lastJob2Name = nil
    gangPositions = nil
    cachedGang = nil
    
    RemoveGangBlips()
    
    ESX.TriggerServerCallback('esx:getPlayerData', function(data)
        PlayerData = data
        
        if PlayerData.job2 and PlayerData.job2.name ~= 'unemployed2' then
            ESX.TriggerServerCallback('gangsbuilder:getGangByJob', function(gang)
                if gang and gang.positions then
                    gangPositions = gang.positions
                    cachedGang = gang
                    CreateGangBlips(gang)
                    ESX.ShowNotification("Vos données de gang ont été actualisées")
                end
            end, PlayerData.job2.name)
        end
    end)
end)



RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    PlayerData.job2 = job2
    
    lastJob2Name = nil
    gangPositions = nil
    cachedGang = nil
    
    RemoveGangBlips()
    
    if job2 and job2.name ~= 'unemployed2' then
        ESX.TriggerServerCallback('gangsbuilder:getGangByJob', function(gang)
            if gang and gang.positions then
                gangPositions = gang.positions
                cachedGang = gang
                CreateGangBlips(gang)
            end
        end, job2.name)
    end
end) 