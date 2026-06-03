Shared.Events:OnNet(Enums.Administration.Server.StaffChangeState, function(xPlayer, currentState)

    if (xPlayer == nil) then
        return
    end

    if (not JG.AdminManager:PlayerIsStaff(xPlayer)) then
        return
    end

    local player_ped = GetPlayerPed(xPlayer.source)
    if (currentState == true and not JG.AdminManager:GroupHasPermission(xPlayer.getGroup(), "player_use_personnal_ped")) then
        xPlayer.triggerEvent(Enums.Player.Events.LoadSkin, GetEntityModel(player_ped) == GetHashKey("mp_m_freemode_01") and "s_m_y_mime" or "s_m_y_mime")
    else
        xPlayer.triggerEvent(Enums.Player.Events.LoadSkin, "default")
    end

    JG.AdminManager:StaffSetValue(xPlayer.source, "state", currentState)
    JG.Discord:SendMessage(
            "Admin:StaffMode",
            ("***%s*** vient de ___%s___ son service."):format(xPlayer.getName(), (currentState == true and "prendre" or "quitter")),
            {

                {
                    name = "Identifiant du STAFF",
                    value = xPlayer.getIdentifier(),
                    inline = true
                },
                {
                    name = "ID session du STAFF",
                    value = xPlayer.source,
                    inline = true
                },
                {
                    name = "Pseudo du STAFF",
                    value = xPlayer.getName(),
                    inline = true
                },

            }
    );

    JG.AdminManager:StaffActionForAll(function(staff_player_source)

        TriggerClientEvent("esx:showNotification", staff_player_source, ("Le staff (~g~%s~s~ - ~g~%s~s~) vient de %s son service."):format(xPlayer.source, xPlayer.getName(), currentState == true and "prendre" or "quitter"))

    end, true)

end);

RegisterServerEvent('staff:sendRadiusMessage')
AddEventHandler('staff:sendRadiusMessage', function(radius, message)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer or not JG.AdminManager:PlayerIsStaff(xPlayer) then
        return TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas la permission d'utiliser cette commande")
    end

    local playerCoords = GetEntityCoords(GetPlayerPed(source))
    local players = ESX.GetPlayers()

    for _, playerId in ipairs(players) do
        local targetCoords = GetEntityCoords(GetPlayerPed(playerId))
        local distance = #(playerCoords - targetCoords)
        
        if distance <= radius then
            TriggerClientEvent('esx:showNotification', playerId, "~s~Message Staff~s~ : " .. message)
        end
    end

    JG.Discord:SendMessage(
        "Admin:StaffMessage",
        ("***%s*** a envoyé un message staff"):format(xPlayer.getName()),
        {
            {
                name = "Staff",
                value = xPlayer.getName(),
                inline = true
            },
            {
                name = "Message",
                value = message,
                inline = true
            },
            {
                name = "Rayon",
                value = radius .. " mètres",
                inline = true
            }
        }
    )
end)