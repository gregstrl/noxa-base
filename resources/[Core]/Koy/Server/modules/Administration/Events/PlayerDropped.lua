---
--- @author Kadir#6666
--- Create at [30/05/2023] 19:07:23
--- Current project [Koy-V1]
--- File name [PlayerDropped]
---

---@param xPlayer xPlayer
---@param drop_reason string
local function onDrop(xPlayer, drop_reason)

    if (not xPlayer) then
        return
    end

    drop_reason = tostring(drop_reason)

    Shared.Events:Broadcast(Enums.Administration.Client.PlayerDropped, player_character, player_name, player_coords, drop_reason_formatted)
    JG.Discord:SendMessage(
            "Admin:PlayerDropped",
            ("***%s*** vient de quitter le serveur."):format(player_name),
            {

                {
                    name = "Nom du JOUEUR",
                    value = xPlayer.getIdentifier(),
                    inline = true
                },

                {
                    name = "Raison de la déconnexion",
                    value = drop_reason,
                    inline = true
                }

            }
    );

end

if Server then
    Server:OnPlayerDropped(function(xPlayer, reason)
        return onDrop(xPlayer, reason)
    end);
else
    AddEventHandler("playerDropped", function(reason)
        local xPlayer = ESX and ESX.GetPlayerFromId(source);
        if xPlayer then
            onDrop(xPlayer, reason);
        end
    end);
    print("^3[AVERTISSEMENT] Server n'est pas disponible pour PlayerDropped, utilisant fallback^7");
end
