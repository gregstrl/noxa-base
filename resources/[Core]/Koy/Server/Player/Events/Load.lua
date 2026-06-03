Shared.Events:On("esx:playerLoaded", function(playerSrc)
    local xPlayer = Server:ConvertToPlayer(playerSrc)

    if xPlayer then
        local ipHost = GetPlayerEndpoint(xPlayer.source) or "Unknown IP"

        Shared.Log:Success(
            Shared.Lang:Translate(
                "player_loaded",
                xPlayer.source,
                xPlayer.identifier,
                xPlayer.name,
                ipHost,
                xPlayer.getGroup() or "user"
            )
        )

        JG.Discord:SendMessage(
            "Admin:PlayerConnecting",
            ("***%s*** vient de se connecter sur le serveur."):format(xPlayer.getName()),
            {
                {
                    name = "Identifiant du JOUEUR",
                    value = xPlayer.getIdentifier() or "N/A",
                    inline = true
                },
                {
                    name = "ID session du JOUEUR",
                    value = tostring(xPlayer.source),
                    inline = true
                },
                {
                    name = "Pseudo du JOUEUR",
                    value = xPlayer.getName(),
                    inline = true
                }
            }
        )

        TriggerClientEvent(Enums.Player.Events.ReceivePlayerData, xPlayer.source, xPlayer)
    end
end)

Shared.Events:OnNet(Enums.Player.Events.PlayerLoaded, function(xPlayer)
    if xPlayer and xPlayer.source then
        JG.PlayersManager:Add(xPlayer.source)
    end
end)

Shared.Events:OnProtectedNet(Enums.Player.Events.KickPlayer, function(player, reason)
    if Server then
    local xPlayer = Server:ConvertToPlayer(player)

    if xPlayer and xPlayer.source then
        DropPlayer(xPlayer.source, reason)
    elseif player then
        DropPlayer(player, reason)
        end
    else
        if type(player) == "table" and player.source then
            DropPlayer(player.source, reason)
        elseif player then
            DropPlayer(player, reason)
        end
    end
end)

local function handlePlayerDisconnect(xPlayer, reason)
    if xPlayer then
        MySQL.Async.fetchScalar('SELECT uid FROM users WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        }, function(uid)
            local coords = xPlayer.getCoords()
            TriggerClientEvent(Enums.Administration.Client.PlayerDropped, -1, uid or 0, xPlayer.getName(), coords, reason)
        end)

        Shared.Log:Info(Shared.Lang:Translate("player_dropped", xPlayer.source, xPlayer.identifier, xPlayer.name, reason))
        if JG.PlayersManager then
            JG.PlayersManager:Remove(xPlayer)
        end
    end
end

if Server then
    Server:OnPlayerDropped(function(xPlayer, reason)
        handlePlayerDisconnect(xPlayer, reason)
    end)
else
    AddEventHandler("playerDropped", function(reason)
        local xPlayer = ESX and ESX.GetPlayerFromId(source)
        if xPlayer then
            handlePlayerDisconnect(xPlayer, reason)
        end
    end)
    print("^3[AVERTISSEMENT] Server n'est pas disponible pour handlePlayerDisconnect, utilisant fallback^7")
end

AddEventHandler("Koy:esx:loaded", function()
    local players = GetPlayers()

    for _, playerId in ipairs(players) do
        local xPlayer = ESX.GetPlayerFromId(tonumber(playerId))

        if xPlayer and type(xPlayer) == "table" then
            TriggerClientEvent(Enums.Player.Events.ReceivePlayerData, xPlayer.source, xPlayer)
        end
    end
end)
