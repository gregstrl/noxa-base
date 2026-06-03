PlayeTime = {}

AddEventHandler('esx:playerLoaded', function(source)
    StartPlayerTime(source)
end)

AddEventHandler('esx:playerDropped', function(source)
    SaveTimePlayed(source)
end)

function StartPlayerTime(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        print("^1[ERROR]^7 Impossible de récupérer xPlayer pour source:", source)
        return
    end

    MySQL.Async.fetchAll("SELECT * FROM playtime WHERE identifier = @identifier", {
        ['@identifier'] = xPlayer.identifier
    }, function(result)
        if result and result[1] then
            TriggerClientEvent("PlayerTime:StartTimer", source, result[1].timeplayed)
        else
            MySQL.Async.execute("INSERT INTO playtime (identifier, timeplayed) VALUES (@identifier, @timeplayed)", {
                ['@identifier'] = xPlayer.identifier,
                ['@timeplayed'] = 0
            }, function(rowsChanged)
                TriggerClientEvent("PlayerTime:StartTimer", source, 0)
            end)
        end
    end)
end

function SaveTimePlayed(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        print("^1[ERROR]^7 Impossible de récupérer xPlayer pour source:", source)
        return
    end

    if PlayeTime[source] then
        MySQL.Async.execute("UPDATE playtime SET timeplayed = @timeplayed WHERE identifier = @identifier", {
            ['@identifier'] = xPlayer.identifier,
            ['@timeplayed'] = PlayeTime[source].timeplayed
        }, function(rowsChanged)
            -- print("^2[SILKY]^7 le temps de jeux de "..xPlayer.identifier.." a bien été sauvegardé")
        end)

        -- Nettoyer les données après sauvegarde
        PlayeTime[source] = nil
    end
end

RegisterServerEvent("PlayerTime:UpdateTimer")
AddEventHandler("PlayerTime:UpdateTimer", function(timeplayed)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        print("^1[ERROR]^7 Impossible de récupérer xPlayer pour source:", source)
        return
    end

    PlayeTime[source] = {
        source = source,
        timeplayed = timeplayed
    }
end)
