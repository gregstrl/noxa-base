ESX = exports["Framework"]:getSharedObject()

local damaged_timer = Config.TimeToRespawn * 6;
local timer = Config.TimeToRespawn;
local gotpressed = false;
local noptmort = false;
local damaged_revive = false;
local UNARMED = GetHashKey("WEAPON_UNARMED");
local player_id = PlayerId();
local killerId = nil;
local deathCause = nil;
local ambulanceCooldownTimer = 0;

local debug = false;
local _print = print;
local print = function(...) if debug then _print(...); end end

local hurt = false;
local IsInPVP = false;

local isDead = false
local canRespawn = false

local isCurrentlyDead = false

local function encodeJson(obj)
    if type(obj) ~= 'table' then
        if type(obj) == 'string' then return '"' .. obj .. '"' end
        return tostring(obj)
    end
    
    local result = '{'
    for k, v in pairs(obj) do
        if result ~= '{' then result = result .. ',' end
        if type(k) ~= 'number' then k = '"' .. k .. '"' end
        result = result .. k .. ':' .. encodeJson(v)
    end
    return result .. '}'
end

local json = {
    encode = encodeJson
}

local function SetDeathEffect()
    SetTimecycleModifier("hud_def_desat_cold")
    SetTimecycleModifierStrength(1.0)
    SetExtraTimecycleModifier("hud_def_blur")
    SetExtraTimecycleModifierStrength(0.5)
    SetPedMotionBlur(PlayerPedId(), true)
end

local function ResetDeathEffect()
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
    SetTimecycleModifierStrength(0.0)
    SetExtraTimecycleModifierStrength(0.0)
    SetPedMotionBlur(PlayerPedId(), false)
end

