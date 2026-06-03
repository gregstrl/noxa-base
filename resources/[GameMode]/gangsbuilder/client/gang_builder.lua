local CreationGang = {
    name = nil,
    label = nil,
    positions = Config.DefaultPositions,
    maxTenues = Config.DefaultMaxTenues,
    garageSize = Config.DefaultGarageSize,
    coffreWeight = Config.DefaultCoffreWeight,
    canSellWeapons = false,
    grades = {} 
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        
        RageUI.IsVisible(creationMenu, function()
            RageUI.Separator("Information sur le gang")
            
            RageUI.Button("Nom du gang", "Indiquer le nom du gang en Base de donnée", {RightLabel = FormatLabel(CreationGang.name)}, true, {
                onSelected = function()
                    local input = KeyboardInput("Nom du gang (identifiant BDD)", CreationGang.name)
                    if input and input ~= '' then
                        CreationGang.name = input
                    end
                end
            })
            
            RageUI.Button("Label du gang", nil, {RightLabel = FormatLabel(CreationGang.label)}, CreationGang.name ~= nil, {
                onSelected = function()
                    local input = KeyboardInput("Label du gang (affiché)", CreationGang.label)
                    if input and input ~= '' then
                        CreationGang.label = input
                    end
                end
            })
            
            RageUI.Button("Gestion des grades", "Créer les grades du gang", {RightLabel = ">>>"}, CreationGang.name ~= nil, {
                onSelected = function()
                end
            }, creationGradesMenu)
            
            RageUI.Separator("Positions")
            
            local allPositionsDefined = true
            local positions = {"Coffre", "Patron", "Garage", "Suppression Vehicule", "Spawn Vehicule", "Vestiaire"}
            
            for _, pos in ipairs(positions) do
                local positionValue = CreationGang.positions[pos]
                local isPositionDefined = positionValue and positionValue.x ~= 0.0
                
                if not isPositionDefined then
                    allPositionsDefined = false
                end
                

                
                RageUI.Button("Position " .. pos, nil, {RightLabel = isPositionDefined and "✓" or "❌"}, CreationGang.name ~= nil, {
                    onSelected = function()
                        CreationGang.positions[pos] = GetCurrentPosition()
                        ESX.ShowNotification("Position " .. pos .. " définie")
                    end
                })
            end
            
            RageUI.Separator("")
            
            RageUI.Button("Valider la création", "Vous permet de créer le gang", {RightLabel = "Confirmer"}, CreationGang.name ~= nil and CreationGang.label ~= nil and allPositionsDefined and (#CreationGang.grades > 0), {
                onSelected = function()
                    TriggerServerEvent('gangsbuilder:createGangWithGrades', CreationGang)
                    ESX.ShowNotification(Config.Messages.GangCreated)
                    
                    CreationGang = {
                        name = nil,
                        label = nil,
                        positions = Config.DefaultPositions,
                        maxTenues = Config.DefaultMaxTenues,
                        garageSize = Config.DefaultGarageSize,
                        coffreWeight = Config.DefaultCoffreWeight,
                        canSellWeapons = false,
                        grades = {}
                    }
                    
                    ESX.TriggerServerCallback('gangsbuilder:getGangs', function(gangs)
                        GangsList = gangs
                    end)
                    
                    Citizen.Wait(1000)
                    TriggerServerEvent('gangsbuilder:requestJobRefresh')
                    
                    RageUI.GoBack()
                end
            })
        end)
        
        RageUI.IsVisible(creationGradesMenu, function()
            RageUI.Separator("↓ Créer un nouveau grade ↓")
            
            RageUI.Button("Ajouter un grade", nil, {RightLabel = "+"}, true, {
                onSelected = function()
                    local gradeName = KeyboardInput("Nom du grade (ex: recrue)", "")
                    if gradeName and gradeName ~= "" then
                        local gradeLabel = KeyboardInput("Label du grade (ex: Recrue)", "")
                        if gradeLabel and gradeLabel ~= "" then
                            local gradeLevel = NumberInput("Niveau du grade (0, 1, 2, ...)", 0)
                            if gradeLevel ~= nil then
                                local gradeSalary = NumberInput("Salaire du grade", 0)
                                if gradeSalary ~= nil then
                                    local exists = false
                                    for _, g in ipairs(CreationGang.grades) do
                                        if g.name == gradeName or g.grade == gradeLevel then
                                            exists = true
                                            break
                                        end
                                    end
                                    
                                    if not exists then
                                        table.insert(CreationGang.grades, {
                                            name = gradeName,
                                            label = gradeLabel,
                                            grade = gradeLevel,
                                            salary = gradeSalary
                                        })
                                        ESX.ShowNotification("Grade ajouté avec succès")
                                    else
                                        ESX.cation("Ce grade existe déjà (même nom ou niveau)")
                                    end
                                end
                            end
                        end
                    end
                end
            })
            
            if #CreationGang.grades > 0 then
                RageUI.Separator("↓ Grades ajoutés ↓")
                
                for i, grade in ipairs(CreationGang.grades) do
                    RageUI.Button(grade.label .. " (Niv. " .. grade.grade .. ")", nil, {RightLabel = "Supprimer >"}, true, {
                        onSelected = function()
                            table.remove(CreationGang.grades, i)
                            ESX.ShowNotification("Grade supprimé")
                        end
                    })
                end
            else
                RageUI.Separator("Aucun grade ajouté")
                RageUI.Separator("Vous devez créer au moins un grade")
            end
        end)
    end
end) 