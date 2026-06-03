Citizen.CreateThread(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `gangs2` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `name` varchar(50) NOT NULL,
            `label` varchar(50) NOT NULL,
            `positions` longtext NOT NULL,
            `max_tenues` int(11) NOT NULL DEFAULT '10',
            `garage_size` int(11) NOT NULL DEFAULT '10',
            `coffre_weight` int(11) NOT NULL DEFAULT '100',
            `can_sell_weapons` tinyint(1) NOT NULL DEFAULT '0',
            PRIMARY KEY (`id`),
            UNIQUE KEY `name` (`name`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    ]], {}, function(affectedRows)
        print('^2[gangsbuilder] ^7Table gangs2 check check check babyyy.')
    end)
end)

function ValidateGangPositions(positions)
    local requiredPositions = {"Coffre", "Patron", "Garage", "SuppressionVehicule", "SpawnVehicule", "Vestiaire", "Blip"}
    
    for _, posType in ipairs(requiredPositions) do
        if not positions[posType] then
            return false
        end
    end
    
    return true
end

function HasFounderPermission(xPlayer)
    if not xPlayer then return false end
    
    local source = xPlayer.source
    return IsPlayerAceAllowed(source, "command." .. Config.FounderPermission) or xPlayer.getGroup() == Config.FounderPermission
end

function NotifyPlayer(playerId, message)
    TriggerClientEvent('gangsbuilder:notify', playerId, message)
end

function GetGangInfo(gangName, cb)
    MySQL.Async.fetchAll('SELECT * FROM gangs2 WHERE name = @name', {
        ['@name'] = gangName
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
end

function GetAllGangs(cb)
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
end

function GetGangMembers(gangName, cb)
    MySQL.Async.fetchAll('SELECT users.identifier, users.firstname, users.lastname, job_grades.label AS grade_label FROM users INNER JOIN job_grades ON users.job2_grade = job_grades.grade WHERE users.job2 = @job2 AND job_grades.job_name = @job_name', {
        ['@job2'] = gangName,
        ['@job_name'] = gangName
    }, function(result)
        cb(result)
    end)
end

function UpdateGangProperty(gangName, property, value, source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not HasFounderPermission(xPlayer) then
        NotifyPlayer(source, Config.Messages.NoPermission)
        return false
    end
    
    MySQL.Async.execute('UPDATE gangs2 SET ' .. property .. ' = @value WHERE name = @name', {
        ['@value'] = value,
        ['@name'] = gangName
    }, function(rowsChanged)
        if rowsChanged > 0 then
            NotifyPlayer(source, Config.Messages.ValueModified)
            return true
        else
            NotifyPlayer(source, "Erreur lors de la modification")
            return false
        end
    end)
end

RegisterNetEvent('gangsbuilder:showInventory')
AddEventHandler('gangsbuilder:showInventory', function(inventory, weapons, money)
    local source = source
    local itemsFormatted = {}
    
    for k, item in pairs(inventory) do
        if item.count > 0 then
            table.insert(itemsFormatted, {
                label = item.label,
                count = item.count
            })
        end
    end
    
    local weaponsFormatted = {}
    for k, weapon in pairs(weapons) do
        table.insert(weaponsFormatted, {
            label = ESX.GetWeaponLabel(weapon.name),
            ammo = weapon.ammo
        })
    end
    
    TriggerClientEvent('gangsbuilder:displayInventory', source, itemsFormatted, weaponsFormatted, money)
end) 