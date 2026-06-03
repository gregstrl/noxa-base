ESX = exports["Framework"]:getSharedObject()

local TimeoutAmbulance = {};
local waitingForRevive = {};
local playerKillers = {};
local ambulanceCooldown = {};
local deathCauses = {};

RegisterServerEvent('ambulance:sendsignal')
AddEventHandler('ambulance:sendsignal', function(x,y,z)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    if (xPlayer) then
        if (not TimeoutAmbulance[xPlayer.identifier] or GetGameTimer() - TimeoutAmbulance[xPlayer.identifier] > 300000) then
            TimeoutAmbulance[xPlayer.identifier] = GetGameTimer();
            ambulanceCooldown[xPlayer.identifier] = true;

            for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                if xPlayer.job.name == 'ambulance' then
                    TriggerClientEvent('isInServiceCheck', xPlayers[i], "+")
                    TriggerClientEvent('ambulance:signal', xPlayers[i], x,y,z)
                end
            end

            TriggerClientEvent('ambulance:updateCooldown', source, true)
        else
            xPlayer.showNotification("Vous devez attendre 5 minutes avant de pouvoir refaire un appel.");
        end
    end
end);

RegisterServerEvent('ambulance:sendAnnonce')
AddEventHandler('ambulance:sendAnnonce', function(args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        if xPlayer.job.name ~= "ambulance" then
            xPlayer.ban(0, '(ambulance:sendAnnonce)')
            return
        end

        if args == "+" then
            TriggerClientEvent('esx:showNotification', source, "[~o~Information~w~] Une ~g~personne~s~ à besoin d'aide !")
        elseif args == "-" then
            TriggerClientEvent('esx:showNotification', source, "[~o~Information~w~] Une demande vient d'être prise en ~o~charge~s~.")
        end
    end
end)

RegisterNetEvent('réanimerafterdie', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    
    if not waitingForRevive[xPlayer.identifier] then
        return
    end
    
    if (GetGameTimer() - waitingForRevive[xPlayer.identifier] >= 200) then
        xPlayer.onRevive(true)
        waitingForRevive[xPlayer.identifier] = nil
        playerKillers[xPlayer.identifier] = nil
        deathCauses[xPlayer.identifier] = nil
        TriggerClientEvent('ambulance:reviveAfterDie', source);
    end
end)

RegisterNetEvent('réanimerafterjesus', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (GetGameTimer() - waitingForRevive[xPlayer.identifier] >= 200) then
        waitingForRevive[xPlayer.identifier] = nil
        playerKillers[xPlayer.identifier] = nil
        TriggerClientEvent('ambulance:reviveAfterJesus', source);
    end
end)

RegisterNetEvent("mort:notifyKiller", function(killerId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and killerId then
        local xKiller = ESX.GetPlayerFromId(killerId)
        if xKiller then
            -- xKiller.showNotification("Vous avez tué un joueur.")
        end
    end
end)

RegisterNetEvent('mort:playerDied', function(killerId, deathCauseId, deathCauseText)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local alreadyDead = waitingForRevive[xPlayer.identifier] ~= nil
        
        if alreadyDead then
            return
        end
        
        waitingForRevive[xPlayer.identifier] = GetGameTimer()
        
        if deathCauseId == -842959696 then
            deathCauseText = "Chute"
        end
        
        deathCauses[xPlayer.identifier] = deathCauseText
        
        if killerId then
            local xKiller = ESX.GetPlayerFromId(killerId)
            if xKiller and xKiller.uid then
                playerKillers[xPlayer.identifier] = xKiller.uid
            elseif exports and exports['Gamemode'] then
                playerKillers[xPlayer.identifier] = exports['Gamemode']:UIDServer(killerId)
            else
                playerKillers[xPlayer.identifier] = killerId
            end
            
            if xKiller then
                --xKiller.showNotification("Vous avez tué un joueur.")
            end
        end
        
        TriggerClientEvent("Oziris:ReceiveDeathStatus", source, true, playerKillers[xPlayer.identifier], deathCauseText)
        
    end
end)

AddEventHandler("Oziris:rezu:playerDied", function(src, killerId, deathCause)
    local player = ESX.GetPlayerFromId(src)
    if player then
        if not waitingForRevive[player.identifier] then
            waitingForRevive[player.identifier] = GetGameTimer()
            
            local killerUID = nil
            if killerId then
                local xKiller = ESX.GetPlayerFromId(killerId)
                if xKiller and xKiller.uid then
                    killerUID = xKiller.uid
                elseif exports and exports['Gamemode'] then
                    killerUID = exports['Gamemode']:UIDServer(killerId)
                end
                playerKillers[player.identifier] = killerUID
            end
            
            deathCauses[player.identifier] = deathCause
            
            player.triggerEvent("Oziris:ReceiveDeathStatus", true, killerUID, deathCause)
        end
    end
end)

AddEventHandler("Oziris:rezu:playerRevived", function(src)
    local player = ESX.GetPlayerFromId(src);
    if (player) then
        if (waitingForRevive[player.identifier]) then
            waitingForRevive[player.identifier] = nil
            playerKillers[player.identifier] = nil
            deathCauses[player.identifier] = nil
            player.triggerEvent("Oziris:ReceiveDeathStatus", false);
        end
    end
end)

RegisterServerEvent('ambulance:clearSignal')
AddEventHandler('ambulance:clearSignal', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        TimeoutAmbulance[xPlayer.identifier] = nil
    end
end)

AddEventHandler("esx:playerLoaded", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if xPlayer.isDead then
            waitingForRevive[xPlayer.identifier] = GetGameTimer()
            TriggerClientEvent("Oziris:playerShouldDie", source, playerKillers[xPlayer.identifier], deathCauses[xPlayer.identifier])
            
            if ambulanceCooldown[xPlayer.identifier] then
                TriggerClientEvent('ambulance:updateCooldown', source, true)
            end
        end
    end
end)

AddEventHandler('playerDropped', function(reason)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.isDead then
        waitingForRevive[xPlayer.identifier] = GetGameTimer()
    end
end)

CreateThread(function()
    while true do
        for identifier, time in pairs(TimeoutAmbulance) do
            if GetGameTimer() - time > 300000 then
                TimeoutAmbulance[identifier] = nil
                ambulanceCooldown[identifier] = nil
                local player = ESX.GetPlayerFromIdentifier(identifier)
                if player then
                    TriggerClientEvent('ambulance:updateCooldown', player.source, false)
                end
            end
        end
        Wait(1000)
    end
end)

RegisterNetEvent('mort:fixDeathState', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    
    
    if waitingForRevive[xPlayer.identifier] then
        waitingForRevive[xPlayer.identifier] = nil
        playerKillers[xPlayer.identifier] = nil
        deathCauses[xPlayer.identifier] = nil
        
        if xPlayer.isDead then
            xPlayer.onRevive(false)
        end
    else
    end
end) 