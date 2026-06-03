ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- MYSQL
local Lite = {};
function Lite:Logs(Executed, Message)
    local Started = Executed;
end
LiteMySQL = {};
local Select = {};
local Where = {}
local Wheres = {}
function LiteMySQL:Insert(Table, Content)
    local executed = GetGameTimer();
    local fields = "";
    local keys = "";
    local id = nil;
    for key, _ in pairs(Content) do
        fields = string.format('%s`%s`,', fields, key)
        key = string.format('@%s', key)
        keys = string.format('%s%s,', keys, key)
    end
    MySQL.Async.insert(string.format("INSERT INTO %s (%s) VALUES (%s)", Table, string.sub(fields, 1, -2), string.sub(keys, 1, -2)), Content, function(insertId)
        id = insertId;
    end)
    while (id == nil) do
        Wait(1.0)
    end
    Lite:Logs(executed, string.format('^2INSERT %s', Table))
    if (id ~= nil) then
        return id;
    else
        error("InsertId is nil")
    end
end
function LiteMySQL:Update(Table, Column, Operator, Value, Content)
    local executed = GetGameTimer();
    self.affectedRows = nil;
    self.keys = "";
    self.args = {};
    for key, value in pairs(Content) do
        self.keys = string.format("%s`%s` = @%s, ", self.keys, key, key)
        self.args[string.format('@%s', key)] = value;
    end
    self.args['@value'] = Value;
    local query = string.format("UPDATE %s SET %s WHERE %s %s @value", Table, string.sub(self.keys, 1, -3), Column, Operator, Value)
    MySQL.Async.execute(query, self.args, function(affectedRows)
        self.affectedRows = affectedRows;
    end)
    while (self.affectedRows == nil) do
        Wait(1.0)
    end
    Lite:Logs(executed, string.format('^4UPDATED %s', Table))
    if (self.affectedRows ~= nil) then
        return self.affectedRows;
    end
end
function LiteMySQL:UpdateWheres(Table, Where, Content)
    local executed = GetGameTimer();
    self.affectedRows = nil;
    self.keys = "";
    self.content = "";
    self.args = {};
    for key, value in pairs(Content) do
        self.content = string.format("%s`%s` = @%s, ", self.content, key, key)
        self.args[string.format('@%s', key)] = value;
    end
    for _, value in pairs(Where) do
        self.keys = string.format("%s `%s` %s @%s AND ", self.keys, value.column, value.operator, value.column)
        self.args[string.format('@%s', value.column)] = value.value;
    end
    local query = string.format('UPDATE %s SET %s WHERE %s', Table, string.sub(self.content, 1, -3), string.sub(self.keys, 1, -5));
    MySQL.Async.execute(query, self.args, function(affectedRows)
        self.affectedRows = affectedRows;
    end)
    while (self.affectedRows == nil) do
        Wait(1.0)
    end
    Lite:Logs(executed, string.format('^4UPDATED %s', Table))
    if (self.affectedRows ~= nil) then
        return self.affectedRows;
    end
end
function LiteMySQL:Select(Table)
    self.SelectTable = Table
    return Select;
end
function LiteMySQL:GetSelectTable()
    return self.SelectTable;
end
function Select:All()
    local executed = GetGameTimer();
    local storage = nil;
    MySQL.Async.fetchAll(string.format('SELECT * FROM %s', LiteMySQL:GetSelectTable()), { }, function(result)
        if (result ~= nil) then
            storage = result
        end
    end)
    while (storage == nil) do
        Wait(1.0)
    end
    Lite:Logs(executed, string.format('^5SELECTED ALL %s', LiteMySQL:GetSelectTable()))
    return #storage, storage;
end
function Select:Delete(Column, Operator, Value)
    local executed = GetGameTimer();
    local count = 0;
    MySQL.Async.execute(string.format('DELETE FROM %s WHERE %s %s @value', LiteMySQL:GetSelectTable(), Column, Operator), { ['@value'] = Value }, function(affectedRows)
        count = affectedRows
    end)
    while (count == 0) do
        Wait(1.0)
    end
    Lite:Logs(executed, string.format('^8DELETED %s WHERE %s %s %s', LiteMySQL:GetSelectTable(), Column, Operator, Value))
    return count;
end
function Select:GetWhereResult()
    return self.whereStorage;
end
function Select:GetWhereConditions(Id)
    return self.whereConditions[Id or 1];
