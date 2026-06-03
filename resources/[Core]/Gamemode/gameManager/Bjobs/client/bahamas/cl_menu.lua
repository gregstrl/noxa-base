--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(10)
    end

    while ESX.GetPlayerData().job == nil do
		Wait(10)
    end

    if ESX.IsPlayerLoaded() then
		ESX.PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local open = false 
local MainMenu = RageUI.CreateMenu('', 'Bahamas')

MainMenu.Display.Header = true 
MainMenu.Closed = function()
	open = false
end

local function KeyboardInputBahamas(entryTitle, textEntry, inputText, maxLength)
	AddTextEntry(entryTitle, textEntry)
	DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		return result
	else
		return nil
	end
end

local function OpenBahamasMenu()
	if open then 
		open = false
		RageUI.Visible(MainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(MainMenu, true)

		CreateThread(function()
			while open do 
				RageUI.IsVisible(MainMenu,function() 

					RageUI.Checkbox("Entreprise Ouverte", nil, Society.List["bahamas"].state, {}, {
						onChecked = function()
							TriggerServerEvent('entreprise:setStatus', "bahamas", true)
							TriggerServerEvent('Ouvre:Bahamas')
						end,
						onUnChecked = function()
							TriggerServerEvent('entreprise:setStatus', "bahamas", false)
							TriggerServerEvent('Ferme:Bahamas')
						end
					})
					RageUI.Button("Annonce ~g~[Recrutement]", nil, {RightLabel = "→"}, true , {
						onSelected = function()
							TriggerServerEvent('Recrutement:Bahamas')
						end
					})

					RageUI.Button("Annonce ~b~[Personnaliser]", nil, {RightLabel = "→"}, true , {
						onSelected = function()
							local input = exports.ox_lib:inputDialog('Message personnalisé', {
								{type = 'input', label = 'Message', description = 'Entrez votre message (emojis autorisés)', required = true, min = 1, max = 200}
							})
							
							if input and input[1] then
								TriggerServerEvent('Personnaliser:Bahamas', input[1])
							end
						end
					})
					
					RageUI.Line()

					RageUI.Button("Faire une ~o~Facture", nil, {RightLabel = "→"}, true , {
						onSelected = function()
							local montant = KeyboardInputBahamas("Montant:", 'Indiquez un montant', '', 6)
							local amount = 0

							if tonumber(montant) == nil then
								ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
								return false
							else
								amount = (tonumber(montant))
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
								if closestPlayer == -1 or closestDistance > 3.0 then
									ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
								else
									TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'bahamas', 'Bahamas', amount)
								end
							end
						end
					})
				end)
				Wait(0)
			end
		end)
	end
end

local IsInPVP = false;

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F6', 'BahamasMenu', 'Menu job Bahamas', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'bahamas' then
		if (not IsInPVP) then
			OpenBahamasMenu()
		end
	end
end)