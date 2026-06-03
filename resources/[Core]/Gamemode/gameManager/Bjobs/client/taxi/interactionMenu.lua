---
--- @author Azagal
--- Create at [28/10/2022] 15:14:47
--- Current project [Koy-V1]
--- File name [interactionMenu]
---

Taxi = Taxi or {}

function Taxi:interactionMenu()
    local mainMenu = RageUI.CreateMenu("", "Menu d'intéractions")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while (mainMenu ~= nil) do
        RageUI.IsVisible(mainMenu, function()

            RageUI.Checkbox("Entreprise Ouverte", nil, Society.List["taxi"].state, {}, {
				onChecked = function()
					TriggerServerEvent('entreprise:setStatus', "taxi", true)
                    TriggerServerEvent('Ouvre:taxi')
				end,
				onUnChecked = function()
					TriggerServerEvent('entreprise:setStatus', "taxi", false)
                    TriggerServerEvent('Ferme:taxi')
				end
			})
            RageUI.Button("Annonce ~g~[Recrutement]", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Recrutement:taxi')
                end
            })

            RageUI.Line()

            RageUI.Checkbox("Mission PNJ", nil, Taxi.missionData.actived, {}, {
                onChecked = function()
                    TriggerServerEvent("Taxi:mission:retreive")
                end,
                onUnChecked = function()
                    TriggerServerEvent("Taxi:mission:stop")
                end
            });
            RageUI.Button("Faire une ~o~Facture", nil, {RightLabel = ""}, true , {
                onSelected = function()
                    local montant = KeyboardInputsasp("Montant:", 'Indiquez un montant', '', 7)
                    if tonumber(montant) == nil then
                        ESX.ShowNotification("[~r~Impossible~h~] Montant invalide")
                        return false
                    else
                        amount = (tonumber(montant))
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
                            ESX.ShowNotification("[~r~Impossible~h~] Personne à proximité")
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'taxi', "Taxi", amount)
						end
                    end
                end
            })

        end)

        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType('mainMenu', true)
        end

        Wait(0)
    end
end

local IsInPVP = false;

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F6','taxi_interactionMenu', '[TAXI] Menu d\'intéractions', function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'taxi' then
        if (not IsInPVP) then
            Taxi:interactionMenu()
        end
    end
end)