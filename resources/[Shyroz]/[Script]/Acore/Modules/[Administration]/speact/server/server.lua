RegisterServerEvent("spectate:request")
AddEventHandler("spectate:request", function(targetId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.getGroup() ~= "user" then
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        if targetPlayer then
            local targetCoords = GetEntityCoords(GetPlayerPed(targetId))
            TriggerClientEvent("spectate:start", src, targetId, targetCoords)
        else
            TriggerClientEvent("esx:showNotification", src, "❌ Joueur introuvable !")
        end
    end
end)
