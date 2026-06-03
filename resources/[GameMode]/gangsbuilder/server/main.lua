ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('gangsbuilder:checkFounderPermission', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        if IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) then
            cb(true)
        else
            local playerGroup = xPlayer.getGroup()
            cb(playerGroup == Config.FounderPermission)
        end
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('gangsbuilder:getGangs', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM gangs2', {}, function(result)
        local gangs = {}
        
        for i=1, #result do
            gangs[i] = {
                id = result[i].id,
                name = result[i].name,
                label = result[i].label,
                positions = json.decode(result[i].positions),
                maxTenues = result[i].max_tenues,
                garageSize = result[i].garage_size,
                coffreWeight = result[i].coffre_weight,
                canSellWeapons = result[i].can_sell_weapons == 1
            }
        end
        
        cb(gangs)
    end)
end)

ESX.RegisterServerCallback('gangsbuilder:getGangByJob', function(source, cb, jobName)
    MySQL.Async.fetchAll('SELECT * FROM gangs2 WHERE name = @name', {
        ['@name'] = jobName
    }, function(result)
        if result[1] then
            local gang = {
                id = result[1].id,
                name = result[1].name,
                label = result[1].label,
                positions = json.decode(result[1].positions),
                maxTenues = result[1].max_tenues,
                garageSize = result[1].garage_size,
                coffreWeight = result[1].coffre_weight,
                canSellWeapons = result[1].can_sell_weapons == 1
            }
            cb(gang)
        else
            cb(nil)
        end
    end)
end)

ESX.RegisterServerCallback('gangsbuilder:savePosition', function(source, cb, positionType, gangName, position)
    MySQL.Async.fetchAll('SELECT positions FROM gangs2 WHERE name = @name', {
        ['@name'] = gangName
    }, function(result)
        if result[1] then
            local positions = json.decode(result[1].positions)
            positions[positionType] = position
            
            MySQL.Async.execute('UPDATE gangs2 SET positions = @positions WHERE name = @name', {
                ['@positions'] = json.encode(positions),
                ['@name'] = gangName
            }, function(rowsChanged)
                cb(rowsChanged > 0)
            end)
        else
            cb(false)
        end
    end)
end)

function SetPlayerJob2(identifier, job, grade)
    MySQL.Async.execute('UPDATE users SET job2 = @job, job2_grade = @grade WHERE identifier = @identifier', {
        ['@job'] = job,
        ['@grade'] = grade,
        ['@identifier'] = identifier
    }, function(rowsChanged)
        if rowsChanged > 0 then
            for _, playerId in ipairs(ESX.GetPlayers()) do
                local player = ESX.GetPlayerFromId(playerId)
                if player and player.identifier == identifier then
                    if player.setJob2 then
                        Citizen.Wait(500)
                        player.setJob2(job, grade)
                        
                        if ESX.AddJob then
                            ESX.AddJob()
                            Citizen.Wait(500)
                        end
                        
                        TriggerClientEvent('gangsbuilder:refreshPlayerData', playerId)
                    else
                        TriggerClientEvent('gangsbuilder:refreshPlayerData', playerId)
                    end
                    break
                end
            end
        end
    end)
end

function RefreshJobsInESX()
    if ESX.RefreshJobs then
        ESX.RefreshJobs()
    elseif ESX.AddJob then
        ESX.AddJob()
    else
        MySQL.Async.fetchAll('SELECT * FROM jobs', {}, function(jobs)
            if not ESX.Jobs then ESX.Jobs = {} end
            
            for k,v in ipairs(jobs) do
                ESX.Jobs[v.name] = v
                ESX.Jobs[v.name].grades = {}
                
                MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @job_name ORDER BY grade ASC', {
                    ['@job_name'] = v.name
                }, function(grades)
                    for _, g in ipairs(grades) do
                        if ESX.Jobs[v.name] then
                            ESX.Jobs[v.name].grades[tostring(g.grade)] = g
                        end
                    end
                end)
            end
        end)
    end
    
    Citizen.Wait(1000)
    
    for _, playerId in ipairs(ESX.GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer then
            MySQL.Async.fetchAll('SELECT job2, job2_grade FROM users WHERE identifier = @identifier', {
                ['@identifier'] = xPlayer.identifier
            }, function(result)
                if result[1] then
                    if xPlayer.setJob2 then
                        xPlayer.setJob2(result[1].job2, result[1].job2_grade)
                    end
                end
            end)
        end
    end
end

RegisterServerEvent('gangsbuilder:createGangWithGrades')
AddEventHandler('gangsbuilder:createGangWithGrades', function(gang)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
        
        if hasPermission then
            MySQL.Async.fetchAll('SELECT name FROM gangs2 WHERE name = @name', {
                ['@name'] = gang.name
            }, function(result)
                if result[1] == nil then
                    MySQL.Async.fetchAll('SELECT name FROM jobs WHERE name = @name', {
                        ['@name'] = gang.name
                    }, function(jobsResult)
                        if jobsResult[1] == nil then
                            MySQL.Async.execute('INSERT INTO gangs2 (name, label, positions, max_tenues, garage_size, coffre_weight, can_sell_weapons) VALUES (@name, @label, @positions, @maxTenues, @garageSize, @coffreWeight, @canSellWeapons)', {
                                ['@name'] = gang.name,
                                ['@label'] = gang.label,
                                ['@positions'] = json.encode(gang.positions),
                                ['@maxTenues'] = gang.maxTenues,
                                ['@garageSize'] = gang.garageSize,
                                ['@coffreWeight'] = gang.coffreWeight,
                                ['@canSellWeapons'] = gang.canSellWeapons and 1 or 0
                            })
                            
                            MySQL.Async.execute('INSERT INTO jobs (name, label) VALUES (@name, @label)', {
                                ['@name'] = gang.name,
                                ['@label'] = gang.label
                            }, function(rowsAffected1)
                                if rowsAffected1 > 0 then
                                    local successCount = 0
                                    local totalGrades = #gang.grades
                                    local highestGrade = 0
                                    local highestGradeIndex = 1
                                    
                                    for i, grade in ipairs(gang.grades) do
                                        if grade.grade > highestGrade then
                                            highestGrade = grade.grade
                                            highestGradeIndex = i
                                        end
                                    end
                                    
                                    for _, grade in ipairs(gang.grades) do
                                        MySQL.Async.execute('INSERT INTO job_grades (job_name, grade, name, label, salary, skin_male, skin_female) VALUES (@job_name, @grade, @name, @label, @salary, @skin_male, @skin_female)', {
                                            ['@job_name'] = gang.name,
                                            ['@grade'] = grade.grade,
                                            ['@name'] = grade.name,
                                            ['@label'] = grade.label,
                                            ['@salary'] = grade.salary,
                                            ['@skin_male'] = json.encode({}),
                                            ['@skin_female'] = json.encode({})
                                        }, function(rowsAffected2)
                                            if rowsAffected2 > 0 then
                                                successCount = successCount + 1
                                                
                                                if successCount == totalGrades then
                                                    TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.GangCreated)
                                                    
                                                    local bossGrade = gang.grades[highestGradeIndex].grade
                                                    
                                                    MySQL.Async.execute('INSERT IGNORE INTO addon_account (name, label, shared) VALUES (@name, @label, 1)', {
                                                        ['@name'] = 'society_' .. gang.name,
                                                        ['@label'] = gang.label
                                                    })
                                                    
                                                    MySQL.Async.execute('INSERT IGNORE INTO addon_account_data (account_name, money, owner) VALUES (@account_name, @money, NULL)', {
                                                        ['@account_name'] = 'society_' .. gang.name,
                                                        ['@money'] = 0
                                                    })
                                                    
                                                    MySQL.Async.execute('INSERT IGNORE INTO datastore (name, label, shared) VALUES (@name, @label, 1)', {
                                                        ['@name'] = 'society_' .. gang.name,
                                                        ['@label'] = gang.label
                                                    })
                                                    
                                                    MySQL.Async.execute('INSERT IGNORE INTO addon_inventory (name, label, shared) VALUES (@name, @label, 1)', {
                                                        ['@name'] = 'society_' .. gang.name,
                                                        ['@label'] = gang.label
                                                    })
                                                    
                                                    RefreshJobsInESX()
                                                    
                                                    if ESX.AddJob then 
                                                        ESX.AddJob()
                                                    end
                                                    
                                                    Citizen.Wait(1500)
                                                    
                                                    if xPlayer and xPlayer.setJob2 then
                                                        xPlayer.setJob2(gang.name, bossGrade)
                                                    end
                                                    
                                                    Citizen.Wait(500)
                                                    TriggerClientEvent('gangsbuilder:refreshPlayerData', source)
                                                    
                                                    TriggerClientEvent('esx:showNotification', source, "Gang créé avec succès! Vous avez été promu automatiquement chef du gang.")
                                                end
                                            end
                                        end)
                                    end
                                else
                                    TriggerClientEvent('gangsbuilder:notify', source, "Erreur lors de la création du job")
                                end
                            end)
                        else
                            TriggerClientEvent('gangsbuilder:notify', source, "Ce nom de job existe déjà")
                        end
                    end)
                else
                    TriggerClientEvent('gangsbuilder:notify', source, "Ce nom de gang existe déjà")
                end
            end)
        else
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.NoPermission)
        end
    end
