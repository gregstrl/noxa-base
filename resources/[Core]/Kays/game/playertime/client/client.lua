local PlayerTime = 0 -- Temps total joué (en millisecondes)
local previousTime = 0 -- Temps précédent pour comparer les intervalles

-- Fonction pour convertir le temps en heures, minutes et secondes
function ConvertirTemps(milliseconds)
    local temps = {}

    local secondes = math.floor(milliseconds / 1000)
    local minutes = math.floor(secondes / 60)
    local heures = math.floor(minutes / 60)

    temps.heures = heures
    temps.minutes = minutes % 60
    temps.secondes = secondes % 60

    return temps
end

-- Événement pour démarrer le compteur lorsqu'on reçoit le temps initial
RegisterNetEvent("PlayerTime:StartTimer", function(PlayedTime)
    if type(PlayedTime) ~= "number" or PlayedTime < 0 then
        print("^1[ERROR]^7 Temps de jeu reçu invalide :", PlayedTime)
        return
    end

    PlayerTime = PlayedTime
    previousTime = PlayedTime
    StartTimer() -- Lance le timer
end)

-- Fonction pour démarrer le timer
function StartTimer()
    CreateThread(function()
        while true do
            Wait(1000) -- Attendre une seconde
            PlayerTime = PlayerTime + 1000 -- Ajouter une seconde au compteur

            -- Si une minute s'est écoulée, mettre à jour le serveur
            if PlayerTime - previousTime >= 60000 then
                TriggerServerEvent("PlayerTime:UpdateTimer", PlayerTime)
                previousTime = PlayerTime
            end
        end
    end)
end

-- Commande pour afficher le temps joué
RegisterCommand("mytime", function()
    local time = ConvertirTemps(PlayerTime)
    -- Notification pour l'utilisateur (ajustez le format si nécessaire)
    TriggerEvent('esx:showNotification', "Vous avez joué " .. time.heures .. " heures, " .. time.minutes .. " minutes.")
end)
