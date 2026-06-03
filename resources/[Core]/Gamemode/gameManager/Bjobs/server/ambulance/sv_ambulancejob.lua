ESX = nil
TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
---@param fowlmas_player xPlayer
local function set_not_hurt(fowlmas_player)
	fowlmas_player.setHurt(false);
end

RegisterNetEvent('Koy:playerHurt', function()
	local fowlmas_la_pute = source;
	local fowlmas_player = ESX.GetPlayerFromId(fowlmas_la_pute);
	fowlmas_player.setHurt(true);
end);

RegisterServerEvent('annonce:serviceAmbulance')
AddEventHandler('annonce:serviceAmbulance', function(status)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
	if (xPlayer) then
		if xPlayer.job.name ~= "ambulance" then
			xPlayer.ban(0, '(annonce:serviceAmbulance)')
			return
		end
		for i = 1, #xPlayers, 1 do
			local ThePlayers = ESX.GetPlayerFromId(xPlayers[i])
			if (ThePlayers) then
				if ThePlayers.job.name == 'ambulance' then
					TriggerClientEvent('ambulance:InfoService', xPlayers[i], status, xPlayer.name)
				end
			end
		end
	end
end)

RegisterServerEvent('ambulance:deleteCall')
AddEventHandler('ambulance:deleteCall', function(k)

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
	if (xPlayer) then
		if xPlayer.job.name ~= "ambulance" then
			xPlayer.ban(0, '(ambulance:deleteCall)')
			return
		end
		for i = 1, #xPlayers, 1 do
			local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
			if thePlayer.job.name == 'ambulance' then
				TriggerClientEvent('isInServiceCheck', xPlayers[i], "-")
				TriggerClientEvent('ambulance:deleteAppel', xPlayers[i], k)
			end
		end

        local appelPlayer = ESX.GetPlayerFromId(k)
        if appelPlayer then
            TriggerClientEvent('esx:showNotification', appelPlayer.source, "Un ambulancier arrive sur place pour vous aider !")
        end
	end
end)

RegisterServerEvent('ambulance:sendnotification')
AddEventHandler('ambulance:sendnotification', function(type, args)

  	local source = source
	if type ~= nil then
		if type == 'guns' then
			TriggerClientEvent('esx:showNotification', source, "~s~Cette personne a été tuée par une arme à feu, précisément: "..args)
		end
	end
end)

RegisterServerEvent('ambulance:healsomeone')
AddEventHandler('ambulance:healsomeone', function(player, type)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local fowlmas_la_pute = ESX.GetPlayerFromId(player);
	if (xPlayer) then
		if xPlayer.job.name ~= "ambulance" then
			xPlayer.ban(0, '(ambulance:healsomeone)')
			return;
		end
		if (not fowlmas_la_pute) then xPlayer.ShowNotification("Un problème est survenue."); return; end
		local hasBandages = xPlayer.getInventoryItem('bandage')
		local hasMedi = xPlayer.getInventoryItem('medikit')
		if type == 'small' then
			if hasBandages.count >= 1 then
				TriggerClientEvent('ambulance:heal', player, type)
				set_not_hurt(fowlmas_la_pute);
				TriggerClientEvent('esx:showNotification', source, "~g~Vous avez soigné votre patient.")
				xPlayer.removeInventoryItem('bandage', 1)
			else
				TriggerClientEvent('esx:showNotification', source, "[~s~Impossible~w~] Vous n'avez pas de bandage sur vous")
			end
		elseif type == 'big' then
			if hasMedi.count >= 1 then
				TriggerClientEvent('ambulance:heal', player, type)
				set_not_hurt(fowlmas_la_pute);
				TriggerClientEvent('esx:showNotification', source, "~g~Vous avez soigné votre patient.")
				xPlayer.removeInventoryItem('bandage', 1)
			else
				TriggerClientEvent('esx:showNotification', source, "[~s~Impossible~w~] Vous n'avez pas de kit de soin sur vous")
			end
		end
	end
end)

