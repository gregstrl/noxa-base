local AdminStorage = Shared.Storage:Get("Administration");
local announcements_menu = AdminStorage:Get("admin_announcements");

announcements_menu:IsVisible(function(Items)
    local client_server_id = Client.Player:GetServerId()
    local client_player = Client.PlayersManager:GetFromId(client_server_id)
    local hasPermission = Client.Admin:GroupHasPermission(client_player.group, "make_announce")
    
    Items:Button("Faire une Annonce", nil, {}, hasPermission, {
        onSelected = function()
            if not hasPermission then
                ESX.ShowNotification("[~r~Impossible~h~] Vous n'avez pas la permission de faire des annonces")
                return
            end
            
            local message = KeyboardInput("Entrez le message de l'annonce", "", 500)
            if message and message ~= "" then
                TriggerServerEvent('admin:sendAnnouncement', message)
                ESX.ShowNotification('[~g~Succès~s~] Annonce envoyée avec succès')
            end
        end
    });
end);

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        return result
    else
        Wait(500)
        return nil
    end
end 