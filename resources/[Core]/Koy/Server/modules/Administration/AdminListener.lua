if not Enums or not Enums.Administration or not Enums.Administration.Server then
    Enums = Enums or {}
    Enums.Administration = Enums.Administration or {}
    Enums.Administration.Server = Enums.Administration.Server or {}
    Enums.Administration.Server.RequestOpenMenu = Enums.Administration.Server.RequestOpenMenu or 'Administration:RequestOpenMenu'
end

-- Définition de l'événement d'ouverture du menu admin
RegisterNetEvent('Koy:Administration_RequestOpenMenu')
AddEventHandler('Koy:Administration_RequestOpenMenu', function()
    local source = source
    
    -- Vérifier si le joueur est un admin
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and (xPlayer.getGroup() ~= "user") then
        -- Envoyer les événements pour rendre le menu prêt et l'ouvrir
        TriggerClientEvent("Admin:MenuReady", source)
        Wait(200)
        TriggerClientEvent("Admin:ForceOpenMenu", source)
    end
end)

-- Attendre que le script soit complètement chargé avant d'enregistrer les autres événements
CreateThread(function()
    Wait(2000)
    
    -- Essayer d'enregistrer l'événement avec Shared.Events s'il est disponible
    if Shared and Shared.Events and type(Shared.Events.OnClient) == "function" then
        if Enums and Enums.Administration and Enums.Administration.Server then
            Shared.Events:OnClient(Enums.Administration.Server.RequestOpenMenu, function(source)
                local xPlayer = ESX.GetPlayerFromId(source)
                if xPlayer and (xPlayer.getGroup() ~= "user") then
                    TriggerClientEvent("Admin:MenuReady", source)
                    Wait(200)
                    TriggerClientEvent("Admin:ForceOpenMenu", source)
                end
            end)
        end
    end
end)

-- S'inscrire à l'événement de redémarrage de ressource
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    
    -- Signaler aux clients en jeu que le serveur est prêt à recevoir des demandes de menu admin
    TriggerClientEvent("Admin:ServerReady", -1)
end) 