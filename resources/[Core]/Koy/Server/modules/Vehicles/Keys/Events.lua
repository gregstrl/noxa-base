---@param xPlayer xPlayer
---@param callback fun(result: table)
local function GetPlayerKeys(xPlayer, callback)
    MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @identifier", { 
        ["@identifier"] = xPlayer.identifier;
    }, function(result)
        if (#result > 0) then
            for i = 1, #result do
                local plate = Shared.Vehicle:ConvertPlate(result[i].plate);
                if (not JG.KeyManager:GetKey("vehicle", plate)) then
                    JG.KeyManager:AddKey(xPlayer, VehicleKey, plate, "vehicle");
                end
            end
            if (callback) then callback(result) end
        end
    end);
end

Shared.Events:OnNet(Enums.VehicleKeys.Events.RequestAllPlayerKeys, function(xPlayer)
    local keys = {}
    local ServerKeys = JG.KeyManager:GetKeysByType("vehicle");
    for _, key in pairs(ServerKeys) do
        if (key:GetOwner() == xPlayer.getIdentifier()) then
            keys[#keys + 1] = key;
        end
    end
    Shared.Events:ToClient(xPlayer, Enums.VehicleKeys.Events.ReceiveAllPlayerKeys, keys);
end);

Shared.Events:OnProtectedNet(Enums.VehicleKeys.Events.RequestPlayerKey, function(xPlayer, vehicleKeyId)
    local key = JG.KeyManager:GetKey("vehicle", Shared.Vehicle:ConvertPlate(vehicleKeyId));
    Shared.Events:ToClient(xPlayer, Enums.VehicleKeys.Events.GetPlayerKey, (key ~= nil and key:GetOwner() == xPlayer.getIdentifier()) or false);
end);

Shared.Events:OnNet(Enums.Player.Events.PlayerLoaded, function(xPlayer)
    GetPlayerKeys(xPlayer);
end);

Shared.Events:OnNet(Enums.VehicleKeys.Events.GiveToPlayer, function(xPlayer, targetId, vehicleKeyId)
    if (xPlayer) then
        local xTarget = ESX.GetPlayerFromId(targetId);
        if (xTarget) then
            local key = JG.KeyManager:GetKey("vehicle", Shared.Vehicle:ConvertPlate(vehicleKeyId));
            if (key) then
                xPlayer.showNotification(Shared.Lang:Translate("keys_vehicle_player_hasgive", vehicleKeyId, xTarget.getName()));
                key:SetOwner(xTarget);
                Shared.Events:ToClient(xPlayer, Enums.VehicleKeys.Events.UpdateKeys);
                xTarget.showNotification(Shared.Lang:Translate("keys_vehicle_player_hastake", vehicleKeyId, xPlayer.getName()));
            end
        end
    end
end);

-- Fonction pour gérer la déconnexion d'un joueur qui possède des clés
local function handlePlayerKeysOnDrop(xPlayer)
    local keys = JG.KeyManager:GetKeysByType("vehicle");
    for plate, key in pairs(keys) do
        if (key) then
            if (key:GetOwner() == xPlayer.getIdentifier()) then
                if (key:GetDefaultOwner() ~= xPlayer.getIdentifier()) then
                    local xTarget = ESX.GetPlayerFromIdentifier(key:GetDefaultOwner());
                    if (xTarget) then
                        key:SetOwner(xTarget);
                        xTarget.showNotification(Shared.Lang:Translate("keys_vehicle_player_givebak", key:GetId(), xPlayer.getName()));
                    else
                        JG.KeyManager:RemoveKey("vehicle", plate);
                    end
                else
                    JG.KeyManager:RemoveKey("vehicle", plate);
                end
            end
        end
    end
end

-- Vérifier si Server est disponible et ajouter le handler en conséquence
if Server then
    Server:OnPlayerDropped(function(xPlayer)
        handlePlayerKeysOnDrop(xPlayer);
    end);
else
    -- Fallback pour gérer l'événement directement si Server n'est pas disponible
    AddEventHandler("playerDropped", function(reason)
        local xPlayer = ESX and ESX.GetPlayerFromId(source);
        if xPlayer then
            handlePlayerKeysOnDrop(xPlayer);
    end
end);
    print("^3[AVERTISSEMENT] Server n'est pas disponible pour handlePlayerKeysOnDrop, utilisant fallback^7");
end

Shared.Events:OnNet(Enums.VehicleKeys.Events.LockVehicle, function(xPlayer, plate)

    local vehicle = JG.VehicleManager:GetVehicleByPlate(plate);

    if (vehicle) then
        local key = JG.KeyManager:GetKey("vehicle", plate);
        if (key and key:GetOwner() == xPlayer.getIdentifier()) then
            vehicle:SetLocked(true);
        end
    end

end);

Shared.Events:OnNet(Enums.VehicleKeys.Events.UnlockVehicle, function(xPlayer, plate)

    local vehicle = JG.VehicleManager:GetVehicleByPlate(plate);

    if (vehicle) then
        local key = JG.KeyManager:GetKey("vehicle", plate);
        if (key and key:GetOwner() == xPlayer.getIdentifier()) then
            vehicle:SetLocked(false);
        end
    end

end);