--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
JailX = {}
local allowedByServer = false

RegisterServerEvent('jail:onConnecting')
AddEventHandler('jail:onConnecting', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then 
        return 
    end
    
    local playerUID = exports['uid']:UIDServer(source)
    
    if not playerUID then 
        local playerIdentifier = xPlayer.identifier
        if playerIdentifier then
            local result = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
                ['@identifier'] = playerIdentifier
            })
            if result[1] then
                playerUID = result[1].uid
            end
        end
    end
    
    if not playerUID then 
        return 
    end
    
    
    MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier = @identifier', {
        ['@identifier'] = playerUID
    }, function(result)
        if result[1] then
            allowedByServer = true
            TriggerClientEvent('jail:PutInBack', source, result[1].remainingTasks, result[1].motif)
            Wait(500)
            TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
            TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
        else
        end
    end)
end)


ESX.AddGroupCommand('unjail', 'moderateur', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    if not args[1] then 
        TriggerClientEvent('esx:showNotification', source, "~s~ID unique manquant") 
        return 
    end
    
    local targetUID = tostring(args[1]):gsub("%s+", "")  
    
    MySQL.Async.fetchAll('SELECT identifier FROM player_uids WHERE uid = @uid', {
        ['@uid'] = targetUID
    }, function(result)
        if result[1] then
            local found = false
            for _, id in ipairs(GetPlayers()) do
                local player = ESX.GetPlayerFromId(id)
                if player and player.identifier == result[1].identifier then
                    found = true
                    local playerUID = exports['uid']:UIDServer1(id)
                    if not playerUID then return end
                    
                    allowedByServer = true
                    local tPlayer = ESX.GetPlayerFromId(id)
                    
                    TriggerClientEvent('jail:UnPut', id)
                    xPlayer.showNotification('Vous avez unjail : ~s~'..tPlayer.name)
                    
                    MySQL.Async.execute("DELETE FROM jail WHERE identifier = @identifier", {
                        ['@identifier'] = playerUID
                    }, function()
                    end)
                    
                    if JailX[id] then
                        JailX[id] = nil
                    end
                    
                    local sourceUID = exports['uid']:UIDServer1(source)
                    if not sourceUID then
                        local sourceIdentifier = xPlayer.identifier
                        if sourceIdentifier then
                            local sourceResult = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
                                ['@identifier'] = sourceIdentifier
                            })
                            if sourceResult[1] then
                                sourceUID = sourceResult[1].uid
                            end
                        end
                    end
                    
                    if not sourceUID or not tPlayer.name or not playerUID then return end
                    
                    SendLogs("Jail", "Koy | UnJail", 
                        "**"..tPlayer.name.."** (***"..playerUID.."***) a été libéré de prison par **"..xPlayer.name.."** (***"..sourceUID.."***)", 
                        "https://discord.com/api/webhooks/1364569104178221066/UNBLu4slShsnJvGDPRLchgu5Bkx9tFF6zhRuU4hCyLKTM8_swDB2-YZJuhVdR5xykZMq"
                    )
                    
                    break
                end
            end
            
            if not found then
                TriggerClientEvent('esx:showNotification', source, "~s~Le joueur avec l'ID unique " .. targetUID .. " n'est pas en ligne")
            end
        else
            TriggerClientEvent('esx:showNotification', source, "~s~Aucun joueur trouvé avec l'ID unique: " .. targetUID)
        end
    end)
end, {help = "Unjail un joueur (ID Unique uniquement)", params = {
    {name = "id_unique", help = "ID Unique du joueur"}
}})

RegisterServerEvent('jail:updateState')
AddEventHandler('jail:updateState', function(time)
    local source = source
    
    if allowedByServer == true then
        JailX[source] = {
            number = time,
            hasBeenAllowed = true
        }
        allowedByServer = false
        TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
        TriggerClientEvent('esx_status:add', source, 'hunger', 1000000) 
    else
        TriggerEvent("tF:Protect", source, '(jail:updateState');
        return
    end
end)

RegisterServerEvent('jail:removeTask')
AddEventHandler('jail:removeTask', function(nbr)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local playerUID = exports['uid']:UIDServer(source)
    
    if not playerUID then
        local playerIdentifier = xPlayer.identifier
        if playerIdentifier then
            local result = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
                ['@identifier'] = playerIdentifier
            })
            if result[1] then
                playerUID = result[1].uid
            else
                return
            end
        end
    end
    
    if not playerUID then 
        return 
    end
    

    local isLicense = string.find(tostring(playerUID), "license:")
    if isLicense then
        local license = playerUID
        local result = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
            ['@identifier'] = license
        })
        if result[1] then
            playerUID = result[1].uid
        else
            return
        end
    end
    
    JailX[source] = {
        number = nbr,
        hasBeenAllowed = false
    }
    
    
    MySQL.Async.execute("UPDATE jail SET remainingTasks = @b WHERE identifier = @a", {
        ['@a'] = playerUID,
        ['@b'] = nbr
    }, function(rowsChanged)
        if rowsChanged > 0 then
        else
        end
    end)
