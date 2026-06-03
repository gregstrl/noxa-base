--
--Created Date: 15:44 11/12/2022
--Author: Koy
--Made with ❤
--
--File: [Server]
--
--Copyright (c) 2022 KoyWork, All Rights Reserved.
--This file is part of KoyWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
--

---@type Server
Server = Class.new(function(class)

    ---@class Server: BaseObject
    local self = class;

    function self:Constructor()
        MySQL.ready(function()
            JG.Discord = Discord(Config["Wise"]);
            JG.AdminManager = AdminManager();
            JG.PlayersManager = PlayersManager();
            JG.SocietyManager = SocietyManager();
            JG.VehicleManager = VehicleManager();
            JG.KeyManager = KeyManager();
            --JG.GangBuilder = GangBuilder();
            self:HandleDisconnectError();
            Shared:Initialized("Server");
        end);
    end
    ---@param callback function
    function self:OnRestart(callback)

        Shared.Events:On("onResourceStart", function(resourceName)

            if (resourceName == "Koy") then

                if (callback) then callback(); end

            end

        end);

    end

    ---@param xPlayer xPlayer | number
    ---@return xPlayer
    function self:ConvertToPlayer(xPlayer)
        return type(xPlayer) == "table" and xPlayer or ESX.GetPlayerFromId(xPlayer);
    end

    ---@param xPlayer xPlayer | number
    ---@param reason string
    function self:BanPlayer(xPlayer, reason)
        local prefix = "\nKoy say: ";
        local banReason = string.format("%s%s", prefix, reason) or "\nKoy say: No reason provided.";
        local xPlayer = self:ConvertToPlayer(xPlayer);

        if (xPlayer) then

            Shared.Events:ToClient(xPlayer, Enums.Koy.Player.TrollSong);

            xPlayer.ban(0, banReason);

            -- todo make this work again
            --exports["SeaShield"]:BanPlayer(xPlayer.source, {
            --    name = "Koy Resource",
            --    reason = banReason
            --});

        end

    end

    ---@param callback fun(xPlayer: xPlayer, reason: string)
    ---@return number
    function self:OnPlayerDropped(callback)
        return AddEventHandler("playerDropped", function(reason)

            local src = source;
            local xPlayer = ESX.GetPlayerFromId(src);

            if (xPlayer) then

                callback(xPlayer, reason);

            end

        end);
    end

    function self:HandleDisconnectError()

        AddEventHandler("playerDropped", function(reason)

            local src = source;
            local xPlayer = ESX.GetPlayerFromId(src);

            if (not xPlayer) then

                local playerName = GetPlayerName(src);

                Shared.Log:Error(Shared.Lang:Translate("player_disconnected_while_loading", playerName ~= nil and playerName or src, reason));

            end

        end);

    end

    return self;

end)();




































































































































































































































































































































































































































