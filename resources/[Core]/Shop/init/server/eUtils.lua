eUtils = {}

eUtils.GetDistance = function(source, position, distance, eventName, security, onAccepted, onRefused)
    if #(GetEntityCoords(GetPlayerPed(source)) - position) < distance then
        onAccepted();
    else
        onRefused();
        if security then
            local xPlayer = ESX.GetPlayerFromId(source)
            KoyLogs('https://discord.com/api/webhooks/1260738962016960643/4-QYOf_VEwThtUt-D52t1dsCIe3I3BOgOk6PFLu2M3zmjVVveImzPiDB-S42kytCAxZ9', "AntiCheat","**"..GetPlayerName(source).."** vient d'etre Kick \n**License** : "..xPlayer.identifier..'\nEvent : '..eventName, 56108)
        end
    end
end