RegisterNetEvent('ambulance:spawnVehicle', function(model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if (xPlayer) then
        if xPlayer.job.name ~= 'ambulance' then
            xPlayer.ban(0, '(ambulance:spawnVehicle)')
            return
        end
		
        ESX.SpawnVehicle(GetHashKey(model), vector3(-284.648193, -585.090698, 27.632490), 88.689254760742, nil, false, nil, function(vehicle)
            local plate = "SAMS" .. math.random(1000, 9999)
            SetVehicleNumberPlateText(vehicle, plate)
            TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
        end)
    end
end)

price2 = 6000

RegisterNetEvent('ambulance:réanimer', function(player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        if xPlayer.job.name ~= "ambulance" then
            xPlayer.ban(0, '(ambulance:réanimer)')
            return
        end

        local hasMedi = xPlayer.getInventoryItem('medikit')

        if hasMedi.count >= 1 then
            local target = ESX.GetPlayerFromId(player);

            if (not target) then return; end

            target.setHurt(false);
            TriggerClientEvent('ambulance:revive', player)
            TriggerClientEvent('atat:applyEffect', player, true)

            xPlayer.removeInventoryItem('medikit', 1)

            local society = ESX.DoesSocietyExist("ambulance")
            if (society) then
                local xTarget = ESX.GetPlayerFromId(player)
                if (xTarget) then
                    xTarget.removeAccountMoney('bank', price2)
                    ESX.AddSocietyMoney("ambulance", price2)
                    xTarget.showNotification("Votre compte en banque à été réduit de "..price2.."~g~$~s~.")
                end
            end
        else
            TriggerClientEvent('esx:showNotification', source, "[~s~Impossible~w~] Vous n'avez pas de kit de soin sur vous")
        end
    end
end)

RegisterServerEvent('ambulance:sendrapport')
AddEventHandler('ambulance:sendrapport', function(firstname, name, type, amount)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(ambulance:sendrapport)');

			return
		end

		if (type) then

			if type == 'petit' then

				type = "Petits soins"

			elseif type == 'grand' then

				type = "Grands soins"

			elseif type == 'rea' then

				type = "Réanimation"

			end

		end

		MySQL.Async.execute('INSERT INTO rapports VALUES (@Prenom, @Nom, @Type, @Montant)', {
			['@Prenom'] = firstname,
			['@Nom'] = name,
			['@Type'] = type,
			['@Montant'] = amount,
		}, function()

		end)

	end

end)

RegisterServerEvent('ambulance:deleterapport')
AddEventHandler('ambulance:deleterapport', function(firstname, name, type, amount)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(ambulance:deleterapport)');

			return

		end

		MySQL.Async.execute("DELETE FROM rapports WHERE Prenom = @a AND Nom = @b AND Type = @c AND Montant = @d", {

			['a'] = firstname,
			['b'] = name,
			['c'] = type,
			['d'] = amount

		}, function()

		end)

	end

end)

ESX.RegisterServerCallback('getAllRapports', function(source, cb)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(getAllRapports)');

			return

		end

		MySQL.Async.fetchAll('SELECT * FROM rapports', {}, function(result)

			cb(result)

		end)

	end

end)

RegisterServerEvent('réanimer')
AddEventHandler('réanimer', function(player)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	local tPlayer = ESX.GetPlayerFromId(player)

	if (xPlayer) and (tPlayer) then

		if xPlayer.getGroup() == "user" then

			xPlayer.ban(0, '(réanimer)');

			return

		end

		tPlayer.removeWeapon('gadget_parachute')
		tPlayer.setHurt(false);

		TriggerClientEvent('ambulance:revive', player)

	end

end)

RegisterServerEvent('ambulance:payNPC')
AddEventHandler('ambulance:payNPC', function()

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		xPlayer.removeAccountMoney('bank', 5000)

		TriggerClientEvent('esx:showNotification', source, "Vous avez payer 5000 ~g~$~s~ de frais médicaux.")

	end

end)

RegisterNetEvent('ambulance:takebandage', function()

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		local hasBandages = xPlayer.getInventoryItem('bandage')

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(ambulance:takebandage)');
			return;

		end

		if (hasBandages.count < 5) then
			xPlayer.addInventoryItem('bandage', 1);
		else
			TriggerClientEvent('esx:showNotification', source, "~s~Vous n'avez plus de place dans votre inventaire.");
		end

	end

end)

RegisterServerEvent('ambulance:takemedikits')
AddEventHandler('ambulance:takemedikits', function()

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= "ambulance" then

		xPlayer.ban(0, '(ambulance:takemedikits)');

		return

	end

	local hasMedi = xPlayer.getInventoryItem('medikit')

	if hasMedi.count < 10 then

		xPlayer.addInventoryItem('medikit', 1)

	else

		TriggerClientEvent('esx:showNotification', source, "~s~Vous n'avez plus de place dans votre inventaire.")

	end

end)


ESX.RegisterUsableItem('medikit', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.removeInventoryItem('medikit', 1)

        TriggerClientEvent('ambulance:useMedikit', source)
		Wait(4000)

        TriggerClientEvent('esx:showNotification', source, "~g~Vous avez utilisé un kit de soin")
    end
end)

ESX.RegisterUsableItem('bandage', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.removeInventoryItem('bandage', 1)

        TriggerClientEvent('ambulance:useBandage', source)
		Wait(4000)

        TriggerClientEvent('esx:showNotification', source, "~g~Vous avez utilisé un bandage")
    end
end)

exports["Koy"]:RegisterCommand("revive", function(xPlayer, args)

	local player_selected_id = tonumber(args[1])
	local player_selected_data = (xPlayer == nil or xPlayer.source ~= player_selected_id) and ESX.GetPlayerFromId(player_selected_id) or xPlayer

	if (player_selected_data == nil) then
		return
	end

	local player_selected_ped = GetPlayerPed(player_selected_data.source)
	local player_selected_max_health = GetEntityMaxHealth(player_selected_ped);
	local player_selected_health = GetEntityHealth(player_selected_ped);

	if ((player_selected_max_health / 100) >= player_selected_health) then

		player_selected_data.triggerEvent("ambulance:revive")
		SendLogs('Revive', "Koy | Revive", ("___%s___ vient de faire revivre ***%s***."):format(((xPlayer ~= nil and xPlayer.getName()) or "Console"), player_selected_data.getName()), "https://discord.com/api/webhooks/1126207891855118476/PMRyxIzDkGE8I7b-qfH37NwwTPIxmwIz__DqTcq__G80Zaxq1MoT9DiEk_y1CZuXH_s2")

		player_selected_data.setHurt(false);

		if (xPlayer ~= nil) then
			xPlayer.showNotification(("Vous avez revive le joueur ~g~%s~s~."):format(player_selected_data.getName()))
		end

	else

		if (xPlayer ~= nil) then
			xPlayer.showNotification(("Le joueur ~g~%s~s~ n'est pas mort."):format(player_selected_data.getName()))
		end

	end

end, {help = "Faire revivre un joueur", params = {
	{name = "id", help = "Id du joueur"}
}}, {
	inMode = true
});

exports["Koy"]:RegisterCommand("revivezone", function(xPlayer, args)

	local admin = xPlayer;

	local players = GetPlayers();

	local count = 0;

	args[1] = args[1] ~= nil and tonumber(args[1]) or 10;

	if (admin) then

		if (tonumber(args[1]) <= 500 and tonumber(args[1]) >= 0) then

			for i = 1, #players do

				local target_player = ESX.GetPlayerFromId(players[i]);

				if (target_player) then

					local coords = GetEntityCoords(GetPlayerPed(players[i]));
					local distance = #(coords - admin.getCoords());

					if (distance <= tonumber(args[1])) then

						local ped = GetPlayerPed(target_player.source);
						local health = GetEntityHealth(ped);
						local maxHealth = GetEntityMaxHealth(ped);

						if (maxHealth /100 >= health) then

							count = count + 1;
							target_player.triggerEvent('ambulance:revive');
							target_player.setHurt(false);

						end

					end

				end

			end

			if (count > 0) then

				admin.showNotification(("Vous venez de revive ~g~%s joueur(s)~h~ dans ce rayon."):format(count))
				SendLogs('ReviveZone', "Koy | ReviveZone", "**"..admin.getName().."** vient de revive **"..count.."** joueurs", "https://discord.com/api/webhooks/1364568798153277491/ZOUdTTeSpf7Oto688WbTaJyzU06nZmTtlBcbRTjk4t6bN5ARcG8TIpjtXLAjFVf9K4aB")

			end

		else

			admin.showNotification("Veuillez saisir un nombre entre 0 et 500");

		end

	end

end, {help = "Faire revivre tout les joueurs d'une zone", params = {
	{name = "radius", help = "Rayon dans lequel cette action va s'effectuer"}
}}, {
	inMode = true
});

exports["Koy"]:RegisterCommand("kill", function(xPlayer, args)

	local player_selected_id = tonumber(args[1])
	local player_selected_data = (xPlayer == nil or xPlayer.source ~= player_selected_id) and ESX.GetPlayerFromId(player_selected_id) or xPlayer

	if (player_selected_data == nil) then
		return
	elseif (xPlayer ~= nil and xPlayer.source ~= player_selected_data.source and not exports["Koy"]:GroupIsHigher(xPlayer.getGroup(), player_selected_data.getGroup())) then
		return
	end

	player_selected_data.triggerEvent("ambulance:slay")

	if (xPlayer ~= nil) then
		xPlayer.showNotification(("Vous avez slay le joueur ~g~%s~s~."):format(player_selected_data.getName()))
	end

end, {help = "Tuer un joueur", params = {
	{name = "id", help = "Id du joueur"}
}}, {
	inMode = true,
	permission = "player_slay"
});

exports["Koy"]:RegisterCommand("heal", function(xPlayer, args)

	if (not xPlayer) then
		return
	end

	local player_selected_id = tonumber(args[1])
	local player_selected_data = xPlayer.source ~= player_selected_id and ESX.GetPlayerFromId(player_selected_id) or xPlayer
	if (player_selected_data == nil) then
		return
	end

	player_selected_data.triggerEvent("esx_basicneeds:healPlayer", "big")
	player_selected_data.setHurt(false);

	player_selected_data.showNotification("Vous avez été soigné.")
	xPlayer.showNotification(("Vous avez soigné ~g~%s~s~."):format(player_selected_data.getName()))
	SendLogs('Heal', "Koy | Heal", ("___%s___ vient de soigner ***%s***."):format(xPlayer.getName(), player_selected_data.getName()), "https://discord.com/api/webhooks/1364568886686650509/UjOabEi900v_X0jvMvPjDhikAHM9zULAXVFVrkrPVCEWGn2E2o2O0S1mcdo1rdCrR6L-")

end, {help = "Heal un joueur", params = {
	{name = "id", help = "Id du joueur, qui va être soigné"}
}}, {
	inMode = true
});

-- ANNONCE
local TimeoutJob = {};

RegisterServerEvent('Ouvre:ambulance')
AddEventHandler('Ouvre:ambulance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "ambulance" then
            xPlayer.ban(0, '(Ouvre:ambulance)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'EMS', '~b~Annonce', "SAMS est désormais ~g~Ouvert~s~", '#3399FF', 'CHAR_CALL911')

        end
    else
        xPlayer.showNotification("[~s~Impossible~s~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Ferme:ambulance')
AddEventHandler('Ferme:ambulance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "ambulance" then
            xPlayer.ban(0, '(Ferme:ambulance)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'EMS', '~b~Annonce', "SAMS est désormais ~s~Fermer~s~", '#3399FF', 'CHAR_CALL911')
        end
    else
        xPlayer.showNotification("[~s~Impossible~s~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Recrutement:ambulance')
AddEventHandler('Recrutement:ambulance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
		TimeoutJob[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "ambulance" then
            xPlayer.ban(0, '(Ferme:ambulance)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'EMS', '~o~Recrutement', "Les SAMS recrutent ! Rendez-vous à ~o~L'hôpital", '#FF9933', 'CHAR_CALL911')
        end
    else
        xPlayer.showNotification("[~s~Impossible~s~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterNetEvent('applyAtaAfterRevive')
AddEventHandler('applyAtaAfterRevive', function(playerId)
    if playerId then
        TriggerClientEvent('atat:applyEffect', playerId, true)
        local identifier = GetPlayerIdentifiers(playerId)[1]
        if identifier then
            local atatEndTime = GetGameTimer() + (125 * 1000) 
            playerAtatStates[identifier] = atatEndTime
        end
    end
end)

RegisterServerEvent('Personnaliser:ambulance')
AddEventHandler('Personnaliser:ambulance', function(message)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    
    if (not TimeoutJob[xPlayer.identifier] or GetGameTimer() - TimeoutJob[xPlayer.identifier] > 120000) then
        TimeoutJob[xPlayer.identifier] = GetGameTimer();
        
        if xPlayer.job.name ~= "ambulance" then
            xPlayer.ban(0, '(Personnaliser:ambulance)');
            return
        end

		sendToDiscord("Annonce EMS", "**" .. GetPlayerName(_source) .. "** a fait une annonce :\n" .. message, 2061822)
        
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'EMS', '~b~Annonce', message, '#3399FF', 'CHAR_CALL911')
        end
    else
        xPlayer.showNotification("[~s~Impossible~s~] Vous devez attendre 2 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterNetEvent('ambulance:revive')
AddEventHandler('ambulance:revive', function(player)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
        if thePlayer.job.name == 'ambulance' then
            TriggerClientEvent('ambulance:deleteAppel', xPlayers[i], player)
        end
    end
end)

RegisterNetEvent('ambulance:reviveCommand')
AddEventHandler('ambulance:reviveCommand', function(player)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
        if thePlayer.job.name == 'ambulance' then
            TriggerClientEvent('ambulance:deleteAppel', xPlayers[i], player)
        end
    end
end)

AddEventHandler('playerDropped', function()
    local source = source
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
        if thePlayer.job.name == 'ambulance' then
            TriggerClientEvent('ambulance:deleteAppel', xPlayers[i], source)
        end
    end
end)

exports["Koy"]:RegisterCommand("debugcorp", function(xPlayer, args)
    if not xPlayer then return end

    if xPlayer.job.name ~= "ambulance" then
        xPlayer.showNotification("[~r~Impossible~s~] Vous devez être ambulancier pour utiliser cette commande")
        return
    end

    local players = GetPlayers()
    local count = 0
    local ambulanceCoords = xPlayer.getCoords()

    for i = 1, #players do
        local targetPlayer = ESX.GetPlayerFromId(players[i])
        if targetPlayer then
            local ped = GetPlayerPed(targetPlayer.source)
            local targetCoords = GetEntityCoords(ped)
            local distance = #(targetCoords - ambulanceCoords)

            if distance <= 25.0 then
                local health = GetEntityHealth(ped)
                local maxHealth = GetEntityMaxHealth(ped)

                if health <= 0 then
                    count = count + 1

                    -- Prendre le contrôle du ped
                    if not NetworkHasControlOfEntity(ped) then
                        NetworkRequestControlOfEntity(ped)
                    end

                    -- Forcer une petite téléportation pour "rafraîchir"
                    local newCoords = vector3(
                        ambulanceCoords.x + math.random(-1, 1),
                        ambulanceCoords.y + math.random(-1, 1),
                        ambulanceCoords.z
                    )
                    SetEntityCoords(ped, newCoords.x, newCoords.y, newCoords.z + 0.05)

                    -- Re-téléportation pour éviter bug de visibilité
                    Wait(100)
                    SetEntityCoords(ped, ambulanceCoords.x, ambulanceCoords.y, ambulanceCoords.z)

                    -- Notification au joueur (même s'il est mort, utile pour debug)
                    TriggerClientEvent('esx:showNotification', targetPlayer.source, "~g~Votre corps a été rafraîchi par un ambulancier")
                end
            end
        end
    end

    if count > 0 then
        xPlayer.showNotification(("~g~Vous avez rafraîchi %s corps dans un rayon de 25m"):format(count))
    else
        xPlayer.showNotification("~s~Aucun corps mort trouvé dans un rayon de 25m")
    end
end, {help = "Forcer l'affichage des corps morts dans un rayon de 25m"}, {
    inMode = true
})