end)

ESX.RegisterServerCallback('gangsbuilder:getGangGrades', function(source, cb, gangName)
    MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @job_name ORDER BY grade ASC', {
        ['@job_name'] = gangName
    }, function(result)
        cb(result)
    end)
end)

RegisterServerEvent('gangsbuilder:createGrade')
AddEventHandler('gangsbuilder:createGrade', function(gangName, grade)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
        
        if hasPermission then
            MySQL.Async.fetchAll('SELECT * FROM jobs WHERE name = @name', {
                ['@name'] = gangName
            }, function(jobs)
                if jobs[1] then
                    MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @job_name AND (grade = @grade OR name = @name)', {
                        ['@job_name'] = gangName,
                        ['@grade'] = grade.grade,
                        ['@name'] = grade.name
                    }, function(grades)
                        if grades[1] then
                            TriggerClientEvent('gangsbuilder:notify', source, "Ce grade existe déjà (même nom ou niveau)")
                        else
                            MySQL.Async.execute('INSERT INTO job_grades (job_name, grade, name, label, salary, skin_male, skin_female) VALUES (@job_name, @grade, @name, @label, @salary, @skin_male, @skin_female)', {
                                ['@job_name'] = gangName,
                                ['@grade'] = grade.grade,
                                ['@name'] = grade.name,
                                ['@label'] = grade.label,
                                ['@salary'] = grade.salary,
                                ['@skin_male'] = json.encode({}),
                                ['@skin_female'] = json.encode({})
                            }, function(rowsAffected)
                                if rowsAffected > 0 then
                                    TriggerClientEvent('gangsbuilder:notify', source, "Grade créé avec succès")
                                else
                                    TriggerClientEvent('gangsbuilder:notify', source, "Erreur lors de la création du grade")
                                end
                            end)
                        end
                    end)
                else
                    TriggerClientEvent('gangsbuilder:notify', source, "Ce gang n'existe pas")
                end
            end)
        else
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.NoPermission)
        end
    end
end)

RegisterServerEvent('gangsbuilder:deleteGrade')
AddEventHandler('gangsbuilder:deleteGrade', function(gangName, gradeName, gradeLevel)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
        
        if hasPermission then
            MySQL.Async.fetchAll('SELECT COUNT(*) as count FROM job_grades WHERE job_name = @job_name', {
                ['@job_name'] = gangName
            }, function(result)
                local count = result[1].count
                
                if count > 1 then 
                    MySQL.Async.execute('DELETE FROM job_grades WHERE job_name = @job_name AND name = @name AND grade = @grade', {
                        ['@job_name'] = gangName,
                        ['@name'] = gradeName,
                        ['@grade'] = gradeLevel
                    }, function(rowsAffected)
                        if rowsAffected > 0 then
                            local players = ESX.GetPlayers()
                            for i=1, #players do
                                local player = ESX.GetPlayerFromId(players[i])
                                if player and player.job2 and player.job2.name == gangName and player.job2.grade_name == gradeName then
                                    MySQL.Async.fetchAll('SELECT grade FROM job_grades WHERE job_name = @job_name ORDER BY grade ASC LIMIT 1', {
                                        ['@job_name'] = gangName
                                    }, function(grades)
                                        if grades[1] then
                                            player.setJob2(gangName, grades[1].grade)
                                        end
                                    end)
                                end
                            end
                            
                            TriggerClientEvent('gangsbuilder:notify', source, "Grade supprimé avec succès")
                        else
                            TriggerClientEvent('gangsbuilder:notify', source, "Erreur lors de la suppression du grade")
                        end
                    end)
                else
                    TriggerClientEvent('gangsbuilder:notify', source, "Impossible de supprimer le dernier grade")
                end
            end)
        else
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.NoPermission)
        end
    end
end)

RegisterServerEvent('gangsbuilder:setJob2')
AddEventHandler('gangsbuilder:setJob2', function(job2Name, grade)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        xPlayer.setJob2(job2Name, grade or 0)
        
        if job2Name ~= 'unemployed2' then
            MySQL.Async.execute('INSERT IGNORE INTO addon_account_data (account_name, money, owner) VALUES (@account_name, @money, NULL)', {
                ['@account_name'] = 'society_' .. job2Name,
                ['@money'] = 0
            })
        end
        
        TriggerClientEvent('gangsbuilder:refreshPlayerData', source)
    end
end)

