---@param vehicle number
---@return number
local function getDoorsStatus(vehicle)
    return GetVehicleDoorLockStatus(vehicle)
end

---@return boolean
local function playerIsInVehicle()
    return IsPedInAnyVehicle(Client.Player:GetPed())
end

---@return number, boolean
local function getVehicleAndPlayer()
    if playerIsInVehicle() then
        return GetVehiclePedIsIn(Client.Player:GetPed()), true
    end

    local vehicle, distance = Game.Vehicle:GetClosest(Client.Player:GetCoords())
    return (distance ~= -1 and distance < 5) and vehicle or nil, distance ~= -1 and distance < 5
end

-- Fonction pour effectuer l'animation de la clé du véhicule
local function keyAnimation(vehicle)
    local plyPed = Client.Player:GetPed()

    -- Demander le dictionnaire d'animations
    Game.Streaming:RequestAnimDict("anim@mp_player_intmenu@key_fob@", function()
        Game.Object:Spawn(GetHashKey("p_car_keys_01"), vector3(0.0, 0.0, 0.0), function(object)
            SetEntityCollision(object, false, false)
            AttachEntityToEntity(object, plyPed, GetPedBoneIndex(plyPed, 57005), 0.09, 0.03, -0.02, -76.0, 13.0, 28.0, false, true, true, true, 0, true)

            SetCurrentPedWeapon(plyPed, GetHashKey("WEAPON_UNARMED"), true)
            ClearPedTasks(plyPed)
            TaskTurnPedToFaceEntity(plyPed, vehicle, 500)
            TaskPlayAnim(plyPed, "anim@mp_player_intmenu@key_fob@", "fob_click", 3.0, 3.0, 1000, 16)
            RemoveAnimDict("anim@mp_player_intmenu@key_fob@")
            PlaySoundFromEntity(-1, "Remote_Control_Fob", vehicle, "PI_Menu_Sounds", true, 0)
            Wait(1250)

            DetachEntity(object, false, false)
            DeleteObject(object)
        end)
    end)
end

-- Fonction pour jouer l'animation de fermeture et d'ouverture des portes
local function doorAnimation(vehicle, isLocking)
    local plyPed = Client.Player:GetPed()

    -- Demander le dictionnaire d'animations
    Game.Streaming:RequestAnimDict("anim@mp_player_intmenu@key_fob@", function()
        local animation = isLocking and "fob_click" or "fob_click"  -- Vous pouvez personnaliser selon les besoins

        -- Jouer l'animation d'ouverture ou de fermeture
        TaskPlayAnim(plyPed, "anim@mp_player_intmenu@key_fob@", animation, 3.0, 3.0, 1000, 49, 0, false, false, false)
        RemoveAnimDict("anim@mp_player_intmenu@key_fob@")
    end)
end

-- Fonction pour faire clignoter les phares du véhicule
local function flashVehicleLights(vehicle)
    SetVehicleLights(vehicle, 2)  -- Phare allumé
    Wait(500)
    SetVehicleLights(vehicle, 0)  -- Phare éteint
end

-- Fonction de gestion du changement de statut du verrouillage des portes
local function changeLockStatus(vehicle)
    local locked = getDoorsStatus(vehicle)

    -- Si déjà dans l'état souhaité, ne rien faire
    if (locked == 1 or locked == 0) then
        -- Véhicule verrouillé
        if locked == 1 then
            SetVehicleDoorsLocked(vehicle, 2)
            doorAnimation(vehicle, true)  -- Animation de fermeture
            Shared.Events:ToServer(Enums.VehicleKeys.Events.LockVehicle, GetVehicleNumberPlateText(vehicle))
            PlayVehicleDoorCloseSound(vehicle, 1)
            ESX.ShowNotification("Vous avez ~r~verrouiller~s~ votre véhicule")
            flashVehicleLights(vehicle)  -- Clignotement des phares
        end
    elseif locked == 2 then
        -- Véhicule déverrouillé
        SetVehicleDoorsLocked(vehicle, 1)
        doorAnimation(vehicle, false)  -- Animation d'ouverture
        Shared.Events:ToServer(Enums.VehicleKeys.Events.UnlockVehicle, GetVehicleNumberPlateText(vehicle))
        PlayVehicleDoorOpenSound(vehicle, 0)
        ESX.ShowNotification("Vous avez ~g~déverrouiller~s~ votre véhicule")
        flashVehicleLights(vehicle)  -- Clignotement des phares
    end
end

-- Événement lorsque le joueur reçoit une clé de véhicule
Shared.Events:OnNet(Enums.VehicleKeys.Events.GetPlayerKey, function(hasKey)
    if hasKey then
        local vehicle, inveh = getVehicleAndPlayer()
        if vehicle and not inveh then
            keyAnimation(vehicle)
        end
        changeLockStatus(vehicle)
    else
        Game.Notification:ShowAdvanced(
            Config["ServerName"] or "Kays Script",
            Shared.Lang:Translate("vehicle_key_notification_header"),
            Shared.Lang:Translate("key_vehicle_no_key"),
            Config["AdvancedNotification"]["VehicleKeys"]["TextureName"],
            Config["AdvancedNotification"]["VehicleKeys"]["IconType"],
            Config["AdvancedNotification"]["VehicleKeys"]["flash"],
            Config["AdvancedNotification"]["VehicleKeys"]["SaveToBrief"],
            Config["AdvancedNotification"]["VehicleKeys"]["HudColorIndex"]
        )
    end
end)

-- Réception des clés de véhicule
Shared.Events:OnNet(Enums.VehicleKeys.Events.ReceiveAllPlayerKeys, function(keys)
    Client.Player:SetValue("VehicleKeys", keys)
end)

-- Mappage de la touche pour ouvrir le véhicule
Shared:RegisterKeyMapping("Koy:Keys:Use", { label = "key_open_vehicle" }, "U", function()
    local vehicle, inveh = getVehicleAndPlayer()
    if vehicle then
        Shared.Events:Protected(Enums.VehicleKeys.Events.RequestPlayerKey, GetVehicleNumberPlateText(vehicle))
    else
        Game.Notification:ShowSimple(Shared.Lang:Translate("no_vehicle_found"))
    end
end)
