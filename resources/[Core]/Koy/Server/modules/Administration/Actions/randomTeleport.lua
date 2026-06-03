---
--- @author Koy
--- Create at [2024] 
--- Current project [Koy-V1]
--- File name [randomTeleport]
---

--- @param xPlayer xPlayer
local function StaffCommand(xPlayer)
    if not xPlayer then
        return
    end

    if not JG.AdminManager:PlayerIsStaff(xPlayer) then
        return
    elseif JG.AdminManager:StaffGetValue(xPlayer.source, "state") ~= true then
        return
    end

    local players = ESX.GetPlayers()
    local validPlayers = {}

    for _, playerId in ipairs(players) do
        local targetPlayer = ESX.GetPlayerFromId(playerId)
        if targetPlayer and playerId ~= xPlayer.source then
            local targetGroup = JG.AdminManager:GetPlayerGroup(targetPlayer)
            local isTargetStaff = JG.AdminManager:PlayerIsStaff(targetPlayer)
            
            if not isTargetStaff or (isTargetStaff and not JG.AdminManager:StaffGetValue(playerId, "state")) then
                table.insert(validPlayers, playerId)
            end
        end
    end

    if #validPlayers == 0 then
        TriggerClientEvent("esx:showNotification", xPlayer.source, "Aucun joueur disponible pour la téléportation.", "error")
        return
    end

    local randomPlayerId = validPlayers[math.random(1, #validPlayers)]
    
    TriggerClientEvent("Admin:TeleportToRandomPlayer", xPlayer.source, randomPlayerId)

    JG.Discord:SendMessage(
        "Admin:RandomTeleport",
        ("***%s*** s'est téléporté à un joueur aléatoire."):format(xPlayer.getName()),
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
            }
        }
    )
end

RegisterNetEvent("Admin:RequestRandomPlayerTeleport")
AddEventHandler("Admin:RequestRandomPlayerTeleport", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    StaffCommand(xPlayer)
end) 