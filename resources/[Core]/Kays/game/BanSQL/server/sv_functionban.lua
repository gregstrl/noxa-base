local local_date = os.date('%H:%M:%S', os.time())

function cmdban(source, args)
	local license,identifier,liveid,xblid,discord,playerip
	local target    = tonumber(args[1])
	local banid = (math.random(100, 99999)..'-'..math.random(100, 99999))

	local pseudo  = GetPlayerName(target)
	local test    = GetPlayerName(source)

	local duree
	local reason
	if tonumber(args[2]) == 0 then
		duree = 0
		reason = table.concat(args, " ", 3)
	else
		local day = tonumber(args[2])
		duree = day
		reason = table.concat(args, " ",4)
	end

	if args[1] then		
		if ReasonForBan == "" then
			ReasonForBan = Text.noreason
		end
		if target and target > 0 then
			local ping = GetPlayerPing(target)
        
			if ping and ping > 0 then
				if duree and duree < 365 then
					local targetplayername = GetPlayerName(target)
					local sourceplayername = ""
						if source ~= 0 then
							sourceplayername = GetPlayerName(source)
						else
							sourceplayername = "Console"
						end
						for k,v in ipairs(GetPlayerIdentifiers(target))do
							if string.sub(v, 1, string.len("license:")) == "license:" then
								license = v
							elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
								identifier = v
							elseif string.sub(v, 1, string.len("live:")) == "live:" then
								liveid = v
							elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
								xblid  = v
							elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
								discord = v
							elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
								playerip = v
							end
						end
						local ReasonForBan = table.concat(args, " ", 3)
						if duree > 0 then
							TriggerClientEvent("esx:showNotification", source, ("~b~Administration\n~s~"..Text.youban .. targetplayername .. Text.during .. duree .. Text.forr .. ReasonForBan))
							ban(source,banid,license,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,duree,ReasonForBan,0)
							Wait(1900)
							DropPlayer(target, Text.yourban.."\n\n❓ Raison du bannissement: "..ReasonForBan)

							local xPlayer = ESX.GetPlayerFromId(source)
							local webhookLink = cfg_webhook.LogsBan
						
							
								local content = {
									{
										["title"] = "**Logs Ban :**",
										["fields"] = {
											{ name = "**- Date & Heure :**", value = local_date },
											{ name = "- Joueurs ban :", value = pseudo.." ["..target.."] ["..identifier.."]" },
											{ name = "", value = "**Durée du bannissement :**\n"..duree.." Heure(s)\n\n**Raison du bannissement :**\n"..ReasonForBan.."\n\n**Auteur du ban :**\n"..test.." | "..xPlayer.identifier.."\n\n**BAN-ID :**\n"..banid},
										},
										["type"]  = "rich",
										["color"] = 65280,
										["footer"] =  {
										["text"] = "By t0nnnio | StoryRP",
										},
									}
								}
								PerformHttpRequest(webhookLink, function(err, text, headers) end, 'POST', json.encode({username = "Logs BAN", embeds = content}), { ['Content-Type'] = 'application/json' })

						else
							TriggerClientEvent("esx:showNotification", source, ("~b~Administration\n~s~"..Text.youban .. targetplayername .. Text.permban .. ReasonForBan))
							ban(source,banid,license,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,duree,ReasonForBan,1)
							DropPlayer(target, Text.yourpermban.."\n\n❓ Raison du bannissement: "..ReasonForBan)

							local xPlayer = ESX.GetPlayerFromId(source)
							local webhookLink = cfg_webhook.LogsBanPerm
						
								local content = {
									{
										["title"] = "**Logs Ban :**",
										["fields"] = {
											{ name = "**- Date & Heure :**", value = local_date },
											{ name = "- Joueurs ban :", value = pseudo.." ["..target.."] ["..identifier.."]" },
											{ name = "", value = "**Durée du bannissement :**\nPermanent\n\n**Raison du bannissement :**\n"..ReasonForBan.."\n\n**Auteur du ban :**\n"..test.." | "..xPlayer.identifier.."\n\n**BAN-ID :**\n"..banid},
										},
										["type"]  = "rich",
										["color"] = 16711680,
										["footer"] =  {
										["text"] = "By t0nnnio | StoryRP",
										},
									}
								}
								PerformHttpRequest(webhookLink, function(err, text, headers) end, 'POST', json.encode({username = "Logs BAN", embeds = content}), { ['Content-Type'] = 'application/json' })
						end
				
				else
					TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.invalidtime)
				end	
			else
				TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.invalidid)
			end
		else
			TriggerClientEvent("esx:showNotification", source, "~b~test\n~s~"..Text.invalidid)
		end
	else
		TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.cmdban)
	end