RegisterServerEvent('gangsbuilder:deleteGang')
AddEventHandler('gangsbuilder:deleteGang', function(gangName)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
        
        if hasPermission then
            MySQL.Async.execute('DELETE FROM gangs2 WHERE name = @name', {
                ['@name'] = gangName
            })
            
            MySQL.Async.execute('DELETE FROM job_grades WHERE job_name = @job_name', {
                ['@job_name'] = gangName
            })
            
            MySQL.Async.execute('DELETE FROM jobs WHERE name = @name', {
                ['@name'] = gangName
            })
            
            local players = ESX.GetPlayers()
            for i=1, #players do
                local player = ESX.GetPlayerFromId(players[i])
                if player and player.job2.name == gangName then
                    player.setJob2('unemployed2', 0)
                    TriggerClientEvent('gangsbuilder:refreshPlayerData', players[i])
                end
            end
            
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.GangDeleted)
        else
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.NoPermission)
        end
    end
end)

RegisterServerEvent('gangsbuilder:updateCoffreWeight')
AddEventHandler('gangsbuilder:updateCoffreWeight', function(gangName, weight)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
        
        if hasPermission then
            MySQL.Async.execute('UPDATE gangs2 SET coffre_weight = @weight WHERE name = @name', {
                ['@weight'] = weight,
                ['@name'] = gangName
            })
            
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.ValueModified)
        else
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.NoPermission)
        end
    end
end)

RegisterServerEvent('gangsbuilder:updateMaxTenues')
AddEventHandler('gangsbuilder:updateMaxTenues', function(gangName, maxTenues)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
        
        if hasPermission then
            MySQL.Async.execute('UPDATE gangs2 SET max_tenues = @maxTenues WHERE name = @name', {
                ['@maxTenues'] = maxTenues,
                ['@name'] = gangName
            })
            
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.ValueModified)
        else
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.NoPermission)
        end
    end
end)

RegisterServerEvent('gangsbuilder:updateGarageSize')
AddEventHandler('gangsbuilder:updateGarageSize', function(gangName, garageSize)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
        
        if hasPermission then
            MySQL.Async.execute('UPDATE gangs2 SET garage_size = @garageSize WHERE name = @name', {
                ['@garageSize'] = garageSize,
                ['@name'] = gangName
            })
            
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.ValueModified)
        else
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.NoPermission)
        end
    end
end)

RegisterServerEvent('gangsbuilder:updateCanSellWeapons')
AddEventHandler('gangsbuilder:updateCanSellWeapons', function(gangName, canSell)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
        
        if hasPermission then
            MySQL.Async.execute('UPDATE gangs2 SET can_sell_weapons = @canSell WHERE name = @name', {
                ['@canSell'] = canSell and 1 or 0,
                ['@name'] = gangName
            })
            
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.ValueModified)
        else
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.NoPermission)
        end
    end
end)

RegisterServerEvent('gangsbuilder:saveAllModifications')
AddEventHandler('gangsbuilder:saveAllModifications', function(gangName)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
        
        if hasPermission then
            TriggerClientEvent('gangsbuilder:notify', source, "Modifications sauvegardées avec succès")
            
            local players = ESX.GetPlayers()
            for i=1, #players do
                local player = ESX.GetPlayerFromId(players[i])
                if player and player.job2 and player.job2.name == gangName then
                    TriggerClientEvent('gangsbuilder:refreshPlayerData', players[i])
                end
            end
        else
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.NoPermission)
        end
    end
end)

RegisterServerEvent('gangsbuilder:searchPlayer')
AddEventHandler('gangsbuilder:searchPlayer', function(targetId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local tPlayer = ESX.GetPlayerFromId(targetId)
    
    if xPlayer and tPlayer then
        local inventory = tPlayer.getInventory()
        local weapons = tPlayer.getLoadout()
        local money = tPlayer.getAccount('cash').money
        
        TriggerClientEvent('gangsbuilder:showInventory', source, inventory, weapons, money)
    end
end)

ESX.RegisterServerCallback('gangsbuilder:getVehicleInfo', function(source, cb, plate)
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @owner', {
                ['@owner'] = result[1].owner
            }, function(userResult)
                if userResult[1] then
                    local fullName = userResult[1].firstname .. ' ' .. userResult[1].lastname
                    local model = result[1].vehicle and json.decode(result[1].vehicle).model or "Inconnu"
                    cb(fullName, model)
                else
                    cb("Propriétaire inconnu", "Modèle inconnu")
                end
            end)
        else
            cb(nil)
        end
    end)
end)

Citizen.CreateThread(function()
    MySQL.Async.execute('CREATE TABLE IF NOT EXISTS gang2_chest (gang_name VARCHAR(50) NOT NULL, type VARCHAR(50) NOT NULL, item VARCHAR(50) NOT NULL, count INT NOT NULL, PRIMARY KEY (gang_name, type, item))', {})
    MySQL.Async.execute('CREATE TABLE IF NOT EXISTS gang2_car (gang_name VARCHAR(50) NOT NULL, plate VARCHAR(50) NOT NULL, model VARCHAR(50) NOT NULL, properties LONGTEXT, stored TINYINT DEFAULT 1, time_out TIMESTAMP NULL DEFAULT NULL, PRIMARY KEY (gang_name, plate))', {})
    MySQL.Async.execute('CREATE TABLE IF NOT EXISTS gang2_grade_permissions (job_name VARCHAR(50) NOT NULL, grade INT NOT NULL, coffre_access TINYINT DEFAULT 1, coffre_deposit TINYINT DEFAULT 1, coffre_take TINYINT DEFAULT 1, coffre_weapons TINYINT DEFAULT 1, coffre_items TINYINT DEFAULT 1, coffre_money TINYINT DEFAULT 1, garage_access TINYINT DEFAULT 1, vehicles LONGTEXT DEFAULT "[]", vestiaire_access TINYINT DEFAULT 1, vestiaire_create TINYINT DEFAULT 0, clothes LONGTEXT DEFAULT "[]", PRIMARY KEY (job_name, grade))', {})
    
    MySQL.Async.execute('ALTER TABLE gang2_grade_permissions ADD COLUMN IF NOT EXISTS vestiaire_create TINYINT DEFAULT 0', {}, function(rowsChanged)
    end)
end)

