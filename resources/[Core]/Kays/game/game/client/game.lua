--[[
  This file is part of wise RolePlay.
  Copyright (c) wise RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = exports["Framework"]:getSharedObject();

local IsInPVP = false;

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

local playercount = 0;
CreateThread(function()
    while true do
        Wait(10000) -- Attendre 10 secondes avant de mettre à jour l'interface

        -- Mettre à jour le texte dans l'interface sans appel serveur
        AddTextEntry('FE_THDR_GTAO', ("~b~wise ~c~| ~s~%s~s~ ~c~| ~s~ ID : ~b~%s~s~ ~c~| ~s~ DISCORD.GG/~b~wise~s~"):format(
            GetPlayerName(PlayerId()),            -- Nom du joueur
            GetPlayerServerId(PlayerId())         -- ID du joueur sur le serveur
        ))

    end
end)


Citizen.CreateThread(function()
	SetDiscordAppId(1425334219285991445)
	SetDiscordRichPresenceAsset('wise')
	SetRichPresence(GetPlayerName(PlayerId()) .." ["..GetPlayerServerId(PlayerId()).."]")
	SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/wisefa")
	SetDiscordRichPresenceAction(1, "Connections", "https://cfx.re/join/8735dv")
	AddTextEntry('PM_PANE_LEAVE', 'Retourner sur la liste des ~b~serveurs.')
	AddTextEntry('PM_PANE_QUIT', 'Quitter ~b~FiveM')
	AddTextEntry('PM_SCR_MAP', 'CARTE')
	AddTextEntry('PM_SCR_GAM', 'DOUANE')
	AddTextEntry('PM_SCR_INF', 'LOGS DU JEU')
	AddTextEntry('PM_SCR_SET', 'CONFIG FIVEM')
	AddTextEntry('PM_SCR_STA', 'STATISTIQUES')
	AddTextEntry('PM_SCR_RPL', '~b~Éditeur ∑')
	AddTextEntry("PM_PANE_CFX", "~b~wise")
	
	local wait = 15
	local count = 60
	local KO = false

	while true do
	   --local isHurt = exports.GameCore:IsHurt()
		if (not IsInPVP) then
			if IsPedInMeleeCombat(PlayerPedId()) then
				if GetEntityHealth(PlayerPedId()) < 115 then
				   ESX.ShowAdvancedNotification("Vous êtes assommé")
					wait = 15
					KO = true
					SetEntityHealth(PlayerPedId(), 116)
				end
			end

			if KO then
				SetPlayerInvincible(PlayerId(), true)
				DisablePlayerFiring(PlayerId(), true)
				SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
				ResetPedRagdollTimer(PlayerPedId())

				if wait >= 0 then
					count = count - 1

					if count == 0 then
						count = 60
						wait = wait - 1
						SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 4)
					end
				else
					SetPlayerInvincible(PlayerId(), false)
					KO = false
				end
			end
		end
	   Wait(0)
   end
end)
