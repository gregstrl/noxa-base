local function BuildAdminMenus()
    local AdminStorage = Shared.Storage:Register("Administration");

    local main_menu = AdminStorage:Set("admin_main", RageUI.AddMenu("", "Administration"));
    local reports_menu = AdminStorage:Set("admin_reports", RageUI.AddSubMenu(main_menu, "", "Administration : Reports"));
    AdminStorage:Set("admin_report_selected", RageUI.AddSubMenu(reports_menu, "", "Administration : Report"));
    AdminStorage:Set("admin_announcements", RageUI.AddSubMenu(main_menu, "", "Administration : Annonces"));
    AdminStorage:Set("admin_builder", RageUI.AddSubMenu(main_menu, "", "Administration : Builders"));
    AdminStorage:Set("admin_vehicles", RageUI.AddSubMenu(main_menu, "", "Administration : Véhicules"));
    AdminStorage:Set("admin_sanctions", RageUI.AddSubMenu(main_menu, "", "Administration : Sanctions"));
    AdminStorage:Set("admin_preferences_submenu", RageUI.AddSubMenu(main_menu, "", "Administration : Préférences"));

    local players_menu = AdminStorage:Set("admin_players", RageUI.AddSubMenu(main_menu, "", "Administration : Liste des joueurs"));
    local player_menu_selected = AdminStorage:Set("admin_player_selected", RageUI.AddSubMenu(players_menu, "", "Administration :  Intéractions"));
    AdminStorage:Set("admin_player_selected_accounts", RageUI.AddSubMenu(player_menu_selected, "", "Administration : Finances"));

    local player_menu_selected_inventory = AdminStorage:Set("admin_player_selected_inventory", RageUI.AddSubMenu(player_menu_selected, "", "Administration : Inventaire"));
    AdminStorage:Set("admin_player_selected_inventory_give", RageUI.AddSubMenu(player_menu_selected_inventory, "", "Administration : Items"));

    local preferences_menu = AdminStorage:Set("admin_preferences", RageUI.AddSubMenu(main_menu, "", "Administration : Gestion Joueur"));
    AdminStorage:Set("admin_player_selected_me", RageUI.AddSubMenu(preferences_menu, "", "Administration : Mon personnage"));
    AdminStorage:Set("admin_sanctions_jail", RageUI.AddSubMenu(AdminStorage:Get("admin_sanctions"), "", "Administration : Sanctions - Jail"));
    AdminStorage:Set("admin_sanctions_ban", RageUI.AddSubMenu(AdminStorage:Get("admin_sanctions"), "", "Administration : Sanctions - Ban"));
    AdminStorage:Set("admin_sanctions_warn", RageUI.AddSubMenu(AdminStorage:Get("admin_sanctions"), "", "Administration : Sanctions - Warn"));
    AdminStorage:Set("admin_sanctions_jail_logs", RageUI.AddSubMenu(AdminStorage:Get("admin_sanctions_jail"), "", "Administration : Logs des jails"));
    AdminStorage:Set("admin_report_sounds", RageUI.AddSubMenu(AdminStorage:Get("admin_preferences_submenu"), "", "Administration : Sons de notification"));
    AdminStorage:Set("admin_gamertag_options", RageUI.AddSubMenu(AdminStorage:Get("admin_preferences_submenu"), "", "Administration : Options Gamertag"));
    AdminStorage:Set("admin_noclip_options", RageUI.AddSubMenu(AdminStorage:Get("admin_preferences_submenu"), "", "Administration : Options Noclip"));

    local supremacy_menu = AdminStorage:Set("admin_supremacy", RageUI.AddSubMenu(main_menu, "", "Administration : Suprématie"));
    local supremacy_menu_group = AdminStorage:Set("admin_supremacy_group", RageUI.AddSubMenu(supremacy_menu, "", "Administration : Grades"));
    AdminStorage:Set("admin_supremacy_group_create", RageUI.AddSubMenu(supremacy_menu_group, "", "Administration : Création"));
    AdminStorage:Set("admin_supremacy_group_manage", RageUI.AddSubMenu(supremacy_menu_group, "", "Administration : Gestion"));

    AdminStorage:Set("admin_supremacy_ped", RageUI.AddSubMenu(supremacy_menu, "", "Administration : Ped"));
    
    return true
end

BuildAdminMenus()

RegisterNetEvent("Koy:RebuildAdminMenus")
AddEventHandler("Koy:RebuildAdminMenus", function()
    BuildAdminMenus()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    
    Wait(1000)
    BuildAdminMenus()
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    
    Wait(1000)
    BuildAdminMenus()
end)