end

function cmdunban(source, args)
	if args[1] then
		local target = table.concat(args, " ")

		MySQL.Async.fetchAll('SELECT * FROM banlist WHERE ban_id like @ban_id', 
		{
			['@ban_id'] = target
		}, function(data)
			if data[1] then
				if #data > 1 then
					TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.toomanyresult)
					for i=1, #data, 1 do
						TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..data[i].targetplayername)
					end
				else
					MySQL.Async.execute(
					'DELETE FROM banlist WHERE ban_id = @ban_id',
					{
					['@ban_id']  = data[1].ban_id
					},
						function ()
						loadBanList()
						TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..data[1].targetplayername .. Text.isunban)

						local xPlayer = ESX.GetPlayerFromId(source)
						local webhookLink = cfg_webhook.LogsUnban
						
						
							local content = {
								{
									["title"] = "**Logs UnBan :**",
									["fields"] = {
										{ name = "**- Date & Heure :**", value = local_date },
										{ name = "- Joueurs unban :", value = data[1].targetplayername.." "..xPlayer.identifier.."\n\n**- Auteur du deban :**\n "..xPlayer.name.." ["..xPlayer.identifier.."]\n\n**- BAN-ID :**\n"..data[1].ban_id },
									},
									["type"]  = "rich",
									["color"] = 3093151,
									["footer"] =  {
									["text"] = "By t0nnnio | StoryRP",
									},
								}
							}
							PerformHttpRequest(webhookLink, function(err, text, headers) end, 'POST', json.encode({username = "Logs UnBan", embeds = content}), { ['Content-Type'] = 'application/json' })
							print('Le joueurs : '..data[1].targetplayername..' a bien été unban !')
					end)
				end
			end
		end)
	end
end

function deban(source, args, cb)
	if args[1] then
		local target = table.concat(args, " ")

		MySQL.Async.fetchAll('SELECT * FROM banlist WHERE ban_id like @ban_id', 
		{
			['@ban_id'] = target
		}, function(data)
			if data[1] then
				if #data > 1 then
					print(Text.toomanyresult)

					if (source ~= 0) then
						TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.toomanyresult)
					end

					for i=1, #data, 1 do
						print(data[i].targetplayername)
						if (source ~= 0) then
							TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..data[i].targetplayername)
						end
					end

					cb(Text.toomanyresult)
				else
					local xPlayer = ESX.GetPlayerFromId(source)
					local webhookLink = cfg_webhook.LogsUnban
						
						
					local content = {
						{
							["title"] = "**Logs UnBan :**",
							["fields"] = {
								{ name = "**- Date & Heure :**", value = local_date },
								{ name = "- Joueurs unban :", value = data[1].targetplayername },
								{ name = "- Auteur du deban :", value = "Console"},
								{ name = "- Ban ID :", value = data[1].ban_id},
							},
							["type"]  = "rich",
							["color"] = 3093151,
							["footer"] =  {
							["text"] = "By t0nnnio | StoryRP",
							},
						}
					}
					PerformHttpRequest(webhookLink, function(err, text, headers) end, 'POST', json.encode({username = "Logs UnBan", embeds = content}), { ['Content-Type'] = 'application/json' })
					
					MySQL.Async.execute(
					'DELETE FROM banlist WHERE ban_id = @ban_id',
					{
					['@ban_id']  = data[1].ban_id
					},
						function ()
						loadBanList()
						cb(data[1].targetplayername .. Text.isunban)
					end)
				end
			else
				print(Text.invalidname)
				cb(Text.invalidname)
			end
		end)
	else
		print(Text.invalidname)

		if (source ~= 0) then
			TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.invalidname)
		end

		cb(Text.invalidname)
	end
end

exports('debanPlayer', function(source, args, cb)
	return deban(source, args, cb)
end)


