ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--

function logVehiclePurchase(xPlayer, vehicleName, price, paymentMethod)
    -- Obtenir la date et l'heure actuelles
    local date = os.date('*t')
    local logMessage = string.format(
        "[LOG - Achat Véhicule] Joueur: %s | License: %s | Véhicule: %s | Prix: %s$ | Paiement: %s | Date: %02d/%02d/%04d %02d:%02d:%02d",
        xPlayer.getName(),
        xPlayer.getIdentifier(),
        vehicleName,
        price,
        paymentMethod,
        date.day, date.month, date.year, date.hour, date.min, date.sec
    )

    -- Afficher le log dans la console
    print(logMessage)

    -- Envoyer le log au Discord via webhook
    sendToDiscordWithSpecialURL(0, "Achat d'un véhicule", logMessage)
end



function sendToDiscordWithSpecialURL(color, title, message)
    local webhook = "https://discord.com/api/webhooks/1364568528560062527/jfW07Y9iXY5Twm-T6Qx3fItmuSFJ7xqzmcSTI71xUIHq7tbQrpBHsA1VwwCYqOq2pv6P" -- Remplace par ton webhook Discord

    -- Vérifie que le webhook est configuré
    if not webhook or webhook == "" then
        print("^1[Erreur] Le webhook Discord n'est pas configuré.^7")
        return
    end

    -- Corps de la requête
    local connect = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Logs Véhicule",
            },
        }
    }

    -- Envoi au webhook
    PerformHttpRequest(webhook, function(err, text, headers) end, "POST", json.encode({username = "Logs Véhicules", embeds = connect}), {["Content-Type"] = "application/json"})
end

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

-- 

ESX.RegisterServerCallback("xCarDealer:getCategories", function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end
    MySQL.Async.fetchAll("SELECT * FROM vehicle_categories", {}, function(result) cb(result) end)
end)

ESX.RegisterServerCallback("xCarDealer:getVehicles", function(source, cb, category)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end
    MySQL.Async.fetchAll("SELECT * FROM vehicles WHERE category = @category", { 
        ['@category'] = category
    }, function(result) cb(result) end)
end)

function checkIfVehicleExists(plate, callback)
    MySQL.Async.fetchScalar("SELECT plate FROM owned_vehicles WHERE plate = @plate", { ['@plate'] = plate }, function(result)
        callback(result)  -- Si result est nil, la plaque est unique, sinon elle existe déjà
    end)
end

ESX.RegisterServerCallback("xCarDealer:sellCar_CB", function(source, cb, vehicle, price)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then 
        cb(false)
        return 
    end

    if not vehicle or not vehicle.plate then
        print('Erreur : Données du véhicule manquantes ou incorrectes')
        cb(false)
        return
    end
    checkIfVehicleExists(vehicle.plate, function(existingPlate)
        if existingPlate then
            -- Le véhicule existe déjà, ne pas insérer un doublon
            TriggerClientEvent('esx:showNotification', source, '(~b~Erreur~s~)\nVous avez déjà ce véhicule.')
            cb(false)
        else
    if xPlayer.getAccount('bank').money >= price then
        xPlayer.removeAccountMoney('bank', price)
        cb(true)
        
        -- Générer une plaque unique
        CreateRandomPlateTextForXP(function(plate)

        -- Insérer le véhicule dans la base de données
        MySQL.Async.execute("INSERT INTO owned_vehicles (owner, plate, vehicle, stored) VALUES (@owner, @plate, @vehicle, @stored)", {
            ['@owner'] = xPlayer.getIdentifier(),
            ['@plate'] = vehicle.plate,
            ['vehicle'] = json.encode(vehicle),
            ['stored'] = 1
        }, function(update)
            if update ~= nil then
                ESX.GiveCarKey(xPlayer, vehicle.plate);
                LiteMySQL:Insert('open_car', {
                    owner = xPlayer.getIdentifier(),
                    plate = vehicle.plate
                });
                logVehiclePurchase(xPlayer, vehicle.name, price, "Banque")
                TriggerClientEvent('esx:showNotification', source, '(~g~Succès~s~)\nVous avez acheté un véhicule. Dirigez-vous à un garage !.')
                end
            end)
        end)
    else
        cb(false)
        TriggerClientEvent('esx:showNotification', source, '(~b~Erreur~s~)\nVous n\'avez pas assez d\'argent.')
    end
end
end)
end)
local characters = { 
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", 
    "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" 
}
function CreateRandomPlateTextForXP(callback)
    local plate
    local isUnique = false

    -- Répéter jusqu'à générer une plaque unique
    Citizen.CreateThread(function()
        repeat
            plate = ""
            math.randomseed(GetGameTimer())
            for i = 1, 4 do
                plate = plate .. characters[math.random(1, #characters)]
            end
            for i = 1, 4 do
                plate = plate .. math.random(1, 9)
            end

            -- Vérification de l'unicité de la plaque
            MySQL.Async.fetchScalar("SELECT plate FROM owned_vehicles WHERE plate = @plate", { ['@plate'] = plate }, function(result)
                if not result then
                    -- Si la plaque est unique, appeler le callback
                    callback(plate)
                    isUnique = true
                end
            end)

            -- Attendre un peu avant de relancer la boucle
            Wait(10)
        until isUnique
    end)
end

ESX.RegisterServerCallback("xCarDealer:sellCar_E", function(source, cb, vehicle, price)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then 
        cb(false)
        return 
    end

    if not vehicle or not vehicle.plate then
        print('Erreur : Données du véhicule manquantes ou incorrectes')
        cb(false)
        return
    end
    checkIfVehicleExists(vehicle.plate, function(existingPlate)
        if existingPlate then
            -- Le véhicule existe déjà, ne pas insérer un doublon
            TriggerClientEvent('esx:showNotification', source, '(~b~Erreur~s~)\nVous avez déjà ce véhicule.')
            cb(false)
        else
    if xPlayer.getAccount('cash').money >= price then
        xPlayer.removeAccountMoney('cash', price)
        cb(true)
        
        -- Générer une plaque unique
        CreateRandomPlateTextForXP(function(plate)

        -- Insérer le véhicule dans la base de données
        MySQL.Async.execute("INSERT INTO owned_vehicles (owner, plate, vehicle, stored) VALUES (@owner, @plate, @vehicle, @stored)", {
            ['@owner'] = xPlayer.getIdentifier(),
            ['@plate'] = vehicle.plate,
            ['vehicle'] = json.encode(vehicle),
            ['stored'] = 1
        }, function(update)
            if update ~= nil then
                ESX.GiveCarKey(xPlayer, vehicle.plate);
                LiteMySQL:Insert('open_car', {
                    owner = xPlayer.getIdentifier(),
                    plate = vehicle.plate
                });
                logVehiclePurchase(xPlayer, vehicle.name, price, "Liquide")
                TriggerClientEvent('esx:showNotification', source, '(~g~Succès~s~)\nVous avez acheté un véhicule. Dirigez-vous à un garage !.')
                end
                    end)
                end)
            else
        cb(false)
        TriggerClientEvent('esx:showNotification', source, '(~b~Erreur~s~)\nVous n\'avez pas assez d\'argent.')
    end
end
end)
end)