end
function Select:GetWheresResult()
    return self.wheresStorage;
end
function Select:GetWheresConditions()
    return self.wheresConditions;
end
function Select:Where(Column, Operator, Value)
    local executed = GetGameTimer();
    self.whereStorage = nil;
    self.whereConditions = { Column, Operator, Value };
    MySQL.Async.fetchAll(string.format('SELECT * FROM %s WHERE %s %s @value', LiteMySQL:GetSelectTable(), Column, Operator), { ['@value'] = Value }, function(result)
        if (result ~= nil) then
            self.whereStorage = result
        end
    end)
    while (self.whereStorage == nil) do
        Wait(1.0)
    end
    Lite:Logs(executed, string.format('^5SELECTED %s WHERE %s %s %s', LiteMySQL:GetSelectTable(), Column, Operator, Value))
    return Where;
end
function Where:Update(Content)
    if (self:Exists()) then
        local Table = LiteMySQL:GetSelectTable();
        local Column = Select:GetWhereConditions(1);
        local Operator = Select:GetWhereConditions(2);
        local Value = Select:GetWhereConditions(3);
        LiteMySQL:Update(Table, Column, Operator, Value, Content)
    else
        error('Not exists')
    end
end
function Where:Exists()
    return Select:GetWhereResult() ~= nil and #Select:GetWhereResult() >= 1
end
function Where:Get()
    local result = Select:GetWhereResult();
    return #result, result;
end
function Select:Wheres(Table)
    local executed = GetGameTimer();
    self.wheresStorage = nil;
    self.keys = "";
    self.args = {};
    for key, value in pairs(Table) do
        self.keys = string.format("%s `%s` %s @%s AND ", self.keys, value.column, value.operator, value.column)
        self.args[string.format('@%s', value.column)] = value.value;
    end
    local query = string.format('SELECT * FROM %s WHERE %s', LiteMySQL:GetSelectTable(), string.sub(self.keys, 1, -5));
    MySQL.Async.fetchAll(query, self.args, function(result)
        if (result ~= nil) then
            self.wheresStorage = result
        end
    end)
    while (self.wheresStorage == nil) do
        Wait(1.0)
    end
    Lite:Logs(executed, string.format('^5SELECT %s WHERE %s', LiteMySQL:GetSelectTable(), json.encode(self.args)))
    return Wheres;
end
function Wheres:Exists()
    return Select:GetWheresResult() ~= nil and #Select:GetWheresResult() >= 1
end
function Wheres:Get()
    local result = Select:GetWheresResult();
    return #result, result;
end
--MYSQL

function GetAllSourceIdentifiers(src)
    local steam, fivem = "0", "0"
    local ste, fiv = "license:", "fivem:"
    for _, v in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len(ste)) == ste then
            steam = string.sub(v, #ste + 1)
        end
        if string.sub(v, 1, string.len(fiv)) == fiv then
            fivem = string.sub(v, #fiv + 1)
        end
    end
    return steam, fivem
end

function GetIdentifiers(source)
    if (source ~= nil) then
        local identifiers = {}
        local playerIdentifiers = GetPlayerIdentifiers(source)
        for _, v in pairs(playerIdentifiers) do
            local before, after = playerIdentifiers[_]:match("([^:]+):([^:]+)")
            identifiers[before] = playerIdentifiers[_]
        end
        return identifiers
    else
        error("source is nil")
    end
end



---@class Afk.Players
Afk.Players = {}
Afk.Players.__index = Afk.Players
Afk.Players.List = {}

---create
---@param UniqueID number (UniqueID of Player)
---@param data table (data of Player)
---@return table (self)
---@public
function Afk.Players:create(UniqueID, data)
    local self = setmetatable({}, Afk.Players)

    self.UniqueID = UniqueID
    self.time = data.time
    self.points = data.points
    self.inZone = data.inZone
    self.playerName = data.playerName
    self.skin = data.skin


    Afk.Players.List[self.UniqueID] = self

    return self
end

---load
---@private
function Afk.Players:load()
    MySQL.Async.fetchAll('SELECT * FROM Koy_afk_players', {}, function(result)
        for k,v in pairs(result) do
            MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
                ['@identifier'] = v.UniqueID
            }, function(r)
                for i,p in pairs(r) do
                    Afk.Players:create(v.UniqueID, {
                        UniqueID = v.UniqueID,
                        time = v.time,
                        points = v.points,
                        inZone = v.inZone,
                        skin = json.decode(p.skin),
                        playerName = v.playerName or "Indéfini"
                    })
                end
            end)
        end
    end)
