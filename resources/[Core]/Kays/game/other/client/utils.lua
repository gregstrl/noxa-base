Citizen.CreateThread(function()
    DisableIdleCamera(true) -- Désactive la caméra inactive une fois
    SetHudColour(116, 0, 85, 255, 255)
end)

-- Fonction pour afficher la notification
local function notifyShopReminder()
    TriggerEvent('esx:showNotification', ' N\'hésitez pas à visiter notre boutique avec la commande F1 !')
end

-- Lancer un timer toutes les 25 minutes pour envoyer la notification
Citizen.CreateThread(function()
    while true do
        Wait(30 * 60 * 1000)  -- Attendre 30 minutes en millisecondes
        notifyShopReminder()  -- Envoie la notification
    end
end)

-- Pour ne pas perdre c'est lunettes/chapeaux etc quand vous prennez un coup de poing etc...
CreateThread(function()
    local playerPed = PlayerPedId()
    SetPedCanLosePropsOnDamage(playerPed, false, 0)

    -- Écouter les événements où le ped pourrait être recréé
    AddEventHandler('playerSpawned', function()
        local newPlayerPed = PlayerPedId()
        SetPedCanLosePropsOnDamage(newPlayerPed, false, 0)
        SetWeaponDamageModifierThisFrame(-1553120962, 0.0) -- Désactive L'anticarkill
    end)
end)


-- Disable Weapons InCar 

local isActive = false
local player = PlayerPedId()
local vehicle = nil

AddEventHandler("gameEventTriggered", function(name, args)
    if name == "CEventNetworkPlayerEnteredVehicle" then
        player = PlayerPedId()
        vehicle = GetVehiclePedIsIn(player, false)

        -- Démarrer un seul thread pour gérer les contrôles
        if not isActive then
            isActive = true
            CreateThread(function()
                while isActive do
                    if IsPedInAnyVehicle(player) then
                        vehicle = GetVehiclePedIsIn(player, false)
                        if GetPedInVehicleSeat(vehicle, -1) == player then
                            -- Désactiver les contrôles d'armes uniquement si le joueur est conducteur
                            DisableControlAction(0, 330, true)  -- Tirer avec les armes
                            DisableControlAction(0, 68, true)   -- Tirer avec les armes à feu
                            DisableControlAction(0, 25, true)   -- Clic droit
                            DisableControlAction(0, 346, true)  -- Tirer avec les armes
                            DisableControlAction(0, 347, true)  -- Tirer avec les armes
                            DisablePlayerFiring(player, true)   -- Désactiver le tir du joueur
                        else
                            -- Si ce n'est pas le conducteur, on vérifie la vitesse
                            local carSpeed = GetEntitySpeed(vehicle) * 3.6  -- Convertir m/s en km/h
                            if carSpeed >= 60 then
                                DisableControlAction(0, 68, true)
                                DisableControlAction(0, 91, true)
                                DisableControlAction(0, 92, true)
                                DisableControlAction(0, 25, true)
                                DisableControlAction(0, 346, true)
                                DisableControlAction(0, 347, true)
                                DisablePlayerFiring(player, true)
                            end
                        end
                    else
                        -- Si le joueur n'est pas dans un véhicule, arrêter le thread
                        isActive = false
                    end
                    Wait(0)  -- Répéter à chaque frame
                end
            end)
        end
    end
end)



