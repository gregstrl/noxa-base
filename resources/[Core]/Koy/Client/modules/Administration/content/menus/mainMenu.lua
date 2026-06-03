local AdminStorage = Shared.Storage:Get("Administration");

---@type UIMenu
local mainMenu = AdminStorage:Get("admin_main");

---@type UIMenu
local reports_menu = AdminStorage:Get("admin_reports");

---@type UIMenu
local players_menu = AdminStorage:Get("admin_players")

---@type UIMenu
local player_selected_menu = AdminStorage:Get("admin_player_selected");

RegisterNetEvent("Admin:OpeningMenu", function()
    mainMenu:Toggle()
end)

mainMenu:IsVisible(function(Items)
    local client_server_id = Client.Player:GetServerId()
    local client_player = Client.PlayersManager:GetFromId(Client.Player:GetServerId(client_server_id))

    Items:Checkbox("Mode Staff", nil, Client.Admin:IsInStaffMode(), {}, {
        onSelected = function(Checked)
            Client.Admin:SetStaffMode(Checked)
        end
    });
    
    local currentPlayerCount = #GetActivePlayers()
    local currentStaffCount = Client.Admin:GetActiveStaffCount()
    local infoText = "                ~h~Connectés: ~b~" .. currentPlayerCount .. "~s~~h~ | Staff en ligne: ~h~~b~" .. currentStaffCount
    Items:Button(infoText, nil, {}, false, {})

    if Client.Admin:IsInStaffMode() then
        Items:Line()
        Items:Button("Gestion des joueurs", nil, {}, true, {
            onSelected = function()
                player_selected_menu:SetHasSubMenu(players_menu)
            end
        }, players_menu)
        Items:Button("Gestion des Reports", nil, {}, true, {}, reports_menu)
        Items:Button("Gestion des Véhicules", nil, {}, true, {}, AdminStorage:Get("admin_vehicles"))

        Items:Line()

        Items:Button("Gestion Sanctions", nil, {}, true, {}, AdminStorage:Get("admin_sanctions"))
        Items:Button("Gestion Préférences", nil, {}, true, {}, AdminStorage:Get("admin_preferences_submenu"))
        Items:Button("Gestion Personnel", nil, {}, true, {}, AdminStorage:Get("admin_preferences"))
        
        Items:Line()
        
        local client_player_is_in_supremacy = (Client.Admin:GroupHasPermission(client_player.group, "group_manage") == true or Client.Admin:GroupHasPermission(client_player.group, "take_ped") == true)
        if (client_player_is_in_supremacy) then
            Items:Button("Gestion du Serveur", nil, {}, true, {}, AdminStorage:Get("admin_supremacy"))
        end

        local builder = (Client.Admin:GroupHasPermission(client_player.group, "builder") == true)
        if (builder) then
            Items:Button("Gestion des Builders", nil, {}, true, {}, AdminStorage:Get("admin_builder"))
        end
    end
end);

function TeleportToRandomPlayer()
    TriggerServerEvent("Admin:RequestRandomPlayerTeleport")
end

RegisterNetEvent("Admin:TeleportToRandomPlayer")
AddEventHandler("Admin:TeleportToRandomPlayer", function(targetServerId)
    local playerPed = PlayerPedId()
    
    SetEntityVisible(playerPed, false, false)
    SetEntityCollision(playerPed, false, false)
    FreezeEntityPosition(playerPed, true)
    SetEntityInvincible(playerPed, true)
    
    TriggerServerEvent("teleport:requestCoords", targetServerId)
end)

RegisterNetEvent("teleport:teleportToCoords")
AddEventHandler("teleport:teleportToCoords", function(coords)
    local playerPed = PlayerPedId()
    
    ESX.Game.Teleport(playerPed, coords, function()
        if not Client.Admin.Ped:HasNoClipActive() and not _G.noclipAdvancedActive then
            SetEntityVisible(playerPed, true, true)
            SetEntityCollision(playerPed, true, true)
            FreezeEntityPosition(playerPed, false)
            SetEntityInvincible(playerPed, false)
        end
        
        ESX.ShowNotification("[~g~Succès~s~] Vous avez été téléporté à un joueur aléatoire !", "success")
    end)
end)