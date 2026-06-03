ESX = exports["Framework"]:getSharedObject()

local cooldowns = {}

AddEventHandler("onResourceStart", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    MySQL.Async.fetchAll("SELECT * FROM gofast_cooldown WHERE cooldown > @time", {["@time"] = os.time()}, function(results)
        for _, data in ipairs(results) do
            cooldowns[data.identifier] = data.cooldown
        end
    end)
end)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    for identifier, cooldown in pairs(cooldowns) do
        if cooldown > os.time() then
            MySQL.Async.execute(
                "INSERT INTO gofast_cooldown (identifier, cooldown) VALUES (@identifier, @cooldown) ON DUPLICATE KEY UPDATE cooldown = @cooldown",
                {["@identifier"] = identifier, ["@cooldown"] = cooldown}
            )
        end
    end
end)

RegisterNetEvent("gofast:startCooldown")
AddEventHandler("gofast:startCooldown", function()
    local _source = source
    local identifier = GetPlayerIdentifier(_source, 0)
    if not identifier then return end

    cooldowns[identifier] = os.time() + 43200

    MySQL.Async.execute(
        "INSERT INTO gofast_cooldown (identifier, cooldown) VALUES (@identifier, @cooldown) ON DUPLICATE KEY UPDATE cooldown = @cooldown",
        {["@identifier"] = identifier, ["@cooldown"] = cooldowns[identifier]}
    )

    TriggerClientEvent("gofast:updateCooldown", _source, 43200)
end)

ESX.RegisterServerCallback("gofast:getCooldown", function(source, cb)
    local identifier = GetPlayerIdentifier(source, 0)
    if not identifier then cb(0) return end

    if cooldowns[identifier] and cooldowns[identifier] > os.time() then
        cb(cooldowns[identifier] - os.time())
    else
        MySQL.Async.fetchScalar("SELECT cooldown FROM gofast_cooldown WHERE identifier = @identifier", {
            ["@identifier"] = identifier
        }, function(result)
            if result and result > os.time() then
                cooldowns[identifier] = result
                cb(result - os.time())
            else
                cb(0)
            end
        end)
    end
end)

AddEventHandler("playerConnecting", function(_, _, deferrals)
    local _source = source
    local identifier = GetPlayerIdentifier(_source, 0)
    if not identifier then return end

    MySQL.Async.fetchScalar("SELECT cooldown FROM gofast_cooldown WHERE identifier = @identifier", {
        ["@identifier"] = identifier
    }, function(result)
        if result and result > os.time() then
            cooldowns[identifier] = result
            TriggerClientEvent("gofast:updateCooldown", _source, result - os.time())
        end
    end)
end)




local alertJobs = {"police"}

RegisterNetEvent("gofast:alertPolice")
AddEventHandler("gofast:alertPolice", function(x, y, z)
    local _source = source
    local xPlayers = ESX.GetPlayers()
    local policeAlerted = false

    for _, playerId in ipairs(xPlayers) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer and xPlayer.job and xPlayer.job.name then
            for _, job in ipairs(alertJobs) do
                if xPlayer.job.name == job then
                    TriggerClientEvent("gofast:receiveAlert", playerId, x, y, z)
                    policeAlerted = true
                    break
                end
            end
        end
    end

    if policeAlerted then
        TriggerClientEvent("gofast:policeAlerted", _source)
    end
end)

RegisterNetEvent("gofast:reward")
AddEventHandler("gofast:reward", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then return end

    local identifier = GetPlayerIdentifier(_source, 0)
    if not identifier then return end

    -- Securite : cet event etait declenchable en boucle par le client => imprimante a argent.
    -- On le gate sur le meme cooldown 12h que le run, et on pose le cooldown cote serveur
    -- (au lieu de faire confiance au client pour appeler gofast:startCooldown separement).
    if cooldowns[identifier] and cooldowns[identifier] > os.time() then
        return
    end

    cooldowns[identifier] = os.time() + 43200
    MySQL.Async.execute(
        "INSERT INTO gofast_cooldown (identifier, cooldown) VALUES (@identifier, @cooldown) ON DUPLICATE KEY UPDATE cooldown = @cooldown",
        {["@identifier"] = identifier, ["@cooldown"] = cooldowns[identifier]}
    )

    local reward = math.random(50000, 80000)
    xPlayer.addAccountMoney('dirtycash', reward)
    TriggerClientEvent("gofast:updateCooldown", _source, 43200)
    TriggerClientEvent("gofast:success", _source, reward)
end)

