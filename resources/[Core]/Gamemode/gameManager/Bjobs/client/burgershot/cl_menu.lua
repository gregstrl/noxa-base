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
local mainMenu8 = RageUI.CreateMenu('', 'Interaction')
local subMenu8 = RageUI.CreateSubMenu(mainMenu8, "", "Interaction")
local subMenu10 = RageUI.CreateSubMenu(mainMenu8, "", "Interaction")
mainMenu8.Display.Header = true 
mainMenu8.Closed = function()
  open = false
end



function OpenF6BurgerShot()
	if open then 
		open = false
		RageUI.Visible(mainMenu8, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu8, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu8,function() 

			RageUI.Checkbox("Entreprise Ouverte", nil, Society.List["burgershot"].state, {}, {
				onChecked = function()
					TriggerServerEvent('entreprise:setStatus', "burgershot", true)
					TriggerServerEvent('Ouvre:BurgerShot')
				end,
				onUnChecked = function()
					TriggerServerEvent('entreprise:setStatus', "burgershot", false)
					TriggerServerEvent('Ferme:BurgerShot')
				end
			})
			RageUI.Button("Annonce ~y~Recrutement", nil, {RightLabel = "→"}, not codesCooldown3, {
				onSelected = function()
					codesCooldown3 = true 
					TriggerServerEvent('Recrutement:BurgerShot')
				end
			})

			RageUI.Button("Annonce ~o~Personnaliser", nil, {RightLabel = "→"}, not codesCooldown3, {
				onSelected = function()
					codesCooldown3 = true 
					local input = exports.ox_lib:inputDialog('Message personnalisé', {
						{type = 'input', label = 'Message', description = 'Entrez votre message (emojis autorisés)', required = true, min = 1, max = 200}
					})
					if input and input[1] then
						TriggerServerEvent('Personnaliser:BurgerShot', input[1])
					end
				end
			})
			
			RageUI.Line()

			RageUI.Button("Faire une Facture", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local montant = KeyboardInputPolice("Montant:", 'Indiquez un montant', '', 7)
                    if tonumber(montant) == nil then
						ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                        return false
                    else
                        amount = (tonumber(montant))
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
							ESX.ShowNotification("[~r~Impossible~h~] Personne autour de vous")
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'burgershot', 'BurgerShot', amount)
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

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Wait(500) 
        blockinput = false
        return result 
    else
        Wait(500) 
        blockinput = false 
        return nil 
    end
end

-- OUVERTURE DU MENU --

Keys.Register('F6', 'burgershot', 'Ouvrir le menu burgershot', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
		OpenF6BurgerShot()
	end
end)
