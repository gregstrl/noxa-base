ESX = exports["Framework"]:getSharedObject()

local Player = {}
Player.__index = Player

local function RecupNewUID()
    local result = MySQL.Sync.fetchAll('SELECT MAX(uid) as max_uid FROM player_uids')
    local maxUid = result[1].max_uid or 0
    return maxUid + 1
end

local function UIDClient(identifier)
    local result = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    })
    
    if result[1] then
        return result[1].uid
    else
        local newUid = RecupNewUID()
        MySQL.Sync.execute('INSERT INTO player_uids (uid, identifier) VALUES (@uid, @identifier)', {
            ['@uid'] = newUid,
            ['@identifier'] = identifier
        })
        MySQL.Sync.execute('UPDATE users SET uid = @uid WHERE identifier = @identifier', {
            ['@uid'] = newUid,
            ['@identifier'] = identifier
        })
        return newUid
    end
end

function Player.new(source)
    local self = setmetatable({}, Player)
    self.source = source
    return self
end

function Player:load(identifier)
    local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    })

    if result[1] then
        local data = result[1]
        self.identifier = identifier
        self.group = data.group
        self.uid = UIDClient(identifier)
        self.accounts = json.decode(data.accounts)
        self.inventory = json.decode(data.inventory)
        self.job = json.decode(data.job)
        self.job2 = json.decode(data.job2)
        self.position = json.decode(data.position)
        self.metadata = json.decode(data.metadata)
        self.firstname = data.firstname
        self.lastname = data.lastname
        self.dateofbirth = data.dateofbirth
        self.sex = data.sex
        self.height = data.height
        self.status = json.decode(data.status)
        self.phone_number = data.phone_number
        self.lastpos = json.decode(data.lastpos)

        TriggerEvent('esx:playerLoaded', self.source, self)
        TriggerClientEvent('esx:playerLoaded', self.source, {
            identifier = self.identifier,
            accounts = self.accounts,
            coords = self.position,
            job = self.job,
            job2 = self.job2,
            inventory = self.inventory,
            metadata = self.metadata,
            uid = self.uid
        })
        TriggerClientEvent('esx:setUID', self.source, self.uid)
    end
end

exports('UIDServer', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        return xPlayer.uid
    end
    return nil
end)

exports('UIDServer1', function(targetId)
    local xPlayer = ESX.GetPlayerFromId(targetId)
    if xPlayer then
        local result = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        })
        if result[1] then
            return result[1].uid
        end
    end
    return nil
end)

return Player 