end

---create
---@param UniqueID number (UniqueID of Player)
---@private
function Afk.Players:add(UniqueID, identifier, playerName)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        MySQL.Async.execute('INSERT INTO Koy_afk_players (UniqueID, time, points, inZone, skin, playerName) VALUES (@UniqueID, @time, @points, @inZone, @skin, @playerName)', {
            ['@UniqueID'] = UniqueID, 
            ['@time'] = 0, 
            ['@points'] = 0, 
            ['@inZone'] = false,
            ['@skin'] = result[1].skin,
            ['@playerName'] = playerName,
        }, function()
            Afk.Players:create(UniqueID, {
                UniqueID = UniqueID,
                time = 0,
                points = 0,
                inZone = false,
                skin = json.decode(result[1].skin),
                playerName = playerName
            })
        end)
    end)
end

---addPoints
---@param points number (number of Points)
---@private
function Afk.Players:addPoints(points, cb)
    self.points += points
    self.time += 3

    MySQL.Async.execute('UPDATE Koy_afk_players SET points = @points, time = @time WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = self.UniqueID,
        ['@points'] = self.points,
        ["@time"] = self.time
    }, function()
        if cb then
            cb()
        end
    end)
end

---removePoints
---@param points number (number of Points)
---@private
function Afk.Players:removePoints(points, cb)
    self.points -= points

    MySQL.Async.execute('UPDATE Koy_afk_players SET points = @points WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = self.UniqueID,
        ['@points'] = self.points
    }, function()
        if cb then
            cb()
        end
    end)
end

---get
---@param UniqueID number (UniqueID of Player)
---@return table | boolean
---@public
function Afk.Players:get(UniqueID)
    if not Afk.Players.List[UniqueID] then
        return false
    end

    return Afk.Players.List[UniqueID]
end

AddEventHandler('esx:playerLoaded', function(source, xPlayer)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.identifier ~= nil then
        xPlayer.UniqueID = xPlayer.identifier
    end

    local player = Afk.Players:get(xPlayer.UniqueID)

    if player then
        TriggerClientEvent('Koy:afk:recievePlayerInformation', source, player)

        if player.inZone == true then
            TriggerClientEvent('Koy:afk:enter', source, true)

            MySQL.Async.execute('UPDATE Koy_afk_players SET inZone = true WHERE UniqueID = @UniqueID', {
                ['@UniqueID'] = xPlayer.UniqueID
            })
        end
    end
end)

RegisterNetEvent('Koy:afk:restart', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.identifier ~= nil then
        xPlayer.UniqueID = xPlayer.identifier
    end

    local player = Afk.Players:get(xPlayer.UniqueID)

    if player then
        TriggerClientEvent('Koy:afk:recievePlayerInformation', source, player)

        if player.inZone == true then
            TriggerClientEvent('Koy:afk:enter', source, true)

            MySQL.Async.execute('UPDATE Koy_afk_players SET inZone = true WHERE UniqueID = @UniqueID', {
                ['@UniqueID'] = xPlayer.UniqueID
            })
        end
    end
end)

RegisterNetEvent('Koy:afk:enter', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.identifier ~= nil then
        xPlayer.UniqueID = xPlayer.identifier
    end

    local player = Afk.Players:get(xPlayer.UniqueID)

    if not player then
        Afk.Players:add(xPlayer.UniqueID, xPlayer.identifier, GetPlayerName(source))
    end

    Wait(1000)

    local player = Afk.Players:get(xPlayer.UniqueID)

    if not player then return end

    if player.inZone == true then
        return
    end

    if player.playerName == "Indefini" then
        player.playerName = GetPlayerName(source)
    end

    player.inZone = true
    TriggerClientEvent('Koy:afk:recievePlayerInformation', source, player)
    TriggerClientEvent('Koy:afk:enter', source)

    MySQL.Async.execute('UPDATE Koy_afk_players SET inZone = true WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = xPlayer.UniqueID
    })
end)

