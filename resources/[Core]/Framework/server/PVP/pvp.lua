--[[
----
----Created Date: 6:34 Tuesday March 14th 2023
----Author: Koy
----Made with ❤
----
----File: [pvp]
----
----Copyright (c) 2023 KoyWork, All Rights Reserved.
----This file is part of KoyWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

local _SetPlayerRoutingBucket = SetPlayerRoutingBucket;
local pvpPlayers = {};
local vehicles = {};

---@param message string
local function SendPVPJoinLeaveMessage(playerId, message)

    local player = ESX.GetPlayerFromId(playerId);

    if (player) then

        for k, v in pairs(pvpPlayers) do

            if (type(v) == "table" and v.source ~= player.source) then
                
                local target = ESX.GetPlayerFromId(v.source);
                target.showNotification((message):format(player.name));
    
            end
    
        end

    end
    
end

---@return number[]
function ESX.GetPlayersInPVPMode()
    return pvpPlayers;
end

---@param playerIdentitifier string
---@return table | nil
function ESX.GetPlayerInPVPMode(playerIdentitifier)
    return pvpPlayers[playerIdentitifier];
end

---@param player xPlayer
local function OnExitPVPMode(player)

    if (vehicles[player.identifier]) then
        ESX.RemoveVehicle(vehicles[player.identifier]);
    end

    player.removeAllWeapons(function()

        player.setLastPosition(pvpPlayers[player.identifier].coords);
        player.addWeaponArray(pvpPlayers[player.identifier].loadout, function()
            player.setAmmoData(pvpPlayers[player.identifier].ammo);
        end, false);

        pvpPlayers[player.identifier] = nil;

        SendPVPJoinLeaveMessage(player.source, "~s~%s~s~ viens de ~y~quitter~s~ le combat.");

    end, false);

end

---@param player xPlayer
local function setPlayerPVPMode(player)

    if (pvpPlayers[player.identifier] and type(pvpPlayers[player.identifier]) == "table") then
        player.triggerEvent("Koy:rezu:updatePVPMode", false);
    else
        player.triggerEvent("Koy:rezu:updatePVPMode", true);
    end

end

RegisterNetEvent("Koy:rezu:playerSwitchPVPMode", function()

    local _src = source;
    local player = ESX.GetPlayerFromId(_src);

    if (player) then

        if (pvpPlayers[player.identifier] and type(pvpPlayers[player.identifier]) == "table") then

            OnExitPVPMode(player);
            _SetPlayerRoutingBucket(player.source, 0);
            player.showNotification('~s~wise: ~s~"Mode PVP ~y~désactiver~s~."');
            
        else

            pvpPlayers[player.identifier] = { 
            
                source = player.source,
                ammo = ESX.Table.Clone(player.GetAmmo()),
                loadout = ESX.Table.Clone(player.getLoadout()),
                source = player.source,
                coords = GetEntityCoords(GetPlayerPed(player.source))
    
            };

            player.removeAllWeapons(function()
                player.addWeaponArray({
                    
                    --{name = "WEAPON_MINISMG"},
                    --{name = "WEAPON_PISTOL"},
                    {name = "WEAPON_SPECIALCARBINE_MK2"},
                    {name = "WEAPON_GLOCK17"},
                    {name = "WEAPON_HEAVYSNIPER"},
                    {name = "WEAPON_PUMPSHOTGUN"},
                    {name = "WEAPON_SMG_MK2"},
                    {name = "WEAPON_A15RC"},
                    {name = "WEAPON_IAR"},
                    {name = "WEAPON_M133"},
                    {name = "WEAPON_JRBAK"},
                    {name = "WEAPON_FAMASU1"},
                    {name = "WEAPON_UMP45"},
                    {name = "WEAPON_UZI"},

                }, nil, true);
            end, false);
            
            _SetPlayerRoutingBucket(player.source, 666666666);
            player.showNotification('~s~wise: ~s~"Mode PVP ~y~activer~s~."');
            SendPVPJoinLeaveMessage(player.source, "~s~%s~s~ viens de ~y~rejoindre~s~ le combat.");

        end

    end
end);

function RegisterPVPCommands()

    exports["Koy"]:RegisterCommand("pvp", function(xPlayer)

        if (xPlayer == nil) then
            return
        end

        setPlayerPVPMode(xPlayer)

    end, {
        help = "Activer/Désactiver le mode PVP"
    }, {
        group = "founder"
    })

    local timers = {};
    exports["Koy"]:RegisterCommand("pvpv", function(xPlayer)

        local player = xPlayer;

        if (player) then

            if (ESX.GetPlayerInPVPMode(player.identifier)) then

                local ped = GetPlayerPed(player.source);
                local coords = GetEntityCoords(ped);
                local heading = GetEntityHeading(ped);
                local health = GetEntityHealth(ped);
                local maxHealth = GetEntityMaxHealth(ped);

                if (GetVehiclePedIsIn(ped) == 0) then

                    if (not timers[player.identifier] or GetGameTimer() - timers[player.identifier] >= 5000) then

                        timers[player.identifier] = GetGameTimer();
                        if (maxHealth /100 >= health) then return player.showNotification("Vous devez être vivant pour faire apparaitre un véhicule."); end

                        ESX.SpawnVehicle("sentinel3", coords, heading, nil, false, nil, function(handle)

                            if (vehicles[player.identifier]) then
                                ESX.RemoveVehicle(vehicles[player.identifier]);
                            end

                            SetPedIntoVehicle(ped, handle, -1);
                            vehicles[player.identifier] = GetVehicleNumberPlateText(handle);

                        end);
                    else
                        player.showNotification("Vous ne pouvez pas faire ceci pour le moment.");
                    end

                end

            else

                player.showNotification("Vous devez être en ~y~zone de combat~s~ pour faire ceci.");

            end

        end

    end, {
        help = "Faire apparaitre un véhicule pour le combat"
    })

end

RegisterNetEvent("Koy:rezu:togglePVPMode", function()
    
    local src = source;
    local player = ESX.GetPlayerFromId(src);

    if (player) then

        if (not pvpPlayers[player.identifier]) then
            
            if (#(vector3(-263.2191, -904.0076, 32.31) - GetEntityCoords(GetPlayerPed(player.source))) > 5) then

                player.ban(0, "Koy:rezu:togglePVPMode");
                return;

            end

        end

        local account = player.getAccount("cash");

        if (account) then

            if (pvpPlayers[player.identifier] ~= nil) then
                setPlayerPVPMode(player);
            else
                setPlayerPVPMode(player);
            end

        end

    end

end);

AddEventHandler("esx:playerDropped", function(src)
    
    local player = ESX.GetPlayerFromId(src);

    if (player) then

        if (pvpPlayers[player.identifier] and type(pvpPlayers[player.identifier]) == "table") then

            OnExitPVPMode(player);

        end

    end

end);