function cmdbanoffline(source, args)
	if args ~= "" then
		local ReasonForBan     = table.concat(args, " ", 3)
		local target           = args[1]
		local duree            = tonumber(args[2])
		local reason           = table.concat(args, " ",3)
		local sourceplayername = ""
		if source ~= 0 then
			sourceplayername = GetPlayerName(source)
		else
			sourceplayername = "Console"
		end
		if duree ~= "" then
			if target ~= "" then
				MySQL.Async.fetchAll('SELECT * FROM baninfo WHERE license = @license', 
				{
					['@license'] = target
				}, function(data)
					print(json.encode(data))
					if data[1] then
						if duree and duree < 365 then
							if ReasonForBan == "" then
								ReasonForBan = Text.noreason
							end
							if duree > 0 then --Here if not perm ban
								banOff(source,data[1].license,data[1].identifier,data[1].liveid,data[1].xblid,data[1].discord,data[1].playerip,data[1].playername,sourceplayername,duree,ReasonForBan,0) --Timed ban here
							else --Here if perm ban
								banOff(source,data[1].license,data[1].identifier,data[1].liveid,data[1].xblid,data[1].discord,data[1].playerip,data[1].playername,sourceplayername,duree,ReasonForBan,1) --Perm ban here
							end
						else
							TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.invalidtime)
						end
					else
						TriggerClientEvent("esx:showNotification", source, "~b~test 10\n~s~"..Text.invalidid)
					end
				end)
			else
				TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.invalidname)
			end
		else
			TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.invalidtime)
			TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.cmdbanoff)
		end
	else
		TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.cmdbanoff)
	end
end

function cmdsearch(source, args)
	local target = table.concat(args, " ")
	if target ~= "" then
		MySQL.Async.fetchAll('SELECT * FROM baninfo WHERE playername like @playername', 
		{
			['@playername'] = ("%"..target.."%")
		}, function(data)
			if data[1] then
				if #data < 50 then
					for i=1, #data, 1 do
						TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~ID Perm: "..data[i].id.."\nPseudo: "..data[i].playername)
					end
				else
					TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.toomanyresult)
				end
			else
				TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.nameinvalide)
			end
		end)
	else
		TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.nameinvalide)
	end
end

function cmdbanhistory(source, args)
	if args[1] and BanListHistory then
	local nombre = (tonumber(args[1]))
	local name   = table.concat(args, " ",1)
		if name ~= "" then
			if nombre and nombre > 0 then
				local expiration = BanListHistory[nombre].expiration
				local timeat     = BanListHistory[nombre].timeat
				local calcul1    = expiration - timeat
				local calcul2    = calcul1 / 86400
				local calcul2 	 = math.ceil(calcul2)
				local resultat   = tostring(BanListHistory[nombre].targetplayername.." , "..BanListHistory[nombre].sourceplayername.." , "..BanListHistory[nombre].reason.." , "..calcul2..Text.day.." , "..BanListHistory[nombre].added)

				TriggerClientEvent("esx:showNotification", source, ("~b~Administration\n~s~"..nombre .." : ".. resultat))
			else
				for i = 1, #BanListHistory, 1 do
					if (tostring(BanListHistory[i].targetplayername)) == tostring(name) then
						local expiration = BanListHistory[i].expiration
						local timeat     = BanListHistory[i].timeat
						local calcul1    = expiration - timeat
						local calcul2    = calcul1 / 86400
						local calcul2 	 = math.ceil(calcul2)					
						local resultat   = tostring(BanListHistory[i].targetplayername.." , "..BanListHistory[i].sourceplayername.." , "..BanListHistory[i].reason.." , "..calcul2..Text.day.." , "..BanListHistory[i].added)

						TriggerClientEvent("esx:showNotification", source, ("~b~Administration\n~s~"..i .." : ".. resultat))
					end
				end
			end
		else
			TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.invalidname)
		end
	else
		TriggerClientEvent("esx:showNotification", source, "~b~Administration\n~s~"..Text.cmdhistory)
	end
end

function sendToDiscord(canal,message)
	local DiscordWebHook = canal
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end

