---
--- @author Kadir#6666
--- Create at [21/04/2023] 12:31:25
--- Current project [Koy-V1]
--- File name [players]
---



local AdminStorage = Shared.Storage:Get("Administration");

---@type UIMenu
local players_menu = AdminStorage:Get("admin_players");

---@type UIMenu
local player_selected_menu = AdminStorage:Get("admin_player_selected");

---@type UIMenu
local player_selected_me_menu = AdminStorage:Get("admin_player_selected_me");

---@type UIMenu
local player_selected_accounts_menu = AdminStorage:Get("admin_player_selected_accounts");

---@type UIMenu
local player_selected_inventory_menu = AdminStorage:Get("admin_player_selected_inventory");

---@type UIMenu
local player_selected_inventory_menu_give = AdminStorage:Get("admin_player_selected_inventory_give");

local hoveredPlayer

local vehicle_choose_index = 1
local teleport_choose_index = 1
local accounts_choose_index = 1

local filter_zone
local filter_cat_value = 1
local filter_cat_index = 1
local filter_value

_G.noclipAdvancedActive = _G.noclipAdvancedActive or false

local function SearchFilterValue(value)

    if (filter_value == nil) then
        return true
    end

    if value == nil then
        return false
    end

    value = (tostring(value)):lower()
    filter_value = (tostring(filter_value)):lower()

    return string.find(value, filter_value) ~= nil
end

AdminStorage:Set("hoveredPlayer", function(newPlayer)
    hoveredPlayer = newPlayer;
end)

Shared.Events:OnNet(Enums.Administration.Client.Actions.ReceiveInventory, function(player_source, player_inventory)

    if (player_source == nil or type(player_source) ~= "number") then
        return
    elseif (player_inventory == nil or type(player_inventory) ~= "table") then
        return
    end

    if (hoveredPlayer == nil) then
        return
    elseif (tonumber(hoveredPlayer[1]) ~= tonumber(player_source)) then
        return
    end

    hoveredPlayer[2].inventory = nil;
    hoveredPlayer[2].inventory = player_inventory;

end)

Shared.Events:OnNet(Enums.Administration.Client.Actions.ReceiveAccounts, function(player_source, player_accounts)

    if (player_source == nil or type(player_source) ~= "number") then
        return
    elseif (player_accounts == nil or type(player_accounts) ~= "table") then
        return
    end

    if (hoveredPlayer == nil) then
        return
    elseif (tonumber(hoveredPlayer[1]) ~= tonumber(player_source)) then
        return
    end

    hoveredPlayer[2].accounts = nil;
    hoveredPlayer[2].accounts = player_accounts;

end)

local function PlayerInfoDisplay()

    if (hoveredPlayer ~= nil) then

        local group_data = Client.Admin:GetGroup(hoveredPlayer[2].group)
        local playerUID = nil
        
        if exports and exports['uid'] then
            playerUID = exports['uid']:UIDClient1(hoveredPlayer[1])
        end
        
        local infoArray = {
            ("Identité : ~h~%s~h~"):format(((hoveredPlayer[2] ~= nil and hoveredPlayer[2].identity) or "Unknow")),
            ("Rang : ~h~%s~h~~s~ - ~h~(L%s)~h~"):format(((group_data ~= nil and group_data.label) or "Utilisateur") , ((group_data ~= nil and group_data.level) or 0)),
            ("Emplois : ~h~%s - %s~h~"):format(((hoveredPlayer[2] ~= nil and hoveredPlayer[2].job.label) or "Unknow"), ((hoveredPlayer[2] ~= nil and hoveredPlayer[2].job.grade_label) or "Unknow")),
            ("Organisation : ~h~%s - %s~h~"):format(((hoveredPlayer[2] ~= nil and hoveredPlayer[2].job2.label) or "Unknow"), ((hoveredPlayer[2] ~= nil and hoveredPlayer[2].job2.grade_label) or "Unknow")),
        }
        
        if playerUID then
            table.insert(infoArray, 1, ("ID Unique : ~h~%s~h~"):format(playerUID))
        end
        
        Panels:info("Informations du Personnage", infoArray)

    end

end

