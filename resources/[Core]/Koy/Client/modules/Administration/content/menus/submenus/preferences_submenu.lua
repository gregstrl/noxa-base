local AdminStorage = Shared.Storage:Get("Administration");

---@type UIMenu
local preferences_submenu = AdminStorage:Get("admin_preferences_submenu");

preferences_submenu:IsVisible(function(Items)
    Items:Checkbox("Gamertag des joueurs", nil, Client.Admin:GetPreferenceFromName("gamertag"), {}, {
        onSelected = function(Checked)
            Client.Admin:SetPreferenceFromName("gamertag", Checked)
            Wait(10)
        end
    });

    Items:Checkbox("Afficher mon gamertag", nil, Client.Admin:GetPreferenceFromName("own_gamertag"), {}, {
        onSelected = function(Checked)
            SetResourceKvp(("admin:preferences:%s"):format("own_gamertag"), tostring(Checked))
            
            CreateThread(function()
                Wait(100)
                if Client.Admin:IsInStaffMode() and Client.Admin.Utils then
                    Client.Admin.Utils:UpdateTags()
                end
            end)
        end
    });

    Items:Checkbox("Blip des joueurs", nil, Client.Admin:GetPreferenceFromName("blip"), {}, {
        onSelected = function(Checked)
            Client.Admin:SetPreferenceFromName("blip", Checked)
            Wait(10)
        end
    });

    Items:Checkbox("Afficher le nombre de reports", nil, Client.Admin:GetPreferenceFromName("report:number"), {}, {
        onSelected = function(Checked)
            Client.Admin:SetPreferenceFromName("report:number", Checked)
        end
    });

    Items:Button("Notification report", "Choisir le son pour les notifications de report", {RightLabel = ">"}, true, {
    }, AdminStorage:Get("admin_report_sounds"));
    
    Items:Button("Options Gamertag", "Choisir le style d'affichage des gamertags", {RightLabel = ">"}, true, {
    }, AdminStorage:Get("admin_gamertag_options"));
    
    Items:Button("Options Noclip", "Choisir le style de noclip à utiliser", {RightLabel = ">"}, true, {
    }, AdminStorage:Get("admin_noclip_options"));
end) 