AddEventHandler("Oziris:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

---@param ped number
function setHurt(ped)
    if (hurt) then return; end
    hurt = true;

    CreateThread(function()
        local anim_set = "move_m@injured";
        RequestAnimSet(anim_set);

        while not HasAnimSetLoaded(anim_set) do
            print('>>REQUESTING ANIM SET');
            Wait(0);
        end

        print('>>ANIM SET APPLIED');
        SetPedMovementClipset(ped, anim_set, true);
        ESX.ShowNotification("Vous êtes blessé, vous devais voir un médecin rapidement")
    end);
end

---@param ped number
function setNotHurt(ped)
    if (not hurt) then return; end
    hurt = false;
    print('>>ANIM SET REMOVED');
    ResetPedMovementClipset(ped);
    ResetPedWeaponMovementClipset(ped);
    ResetPedStrafeClipset(ped);
    ClearTimecycleModifier();
    SetTimecycleModifierStrength(0.0);
end

CreateThread(function()
    local playerPed = PlayerPedId()
    local playerId = PlayerId()
    SetPlayerHealthRechargeLimit(playerId, 0.0)
    SetPlayerHealthRechargeMultiplier(playerId, 0.0)
    print('>>HEALTH RECHARGE DISABLED')

    while true do
        local ped = playerPed

        if DoesEntityExist(ped) and not IsPedFatallyInjured(ped) then
            local max_health = GetPedMaxHealth(ped)
            local health = GetEntityHealth(ped)
            local ratio = (max_health == 200) and 110 or (max_health / 100 * 10)

            print(('>>CHECKING HEALTH HP(^2%s^7/^2%s^0) | IS_HURT: %s | IS_IN_PVP: %s | TIMECYCLE: ^6%s^0'):format(health, max_health, hurt and '^2YES^0' or '^1NO^0', IsInPVP and '^2YES^0' or '^1NO^0', GetTimecycleModifierIndex()))

            if not hurt and health <= ratio and not IsInPVP then
                print('>>SETTING HURT')
                setHurt(ped)
            elseif hurt and health > ratio and not IsInPVP then
                print('>>SETTING NOT HURT')
                setNotHurt(ped)
            end

            if hurt then
                print('>>CHECKING HEALTH RECHARGE')
                SetPlayerHealthRechargeLimit(playerId, 0.0)
                SetPlayerHealthRechargeMultiplier(playerId, 0.0)
                print('>>CHECKING PED TASKS')

                if IsInPVP then
                    print('>>PED IS IN PVP')
                    setNotHurt(ped)
                end
            end
        else
            print('>>PED IS DEAD WAITING FOR RESPAWN')
        end

        Wait(100)
    end
end)

CreateThread(function()
    while true do
        if (hurt) then
            local random = math.random(6, 9);
            local strength = random / 10;
            SetTimecycleModifierStrength(strength);
        end
        Wait(1000);
    end
end);

RegisterNetEvent("Oziris:ReceiveDeathStatus", function(isDead, killer, cause)
    if (isDead) then
        killerId = killer
        deathCause = cause
        ShowDeathUI();
    else
        killerId = nil
        deathCause = nil
        HideDeathUI();
    end
end);

RegisterNetEvent("esx:playerLoaded", function(xPlayer)
    ESX.PlayerLoaded = true;
    ESX.PlayerData = xPlayer;
end);

local eventHandler;
eventHandler = AddEventHandler("Oziris:playerShouldDie", function(killer, cause)
    RemoveEventHandler(eventHandler);

    if (ESX.PlayerData.isDead) then
        SetTimeout(2000, function()
            local ped = PlayerPedId();
            SetEntityHealth(ped, 0);
            SetEntityMaxHealth(ped, 200);
            SetPedDiesInWater(ped, false);
            SetPedDiesWhenInjured(ped, false);
            SetEntityInvincible(ped, true);
            SetPedToRagdoll(ped, 10000, 10000, 0, 0, 0, 0);
            
            killerId = killer
            deathCause = cause
            ESX.ShowNotification('Vous avez été mis dans le coma de force, car vous avez quitté le serveur en étant coma...');
            ShowDeathUI();
        end);
    end

    if (ESX.PlayerData.isHurt) then
        local ped = PlayerPedId();
        local max_health = GetPedMaxHealth(ped);
        local max_health_percent = max_health == 200 and 110 or max_health / 100 * 10;
        SetEntityHealth(ped, max_health_percent);
    end
end);

function ShowDeathUI()
    isCurrentlyDead = true
    _print("^2[MORT] Affichage de l'UI de mort^7")
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "show",
        timer = timer,
        canRespawn = noptmort,
        gotpressed = gotpressed,
        killerId = killerId,
        deathCause = deathCause
    })
    SetDeathEffect()
end

function HideDeathUI()
    isCurrentlyDead = false
    _print("^2[MORT] Fermeture de l'UI de mort^7")
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "hide"
    })
    ResetDeathEffect()
end

RegisterNUICallback('reappear', function(data, cb)
    _print("^2[MORT] Callback reappear^7")
    SetEntityCoords(PlayerPedId(), Config.RespawningPlace)
    TriggerServerEvent('réanimerafterdie')
    TriggerServerEvent('ambulance:clearSignal')
    Wait(1000)
    gotpressed = false
    noptmort = false
    isCurrentlyDead = false
    ResetDeathEffect()
    cb('ok')
end)

RegisterNUICallback('ambulance', function(data, cb)
    if not gotpressed then
        local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(), true))
        TriggerServerEvent('ambulance:sendsignal', x, y, z)
        gotpressed = true
        ambulanceCooldownTimer = 300
        SendNUIMessage({
            type = 'update',
            canRespawn = noptmort,
            gotpressed = gotpressed,
            timer = timer,
            ambulanceCooldown = ambulanceCooldownTimer
        })
    end
    cb('ok')
end)

RegisterNUICallback('report', function(data, cb)
    if data.message then
        ExecuteCommand('report ' .. data.message)
    end
    cb('ok')
end)