local function PlayerActionsDisplay()

    if (hoveredPlayer ~= nil) then
        local client_server_id = Client.Player:GetServerId()
        local client_player = Client.PlayersManager:GetFromId(Client.Player:GetServerId(client_server_id))
        
        local playerUID = nil
        if exports and exports['uid'] then
            playerUID = exports['uid']:UIDClient1(hoveredPlayer[1])
        end
        
        local headerText = ""
        if playerUID then
            headerText = ("(%s | UID %s) - %s"):format(hoveredPlayer[1], playerUID, ((hoveredPlayer[2] ~= nil and hoveredPlayer[2].name) or "Unknow"))
        else
            headerText = ("(%s) - %s"):format(hoveredPlayer[1], ((hoveredPlayer[2] ~= nil and hoveredPlayer[2].name) or "Unknow"))
        end
        
        Items:Separator(headerText, nil, {}, true,{})

        Items:Line()

        Items:Button("Goto", nil, {}, hoveredPlayer[3] == nil,{

            onSelected = function()

                Shared.Events:ToServer(Enums.Administration.Server.Actions.Goto, hoveredPlayer[1])

            end

        })

        Items:Button("Bring", nil, {}, hoveredPlayer[3] == nil,{

            onSelected = function()

                Shared.Events:ToServer(Enums.Administration.Server.Actions.Bring, hoveredPlayer[1])

            end

        })

        Items:Button("Bring back", nil, {}, hoveredPlayer[3] == nil,{

            onSelected = function()

                Shared.Events:ToServer(Enums.Administration.Server.Actions.BringBack, hoveredPlayer[1])

            end

        })

        Items:Button("Spectate le joueur", nil, {}, true, {
        onSelected = function()
            local playerId = exports.input:ShowSync("Veuillez entrer l'id", false, 150, "small_text")
    
            if playerId and tonumber(playerId) then
                ExecuteCommand("spectate " .. tonumber(playerId))
            else
                ESX.ShowNotification("[~r~Impossible~s~] ID invalide, veuillez réessayer.")
            end
        end
    })
    
        Items:Button("Envoyer un message au joueur", nil, {}, true, { 
            onSelected = function()
                if hoveredPlayer and hoveredPlayer[1] then
                    local reason = exports.input:ShowSync("Veuillez entrer le message", false, 255, "small_text")
        
                    if reason and reason ~= "" then
                        ExecuteCommand("sendmessage " .. hoveredPlayer[1] .. " " .. reason)
                    else
                        ESX.ShowNotification("[~r~Impossible~s~] Message invalide, veuillez réessayer.")
                    end
                end
            end
        })
    
        local teleportLocations = {}
        for _, location in ipairs(Config["Admin"]["TeleportCoords"] or {}) do
            table.insert(teleportLocations, location.value)
        end

        Items:List("Téléportation Rapide", teleportLocations, teleport_choose_index, "Téléporter le joueur à un endroit prédéfini", {
        }, true,{

            onListChange = function(Index)
                teleport_choose_index = Index;
            end,

            onSelected = function(Index)
                Shared.Events:ToServer(Enums.Administration.Server.Actions.Player.TeleportCoords, Index, hoveredPlayer[1])
            end

        })
        
        Items:List("Donner un véhicule", Config["Admin"]["SpawnVehicles"] or {}, vehicle_choose_index, nil, {
        }, true,{

            onListChange = function(Index)

                vehicle_choose_index = Index;

            end,

            onSelected = function()

                Shared.Events:ToServer(Enums.Administration.Server.Actions.Entity, "vehicle_spawn", Config["Admin"]["SpawnVehicles"][vehicle_choose_index], hoveredPlayer[1])

            end

        })


        Items:Button("Finances", nil, {}, true,{

            onSelected = function()

                Shared.Events:ToServer(Enums.Administration.Server.Actions.Player.GetAccounts, hoveredPlayer[1])

            end

        }, player_selected_accounts_menu)

        Items:Button("Inventaire", nil, {}, true,{

            onSelected = function()

                Shared.Events:ToServer(Enums.Administration.Server.Actions.Player.GetInventory, hoveredPlayer[1])

            end

        }, player_selected_inventory_menu)

        Items:Button("Revive", nil, {}, true,{

            onSelected = function()

                ExecuteCommand(("revive %s"):format(hoveredPlayer[1]))

            end

        })


        Items:Button("Freeze", nil, {}, hoveredPlayer[3] == nil,{

            onSelected = function()

                Shared.Events:ToServer(Enums.Administration.Server.Actions.Player.Freeze, hoveredPlayer[1])

            end

        })

        Items:Button("Attribuer un job", nil, {}, Client.Admin:GroupHasPermission(client_player.group, "setjob") == true, {
            onSelected = function()
                local jobName = exports.input:ShowSync("Entrez le nom du job", false, 30, "small_text")
                if jobName and jobName ~= "" then
                    local grade = exports.input:ShowSync("Entrez le grade", false, 2, "small_text")
                    if grade and tonumber(grade) then
                        ExecuteCommand(("setjob %s %s %s"):format(hoveredPlayer[1], jobName, grade))
                        ESX.ShowNotification(("[~g~Succès~s~] Job modifié en %s grade %s"):format(jobName, grade))
                    else
                        ESX.ShowNotification("[~r~Impossible~s~] Grade invalide")
                    end
                else
                    ESX.ShowNotification("[~r~Impossible~s~] Job invalide")
                end
            end
        })

        Items:Button("Attribuer un(e) Gang/Organisation", nil, {}, Client.Admin:GroupHasPermission(client_player.group, "setjob2") == true, {
            onSelected = function()
                local jobName = exports.input:ShowSync("Entrez le nom de l'organisation", false, 30, "small_text")
                if jobName and jobName ~= "" then
                    local grade = exports.input:ShowSync("Entrez le grade", false, 2, "small_text")
                    if grade and tonumber(grade) then
                        ExecuteCommand(("setjob2 %s %s %s"):format(hoveredPlayer[1], jobName, grade))
                        ESX.ShowNotification(("[~g~Succès~s~] Organisation modifiée en %s grade %s"):format(jobName, grade))
                    else
                        ESX.ShowNotification("[~r~Impossible~s~] Grade invalide")
                    end
                else
                    ESX.ShowNotification("[~r~Impossible~s~] Organisation invalide")
                end
            end
        })

    end