RegisterNetEvent('Koy:afk:exit', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.identifier ~= nil then
        xPlayer.UniqueID = xPlayer.identifier
    end

    local player = Afk.Players:get(xPlayer.UniqueID)

    if not player then
        Afk.Players:add(xPlayer.UniqueID, xPlayer.identifier, GetPlayerName(source))
    end

    player.inZone = false

    TriggerClientEvent('Koy:afk:recievePlayerInformation', source, player)
    TriggerClientEvent('Koy:afk:exit', source)

    MySQL.Async.execute('UPDATE Koy_afk_players SET inZone = false WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = player.UniqueID
    })
end)
local TimeAfk = {}
local CooldownTime = 100

RegisterNetEvent('Koy:afk:addPoints', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    if xPlayer.identifier ~= nil then
        xPlayer.UniqueID = xPlayer.identifier
    end

    local UniqueID = xPlayer.UniqueID
    if not UniqueID then
        return
    end

    local player = Afk.Players:get(UniqueID)

    if TimeAfk[source] and TimeAfk[source] > os.time() then
        local remainingTime = TimeAfk[source] - os.time()
        return
    end

    if not player then
        exports['Jetevois']:fg_BanPlayer(source, "Tentative de CHEAT en zone AFK", true)
        return
    end

    if not player.inZone then
        exports['Jetevois']:fg_BanPlayer(source, "Tentative de CHEAT en zone AFK", true)
        return
    end

    TimeAfk[source] = os.time() + CooldownTime

    player:addPoints(5, function()
        TriggerClientEvent('Koy:afk:recievePlayerInformation', source, player)
    end)
end)


RegisterNetEvent('Koy:afk:buyCase', function(caseId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.identifier ~= nil then
        xPlayer.UniqueID = xPlayer.identifier
    end

    local player = Afk.Players:get(xPlayer.UniqueID)

    if not player then
        DropPlayer(source, "Tentative de CHEAT en zone AFK")
    end

    player:removePoints(Afk.Case[caseId].price, function()
        TriggerClientEvent('Koy:afk:recievePlayerInformation', source, player)
    end)

    TriggerClientEvent('Koy:afk:case:open', source, caseId, xPlayer.UniqueID)
end)

RegisterNetEvent('Koy:afk:case:reward', function(reward, vehicleData)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.identifier ~= nil then
        xPlayer.UniqueID = xPlayer.identifier
    end

    if reward.type == 'vehicle' then
        local plate = CreateRandomPlateText()
        local vehicleData = {}
        vehicleData.model = GetHashKey(reward)
        vehicleData.plate = plate
        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, state, stored, boutique) VALUES (@owner, @plate, @vehicle, @state, @stored, @boutique)', {
            ['@owner'] = xPlayer.identifier,
            ['@state'] = 0,
            ['@plate'] = plate,
            ['@vehicle'] = json.encode(vehicleData), 
            ['@type'] = reward.vehicle, 
            ['@stored'] = 1,
            ['@boutique'] = 1
        }, function(rowsChange) end)
        ESX.GiveCarKey(xPlayer, plate);
    elseif reward.type == 'weapon' then
        xPlayer.addWeapon(reward.name, 255)
        SeaLogs('https://discord.com/api/webhooks/1304244703914491954/ZSyT6WhrB1pAfdElkpCXWITBrG5toj-_e8H6fynCiqjH70Mh-8efqbWMBg8Yu4s3snLK', "AFK-FARM","Nom : ".. GetPlayerName(xPlayer.source).. '\nIdentifier : '.. xPlayer.identifier .. '\nA gagner : **'..reward.name..' ARME ', 3447003)
    elseif reward.type == 'item' then
        xPlayer.addInventoryItem(reward.name, reward.count)
        SeaLogs('https://discord.com/api/webhooks/1304244703914491954/ZSyT6WhrB1pAfdElkpCXWITBrG5toj-_e8H6fynCiqjH70Mh-8efqbWMBg8Yu4s3snLK', "AFK-FARM","Nom : ".. GetPlayerName(xPlayer.source).. '\nIdentifier : '.. xPlayer.identifier .. '\nA gagner : **'..reward.count..' ITEM ', ''..reward.name..'', 3447003)
    elseif reward.type == "coins" then 
        TriggerClientEvent('esx:showNotification', source, ('Vous avez gagnez ~o~%s~s~ StoryCoins \n Merci d\'ouvrir un ticket !'):format(reward.count))
        SeaLogs('https://discord.com/api/webhooks/1304244703914491954/ZSyT6WhrB1pAfdElkpCXWITBrG5toj-_e8H6fynCiqjH70Mh-8efqbWMBg8Yu4s3snLK', "AFK-FARM","Nom : ".. GetPlayerName(xPlayer.source).. '\nIdentifier : '.. xPlayer.identifier .. '\nA gagner : **'..reward.count..' Coins ', 16776960)
    elseif reward.type == "money" then
        xPlayer.addAccountMoney('cash', reward.count)
        SeaLogs('https://discord.com/api/webhooks/1304244703914491954/ZSyT6WhrB1pAfdElkpCXWITBrG5toj-_e8H6fynCiqjH70Mh-8efqbWMBg8Yu4s3snLK', "AFK-FARM","Nom : ".. GetPlayerName(xPlayer.source).. '\nIdentifier : '.. xPlayer.identifier .. '\nA gagner : **'..reward.count..' ARGENT ',  3447003)
    end