end)

RegisterServerEvent('jail:SetInJail')
AddEventHandler('jail:SetInJail', function(jailStay, reason)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    local playerUID = exports['uid']:UIDServer1(source)
    
    if playerUID and string.find(tostring(playerUID), "license:") then
        local license = playerUID
        local result = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
            ['@identifier'] = license
        })
        if result[1] then
            playerUID = result[1].uid
        else
            playerUID = nil 
        end
    end
    
    if not playerUID then
        local playerIdentifier = xPlayer.identifier
        if playerIdentifier then
            local result = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
                ['@identifier'] = playerIdentifier
            })
            if result[1] then
                playerUID = result[1].uid
            end
        end
    end
    
    if not playerUID then
        return
    end
    
    
    JailX[source] = {
        number = jailStay,
        hasBeenAllowed = false
    }
    
    MySQL.Async.execute('INSERT INTO jail (identifier, remainingTasks, motif) VALUES (@identifier, @number, @reason)', {  
        ['@identifier'] = playerUID,        
        ['@number'] = jailStay,
        ['@reason'] = reason
    }, function(rowsChanged)
        if rowsChanged > 0 then
        else
            print("pas bon")
        end
    end)
end)

RegisterServerEvent('jail:SetInJailBack')
AddEventHandler('jail:SetInJailBack', function(jailStay)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    JailX[source] = {
        number = jailStay,
        hasBeenAllowed = false
    }
end)

RegisterServerEvent('jail:HealPlayer')
AddEventHandler('jail:HealPlayer', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if JailX[source] == nil then
        TriggerEvent("tF:Protect", source, '(jail:HealPlayer)');
        return
    end 
    TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
    TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
end)

RegisterServerEvent('jail:finish')
AddEventHandler('jail:finish', function()
    local source = source
    if not source then return end
    
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    local playerUID = exports['uid']:UIDServer(source)
    
    if JailX[source] and JailX[source].number == 0 then
        MySQL.Async.execute("DELETE FROM jail WHERE identifier = @a", {
            ['@a'] = playerUID
        }, function()
            TriggerClientEvent('jail:finishAll', source)
            TriggerClientEvent('esx:showNotification', source, "~g~Vous avez été libéré après avoir réalisé l'entièreté de vos tâches !")
        end)
    else
        if JailX[source] then
        else 
        end
        TriggerEvent("tF:Protect", source, '(jail:finish)');
        return
    end
end)

RegisterNetEvent('Koy:Jail:CheckIsRealyFinish')
AddEventHandler('Koy:Jail:CheckIsRealyFinish', function()
    if JailX[source].number > 0 then
        DropPlayer(source, "Chelou chelou l'histoire, coup de pompe chasseur, hoo faaa (Le tcho)")
    end
end)

RegisterServerEvent('jail:remove')
AddEventHandler('jail:remove', function(timeLeft)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerUID = exports['uid']:UIDServer(source)
    if not JailX[source].hasBeenAllowed then
        TriggerEvent("tF:Protect", source, '(jail:remove)');
        return
    end
    MySQL.Async.execute("DELETE FROM jail WHERE identifier = @a AND remainingTasks = @b", {
        ['a'] = playerUID,
        ['b'] = timeLeft
    }, function()
    end)
end)

ESX.AddGroupCommand("jail" , "moderateur" ,function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not args[1] then
        if (xPlayer) then
            TriggerClientEvent('esx:showNotification', source, "~s~ID unique manquant") 
            return
        else
            return
        end
    end
    
    local targetUID = tostring(args[1]):gsub("%s+", "") 
    
    MySQL.Async.fetchAll('SELECT identifier FROM player_uids WHERE uid = @uid', {
        ['@uid'] = targetUID
    }, function(result)
        if result[1] then
            local found = false
            for _, id in ipairs(GetPlayers()) do
                local player = ESX.GetPlayerFromId(id)
                if player and player.identifier == result[1].identifier then
                    found = true
                    local playerUID = exports['uid']:UIDServer(id)
                    MySQL.Async.fetchAll('SELECT 1 FROM jail WHERE identifier = @identifier', {
                        ['@identifier'] = playerUID
                    },function(jailResult)
                        if jailResult[1] then
                            TriggerClientEvent('esx:showNotification', source, "~s~Le joueur est déjà en prison~s~") 
                        else
                            TriggerClientEvent("JailMenu:OpenMenu", source, id)
                            TriggerClientEvent('esx:showNotification', source, "~g~Joueur trouvé avec l'ID unique : " .. targetUID)
                        end
                    end)
                    break
                end
            end
            
            if not found then
                TriggerClientEvent('esx:showNotification', source, "~s~Le joueur avec l'ID unique " .. targetUID .. " n'est pas en ligne")
            end
        else
            TriggerClientEvent('esx:showNotification', source, "~s~Aucun joueur trouvé avec l'ID unique: " .. targetUID)
        end
    end)
end, {help = "Jail un joueur (ID Unique uniquement)", params = {
    {name = "id_unique", help = "ID Unique du joueur"},
}})