function banOff(source,license,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,duree,reason,permanent)
	local banid = (math.random(100, 99999)..'-'..math.random(100, 99999))
	if targetplayername == nil then
		return
	end
	MySQL.Async.fetchAll('SELECT * FROM banlist WHERE targetplayername like @playername', 
	{
		['@playername'] = ("%"..targetplayername.."%")
	}, function(data)
		if not data[1] then
			local expiration = duree * 3600 --calcul total expiration (en secondes)
			local timeat     = os.time()
			local added      = os.date()

			if expiration < os.time() then
				expiration = os.time()+expiration
			end
			
			table.insert(BanList, {
				ban_id     = banid,
				license    = license,
				identifier = identifier,
				liveid     = liveid,
				xblid      = xblid,
				discord    = discord,
				playerip   = playerip,
				reason     = reason,
				expiration = expiration,
				permanent  = permanent
			  })

			MySQL.Async.execute(
					'INSERT INTO banlist (license,ban_id,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,reason,expiration,timeat,permanent) VALUES (@license,@ban_id,@identifier,@liveid,@xblid,@discord,@playerip,@targetplayername,@sourceplayername,@reason,@expiration,@timeat,@permanent)',
					{ 
					['@license']          = license,
					['@ban_id']          = banid,
					['@identifier']       = identifier,
					['@liveid']           = liveid,
					['@xblid']            = xblid,
					['@discord']          = discord,
					['@playerip']         = playerip,
					['@targetplayername'] = targetplayername,
					['@sourceplayername'] = sourceplayername,
					['@reason']           = reason,
					['@expiration']       = expiration,
					['@timeat']           = timeat,
					['@permanent']        = permanent,
					},
					function ()
			end)


			local xPlayer = ESX.GetPlayerFromId(source)
			local webhookLink = cfg_webhook.LogsBanOff
						
							
			local content = {
				{
					["title"] = "**Logs Ban Offline :**",
					["fields"] = {
						{ name = "**- Date & Heure :**", value = local_date },
						{ name = "", value = "**Joueurs ban :**\n"..targetplayername.." | "..license.."**\n\nDurée du bannissement :**\n"..duree.."Heure(s)\n\n**Raison du bannissement :**\n"..reason.."\n\n**Auteur du ban :**\n"..xPlayer.name.." | "..xPlayer.identifier.."\n\n**BAN-ID :**\n"..banid },
					},
					["type"]  = "rich",
					["color"] = 65280,
					["footer"] =  {
					["text"] = "By t0nnnio | StoryRP",
					},
				}
			}
			PerformHttpRequest(webhookLink, function(err, text, headers) end, 'POST', json.encode({username = "Logs BAN", embeds = content}), { ['Content-Type'] = 'application/json' })

			TriggerClientEvent("esx:showNotification", source, ("~b~Administration\n~s~"..Text.youban .. targetplayername .. Text.during .. duree .. Text.forr .. reason))

			MySQL.Async.execute(
					'INSERT INTO banlisthistory (license,ban_id,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,reason,added,expiration,timeat,permanent) VALUES (@license,@ban_id,@identifier,@liveid,@xblid,@discord,@playerip,@targetplayername,@sourceplayername,@reason,@added,@expiration,@timeat,@permanent)',
					{ 
					['@license']          = license,
					['@ban_id']          = banid,
					['@identifier']       = identifier,
					['@liveid']           = liveid,
					['@xblid']            = xblid,
					['@discord']          = discord,
					['@playerip']         = playerip,
					['@targetplayername'] = targetplayername,
					['@sourceplayername'] = sourceplayername,
					['@reason']           = reason,
					['@added']            = added,
					['@expiration']       = expiration,
					['@timeat']           = timeat,
					['@permanent']        = permanent,
					},
					function ()
			end)
			BanListHistoryLoad = false
		else
			TriggerClientEvent("esx:showNotification", source, ("~b~Administration\n~s~"..targetplayername .. Text.alreadyban .. reason))
		end
	end)
end

function ban(source,banid,license,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,duree,reason,permanent)
	if targetplayername == nil then
		return
	end
	MySQL.Async.fetchAll('SELECT * FROM banlist WHERE targetplayername like @playername', 
	{
		['@playername'] = ("%"..targetplayername.."%")
	}, function(data)
		if not data[1] then
			local expiration = duree * 3600 --calcul total expiration (en secondes)
			local timeat     = os.time()
			local added      = os.date()

			if expiration < os.time() then
				expiration = os.time()+expiration
			end
			
			table.insert(BanList, {
				ban_id     = banid,
				license    = license,
				identifier = identifier,
				liveid     = liveid,
				xblid      = xblid,
				discord    = discord,
				playerip   = playerip,
				reason     = reason,
				expiration = expiration,
				permanent  = permanent
			  })
			MySQL.Async.execute(
					'INSERT INTO banlist (license,ban_id,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,reason,expiration,timeat,permanent) VALUES (@license,@ban_id,@identifier,@liveid,@xblid,@discord,@playerip,@targetplayername,@sourceplayername,@reason,@expiration,@timeat,@permanent)',
					{ 
					['@license']          = license,
					['@ban_id']          = banid,
					['@identifier']       = identifier,
					['@liveid']           = liveid,
					['@xblid']            = xblid,
					['@discord']          = discord,
					['@playerip']         = playerip,
					['@targetplayername'] = targetplayername,
					['@sourceplayername'] = sourceplayername,
					['@reason']           = reason,
					['@expiration']       = expiration,
					['@timeat']           = timeat,
					['@permanent']        = permanent,
					},
					function ()
			end)

			MySQL.Async.execute(
					'INSERT INTO banlisthistory (license,ban_id,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,reason,added,expiration,timeat,permanent) VALUES (@license,@ban_id,@identifier,@liveid,@xblid,@discord,@playerip,@targetplayername,@sourceplayername,@reason,@added,@expiration,@timeat,@permanent)',
					{ 
					['@license']          = license,
					['@ban_id']          = banid,
					['@identifier']       = identifier,
					['@liveid']           = liveid,
					['@xblid']            = xblid,
					['@discord']          = discord,
					['@playerip']         = playerip,
					['@targetplayername'] = targetplayername,
					['@sourceplayername'] = sourceplayername,
					['@reason']           = reason,
					['@added']            = added,
					['@expiration']       = expiration,
					['@timeat']           = timeat,
					['@permanent']        = permanent,
					},
					function ()
			end)
			
			BanListHistoryLoad = false
		else
			TriggerClientEvent("esx:showNotification", source, ("~b~Administration\n~s~"..targetplayername .. Text.alreadyban .. reason))
		end
	end)
