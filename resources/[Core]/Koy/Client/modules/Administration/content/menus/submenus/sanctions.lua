---
--- Fichier: [sanctions]
---

local AdminStorage = Shared.Storage:Get("Administration")

local sanctions_menu = AdminStorage:Get("admin_sanctions")
local jail_menu = AdminStorage:Get("admin_sanctions_jail")
local ban_menu = AdminStorage:Get("admin_sanctions_ban")
local warn_menu = AdminStorage:Get("admin_sanctions_warn")

local jail_logs_menu = nil
if AdminStorage:Get("admin_sanctions_jail_logs") then
    jail_logs_menu = AdminStorage:Get("admin_sanctions_jail_logs")
else
    jail_logs_menu = RageUI.AddSubMenu(jail_menu, "", "Administration : Logs des jails")
    AdminStorage:Set("admin_sanctions_jail_logs", jail_logs_menu)
end

local jail_players_list = {}
local ban_players_list = {}
local selected_player = nil
local selected_ban_duration = 1

Shared.Events:OnNet("Admin:RequestUID", function(playerId)
    
    if not selected_player then
        return
    end
    
    if selected_player.id ~= playerId then
        print("Client: IDs ne correspondent pas: " .. selected_player.id .. " vs " .. playerId)
        return
    end
    
    Shared.Events:ToServer("Admin:ReceiveUID", playerId, selected_player.uid)
end)

sanctions_menu:IsVisible(function(Items)
    Items:Separator("Options disponibles")

    Items:Button("Jail", "Mettre un joueur en prison", {}, true, {}, jail_menu)
    Items:Button("Ban", "Bannir un joueur", {}, true, {}, ban_menu)
    -- Items:Button("Warn", "Avertir un joueur", {}, true, {}, warn_menu)
end)

local player_jail_menu = AdminStorage:Set("admin_player_jail_options", RageUI.AddSubMenu(jail_menu, "", "Options de Jail"))
local player_ban_menu = AdminStorage:Set("admin_player_ban_options", RageUI.AddSubMenu(ban_menu, "", "Options de Ban"))

player_jail_menu:IsVisible(function(Items)
    if selected_player then
        Items:Separator("Options pour " .. selected_player.name)
        
        Items:Button("Mettre en jail", nil, {}, true, {
            onSelected = function()
                RageUI.CloseAll()
                ExecuteCommand("jail " .. selected_player.uid)
            end
        })
        
        Items:Button("Logs des jails", nil, {}, true, {
            onSelected = function()
                if not jail_logs_menu then
                    jail_logs_menu = RageUI.AddSubMenu(player_jail_menu, "", "Administration : Logs des jails")
                    AdminStorage:Set("admin_sanctions_jail_logs", jail_logs_menu)
                end
                Shared.Events:ToServer("Admin:GetJailLogs", selected_player.id)
            end
        }, jail_logs_menu)
    else
        Items:Button("Erreur: Aucun joueur sélectionné", nil, {}, false, {})
    end
end)

local ban_durations = {
    { label = "1h", value = "1" },
    { label = "3h", value = "3" },
    { label = "6h", value = "6" },
    { label = "12h", value = "12" },
    { label = "1j", value = "24" },
    { label = "2j", value = "48" },
    { label = "3j", value = "72" },
    { label = "7j", value = "168" },
    { label = "14j", value = "336" },
    { label = "30j", value = "720" },
    { label = "Permanent", value = "0" }
}

player_ban_menu:IsVisible(function(Items)
    if selected_player then
        Items:Separator("Options pour " .. selected_player.name)
        
        Items:Separator("Bannissements rapides")
        
        Items:Button("1h - Insulte", nil, {}, true, {
            onSelected = function()
                RageUI.CloseAll()
                ExecuteCommand("ban " .. selected_player.uid .. " 1 Insulte")
            end
        })
        
        Items:Button("1j - Langage inapproprié", nil, {}, true, {
            onSelected = function()
                RageUI.CloseAll()
                ExecuteCommand("ban " .. selected_player.uid .. " 24 Langage inapproprié")
            end
        })
        
        Items:Button("3j - Comportement toxique", nil, {}, true, {
            onSelected = function()
                RageUI.CloseAll()
                ExecuteCommand("ban " .. selected_player.uid .. " 72 Comportement toxique")
            end
        })
        
        Items:Button("7j - Triche", nil, {}, true, {
            onSelected = function()
                RageUI.CloseAll()
                ExecuteCommand("ban " .. selected_player.uid .. " 168 Triche")
            end
        })
        
        Items:Button("Permanent - Hack", nil, {}, true, {
            onSelected = function()
                RageUI.CloseAll()
                ExecuteCommand("ban " .. selected_player.uid .. " 0 Hack")
            end
        })
        
        Items:Separator("Ban personnalisé")
        
        local duration_labels = {}
        for i, data in ipairs(ban_durations) do
            table.insert(duration_labels, data.label)
        end
        
        -- Items:List("Durée", duration_labels, selected_ban_duration, "Sélectionner la durée du ban", {}, true, {
        --     onListChange = function(Index, Item)
        --         selected_ban_duration = Index
        --     end,
        --     onSelected = function()
        --         return
        --     end
        -- })
        
        Items:Button("Ban avec raison personnalisée", "Appuyez pour entrer une raison", {}, true, {
            onSelected = function()
                DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 128)
                
                while UpdateOnscreenKeyboard() == 0 do
                    DisableAllControlActions(0)
                    Wait(0)
                end
                
                if UpdateOnscreenKeyboard() == 1 then
                    local reason = GetOnscreenKeyboardResult()
                    if reason and reason ~= "" then
                        RageUI.CloseAll()
                        ExecuteCommand("ban " .. selected_player.uid .. " " .. ban_durations[selected_ban_duration].value .. " " .. reason)
                    else
                        ESX.ShowNotification("[~r~Impossible~s~] Veuillez entrer une raison valide")
                    end
                end
            end
        })
    else
        Items:Button("Erreur: Aucun joueur sélectionné", nil, {}, false, {})
    end
