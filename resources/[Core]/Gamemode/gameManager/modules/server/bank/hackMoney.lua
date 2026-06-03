local playerTimed = {};

RegisterNetEvent("Bank:hackATM", function(animation, success, coords)
    local playerSrc = source

    local xPlayer = ESX.GetPlayerFromId(playerSrc)
    if (not xPlayer) then
        return
    end

    if (not playerTimed[xPlayer.identifier] or GetGameTimer() - playerTimed[xPlayer.identifier] > 3600000) then
        if animation then
            TriggerClientEvent("Bank:startBruteForce", playerSrc)
            playerTimed[xPlayer.identifier] = nil 
        else
            if success then
                local amount = math.random(10000, 20000)
                local chance = math.random(0, 10)
                local xPlayers = ESX.GetPlayers()
                playerTimed[xPlayer.identifier] = GetGameTimer()
                xPlayer.addAccountMoney('cash', amount)
                xPlayer.showAdvancedNotification("Notification", "Bruteforce", "Vous avez terminé avec succès le Bruteforce")
                xPlayer.showAdvancedNotification("Notification", "Bruteforce", "Vous avez gagné "..amount.." ~g~$")
                if chance > 7 then
                    for i = 1, #xPlayers do
                        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                
                        if xPlayer.job.name == 'police' or xPlayer.job.name == 'bcso' then
                            TriggerClientEvent("Bank:PoliceBlip", xPlayers[i], coords, 45)
                        end
                    end
                end
            else
                xPlayer.showAdvancedNotification("Notification", "Bruteforce", "Vous avez raté le Bruteforce")
            end
        end
    else
		xPlayer.showAdvancedNotification("Notification", "Bruteforce", "Ce distributeur a été récemment cambriolé et n'a plus d'argent, revenez plus tard.")
	end
end)