end)


function SeaLogs(webhook, name, message, color)
    local date = os.date('*t')
    local webhook = 'https://discord.com/api/webhooks/1304244703914491954/ZSyT6WhrB1pAfdElkpCXWITBrG5toj-_e8H6fynCiqjH70Mh-8efqbWMBg8Yu4s3snLK'
  
  if date.day < 10 then date.day = '0' .. tostring(date.day) end
  if date.month < 10 then date.month = '0' .. tostring(date.month) end
  if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
  if date.min < 10 then date.min = '0' .. tostring(date.min) end
  if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end

  local time = '\nDate: **`' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. (date.hour) .. ':' .. date.min .. ':' .. date.sec .. '`'

  local embeds = {
	  {
          ["title"]= message .. time,
		  ["type"]="rich",
		  ["color"] =color,
		  ["footer"]=  {
			  ["text"]= "Koy Logs",
		 },
	  }
  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end


local characters = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" }

function CreateRandomPlateText()
    local plate = ""
    math.randomseed(GetGameTimer())
    for i = 1, 4 do
        plate = plate .. characters[math.random(1, #characters)]
    end
    plate = plate .. ""
    for i = 1, 4 do
        plate = plate .. math.random(1, 9)
    end
    return plate
end


ESX.RegisterServerCallback('Koy:afk:selectFirstPlayersPoints', function(source, cb)
    local rTable = nil
    local rName = nil

    MySQL.Async.fetchAll('SELECT MAX(points) AS max_points FROM Koy_afk_players', {}, function(result)
        local maxPoints = result[1]['max_points']
    
        MySQL.Async.fetchAll('SELECT * FROM Koy_afk_players WHERE points = @points', {
            ['@points'] = maxPoints
        }, function(result2)
            if result2[1] then
                rTable = json.decode(result2[1].skin)
                rName = result2[1].playerName
            end

            -- Maintenant, tous les résultats sont disponibles
            cb({rTable, rName})
        end)    
    end)
end)


ESX.RegisterServerCallback('Koy:afk:getClassement', function(source, cb)
    local sqlQuery = [[
        SELECT * FROM Koy_afk_players
        ORDER BY points DESC
    ]]

    local t = {}

    MySQL.Async.fetchAll(sqlQuery, {}, function(result)
        for _, v in ipairs(result) do
            table.insert(t, v)
        end

        -- Maintenant, tous les résultats sont disponibles
        cb(t)
    end)
end)



RegisterCommand('sendPoints', function(source, args)
    if source == 0 then
        local xPlayer = ESX.GetPlayerFromId(args[1])


        if xPlayer then
            if xPlayer.identifier ~= nil then
                xPlayer.UniqueID = xPlayer.identifier
            end

            local player = Afk.Players:get(xPlayer.UniqueID)

            if not player then
                Afk.Players:add(xPlayer.UniqueID, xPlayer.identifier, xPlayer.name)
            end

            Wait(1000)
            local player = Afk.Players:get(xPlayer.UniqueID)

            player:addPoints(args[2], function()
                TriggerClientEvent('Koy:afk:recievePlayerInformation', xPlayer.source, player)
            end)
        end
    end
end)

CreateThread(function()
    -- MySQL.Async.execute([[
    --     CREATE TABLE IF NOT EXISTS `Koy_afk_players` (
    --         UniqueID INT(11) DEFAULT "0",
    --         points LONGTEXT DEFAULT "0",
    --         time LONGTEXT DEFAULT "0",
    --         inZone BOOLEAN DEFAULT false
    --     );
    -- ]], function()
        Afk.Players:load()
    -- end)
end)