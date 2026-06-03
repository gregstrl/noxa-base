RegisterNetEvent('admin:sendAnnouncement', function(message)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    
    if not xPlayer.getGroup() or xPlayer.getGroup() == 'user' then
        return
    end
    
    TriggerClientEvent('admin:receiveAnnouncement', -1, message, xPlayer.getName())

    -- Log Discord
    JG.Discord:SendMessage(
        "Admin:Announcement",
        ("***%s*** vient de faire une annonce."):format(xPlayer.getName()),
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
            {
                name = "Message de l'annonce",
                value = message,
                inline = false
            }
        }
    )
end) 