end

local function ItemsDisplay(displayType)

    Items:Separator("↓ ~g~Liste des items~s~ ↓")

    if (displayType == "player") then

        local player_inventory = type(hoveredPlayer[2].inventory) == "table" and hoveredPlayer[2].inventory["items"]

        if (type(player_inventory) == "table") then

            if (#player_inventory <= 0) then

                Items:Button("Aucun items", nil, {
                }, true, {
                })

            else

                for i = 1, #player_inventory do

                    local item_values = player_inventory[i]

                    if (item_values ~= nil and (SearchFilterValue(item_values.label) or SearchFilterValue(item_values.name))) then

                        Items:Button(("%s - ~h~%s~h~"):format(item_values.label, item_values.name), ("Quantité : ~g~%s~y~"):format(item_values.count), {
                        }, true, {

                            onSelected = function()

                                local item_count = tonumber(Shared:KeyboardInput("Veuillez entrer la quantité que vous souhaitez prendre", 2));

                                if (type(item_count) == "number") then

                                    ExecuteCommand(("removeitem %s %s %s"):format(hoveredPlayer[1], item_values.name, item_count))

                                end

                            end

                        })

                    end

                end

            end

        else

            Items:Separator("Inventaire en chargement ...")

        end

    elseif (displayType == "server") then

        local server_items = Client.Admin.Utils:GetItems()

        if (server_items ~= nil) then

            for itemName, itemValues in pairs(server_items) do

                if (itemName ~= nil and itemValues ~= nil and (SearchFilterValue(itemValues.label) or SearchFilterValue(itemName))) then

                    Items:Button(("%s - ~h~%s~h~"):format(itemValues.label, itemName), nil, {
                    }, true, {

                        onSelected = function()

                            local item_count = tonumber(Shared:KeyboardInput("Veuillez entrer la quantité que vous souhaitez donner", 2));

                            if (type(item_count) == "number") then

                                ExecuteCommand(("giveitem %s %s %s"):format(hoveredPlayer[1], itemName, item_count))

                            end

                        end

                    })

                end

            end

        end

    end

end

local function WeaponsDisplay(displayType)

    Items:Separator("↓ ~g~Liste des armes~s~ ↓")

    if (displayType == "player") then

        local player_weapons = type(hoveredPlayer[2].inventory) == "table" and hoveredPlayer[2].inventory["weapons"]

        if (type(player_weapons) == "table") then

            if (#player_weapons <= 0) then

                Items:Button("Aucune armes", nil, {

                    

                }, true, {
                })

            else

                for i = 1, #player_weapons do

                    local weapon_data = player_weapons[i]

                    if (weapon_data ~= nil and (SearchFilterValue(weapon_data.label) or SearchFilterValue(weapon_data.name))) then

                        Items:Button(weapon_data.label, weapon_data.name, {

                            

                        }, true, {

                            onSelected = function()

                                ExecuteCommand(("removeweapon %s %s"):format(hoveredPlayer[1], weapon_data.name))

                            end

                        })

                    end

                end

            end

        else

            Items:Separator("Armes en chargement ...")

        end

    elseif (displayType == "server") then

        local server_weapons = ESX.GetWeaponList()

        if (server_weapons ~= nil) then

            for i = 1, #server_weapons do

                local weapon_data = server_weapons[i]

                if (weapon_data ~= nil and (SearchFilterValue(weapon_data.label) or SearchFilterValue(weapon_data.name))) then

                    Items:Button(weapon_data.label, weapon_data.name, {

                        

                    }, true, {

                        onSelected = function()

                            ExecuteCommand(("giveweapon %s %s %s"):format(hoveredPlayer[1], weapon_data.name, 300))

                        end

                    })

                end

            end

        end

    end

end

local function staffCanManagePlayer(player_id)

    if (type(player_id) ~= "number") then
        return false
    end

    local client_server_id = Client.Player:GetServerId()
    local client_player = Client.PlayersManager:GetFromId(client_server_id)
    local server_selected_player = Client.PlayersManager:GetFromId(player_id)

    return (((player_id ~= client_server_id and Client.Admin:GroupIsHigher(client_player.group, server_selected_player.group)) and true) or false)

end

local function getPlayerIdFromUID(targetUID)
    if not exports or not exports['Acore'] then
        ESX.ShowNotification("[~r~Impossible~s~] Le système d'UID n'est pas disponible.")
        return nil
    end
    
    local server_players = Client.PlayersManager:GetAll()
    
    for id, values in pairs(server_players) do
        if type(id) == "number" then
            local playerUID = exports['uid']:UIDClient1(id)
            if playerUID and tostring(playerUID) == tostring(targetUID) then
                return id
            end
        end
    end
    
    return nil
end

local shouldUpdatePlayersCache = true

Shared.Events:On(Enums.Player.Manager.Added, function()
    shouldUpdatePlayersCache = true
end)

Shared.Events:On(Enums.Player.Manager.Removed, function()
    shouldUpdatePlayersCache = true
end)

Shared.Events:OnNet(Enums.Player.Manager.Add, function()
    shouldUpdatePlayersCache = true
end)

Shared.Events:OnNet(Enums.Player.Manager.Remove, function()
    shouldUpdatePlayersCache = true
end)

players_menu:IsVisible(function(Items)

    local server_players = Client.PlayersManager:GetAll()
    local server_players_number = Shared.Table:SizeOf(server_players)
    
    if Client.PlayersManager.cache == nil or shouldUpdatePlayersCache then
        shouldUpdatePlayersCache = false
        Client.PlayersManager.cache = {}
        
        local playersList = {}
        for id, values in pairs(server_players) do
            if type(id) == "number" and type(values) == "table" then
                local playerUID = nil
                if exports and exports['uid'] then
                    playerUID = exports['uid']:UIDClient1(id)
                end
                
                local displayText = ""
                if playerUID then
                    displayText = ("%s (%s | UID %s) - %s"):format(((values.group ~= "user" and "[~s~STAFF~s~]") or ""), id, playerUID, values.name)
                else
                    displayText = ("%s (%s) - %s"):format(((values.group ~= "user" and "[~s~STAFF~s~]") or ""), id, values.name)
                end
                
                table.insert(playersList, {
                    id = id,
                    values = values,
                    displayText = displayText,
                    canManage = staffCanManagePlayer(tonumber(id))
                })
            end
        end
        Client.PlayersManager.cache = playersList
    end

    if (server_players_number == 0) then

        Items:Button("Une erreur s'est produite.", nil, {}, true, {})

    else

        
        Items:Separator("Options de Recherche")
        
        Items:Button("Rechercher par ID Unique (UID)", nil, {}, true, {
            onSelected = function()
                local targetUID = Shared:KeyboardInput("Veuillez entrer l'ID Unique (UID) du joueur", 20)
                
                if targetUID and targetUID ~= "" then
                    local playerId = getPlayerIdFromUID(targetUID)
                    
                    if playerId then
                        local values = Client.PlayersManager:GetFromId(playerId)
                        hoveredPlayer = { playerId, values }
                        player_selected_menu:SetHasSubMenu(players_menu)
                        RageUI.Visible(player_selected_menu, true)
                    else
                        ESX.ShowNotification("[~r~Impossible~s~] Aucun joueur trouvé avec cet UID (Joueur pas connecter)")
                    end
                end
            end
        })

        Items:Button(((filter_value == nil and "Rechercher") or "Réinitialiser la recherche"), nil, {
        }, true, {

            onSelected = function()

                if (filter_value ~= nil) then

                    filter_value = nil;

                else

                    local value = Shared:KeyboardInput("ID, pseudo, identité, staff", 30);

                    if (value ~= nil and (Shared:InputIsValid(value, "string") or Shared:InputIsValid(value, "number"))) then

                        filter_value = value

                    end

                end

            end

        })

        Items:Checkbox("Restreindre a ma zone", nil, filter_zone, {
        }, {

            onSelected = function(Checked)

                filter_zone = Checked;

            end

        })

        Items:Line()
    
        Items:Button("Téléportation aléatoire", "Se téléporter à un joueur aléatoire", {}, 
        true, {
            onSelected = function()
                TeleportToRandomPlayer()
            end
        });

        if (hoveredPlayer ~= nil) then
            hoveredPlayer = nil;
        end
        
        local filteredPlayers = {}
        
        if Client.PlayersManager.cache and #Client.PlayersManager.cache > 0 then
            for _, playerData in ipairs(Client.PlayersManager.cache) do
                local id = playerData.id
                local values = playerData.values
                local filter_string_matched = (SearchFilterValue(tostring(id)) or SearchFilterValue(values.name) or SearchFilterValue(values.identity) or (SearchFilterValue("staff") and values.group ~= "user"))
                local filter_zone_matched = ((filter_zone ~= true or (filter_zone == true and GetPlayerFromServerId(id) ~= -1)) and true) or false;
                
                if (filter_zone_matched and filter_string_matched) then
                    table.insert(filteredPlayers, playerData)
                end
            end
        else
            for id, values in pairs(server_players) do
                if (type(id) == "number" and type(values) == "table") then
                    local filter_string_matched = (SearchFilterValue(tostring(id)) or SearchFilterValue(values.name) or SearchFilterValue(values.identity) or (SearchFilterValue("staff") and values.group ~= "user"))
                    local filter_zone_matched = ((filter_zone ~= true or (filter_zone == true and GetPlayerFromServerId(id) ~= -1)) and true) or false;

                    if (filter_zone_matched and filter_string_matched) then
                        table.insert(filteredPlayers, {id = id, values = values})
                    end
                end
            end
        end

        for _, playerData in ipairs(filteredPlayers) do
            local id = playerData.id
            local values = playerData.values
            
            local displayText = ""
            if playerData.displayText then
                displayText = playerData.displayText
            else
                local playerUID = nil
                if exports and exports['uid'] then
                    playerUID = exports['uid']:UIDClient1(id)
                end
                
                if playerUID then
                    displayText = ("%s (%s | UID %s) - %s"):format(((values.group ~= "user" and "[~r~STAFF~s~]") or ""), id, playerUID, values.name)
                else
                    displayText = ("%s (%s) - %s"):format(((values.group ~= "user" and "[~r~STAFF~s~]") or ""), id, values.name)
                end
            end

            Items:Button(displayText, nil, {
            
                RightBadge = (playerData.canManage == false and RageUI.BadgeStyle.Lock) or (not playerData.canManage and staffCanManagePlayer(tonumber(id)) == false and RageUI.BadgeStyle.Lock) or nil

            }, true, {

                onActive = function()
                    if (hoveredPlayer == nil or hoveredPlayer[1] == nil or hoveredPlayer[1] ~= id) then
                        hoveredPlayer = { id, values }
                    end
                end,

                onSelected = function ()
                    hoveredPlayer = { id, values }
                    Wait(50)
                    if not RageUI.Visible(player_selected_menu) then
                        RageUI.Visible(player_selected_menu, true)
                    end
                end

            }, (playerData.canManage == true and AdminStorage:Get("admin_player_selected") or (playerData.canManage == nil and staffCanManagePlayer(tonumber(id)) == true and AdminStorage:Get("admin_player_selected")) or nil))
        end
    end

end, function(Panels)

    PlayerInfoDisplay();

end)

player_selected_menu:IsVisible(function(Items)

    PlayerActionsDisplay();

end, function(Panels)

    PlayerInfoDisplay();

end)

player_selected_me_menu:IsVisible(function(Items)

    Items:Button("Gérer", nil, {
    }, true, {

        onSelected = function()

            player_selected_menu:SetHasSubMenu(player_selected_me_menu)

        end

    }, player_selected_menu)

end)

player_selected_inventory_menu:IsVisible(function(Items)

    if (hoveredPlayer ~= nil) then

        local client_server_id = Client.Player:GetServerId()
        local client_player = Client.PlayersManager:GetFromId(Client.Player:GetServerId(client_server_id))

        Items:List("Trier par", {
            "Aucun",
            "Items",
            "Armes"
        }, filter_cat_index, nil, {
        }, true, {

            onListChange = function(Index)

                filter_cat_index = Index

                if (filter_cat_index == 1) then

                    filter_cat_value = nil

                elseif (filter_cat_index == 2) then

                    filter_cat_value = "items"

                elseif (filter_cat_index == 3) then

                    filter_cat_value = "weapons"

                end

            end

        })

        Items:Button("Give", nil, {
        }, Client.Admin:GroupHasPermission(client_player.group, "player_manage_item"), {
        }, player_selected_inventory_menu_give)

        if (filter_cat_value == "items") then
            ItemsDisplay("player")
        elseif (filter_cat_value == "weapons") then
            WeaponsDisplay("player")
        else
            ItemsDisplay("player")
            WeaponsDisplay("player")
        end

    end

end, function()  end, function() filter_value = nil;  end)

player_selected_inventory_menu_give:IsVisible(function(Items)

    local server_items = Client.Admin.Utils:GetItems()
    local server_weapons = ESX.GetWeaponList()

    if ((server_items ~= nil and server_weapons ~= nil) and hoveredPlayer ~= nil) then

        Items:List("Trier par", {
            "Aucun",
            "Items",
            "Armes"
        }, filter_cat_index, nil, {
        }, true, {

            onListChange = function(Index)

                filter_cat_index = Index

                if (filter_cat_index == 1) then

                    filter_cat_value = nil

                elseif (filter_cat_index == 2) then

                    filter_cat_value = "items"

                elseif (filter_cat_index == 3) then

                    filter_cat_value = "weapons"

                end

            end

        })

        Items:Button("Rechercher", nil, {
        }, true, {

            onSelected = function()

                filter_value = nil;

                local value = Shared:KeyboardInput("Nom de l'item/arme", 30);

                if (value ~= nil and Shared:InputIsValid(value, "string")) then

                    filter_value = value

                end

            end

        })

        Items:Line()

        if (filter_cat_value == "items") then
            ItemsDisplay("server")
        elseif (filter_cat_value == "weapons") then
            WeaponsDisplay("server")
        else
            ItemsDisplay("server")
            WeaponsDisplay("server")
        end

    end

end, function()  end, function() filter_value = nil;  end)

player_selected_accounts_menu:IsVisible(function(Items)

    if (hoveredPlayer ~= nil and hoveredPlayer[2] ~= nil and type(hoveredPlayer[2].accounts) == "table") then

        local client_server_id = Client.Player:GetServerId()
        local client_player = Client.PlayersManager:GetFromId(Client.Player:GetServerId(client_server_id))
        local player_selected_accounts = hoveredPlayer[2].accounts

        Items:Separator("↓ ~g~Finances~s~ ↓")

        for i = 1, #player_selected_accounts do

            local current_player_account = player_selected_accounts[i]

            if (current_player_account ~= nil and Config["Admin"]["ViewableAccounts"][current_player_account.name] == true) then

                Items:List(("%s (~h~%s~s~$)"):format(ESX.GetAccountLabel(current_player_account.name), ESX.Math.GroupDigits(current_player_account.money)), {
                    "Prendre",
                    "Donner"
                }, accounts_choose_index,nil, {
                }, true, {

                    onListChange = function(Index)

                        accounts_choose_index = Index;

                    end,

                    onSelected = function(Index)

                        local item_count = tonumber(Shared:KeyboardInput("Veuillez entrer la quantité que vous souhaitez prendre", 6));

                        if (type(item_count) ~= "number") then

                            return

                        end

                        if (Index == 1) then

                            ExecuteCommand(("removeaccountmoney %s %s %s"):format(hoveredPlayer[1], current_player_account.name, item_count))

                        elseif (Index == 2) then

                            ExecuteCommand(("giveaccountmoney %s %s %s"):format(hoveredPlayer[1], current_player_account.name, item_count))

                        end

                    end

                })

            end

        end

    end

end)