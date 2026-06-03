ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterNetEvent('benny:spawnVehicle', function(model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'mecano' then
        xPlayer.ban(0, '(benny:spawnVehicle)')
        return
    end
      
    ESX.SpawnVehicle(GetHashKey(model), vector3(-988.3901, -2054.1946, 9.4054), 225.6017, nil, false, nil, function(vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
end)

RegisterNetEvent('ls:spawnVehicle', function(model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'mecano2' then
        xPlayer.ban(0, '(ls:spawnVehicle)')
        return
    end

    ESX.SpawnVehicle(GetHashKey(model), vector3(-365.2996, -145.7475, 38.3260), 30.5915, nil, false, nil, function(vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
end)

RegisterNetEvent('autoexotic:spawnVehicle', function(model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'autoexotic' then
        xPlayer.ban(0, '(autoexotic:spawnVehicle)')
        return
    end

    ESX.SpawnVehicle(GetHashKey(model), vector3(-384.4778, -127.9943, 38.07802), 208.34944152832, nil, false, nil, function(vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
end)

RegisterNetEvent('larrys:spawnVehicle', function(model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'larrys' then
        xPlayer.ban(0, '(larrys:spawnVehicle)')
        return
    end

    ESX.SpawnVehicle(GetHashKey(model), vector3(1244.250488, 2710.802246, 38.00), 178.21, nil, false, nil, function(vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
end)



-- ANNONCE
local TimeoutJob = {};

RegisterServerEvent('Ouvre:Mecano')
AddEventHandler('Ouvre:Mecano', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "mecano" then
            xPlayer.ban(0, '(Ouvre:Mecano)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BENNY\'S', '~o~Annonce', "BENNY\'S est désormais ~g~Ouvert", '#7c0d0dff', 'CHAR_BENNYS')

        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Personnaliser:Mecano')
AddEventHandler('Personnaliser:Mecano', function(message)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "mecano" then
            xPlayer.ban(0, '(Personnaliser:Mecano)');
            return
        end

        sendToDiscord("Annonce Mécano", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)


        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BENNY\'S', '~o~Annonce', message, '#7c0d0dff', 'CHAR_BENNYS')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)    

RegisterServerEvent('Personnaliser:Mecano2')
AddEventHandler('Personnaliser:Mecano2', function(message)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "mecano2" then
            xPlayer.ban(0, '(Personnaliser:Mecano2)');
            return
        end

        sendToDiscord("Annonce LsCustom", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)

        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LSCUSTOM', '~c~Annonce', message, '#101291ff', 'CHAR_LSCUSTOM')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)    

RegisterServerEvent('Ferme:Mecano')
AddEventHandler('Ferme:Mecano', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "mecano" then
            xPlayer.ban(0, '(Ferme:Mecano)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BENNY\'S', '~o~Annonce', "BENNY\'S est désormais ~s~Fermer", '#7c0d0dff', 'CHAR_BENNYS')

        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Recrutement:Mecano')
AddEventHandler('Recrutement:Mecano', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "mecano" then
            xPlayer.ban(0, '(Recrutement:Mecano)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BENNY\'S', '~o~Recrutement', "Recrutement en cours, rendez-vous au ~o~Benny's", '#7c0d0dff', 'CHAR_BENNYS')

        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Ouvre:Mecano2')
AddEventHandler('Ouvre:Mecano2', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "mecano2" then
            xPlayer.ban(0, '(Ouvre:Mecano)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LSCUSTOM', '~c~Annonce', "LS Custom est désormais ~g~Ouvert", '#101291ff', 'CHAR_LSCUSTOM')

        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Ferme:Mecano2')
AddEventHandler('Ferme:Mecano2', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "mecano2" then
            xPlayer.ban(0, '(Ferme:Mecano)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LSCUSTOM', '~c~Annonce', "LS Custom est désormais ~g~Fermer", '#101291ff', 'CHAR_LSCUSTOM')

	    end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Recrutement:Mecano2')
AddEventHandler('Recrutement:Mecano2', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "mecano2" then
            xPlayer.ban(0, '(Recrutement:Mecano)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LSCUSTOM', '~o~Recrutement', "Les Recrutement en cours, rendez-vous au ~o~LS Custom", '#7c0d0dff', 'CHAR_LSCUSTOM')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

-- AutoExotic

RegisterServerEvent('Ouvre:AutoExotic')
AddEventHandler('Ouvre:AutoExotic', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "autoexotic" then
            xPlayer.ban(0, '(Ouvre:AutoExotic)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'AUTOEXOTIC', '~b~Annonce', "Auto Exotic est désormais ~g~Ouvert", '#3399FF', 'CHAR_AUTOEXOTIC')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Ferme:AutoExotic')
AddEventHandler('Ferme:AutoExotic', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "autoexotic" then
            xPlayer.ban(0, '(Ferme:AutoExotic)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'AUTOEXOTIC', '~b~Annonce', "Auto Exotic est désormais ~s~Fermer", '#3399FF', 'CHAR_AUTOEXOTIC')
	    end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Recrutement:AutoExotic')
AddEventHandler('Recrutement:AutoExotic', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "autoexotic" then
            xPlayer.ban(0, '(Recrutement:AutoExotic)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'AUTOEXOTIC', '~o~Recrutement', "Les Recrutement en cours, rendez-vous au ~o~Auto Exotic", '#7c0d0dff', 'CHAR_AUTOEXOTIC')

        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Personnaliser:AutoExotic')
AddEventHandler('Personnaliser:AutoExotic', function(message)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "autoexotic" then
            xPlayer.ban(0, '(Personnaliser:AutoExotic)');
            return
        end
        sendToDiscord("Annonce AutoExotic", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)

        
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'AUTOEXOTIC', '~o~Annonce', message, '#7c0d0dff', 'CHAR_AUTOEXOTIC')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

-- larrys

RegisterServerEvent('Ouvre:larrys')
AddEventHandler('Ouvre:larrys', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "larrys" then
            xPlayer.ban(0, '(Ouvre:larrys)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LARRYS', '~s~Annonce', "Larrys est désormais ~g~Ouvert", '#FF3333', 'CHAR_LARRYS')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Personnaliser:larrys')
AddEventHandler('Personnaliser:larrys', function(message)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "larrys" then
            xPlayer.ban(0, '(Personnaliser:larrys)');
            return
        end

        sendToDiscord("Annonce Larrys", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)

    
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LARRYS', '~s~Annonce', message, '#FF3333', 'CHAR_LARRYS')
        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Ferme:larrys')
AddEventHandler('Ferme:larrys', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "larrys" then
            xPlayer.ban(0, '(Ferme:larrys)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LARRYS', '~s~Annonce', "Larrys est désormais ~s~Fermer", '#FF3333', 'CHAR_LARRYS')
	    end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Recrutement:larrys')
AddEventHandler('Recrutement:larrys', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "larrys" then
            xPlayer.ban(0, '(Recrutement:larrys)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LARRYS', '~o~Recrutement', "Les Recrutement en cours, rendez-vous au ~o~Larrys", '#7c0d0dff', 'CHAR_LARRYS')

        end
    else
        xPlayer.showNotification("[~r~Impossible~h~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterNetEvent("craftMecano", function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer.canCarryItem(item, 1) then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez ateint la limite maximum')
    else
        xPlayer.addInventoryItem(item, 1)    
    end
end)