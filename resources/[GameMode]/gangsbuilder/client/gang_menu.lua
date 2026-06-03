local isMenuOpen = false

function OpenGangBuilderMenu()
    if isMenuOpen then
        isMenuOpen = false
        RageUI.Visible(mainMenu, false)
        return
    else
        isMenuOpen = true
        RageUI.Visible(mainMenu, true)
        
        ESX.TriggerServerCallback('gangsbuilder:getGangs', function(gangs)
            GangsList = gangs
        end)
        
        Citizen.CreateThread(function()
            while isMenuOpen do
                RageUI.IsVisible(mainMenu, function()
                    RageUI.Separator("↓ Création de gang ↓")
                    
                    RageUI.Button("Créer un gang", "Vous permet de créer un gang", {RightLabel = ">>>"}, true, {
                        onSelected = function()
                        end
                    }, creationMenu)
                    
                    RageUI.Button("Modifier un gang", nil, {RightLabel = ">>>"}, true, {
                        onSelected = function()
                        end
                    }, listeMenu)
                end)
                
                RageUI.IsVisible(listeMenu, function()
                    RageUI.Separator("Liste des Groupes actifs")
                    
                    for i = 1, #GangsList do
                        RageUI.Button(GangsList[i].label, nil, {RightLabel = "< Modifier >"}, true, {
                            onSelected = function()
                                SelectedGang = GangsList[i]
                            end
                        }, modifyMenu)
                    end
                end)
                
                RageUI.IsVisible(infoMenu, function()
                    if SelectedGang then
                        RageUI.Separator("ID Unique: " .. SelectedGang.id)
                        
                        RageUI.Button("Se TP à", nil, {RightLabel = "< Garage >"}, true, {
                            onSelected = function()
                                if SelectedGang.positions and SelectedGang.positions.Garage then
                                    local pos = SelectedGang.positions.Garage
                                    SetEntityCoords(PlayerPedId(), pos.x, pos.y, pos.z)
                                else
                                    ESX.ShowNotification("Position de garage non définie")
                                end
                            end
                        })
                        
                        RageUI.Button("Liste des véhicules", nil, {}, true, {
                            onSelected = function()
                            end
                        })
                        
                        RageUI.Button("Coffre", nil, {}, true, {
                            onSelected = function()
                            end
                        })
                        
                        RageUI.Button("Liste des membres", nil, {}, true, {
                            onSelected = function()
                            end
                        })
                    end
                end)
                
                RageUI.IsVisible(modifyMenu, function()
                    if SelectedGang then
                        RageUI.Button("Modifié les positions", nil, {RightLabel = ">>>"}, true, {
                            onSelected = function()
                            end
                        }, positionsMenu)
                        
                        RageUI.Button("Gestion des grades", nil, {RightLabel = ">>>"}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback('gangsbuilder:getGangGrades', function(grades)
                                    GangGradesList = grades
                                end, SelectedGang.name)
                            end
                        }, gradesMenu)
                        
                        RageUI.Button("Gestion des véhicules", nil, {RightLabel = ">>>"}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback('gangsbuilder:getConfiguredGangVehicles', function(vehicles)
                                    GangVehiclesList = vehicles
                                end, SelectedGang.name)
                            end
                        }, vehicleManagementMenu)
                        
                        RageUI.Button("Supprimer le gang", nil, {RightLabel = ">>>"}, true, {
                            onSelected = function()
                                local confirm = KeyboardInput("Tapez 'CONFIRMER' pour supprimer le gang", "")
                                if confirm == "CONFIRMER" then
                                    TriggerServerEvent('gangsbuilder:deleteGang', SelectedGang.name)
                                    ESX.ShowNotification(Config.Messages.GangDeleted)
                                    ESX.TriggerServerCallback('gangsbuilder:getGangs', function(gangs)
                                        GangsList = gangs
                                        SelectedGang = nil
                                        RageUI.GoBack()
                                    end)
                                end
                            end
                        })
                        
                        RageUI.Button("Modifié le poids du Coffre", nil, {RightLabel = ">>>"}, true, {
                            onSelected = function()
                                local newWeight = NumberInput("Nouveau poids du coffre", SelectedGang.coffreWeight or Config.DefaultCoffreWeight)
                                if newWeight then
                                    TriggerServerEvent('gangsbuilder:updateCoffreWeight', SelectedGang.name, newWeight)
                                    ESX.ShowNotification(Config.Messages.ValueModified)
                                end
                            end
                        })
                        
                        RageUI.Button("Modifié le nombre de tenues", nil, {RightLabel = ">>>"}, true, {
                            onSelected = function()
                                local newMaxTenues = NumberInput("Nouveau nombre max de tenues", SelectedGang.maxTenues or Config.DefaultMaxTenues)
                                if newMaxTenues then
                                    TriggerServerEvent('gangsbuilder:updateMaxTenues', SelectedGang.name, newMaxTenues)
                                    ESX.ShowNotification(Config.Messages.ValueModified)
                                end
                            end
                        })
                        
                        RageUI.Button("Modifié la taille du garage", nil, {RightLabel = ">>>"}, true, {
                            onSelected = function()
                                local newGarageSize = NumberInput("Nouvelle taille du garage", SelectedGang.garageSize or Config.DefaultGarageSize)
                                if newGarageSize then
                                    TriggerServerEvent('gangsbuilder:updateGarageSize', SelectedGang.name, newGarageSize)
                                    ESX.ShowNotification(Config.Messages.ValueModified)
                                end
                            end
                        })
                        
                        RageUI.List("Attribuer la Vente D'armes", {"Active", "Désactive"}, SelectedGang.canSellWeapons and 1 or 2, nil, {}, true, {
                            onListChange = function(Index)
                                local canSell = Index == 1
                                TriggerServerEvent('gangsbuilder:updateCanSellWeapons', SelectedGang.name, canSell)
                                SelectedGang.canSellWeapons = canSell
                                ESX.ShowNotification(Config.Messages.ValueModified)
                            end
                        })
                        
                        RageUI.Separator("↓ ~g~Sauvegarder les modifications~s~ ↓")
                        
                        RageUI.Button("Sauvegarder", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent('gangsbuilder:saveAllModifications', SelectedGang.name)
                                ESX.TriggerServerCallback('gangsbuilder:getGangs', function(gangs)
                                    GangsList = gangs
                                    for i = 1, #GangsList do
                                        if GangsList[i].name == SelectedGang.name then
                                            SelectedGang = GangsList[i]
                                            break
                                        end
                                    end
                                    
                                    if PlayerData.job2 and PlayerData.job2.name == SelectedGang.name then
                                        ESX.TriggerServerCallback('gangsbuilder:getGangByJob', function(gang)
                                            if gang and gang.positions then
                                                gangPositions = gang.positions
                                                cachedGang = gang
                                                RemoveGangBlips()
                                                CreateGangBlips(gang)
                                            end
                                        end, SelectedGang.name)
                                    end
                                    
                                    ESX.ShowNotification("Modifications sauvegardées et appliquées")
                                end)
                            end
                        })
                    end
                end)
                
                RageUI.IsVisible(positionsMenu, function()
                    if SelectedGang then
                        RageUI.Button("Position Coffre", nil, {RightLabel = "Définir"}, true, {
                            onSelected = function()
                                SavePosition("Coffre", SelectedGang.name)
                            end
                        })
                        
                        RageUI.Button("Position Patron", nil, {RightLabel = "Définir"}, true, {
                            onSelected = function()
                                SavePosition("Patron", SelectedGang.name)
                            end
                        })
                        
                        RageUI.Button("Position Garage", nil, {RightLabel = "Définir"}, true, {
                            onSelected = function()
                                SavePosition("Garage", SelectedGang.name)
                            end
                        })
                        
                        RageUI.Button("Position Suppression véhicule", nil, {RightLabel = "Définir"}, true, {
                            onSelected = function()
                                SavePosition("SuppressionVehicule", SelectedGang.name)
                            end
                        })
                        
                        RageUI.Button("Position spawn véhicule", nil, {RightLabel = "Définir"}, true, {
                            onSelected = function()
                                SavePosition("SpawnVehicule", SelectedGang.name)
                            end
                        })
                        
                        RageUI.Button("Position Vestiaire", nil, {RightLabel = "Définir"}, true, {
                            onSelected = function()
                                SavePosition("Vestiaire", SelectedGang.name)
                            end
                        })
                        
                        -- RageUI.Button("Position Blips", nil, {RightLabel = "Définir"}, true, {
                        --     onSelected = function()
                        --         SavePosition("Blip", SelectedGang.name)
                        --     end
                        -- })
                    end
                end)
                
                RageUI.IsVisible(gradesMenu, function()
                    if SelectedGang then
                        RageUI.Separator("↓ Créer un nouveau grade ↓")
                        
                        RageUI.Button("Créer un grade", nil, {RightLabel = ">>>"}, true, {
                            onSelected = function()
                                local gradeName = KeyboardInput("Nom du grade (ex: recrue)", "")
                                if gradeName and gradeName ~= "" then
                                    local gradeLabel = KeyboardInput("Label du grade (ex: Recrue)", "")
                                    if gradeLabel and gradeLabel ~= "" then
                                        local gradeLevel = NumberInput("Niveau du grade (0, 1, 2, ...)", 0)
                                        if gradeLevel ~= nil then
                                            local gradeSalary = NumberInput("Salaire du grade", 0)
                                            if gradeSalary ~= nil then
                                                TriggerServerEvent('gangsbuilder:createGrade', SelectedGang.name, {
                                                    name = gradeName,
                                                    label = gradeLabel,
                                                    grade = gradeLevel,
                                                    salary = gradeSalary
                                                })
                                                ESX.ShowNotification("Grade créé avec succès")
                                                
                                                ESX.TriggerServerCallback('gangsbuilder:getGangGrades', function(grades)
                                                    GangGradesList = grades
                                                end, SelectedGang.name)
                                            end
                                        end
                                    end
                                end
                            end
                        })
                        
                        if GangGradesList and #GangGradesList > 0 then
                            RageUI.Separator("↓ Grades existants ↓")
                            
                            for i = 1, #GangGradesList do
                                RageUI.Button(GangGradesList[i].label .. " (Niv. " .. GangGradesList[i].grade .. ")", nil, {RightLabel = "Supprimer >"}, true, {
                                    onSelected = function()
                                        local confirm = KeyboardInput("Tapez 'CONFIRMER' pour supprimer le grade", "")
                                        if confirm == "CONFIRMER" then
                                            TriggerServerEvent('gangsbuilder:deleteGrade', SelectedGang.name, GangGradesList[i].name, GangGradesList[i].grade)
                                            ESX.ShowNotification("Grade supprimé avec succès")
                                            
                                            ESX.TriggerServerCallback('gangsbuilder:getGangGrades', function(grades)
                                                GangGradesList = grades
                                            end, SelectedGang.name)
                                        end
                                    end
                                })
                            end
                        else
                            RageUI.Separator("Aucun grade disponible")
                        end
                    end
                end)
                
                RageUI.IsVisible(vehicleManagementMenu, function()
                    if SelectedGang then
                        RageUI.Separator("↓ Gestion des véhicules du gang ↓")
                        
                        RageUI.Button("Ajouter un véhicule", nil, {RightLabel = ">>>"}, true, {
                            onSelected = function()
                            end
                        }, vehicleAddMenu)
                        
                        if not GangVehiclesList then GangVehiclesList = {} end
                        
                        if GangVehiclesList and #GangVehiclesList > 0 then
                            RageUI.Separator("↓ Véhicules configurés ↓")
                            
                            for i = 1, #GangVehiclesList do
                                local vehicle = GangVehiclesList[i]
                                local colorName = "Couleur " .. (vehicle.color or 1)
                                
                                RageUI.Button(vehicle.label .. " [" .. vehicle.plate .. "]", nil, {RightLabel = "Supprimer >"}, true, {
                                    onSelected = function()
                                        local confirm = KeyboardInput("Tapez 'CONFIRMER' pour supprimer ce véhicule", "")
                                        if confirm == "CONFIRMER" then
                                            TriggerServerEvent('gangsbuilder:removeGangVehicle', SelectedGang.name, vehicle.plate)
                                            ESX.ShowNotification("Véhicule supprimé du gang")
                                            
                                            ESX.TriggerServerCallback('gangsbuilder:getConfiguredGangVehicles', function(vehicles)
                                                GangVehiclesList = vehicles
                                            end, SelectedGang.name)
                                        end
                                    end
                                })
                            end
                        else
                            RageUI.Separator("Aucun véhicule configuré")
                        end
                    end
                end)
                
                RageUI.IsVisible(vehicleAddMenu, function()
                    if SelectedGang then
                        RageUI.Separator("↓ Ajouter un véhicule au gang ↓")
                        
                        local vehiclesList = {
                            {model = "sultan", label = "Sultan"},
                            {model = "kuruma", label = "Kuruma"},
                            {model = "cognoscenti", label = "Cognoscenti"},
                            {model = "baller", label = "Baller"},
                            {model = "schafter", label = "Schafter"},
                            {model = "felon", label = "Felon"},
                            {model = "buffalo", label = "Buffalo"},
                            {model = "dominator", label = "Dominator"},
                            {model = "manchez", label = "Manchez"},
                            {model = "sanchez", label = "Sanchez"},
                            {model = "faggio", label = "Faggio"},
                            {model = "blazer", label = "Blazer"},
                            {model = "btype", label = "Roosevelt"},
                            {model = "youga", label = "Youga"},
                            {model = "burrito", label = "Burrito"},
                            {model = "mesa", label = "Mesa"},
                            {model = "dubsta", label = "Dubsta"},
                            {model = "guardian", label = "Guardian"},
                            {model = "insurgent", label = "Insurgent"},
                            {model = "rumpo", label = "Rumpo"}
                        }
                        
                        for i = 1, #vehiclesList do
                            local vehicle = vehiclesList[i]
                            
                            RageUI.Button(vehicle.label, nil, {RightLabel = "Ajouter >"}, true, {
                                onSelected = function()
                                    local colorChoice = NumberInput("Numéro de couleur (1-159)", 1)
                                    if colorChoice then
                                        colorChoice = math.max(1, math.min(159, colorChoice))
                                        
                                        TriggerServerEvent('gangsbuilder:addGangVehicle', SelectedGang.name, {
                                            model = vehicle.model,
                                            color = colorChoice
                                        })
                                        
                                        ESX.TriggerServerCallback('gangsbuilder:getConfiguredGangVehicles', function(vehicles)
                                            GangVehiclesList = vehicles
                                        end, SelectedGang.name)
                                        
                                        RageUI.GoBack()
                                    end
                                end
                            })
                        end
                        
                        RageUI.Button("Véhicule personnalisé", nil, {RightLabel = "Ajouter >"}, true, {
                            onSelected = function()
                                local modelName = KeyboardInput("Nom du modèle de véhicule", "")
                                if modelName and modelName ~= "" then
                                    local colorChoice = NumberInput("Numéro de couleur (1-159)", 1)
                                    if colorChoice then
                                        colorChoice = math.max(1, math.min(159, colorChoice))
                                        
                                        TriggerServerEvent('gangsbuilder:addGangVehicle', SelectedGang.name, {
                                            model = modelName,
                                            color = colorChoice
                                        })
                                        
                                        ESX.TriggerServerCallback('gangsbuilder:getConfiguredGangVehicles', function(vehicles)
                                            GangVehiclesList = vehicles
                                        end, SelectedGang.name)
                                        
                                        RageUI.GoBack()
                                    end
                                end
                            end
                        })
                    end
                end)
                
                Citizen.Wait(0)
            end
        end)
    end
end 