RegisterServerEvent("JailMenu:AntiMassJail")
AddEventHandler("JailMenu:AntiMassJail", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.ban(0, "c'est con ca :( - (JailMenu:AntiMassJail)");
end)

RegisterServerEvent("JailMenu:JailPlayer")
AddEventHandler("JailMenu:JailPlayer", function(targetId, time, raison)
    local xPlayer = ESX.GetPlayerFromId(source)
    local target = ESX.GetPlayerFromId(targetId)
    
    if not xPlayer or not target then return end
    
    local playerUID = exports['uid']:UIDServer1(targetId)
    if not playerUID then
        local targetIdentifier = target.identifier
        if targetIdentifier then
            local result = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
                ['@identifier'] = targetIdentifier
            })
            if result[1] then
                playerUID = result[1].uid
            end
        end
    end
    
    if not playerUID then return end
    
    if not time or not raison then return end
    
    if xPlayer.getGroup() ~= "user" then
        MySQL.Async.fetchAll('SELECT 1 FROM jail WHERE identifier = @identifier', {
            ['@identifier'] = playerUID
        }, function(result)
            if result[1] then
                xPlayer.showNotification("~s~Le joueur est déjà en prison~s~")
            else
                TriggerClientEvent("jail:PutIn", targetId, time, raison)
                TriggerClientEvent("JailMenu:AddJailCounter", xPlayer.source)
                
                local sourceUID = exports['uid']:UIDServer1(source)
                if not sourceUID then
                    local sourceIdentifier = xPlayer.identifier
                    if sourceIdentifier then
                        local sourceResult = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
                            ['@identifier'] = sourceIdentifier
                        })
                        if sourceResult[1] then
                            sourceUID = sourceResult[1].uid
                        end
                    end
                end
                
                if not sourceUID or not target.name or not playerUID or not raison or not time then return end
                
                SendLogs("Jail", "Koy | Jail", 
                    "Le joueur **"..target.name.."** (***"..playerUID.."***) a été envoyé en prison pour **"..raison.."** avec **"..time.."** objet(s) par **"..xPlayer.name.."** (***"..sourceUID.."***)", 
                    "https://discord.com/api/webhooks/1364569042693787760/rgXCE5wgpI8TZB3h-kk96yHFWVTRcA7o8NKV5RLDgHCR6ABEx-uP-Jtpqrm5FQrOEk01"
                )
            end
        end)
    else
        xPlayer.ban(0, "(JailMenu:JailPlayer)")
    end
end)

RegisterServerEvent('jail:checkJailStatus')
AddEventHandler('jail:checkJailStatus', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    
    local playerUID = nil
    
    playerUID = exports['uid']:UIDServer(source)
    
    if playerUID and string.find(tostring(playerUID), "license:") then
        local license = playerUID
        local result = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
            ['@identifier'] = license
        })
        if result[1] then
            playerUID = result[1].uid
        else
            playerUID = nil 
        end
    end
    
    if not playerUID then
        local playerIdentifier = xPlayer.identifier
        if playerIdentifier then
            local result = MySQL.Sync.fetchAll('SELECT uid FROM player_uids WHERE identifier = @identifier', {
                ['@identifier'] = playerIdentifier
            })
            if result[1] then
                playerUID = result[1].uid
            end
        end
    end
    
    if not playerUID then 
        return 
    end
    
    
    MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier = @identifier', {
        ['@identifier'] = playerUID
    }, function(result)
        if result[1] then
            
            JailX[source] = {
                number = tonumber(result[1].remainingTasks),
                hasBeenAllowed = false
            }
            
            allowedByServer = true
            
            TriggerClientEvent('jail:refreshJailStatus', source, true, tonumber(result[1].remainingTasks), result[1].motif)
            Wait(500)
            TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
            TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
        else
            TriggerClientEvent('jail:refreshJailStatus', source, false, 0, "")
        end
    end)
end)