end)

jail_menu:IsVisible(function(Items)
    Items:Separator("Liste des joueurs")

    jail_players_list = {}
    local players = Client.PlayersManager:GetAll()
    for playerId, playerData in pairs(players) do
        local playerUID = nil
        
        local success, result = pcall(function()
            if exports and exports["uid"] and exports["uid"].GetPlayerUID then
                return exports["uid"]:GetPlayerUID(playerId)
            end
            return nil
        end)
        
        if success and result then
            playerUID = result
        else
            playerUID = playerId
        end
        
        local isStaff = playerData.group ~= nil and playerData.group ~= "user"
        
        local playerText = isStaff and "[STAFF] " or ""
        playerText = playerText .. "[" .. playerUID .. "] " .. playerData.name
        
        table.insert(jail_players_list, {
            id = playerId,
            uid = playerUID,
            name = playerData.name,
            displayName = playerText,
            group = playerData.group,
            isStaff = isStaff
        })
    end

    table.sort(jail_players_list, function(a, b) return tonumber(a.id) < tonumber(b.id) end)

    for _, player in ipairs(jail_players_list) do
        Items:Button(player.displayName, nil, {}, true, {
            onSelected = function()
                selected_player = player
            end
        }, player_jail_menu)
    end
end)

ban_menu:IsVisible(function(Items)
    Items:Separator("Liste des joueurs")

    ban_players_list = {}
    local players = Client.PlayersManager:GetAll()
    for playerId, playerData in pairs(players) do
        local playerUID = nil
        
        local success, result = pcall(function()
            if exports and exports["uid"] and exports["uid"].GetPlayerUID then
                return exports["uid"]:GetPlayerUID(playerId)
            end
            return nil
        end)
        
        if success and result then
            playerUID = result
        else
            playerUID = playerId
        end
        
        local isStaff = playerData.group ~= nil and playerData.group ~= "user"
        
        local playerText = isStaff and "[STAFF] " or ""
        playerText = playerText .. "[" .. playerUID .. "] " .. playerData.name
        
        table.insert(ban_players_list, {
            id = playerId,
            uid = playerUID,
            name = playerData.name,
            displayName = playerText,
            group = playerData.group,
            isStaff = isStaff
        })
    end

    table.sort(ban_players_list, function(a, b) return tonumber(a.id) < tonumber(b.id) end)

    for _, player in ipairs(ban_players_list) do
        Items:Button(player.displayName, nil, {}, true, {
            onSelected = function()
                selected_player = player
            end
        }, player_ban_menu)
    end
end)

local function updateJailLogsMenu(logs, playerName, usedUID)
    if not jail_logs_menu then
        jail_logs_menu = RageUI.AddSubMenu(player_jail_menu, "", "Administration : Logs des jails")
        AdminStorage:Set("admin_sanctions_jail_logs", jail_logs_menu)
    end
    
    jail_logs_menu:IsVisible(function(Items)
        Items:Separator("Logs de jail pour " .. playerName)
        
        if not logs or #logs == 0 then
            if selected_player and selected_player.uid then
                
            end
            
            Items:Button("Aucun historique de jail", nil, {}, false, {})
        else
            for _, log in ipairs(logs) do
                local keys = {}
                for k, _ in pairs(log) do
                    table.insert(keys, k)
                end
                
                local logText = ""
                
                if log.remainingTasks then
                    logText = "Tâches restantes: " .. log.remainingTasks
                end
                
                if log.motif then
                    if logText ~= "" then logText = logText .. " | " end
                    logText = logText .. "Motif: " .. log.motif
                end
                
                Items:Button(logText, nil, {}, false, {})
            end
        end
    end)
end

Shared.Events:OnNet("Admin:ReceiveJailLogs", function(playerId, playerName, logs, usedUID)
    if usedUID then
    end
    
    
    updateJailLogsMenu(logs, playerName, usedUID)
end)

Shared.Events:OnNet("Admin:DirectJailLogsResult", function(logs, uid)
    
    if logs and #logs > 0 then
        updateJailLogsMenu(logs, "UID: " .. uid, uid)
    end
end) 