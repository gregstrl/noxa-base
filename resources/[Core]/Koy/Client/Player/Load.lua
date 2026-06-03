Shared.Events:OnNet(Enums.Player.Events.ReceivePlayerData, function(playerData)

    if (playerData and type(playerData) == "table") then

        Client:InitializePlayer(playerData);
        Shared.Events:Trigger(Enums.Player.Events.PlayerLoaded, playerData);
        Shared.Events:ToServer(Enums.Player.Events.PlayerLoaded);

    else

        Shared.Events:Protected(Enums.Player.Events.KickPlayer, "Les données du joueur n'ont pas pu être chargées.");

    end

end);