CreateThread(function()
    while true do
        if IsNuiFocused() then
            timer = timer - 1
            damaged_timer = damaged_timer - 1

            if timer <= 0 then
                timer = Config.TimeToRespawn
                noptmort = true
            end

            if damaged_timer <= 0 then
                damaged_timer = Config.TimeToRespawn * 2
                damaged_revive = true
            end

            SendNUIMessage({
                type = "update",
                timer = timer,
                canRespawn = noptmort,
                damaged_timer = damaged_timer,
                damaged_revive = damaged_revive
            })
        end
        Wait(1000)
    end
end)

CreateThread(function()
    while true do
        if gotpressed and ambulanceCooldownTimer > 0 then
            ambulanceCooldownTimer = ambulanceCooldownTimer - 1
            SendNUIMessage({
                type = 'update',
                canRespawn = noptmort,
                gotpressed = gotpressed,
                timer = timer,
                ambulanceCooldown = ambulanceCooldownTimer
            })
            if ambulanceCooldownTimer <= 0 then
                gotpressed = false
                SendNUIMessage({
                    type = 'update',
                    canRespawn = noptmort,
                    gotpressed = gotpressed,
                    timer = timer,
                    ambulanceCooldown = 0
                })
            end
        end
        Wait(1000)
    end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
    timer = Config.TimeToRespawn
    damaged_timer = Config.TimeToRespawn * 6
    gotpressed = false
    noptmort = false
    damaged_revive = false
    
    
    local killerServerId = nil
    local deathReason = nil
    
    if data then
        _print("donnes : " .. json.encode(data))
    else
        data = {}
    end
    
    if data.killerServerId then
        killerServerId = data.killerServerId
        _print("Tueur détecté : " .. tostring(killerServerId))
    end
    
    if data.deathCause then
        local causes = {
            [0] = "Cause inconnue",
            [741814745] = "Explosion",
            [615608432] = "Brûlure",
            [-10959621] = "Noyade",
            [-1600701090] = "Asphyxie",
            [-842959696] = "Chute"
        }
        
        if data.deathCause == -842959696 or data.deathCause == 7 then
            deathReason = "Chute"
        else
            deathReason = causes[data.deathCause] or "Cause inconnue"
        end
    end
    
    if killerServerId then
        if exports and exports['Gamemode'] then
            local killerUID = exports['Gamemode']:UIDClient1(killerServerId)
            killerId = killerUID
        else
            killerId = killerServerId
        end
        
        TriggerServerEvent('mort:notifyKiller', killerServerId)
    else
        killerId = nil
    end
    
    deathCause = deathReason
    
    TriggerServerEvent('mort:playerDied', killerServerId, data.deathCause, deathReason)
    
    ShowDeathUI()
end)

RegisterNetEvent('ambulance:reviveAfterDie')
AddEventHandler('ambulance:reviveAfterDie', function()
    TriggerServerEvent('ambulance:clearSignal')
    gotpressed = false
    noptmort = false
    damaged_revive = false
    HideDeathUI()
end)

RegisterNetEvent('ambulance:updateCooldown')
AddEventHandler('ambulance:updateCooldown', function(cooldownState)
    gotpressed = cooldownState
    if isDead then
        SendNUIMessage({
            type = 'update',
            canRespawn = noptmort,
            gotpressed = gotpressed,
            timer = timer
        })
    end
end)

exports('IsHurt', function()
    return hurt;
end);

CreateThread(function()
    while true do
        Wait(1000)
        local isDead = IsPlayerDead(PlayerId())
        
        if not isDead and isCurrentlyDead then
            if not IsNuiFocused() then
            else
                HideDeathUI()
                TriggerServerEvent('mort:fixDeathState')
            end
        end
        
        if isDead and not isCurrentlyDead and not ESX.PlayerData.isDead then
        end
    end
end)

CreateThread(function()
    while true do
        Wait(500)
        if isCurrentlyDead and IsNuiFocused() then
            SendNUIMessage({
                type = "update",
                timer = timer,
                canRespawn = noptmort,
                gotpressed = gotpressed,
                deathCause = deathCause,
                killerId = killerId
            })
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        if isCurrentlyDead then
            DisableAllControlActions(0)
            EnableControlAction(0, 245, true)
        end
    end
end) 