ESX.RegisterServerCallback('gangsbuilder:getGangInventory', function(source, cb, gangName)
    MySQL.Async.fetchAll('SELECT * FROM gang2_chest WHERE gang_name = @gang_name', {
        ['@gang_name'] = gangName
    }, function(result)
        local inventory = {
            items = {},
            weapons = {}
        }
        
        for i=1, #result do
            if result[i].type == 'item_standard' then
                local item = ESX.GetItemLabel(result[i].item)
                
                if item then
                    table.insert(inventory.items, {
                        name = result[i].item,
                        label = item,
                        count = result[i].count
                    })
                end
            elseif result[i].type == 'item_account' then
                if result[i].item == 'black_money' then
                    table.insert(inventory.items, {
                        name = 'black_money',
                        label = 'Argent sale',
                        count = result[i].count
                    })
                end
            elseif result[i].type == 'item_weapon' then
                local label = ESX.GetWeaponLabel(result[i].item)
                
                if label then
                    table.insert(inventory.weapons, {
                        name = result[i].item,
                        label = label,
                        ammo = result[i].count
                    })
                end
            end
        end
        
        cb(inventory)
    end)
end)

RegisterServerEvent('gangsbuilder:putItemInGangInventory')
AddEventHandler('gangsbuilder:putItemInGangInventory', function(gangName, type, item, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.job2.name == gangName then
        if type == 'item_standard' then
            local playerItem = xPlayer.getInventoryItem(item)
            
            if playerItem.count >= count and count > 0 then
                xPlayer.removeInventoryItem(item, count)
                
                MySQL.Async.execute('INSERT INTO gang2_chest (gang_name, type, item, count) VALUES (@gang_name, @type, @item, @count) ON DUPLICATE KEY UPDATE count = count + @count', {
                    ['@gang_name'] = gangName,
                    ['@type'] = type,
                    ['@item'] = item,
                    ['@count'] = count
                })
                
                TriggerClientEvent('esx:showNotification', source, 'Vous avez déposé ~y~x' .. count .. ' ' .. playerItem.label)
            else
                TriggerClientEvent('esx:showNotification', source, 'Quantité invalide')
            end
        elseif type == 'item_account' then
            local account = xPlayer.getAccount(item)
            
            if account.money >= count and count > 0 then
                xPlayer.removeAccountMoney(item, count)
                
                MySQL.Async.execute('INSERT INTO gang2_chest (gang_name, type, item, count) VALUES (@gang_name, @type, @item, @count) ON DUPLICATE KEY UPDATE count = count + @count', {
                    ['@gang_name'] = gangName,
                    ['@type'] = type,
                    ['@item'] = item,
                    ['@count'] = count
                })
                
                TriggerClientEvent('esx:showNotification', source, 'Vous avez déposé ~g~$' .. count .. '~s~ d\'argent sale')
            else
                TriggerClientEvent('esx:showNotification', source, 'Montant invalide')
            end
        elseif type == 'item_weapon' then
            local playerWeapon = xPlayer.getWeapon(item)
            
            if playerWeapon then
                xPlayer.removeWeapon(item)
                
                MySQL.Async.execute('INSERT INTO gang2_chest (gang_name, type, item, count) VALUES (@gang_name, @type, @item, @count) ON DUPLICATE KEY UPDATE count = @count', {
                    ['@gang_name'] = gangName,
                    ['@type'] = type,
                    ['@item'] = item,
                    ['@count'] = count
                })
                
                TriggerClientEvent('esx:showNotification', source, 'Vous avez déposé ~y~' .. ESX.GetWeaponLabel(item))
            else
                TriggerClientEvent('esx:showNotification', source, 'Vous ne possédez pas cette arme')
            end
        end
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas accès à ce coffre')
    end
end)

RegisterServerEvent('gangsbuilder:getItemFromGangInventory')
AddEventHandler('gangsbuilder:getItemFromGangInventory', function(gangName, type, item, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.job2.name == gangName then
        MySQL.Async.fetchAll('SELECT * FROM gang2_chest WHERE gang_name = @gang_name AND type = @type AND item = @item', {
            ['@gang_name'] = gangName,
            ['@type'] = type,
            ['@item'] = item
        }, function(result)
            if result[1] then
                if type == 'item_standard' then
                    if result[1].count >= count and count > 0 then
                        if xPlayer.canCarryItem(item, count) then
                            xPlayer.addInventoryItem(item, count)
                            
                            if result[1].count - count > 0 then
                                MySQL.Async.execute('UPDATE gang2_chest SET count = @count WHERE gang_name = @gang_name AND type = @type AND item = @item', {
                                    ['@gang_name'] = gangName,
                                    ['@type'] = type,
                                    ['@item'] = item,
                                    ['@count'] = result[1].count - count
                                })
                            else
                                MySQL.Async.execute('DELETE FROM gang2_chest WHERE gang_name = @gang_name AND type = @type AND item = @item', {
                                    ['@gang_name'] = gangName,
                                    ['@type'] = type,
                                    ['@item'] = item
                                })
                            end
                            
                            TriggerClientEvent('esx:showNotification', source, 'Vous avez pris ~y~x' .. count .. ' ' .. ESX.GetItemLabel(item))
                        else
                            TriggerClientEvent('esx:showNotification', source, 'Vous ne pouvez pas porter plus d\'objets')
                        end
                    else
                        TriggerClientEvent('esx:showNotification', source, 'Quantité invalide')
                    end
                elseif type == 'item_account' then
                    if result[1].count >= count and count > 0 then
                        xPlayer.addAccountMoney(item, count)
                        
                        if result[1].count - count > 0 then
                            MySQL.Async.execute('UPDATE gang2_chest SET count = @count WHERE gang_name = @gang_name AND type = @type AND item = @item', {
                                ['@gang_name'] = gangName,
                                ['@type'] = type,
                                ['@item'] = item,
                                ['@count'] = result[1].count - count
                            })
                        else
                            MySQL.Async.execute('DELETE FROM gang2_chest WHERE gang_name = @gang_name AND type = @type AND item = @item', {
                                ['@gang_name'] = gangName,
                                ['@type'] = type,
                                ['@item'] = item
                            })
                        end
                        
                        TriggerClientEvent('esx:showNotification', source, 'Vous avez pris ~g~$' .. count .. '~s~ d\'argent sale')
                    else
                        TriggerClientEvent('esx:showNotification', source, 'Montant invalide')
                    end
                elseif type == 'item_weapon' then
                    if not xPlayer.hasWeapon(item) then
                        xPlayer.addWeapon(item, count)
                        
                        MySQL.Async.execute('DELETE FROM gang2_chest WHERE gang_name = @gang_name AND type = @type AND item = @item', {
                            ['@gang_name'] = gangName,
                            ['@type'] = type,
                            ['@item'] = item
                        })
                        
                        TriggerClientEvent('esx:showNotification', source, 'Vous avez pris ~y~' .. ESX.GetWeaponLabel(item))
                    else
                        TriggerClientEvent('esx:showNotification', source, 'Vous possédez déjà cette arme')
                    end
                end
            else
                TriggerClientEvent('esx:showNotification', source, 'Cet item n\'est pas dans le coffre')
            end
        end)
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas accès à ce coffre')
    end
end)

ESX.RegisterServerCallback('gangsbuilder:getGangVehicles', function(source, cb, gangName)
    MySQL.Async.fetchAll('SELECT * FROM gang2_car WHERE gang_name = @gang_name', {
        ['@gang_name'] = gangName
    }, function(result)
        local vehicles = {}
        for i=1, #result do
            local canAccess = true
            if result[i].stored == 0 then
                if result[i].time_out ~= nil then
                    local timeOut = os.time(os.date("!*t", result[i].time_out))
                    local currentTime = os.time()
                    local diffMinutes = (currentTime - timeOut) / 60
                    
                    if diffMinutes < 30 then
                        canAccess = false
                    else
                        MySQL.Async.execute('UPDATE gang2_car SET stored = 1, time_out = NULL WHERE gang_name = @gang_name AND plate = @plate', {
                            ['@gang_name'] = gangName,
                            ['@plate'] = result[i].plate
                        })
                        canAccess = true
                    end
                end
            end
            
            if canAccess or result[i].stored == 1 then
                table.insert(vehicles, result[i])
            end
        end
        cb(vehicles)
    end)
end)

ESX.RegisterServerCallback('gangsbuilder:storeGangVehicle', function(source, cb, vehicleData)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.job2.name == vehicleData.gang then
        MySQL.Async.execute('INSERT INTO gang2_car (gang_name, plate, model, properties, stored) VALUES (@gang_name, @plate, @model, @properties, 1) ON DUPLICATE KEY UPDATE model = @model, properties = @properties, stored = 1, time_out = NULL', {
            ['@gang_name'] = vehicleData.gang,
            ['@plate'] = vehicleData.plate,
            ['@model'] = vehicleData.model,
            ['@properties'] = json.encode(vehicleData.properties or {})
        }, function(rowsChanged)
            cb(rowsChanged > 0)
        end)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('gangsbuilder:takeOutGangVehicle', function(source, cb, gangName, plate)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.job2.name == gangName then
        MySQL.Async.execute('UPDATE gang2_car SET stored = 0, time_out = NOW() WHERE gang_name = @gang_name AND plate = @plate', {
            ['@gang_name'] = gangName,
            ['@plate'] = plate
        }, function(rowsChanged)
            cb(rowsChanged > 0)
        end)
    else
        cb(false)
    end
end)

RegisterServerEvent('gangsbuilder:deleteGangVehicle')
AddEventHandler('gangsbuilder:deleteGangVehicle', function(plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        MySQL.Async.fetchAll('SELECT * FROM gang2_car WHERE plate = @plate AND gang_name = @gang_name', {
            ['@plate'] = plate,
            ['@gang_name'] = xPlayer.job2.name
        }, function(result)
            if result[1] then
                MySQL.Async.execute('UPDATE gang2_car SET stored = 1, time_out = NULL WHERE plate = @plate AND gang_name = @gang_name', {
                    ['@plate'] = plate,
                    ['@gang_name'] = xPlayer.job2.name
                })
                TriggerClientEvent('esx:showNotification', source, 'Véhicule rangé dans le garage')
            else
                TriggerClientEvent('esx:showNotification', source, 'Ce véhicule n\'appartient pas à votre gang')
            end
        end)
    end
end)

RegisterServerEvent('gangsbuilder:addGangVehicle')
AddEventHandler('gangsbuilder:addGangVehicle', function(gangName, vehicleData)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
        
        if hasPermission then
            MySQL.Async.fetchAll('SELECT * FROM gangs2 WHERE name = @name', {
                ['@name'] = gangName
            }, function(gangs)
                if gangs[1] then
                    local plate = 'GANG' .. math.random(1000, 9999)
                    
                    MySQL.Async.execute('INSERT INTO gang2_car (gang_name, plate, model, properties) VALUES (@gang_name, @plate, @model, @properties)', {
                        ['@gang_name'] = gangName,
                        ['@plate'] = plate,
                        ['@model'] = vehicleData.model,
                        ['@properties'] = json.encode({
                            color = vehicleData.color
                        })
                    }, function(rowsAffected)
                        if rowsAffected > 0 then
                            TriggerClientEvent('gangsbuilder:notify', source, "Véhicule ajouté avec succès au gang")
                        else
                            TriggerClientEvent('gangsbuilder:notify', source, "Erreur lors de l'ajout du véhicule")
                        end
                    end)
                else
                    TriggerClientEvent('gangsbuilder:notify', source, "Ce gang n'existe pas")
                end
            end)
        else
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.NoPermission)
        end
    end
end)

RegisterServerEvent('gangsbuilder:removeGangVehicle')
AddEventHandler('gangsbuilder:removeGangVehicle', function(gangName, plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
        
        if hasPermission then
            MySQL.Async.execute('DELETE FROM gang2_car WHERE gang_name = @gang_name AND plate = @plate', {
                ['@gang_name'] = gangName,
                ['@plate'] = plate
            }, function(rowsAffected)
                if rowsAffected > 0 then
                    TriggerClientEvent('gangsbuilder:notify', source, "Véhicule supprimé du gang")
                else
                    TriggerClientEvent('gangsbuilder:notify', source, "Erreur lors de la suppression du véhicule")
                end
            end)
        else
            TriggerClientEvent('gangsbuilder:notify', source, Config.Messages.NoPermission)
        end
    end
end)

ESX.RegisterServerCallback('gangsbuilder:getConfiguredGangVehicles', function(source, cb, gangName)
    local xPlayer = ESX.GetPlayerFromId(source)
    local hasPermission = IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
    
    if hasPermission then
        MySQL.Async.fetchAll('SELECT * FROM gang2_car WHERE gang_name = @gang_name', {
            ['@gang_name'] = gangName
        }, function(vehicles)
            local vehiclesList = {}
            
            for i=1, #vehicles do
                local properties = json.decode(vehicles[i].properties or '{}')
                table.insert(vehiclesList, {
                    plate = vehicles[i].plate,
                    model = vehicles[i].model,
                    label = GetVehicleLabel(vehicles[i].model),
                    color = properties.color or 1
                })
            end
            
            cb(vehiclesList)
        end)
    else
        cb({})
    end
end)

function GetVehicleLabel(model)
    local label = model:gsub("^%l", string.upper)
    return label
end

ESX.RegisterServerCallback('gangsbuilder:getPlayerInventory', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local items = xPlayer.getInventory()
    local inventory = {
        items = {},
        weapons = {},
        blackMoney = 0
    }
    
    for i=1, #items, 1 do
        if items[i].count > 0 then
            inventory.items[#inventory.items+1] = {
                name = items[i].name,
                count = items[i].count,
                label = items[i].label
            }
        end
    end
    
    local blackMoney = xPlayer.getAccount('black_money')
    if blackMoney then
        inventory.blackMoney = blackMoney.money
    end
    
    local loadout = xPlayer.getLoadout()
    for i=1, #loadout, 1 do
        inventory.weapons[#inventory.weapons+1] = {
            name = loadout[i].name,
            label = ESX.GetWeaponLabel(loadout[i].name),
            ammo = loadout[i].ammo
        }
    end
    
    cb(inventory)
end)

ESX.RegisterServerCallback('gangsbuilder:isHighestGrade', function(source, cb, gangName, playerGrade)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    MySQL.Async.fetchAll('SELECT grade FROM job_grades WHERE job_name = @jobName ORDER BY grade DESC LIMIT 1', {
        ['@jobName'] = gangName
    }, function(result)
        if result and result[1] then
            local highestGrade = result[1].grade
            cb(playerGrade == highestGrade)
        else
            cb(false)
        end
    end)
end)

ESX.RegisterServerCallback('gangsbuilder:getSocietyMoney', function(source, cb, societyName)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    TriggerEvent('esx_addonaccount:getSharedAccount', societyName, function(account)
        if account then
            cb(account.money)
        else
            cb(0)
        end
    end)
end)

RegisterServerEvent('gangsbuilder:depositMoney')
AddEventHandler('gangsbuilder:depositMoney', function(societyName, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if amount > 0 and xPlayer.getAccount('cash').money >= amount then
        TriggerEvent('esx_addonaccount:getSharedAccount', societyName, function(account)
            if account then
                xPlayer.removeAccountMoney('cash', amount)
                account.addMoney(amount)
                TriggerClientEvent('esx:showNotification', source, 'Vous avez déposé ~g~$' .. amount)
            else
                TriggerClientEvent('esx:showNotification', source, 'Compte société invalide')
            end
        end)
    else
        TriggerClientEvent('esx:showNotification', source, 'Montant invalide')
    end
end)

RegisterServerEvent('gangsbuilder:withdrawMoney')
AddEventHandler('gangsbuilder:withdrawMoney', function(societyName, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if amount > 0 then
        TriggerEvent('esx_addonaccount:getSharedAccount', societyName, function(account)
            if account and account.money >= amount then
                account.removeMoney(amount)
                xPlayer.addAccountMoney('cash', amount)
                TriggerClientEvent('esx:showNotification', source, 'Vous avez retiré ~g~$' .. amount)
            else
                TriggerClientEvent('esx:showNotification', source, 'Fonds insuffisants')
            end
        end)
    else
        TriggerClientEvent('esx:showNotification', source, 'Montant invalide')
    end
end)

ESX.RegisterServerCallback('gangsbuilder:getEmployees', function(source, cb, gangName)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerIdentifier = xPlayer.identifier
    
    MySQL.Async.fetchAll('SELECT u.identifier, u.firstname, u.lastname, u.job2_grade as grade, g.label AS grade_label FROM users u JOIN job_grades g ON u.job2 = g.job_name AND u.job2_grade = g.grade WHERE u.job2 = @gangName AND u.identifier != @playerIdentifier', {
        ['@gangName'] = gangName,
        ['@playerIdentifier'] = playerIdentifier
    }, function(employees)
        local formattedEmployees = {}
        
        for i=1, #employees do
            table.insert(formattedEmployees, {
                identifier = employees[i].identifier,
                name = employees[i].firstname .. ' ' .. employees[i].lastname,
                grade = employees[i].grade,
                grade_label = employees[i].grade_label
            })
        end
        
        cb(formattedEmployees)
    end)
end)

RegisterServerEvent('gangsbuilder:promoteEmployee')
AddEventHandler('gangsbuilder:promoteEmployee', function(identifier, gangName)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.job2 and xPlayer.job2.name == gangName and xPlayer.job2.grade_name == 'boss' then
        MySQL.Async.fetchAll('SELECT job2_grade as grade FROM users WHERE identifier = @identifier AND job2 = @gangName', {
            ['@identifier'] = identifier,
            ['@gangName'] = gangName
        }, function(result)
            if result[1] then
                local currentGrade = result[1].grade
                
                MySQL.Async.fetchAll('SELECT grade FROM job_grades WHERE job_name = @gangName AND grade > @currentGrade ORDER BY grade ASC LIMIT 1', {
                    ['@gangName'] = gangName,
                    ['@currentGrade'] = currentGrade
                }, function(grades)
                    if grades[1] then
                        local newGrade = grades[1].grade
                        
                        SetPlayerJob2(identifier, gangName, newGrade)
                        TriggerClientEvent('esx:showNotification', source, 'Employé promu avec succès')
                    else
                        TriggerClientEvent('esx:showNotification', source, 'Cet employé a déjà le grade maximum')
                    end
                end)
            else
                TriggerClientEvent('esx:showNotification', source, 'Employé non trouvé')
            end
        end)
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas accès à cette action')
    end
end)

RegisterServerEvent('gangsbuilder:demoteEmployee')
AddEventHandler('gangsbuilder:demoteEmployee', function(identifier, gangName)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.job2 and xPlayer.job2.name == gangName and xPlayer.job2.grade_name == 'boss' then
        MySQL.Async.fetchAll('SELECT job2_grade as grade FROM users WHERE identifier = @identifier AND job2 = @gangName', {
            ['@identifier'] = identifier,
            ['@gangName'] = gangName
        }, function(result)
            if result[1] then
                local currentGrade = result[1].grade
                
                MySQL.Async.fetchAll('SELECT grade FROM job_grades WHERE job_name = @gangName AND grade < @currentGrade ORDER BY grade DESC LIMIT 1', {
                    ['@gangName'] = gangName,
                    ['@currentGrade'] = currentGrade
                }, function(grades)
                    if grades[1] then
                        local newGrade = grades[1].grade
                        
                        SetPlayerJob2(identifier, gangName, newGrade)
                        TriggerClientEvent('esx:showNotification', source, 'Employé rétrogradé avec succès')
                    else
                        TriggerClientEvent('esx:showNotification', source, 'Cet employé a déjà le grade minimum')
                    end
                end)
            else
                TriggerClientEvent('esx:showNotification', source, 'Employé non trouvé')
            end
        end)
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas accès à cette action')
    end
end)

RegisterServerEvent('gangsbuilder:fireEmployee')
AddEventHandler('gangsbuilder:fireEmployee', function(identifier, gangName)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.job2 and xPlayer.job2.name == gangName and xPlayer.job2.grade_name == 'boss' then
        SetPlayerJob2(identifier, 'unemployed2', 0)
        TriggerClientEvent('esx:showNotification', source, 'Employé viré avec succès')
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas accès à cette action')
    end
end)

RegisterServerEvent('gangsbuilder:recruitPlayer')
AddEventHandler('gangsbuilder:recruitPlayer', function(targetId, gangName)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    
    if xPlayer and xPlayer.job2 and xPlayer.job2.name == gangName and xPlayer.job2.grade_name == 'boss' and targetPlayer then
        MySQL.Async.fetchAll('SELECT grade FROM job_grades WHERE job_name = @gangName ORDER BY grade ASC LIMIT 1', {
            ['@gangName'] = gangName
        }, function(grades)
            if grades[1] then
                local minGrade = grades[1].grade
                
                SetPlayerJob2(targetPlayer.identifier, gangName, minGrade)
                TriggerClientEvent('esx:showNotification', source, 'Joueur recruté avec succès')
                TriggerClientEvent('esx:showNotification', targetId, 'Vous avez été recruté dans un gang')
            else
                TriggerClientEvent('esx:showNotification', source, 'Aucun grade trouvé pour ce gang')
            end
        end)
    else
        TriggerClientEvent('esx:showNotification', source, 'Action impossible')
    end
end)

ESX.RegisterServerCallback('gangsbuilder:getGangClothes', function(source, cb, gangName)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    MySQL.Async.fetchAll('SELECT * FROM gang2_clothes WHERE gang = @gang', {
        ['@gang'] = gangName
    }, function(results)
        cb(results)
    end)
end)

RegisterServerEvent('gangsbuilder:saveGangClothes')
AddEventHandler('gangsbuilder:saveGangClothes', function(gangName, label, skin)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.job2 and xPlayer.job2.name == gangName then
        local isBoss = xPlayer.job2.grade_name == 'boss'
        
        local playerGrade = xPlayer.job2.grade
        if playerGrade == nil then
            playerGrade = 0
        end
        
        if isBoss then
            local characterName = GetCharacterName(xPlayer.identifier)
            
            MySQL.Async.fetchAll('SELECT * FROM gang2_clothes WHERE gang = @gang AND label = @label', {
                ['@gang'] = gangName,
                ['@label'] = label
            }, function(result)
                if result and #result > 0 then
                    MySQL.Async.execute('UPDATE gang2_clothes SET skin = @skin, creator = @creator WHERE gang = @gang AND label = @label', {
                        ['@gang'] = gangName,
                        ['@label'] = label,
                        ['@skin'] = skin,
                        ['@creator'] = characterName
                    }, function(rowsChanged)
                        if rowsChanged > 0 then
                            TriggerClientEvent('esx:showNotification', source, 'Tenue mise à jour avec succès')
                        else
                            TriggerClientEvent('esx:showNotification', source, 'Erreur lors de la mise à jour de la tenue')
                        end
                    end)
                else
                    MySQL.Async.execute('INSERT INTO gang2_clothes (gang, label, skin, creator) VALUES (@gang, @label, @skin, @creator)', {
                        ['@gang'] = gangName,
                        ['@label'] = label,
                        ['@skin'] = skin,
                        ['@creator'] = characterName
                    }, function(rowsChanged)
                        if rowsChanged > 0 then
                            TriggerClientEvent('esx:showNotification', source, 'Tenue sauvegardée avec succès')
                        else
                            TriggerClientEvent('esx:showNotification', source, 'Erreur lors de la sauvegarde de la tenue')
                        end
                    end)
                end
            end)
        else
            MySQL.Async.fetchAll('SELECT vestiaire_create FROM gang2_grade_permissions WHERE job_name = @gangName AND grade = @grade', {
                ['@gangName'] = gangName,
                ['@grade'] = playerGrade
            }, function(result)
                local canCreateOutfits = false
                
                if result and result[1] then
                    if result[1].vestiaire_create == 1 then
                        canCreateOutfits = true
                    end
                end
                
                if canCreateOutfits then
                    local characterName = GetCharacterName(xPlayer.identifier)
                    
                    MySQL.Async.fetchAll('SELECT * FROM gang2_clothes WHERE gang = @gang AND label = @label', {
                        ['@gang'] = gangName,
                        ['@label'] = label
                    }, function(result)
                        if result and #result > 0 then
                            MySQL.Async.execute('UPDATE gang2_clothes SET skin = @skin, creator = @creator WHERE gang = @gang AND label = @label', {
                                ['@gang'] = gangName,
                                ['@label'] = label,
                                ['@skin'] = skin,
                                ['@creator'] = characterName
                            }, function(rowsChanged)
                                if rowsChanged > 0 then
                                    TriggerClientEvent('esx:showNotification', source, 'Tenue mise à jour avec succès')
                                else
                                    TriggerClientEvent('esx:showNotification', source, 'Erreur lors de la mise à jour de la tenue')
                                end
                            end)
                        else
                            MySQL.Async.execute('INSERT INTO gang2_clothes (gang, label, skin, creator) VALUES (@gang, @label, @skin, @creator)', {
                                ['@gang'] = gangName,
                                ['@label'] = label,
                                ['@skin'] = skin,
                                ['@creator'] = characterName
                            }, function(rowsChanged)
                                if rowsChanged > 0 then
                                    TriggerClientEvent('esx:showNotification', source, 'Tenue sauvegardée avec succès')
                                else
                                    TriggerClientEvent('esx:showNotification', source, 'Erreur lors de la sauvegarde de la tenue')
                                end
                            end)
                        end
                    end)
                else
                    TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas la permission de créer des tenues')
                end
            end)
        end
    else
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas les permissions nécessaires')
    end
end)

function GetCharacterName(identifier)
    local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    })
    
    if result[1] then
        return result[1].firstname .. ' ' .. result[1].lastname
    else
        return "Inconnu"
    end
end

RegisterServerEvent('gangsbuilder:requestJobRefresh')
AddEventHandler('gangsbuilder:requestJobRefresh', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        MySQL.Async.execute('UPDATE users SET job2 = @job, job2_grade = @grade WHERE identifier = @identifier', {
            ['@job'] = xPlayer.job2.name,
            ['@grade'] = xPlayer.job2.grade,
            ['@identifier'] = xPlayer.identifier
        }, function(rowsChanged)
            RefreshJobsInESX()
            
            Citizen.Wait(500)
            TriggerClientEvent('gangsbuilder:refreshPlayerData', source)
            
            TriggerClientEvent('esx:showNotification', source, "Les données de job ont été rafraîchies")
        end)
    end
end)

ESX.RegisterServerCallback('gangsbuilder:getGradePermissions', function(source, cb, gangName, grade)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        if grade == nil then
            grade = xPlayer.job2.grade
            
            if grade == nil then
                grade = 0
            end
        end
        
        MySQL.Async.fetchAll('SELECT * FROM gang2_grade_permissions WHERE job_name = @job_name AND grade = @grade', {
            ['@job_name'] = gangName,
            ['@grade'] = grade
        }, function(result)
            if result and result[1] then
                local permissions = result[1]
                permissions.vehicles = json.decode(permissions.vehicles)
                permissions.clothes = json.decode(permissions.clothes)
                
                if not permissions.vehicles or type(permissions.vehicles) ~= 'table' then 
                    permissions.vehicles = {} 
                end
                
                if not permissions.clothes or type(permissions.clothes) ~= 'table' then 
                    permissions.clothes = {} 
                end
                
                if permissions.vestiaire_create == nil then
                    permissions.vestiaire_create = 0
                end
                
                cb(permissions)
            else
                if grade == nil then
                    grade = 0
                end
                
                MySQL.Async.execute('INSERT INTO gang2_grade_permissions (job_name, grade, vestiaire_create) VALUES (@job_name, @grade, 0)', {
                    ['@job_name'] = gangName,
                    ['@grade'] = grade
                }, function(rowsChanged)
                    if rowsChanged > 0 then
                        cb({
                            job_name = gangName,
                            grade = grade,
                            coffre_access = 1,
                            coffre_deposit = 1,
                            coffre_take = 1,
                            coffre_weapons = 1, 
                            coffre_items = 1,
                            coffre_money = 1,
                            garage_access = 1,
                            vehicles = {},
                            vestiaire_access = 1,
                            vestiaire_create = 0,
                            clothes = {}
                        })
                    else
                        cb({
                            job_name = gangName,
                            grade = grade,
                            coffre_access = 1,
                            coffre_deposit = 1,
                            coffre_take = 1,
                            coffre_weapons = 1, 
                            coffre_items = 1,
                            coffre_money = 1,
                            garage_access = 1,
                            vehicles = {},
                            vestiaire_access = 1,
                            vestiaire_create = 0,
                            clothes = {}
                        })
                    end
                end)
            end
        end)
    else
        cb(nil)
    end
end)

RegisterServerEvent('gangsbuilder:updateGradePermissions')
AddEventHandler('gangsbuilder:updateGradePermissions', function(gangName, grade, permissions)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.job2 and xPlayer.job2.name == gangName and xPlayer.job2.grade_name == 'boss' then
        if type(permissions.vehicles) == 'table' then
            permissions.vehicles = json.encode(permissions.vehicles)
        end
        
        if type(permissions.clothes) == 'table' then
            permissions.clothes = json.encode(permissions.clothes)
        end
        
        if permissions.vestiaire_create == nil then
            permissions.vestiaire_create = 0
        end
        
        MySQL.Async.execute('UPDATE gang2_grade_permissions SET coffre_access = @coffre_access, coffre_deposit = @coffre_deposit, coffre_take = @coffre_take, coffre_weapons = @coffre_weapons, coffre_items = @coffre_items, coffre_money = @coffre_money, garage_access = @garage_access, vehicles = @vehicles, vestiaire_access = @vestiaire_access, vestiaire_create = @vestiaire_create, clothes = @clothes WHERE job_name = @job_name AND grade = @grade', {
            ['@job_name'] = gangName,
            ['@grade'] = grade,
            ['@coffre_access'] = permissions.coffre_access,
            ['@coffre_deposit'] = permissions.coffre_deposit,
            ['@coffre_take'] = permissions.coffre_take,
            ['@coffre_weapons'] = permissions.coffre_weapons,
            ['@coffre_items'] = permissions.coffre_items,
            ['@coffre_money'] = permissions.coffre_money,
            ['@garage_access'] = permissions.garage_access,
            ['@vehicles'] = permissions.vehicles,
            ['@vestiaire_access'] = permissions.vestiaire_access,
            ['@vestiaire_create'] = permissions.vestiaire_create,
            ['@clothes'] = permissions.clothes
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent('gangsbuilder:notify', source, "Permissions mises à jour pour le grade")
            else
                MySQL.Async.execute('INSERT INTO gang2_grade_permissions (job_name, grade, coffre_access, coffre_deposit, coffre_take, coffre_weapons, coffre_items, coffre_money, garage_access, vehicles, vestiaire_access, vestiaire_create, clothes) VALUES (@job_name, @grade, @coffre_access, @coffre_deposit, @coffre_take, @coffre_weapons, @coffre_items, @coffre_money, @garage_access, @vehicles, @vestiaire_access, @vestiaire_create, @clothes)', {
                    ['@job_name'] = gangName,
                    ['@grade'] = grade,
                    ['@coffre_access'] = permissions.coffre_access,
                    ['@coffre_deposit'] = permissions.coffre_deposit,
                    ['@coffre_take'] = permissions.coffre_take,
                    ['@coffre_weapons'] = permissions.coffre_weapons,
                    ['@coffre_items'] = permissions.coffre_items,
                    ['@coffre_money'] = permissions.coffre_money,
                    ['@garage_access'] = permissions.garage_access,
                    ['@vehicles'] = permissions.vehicles,
                    ['@vestiaire_access'] = permissions.vestiaire_access,
                    ['@vestiaire_create'] = permissions.vestiaire_create,
                    ['@clothes'] = permissions.clothes
                }, function()
                    TriggerClientEvent('gangsbuilder:notify', source, "Permissions créées pour le grade")
                end)
            end
        end)
    else
        TriggerClientEvent('gangsbuilder:notify', source, "Vous n'avez pas les droits pour modifier les permissions")
    end
end)

ESX.RegisterServerCallback('gangsbuilder:checkGradePermissions', function(source, cb, gangName, grade, permissionType)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        MySQL.Async.fetchAll('SELECT * FROM gang2_grade_permissions WHERE job_name = @job_name AND grade = @grade', {
            ['@job_name'] = gangName,
            ['@grade'] = grade
        }, function(result)
            if result and result[1] then
                local permissions = result[1]
                
                if permissionType == 'coffre' then
                    cb(permissions.coffre_access == 1)
                elseif permissionType == 'coffre_deposit' then
                    cb(permissions.coffre_deposit == 1)
                elseif permissionType == 'coffre_take' then
                    cb(permissions.coffre_take == 1)
                elseif permissionType == 'coffre_weapons' then
                    cb(permissions.coffre_weapons == 1)
                elseif permissionType == 'coffre_items' then
                    cb(permissions.coffre_items == 1)
                elseif permissionType == 'coffre_money' then
                    cb(permissions.coffre_money == 1)
                elseif permissionType == 'garage' then
                    cb(permissions.garage_access == 1)
                elseif permissionType == 'vestiaire' then
                    cb(permissions.vestiaire_access == 1)
                elseif permissionType == 'vehicle' then
                    local vehicles = json.decode(permissions.vehicles)
                    if vehicles and #vehicles > 0 then
                        cb(vehicles)
                    else
                        cb(true)
                    end
                elseif permissionType == 'clothes' then
                    local clothes = json.decode(permissions.clothes)
                    if clothes and #clothes > 0 then
                        cb(clothes)
                    else
                        cb(true)
                    end
                else
                    cb(false)
                end
            else
                if permissionType == 'vehicle' or permissionType == 'clothes' then
                    cb(true)
                else
                    cb(true)
                end
            end
        end)
    else
        cb(false)
    end
end) 