end


Citizen.CreateThread(function()
	while true do
		Wait(240000)
		loadBanList()
	end
end)

function loadBanList()
    -- Vérifier si la connexion à la base de données est établie
    if not MySQL then
        print("Erreur : Connexion à la base de données non établie.")
        return
    end

    -- Exécuter la requête de manière asynchrone
    MySQL.Async.fetchAll('SELECT license, ban_id, identifier, liveid, xblid, discord, playerip, reason, expiration, sourceplayername, permanent FROM banlist', {}, function(data)
        -- Vérifier si des données ont été récupérées
        if data then
            BanList = {}

            -- Parcourir les résultats et les insérer dans la liste des bannis
            for i = 1, #data, 1 do
                table.insert(BanList, {
                    license = data[i].license,
                    ban_id = data[i].ban_id,
                    identifier = data[i].identifier,
                    liveid = data[i].liveid,
                    xblid = data[i].xblid,
                    discord = data[i].discord,
                    playerip = data[i].playerip,
                    reason = data[i].reason,
                    expiration = data[i].expiration,
                    sourceplayername = data[i].sourceplayername,
                    permanent = data[i].permanent
                })
            end

			print("Liste des bannis chargée avec succès.")
        else
            print("Aucune donnée trouvée dans la table des bannis.")
        end
    end, function(error)
        -- Gestion des erreurs lors de l'exécution de la requête
        print("Erreur lors du chargement de la liste des bannis : " .. tostring(error))
    end)
end

function loadBanListHistory()
    MySQL.Async.fetchAll('SELECT * FROM banlisthistory', {}, function(data)
        BanListHistory = {}

        for _, record in ipairs(data) do
            table.insert(BanListHistory, {
                license = record.license,
                identifier = record.identifier,
                liveid = record.liveid,
                xblid = record.xblid,
                discord = record.discord,
                playerip = record.playerip,
                targetplayername = record.targetplayername,
                sourceplayername = record.sourceplayername,
                reason = record.reason,
                added = record.added,
                expiration = record.expiration,
                permanent = record.permanent,
                timeat = record.timeat
            })
        end
    end)
end

function deletebanned(license)
    MySQL.Async.execute('DELETE FROM banlist WHERE license = @license', {
        ['@license'] = license
    }, function(affectedRows)
        if affectedRows > 0 then
            print('Le joueur avec la licence ' .. license .. ' a été supprimé de la liste des bannis.')
            loadBanList()
        else
            print('Aucun enregistrement trouvé pour la licence ' .. license .. '.')
        end
    end)
end

local function doublecheck(player)
    local identifiers = {
        license = "n/a",
        steamID = "n/a",
        liveid = "n/a",
        xblid = "n/a",
        discord = "n/a",
        playerip = "n/a"
    }

    for _, id in ipairs(GetPlayerIdentifiers(player)) do
        for key in pairs(identifiers) do
            if id:match("^" .. key) then
                identifiers[key] = id
                break
            end
        end
    end

    local function isBanned(banEntry)
        if banEntry.permanent == 1 then
            return true
        elseif banEntry.expiration > os.time() then
            return true
        elseif banEntry.expiration < os.time() and banEntry.permanent == 0 then
            deletebanned(identifiers.license)
            return false
        end
        return false
    end

    for _, banEntry in ipairs(BanList) do
        for key, id in pairs(identifiers) do
            if banEntry[key] == id and isBanned(banEntry) then
                DropPlayer(player, Text.yourban .. banEntry.reason)
                return
            end
        end
    end
end