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


-- MENU FUNCTION --

local open = false 
local club77Main2 = RageUI.CreateMenu('', 'club77')
local subMenu5 = RageUI.CreateSubMenu(club77Main2, "Annonces", "Interaction")
club77Main2.Display.Header = true 
club77Main2.Closed = function()
  open = false
end

function KeyboardInputclub77(entryTitle, textEntry, inputText, maxLength)
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


local society = {
    label = "Club 77",
    name = "club77",
}


local IndexStrip = 1

function OpenMenuclub77()
	if open then 
		open = false
		RageUI.Visible(club77Main2, false)
		return
	else
		open = true 
		RageUI.Visible(club77Main2, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(club77Main2,function() 

			RageUI.Checkbox("Entreprise Ouverte", nil, Society.List["club77"].state, {}, {
				onChecked = function()
					TriggerServerEvent('entreprise:setStatus', "club77", true)
					TriggerServerEvent('Ouvre:club77')
				end,
				onUnChecked = function()
					TriggerServerEvent('entreprise:setStatus', "club77", false)
					TriggerServerEvent('Ferme:club77')
				end
			})
			RageUI.Button("Annonce ~g~[Recrutement]", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerServerEvent('Recrutement:club77')
				end
			})
			RageUI.Button("Annonce ~o~[Personnaliser]", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					local input = exports.ox_lib:inputDialog('Message personnalisé', {
						{type = 'input', label = 'Message', description = 'Entrez votre message (emojis autorisés)', required = true, min = 1, max = 200}
					})
					if input and input[1] then
						TriggerServerEvent('Personnaliser:club77', input[1])
					end
				end
			})
			RageUI.Line()
			RageUI.Button("Faire une ~o~Facture", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local montant = KeyboardInputclub77("Montant:", 'Indiquez un montant', '', 6)
					local amount = 0;
                    if tonumber(montant) == nil then
						ESX.ShowNotification("[~s~Impossible~s~] Montant invalide")
                        return false
                    else
                        amount = (tonumber(montant))
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
							ESX.ShowNotification("[~s~Impossible~s~] Personne autour de vous")
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'club77', 'club77', amount)
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




-- FUNCTION BILLING --

function OpenBillingMenu2()

	ESX.UI.Menu.Open(
	  'dialog', GetCurrentResourceName(), 'billing',
	  {
		title = "Facture"
	  },
	  function(data, menu)
	  
		local amount = tonumber(data.value)
		local player, distance = ESX.Game.GetClosestPlayer()
  
		if player ~= -1 and distance <= 3.0 then
  
		  menu.close()
		  if amount == nil then
			  ESX.ShowNotification("[~s~Impossible~s~] Montant invalide")
		  else
			local playerPed        = PlayerPedId()
			TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
			Wait(5000)
			  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'club77', ('club77'), amount)
		  end
  
		else
		 	ESX.ShowNotification("[~s~Impossible~s~] Aucun joueur à proximitée")
		end
  
	  end,
	  function(data, menu)
		  menu.close()
	  end
	)
  end

-- OUVERTURE DU MENU --

local IsInPVP = false;

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F6', 'club77', 'Menu job Club 77', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'club77' then
		if (not IsInPVP) then
			OpenMenuclub77()
		end
	end
end)