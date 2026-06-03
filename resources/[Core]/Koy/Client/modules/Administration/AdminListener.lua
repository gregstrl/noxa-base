--[[
----
----Created Date: 3:52 Saturday December 24th 2022
----Author: Koy
----Made with ❤
----
----File: [AdminListener]
----
----Copyright (c) 2022 KoyWork, All Rights Reserved.
----This file is part of KoyWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

function ShowNotification(message)
    if ESX and ESX.ShowNotification then
        ESX.ShowNotification(message)
    else
        SetNotificationTextEntry("STRING")
        AddTextComponentString(message)
        DrawNotification(false, false)
    end
end

local mainMenu = nil

---@type AdminListener
AdminListener = Class.new(function(class)

    ---@class AdminListener: BaseObject
    local self = class;

    function self:Constructor()

        ---@type table
        self.staff = {};

        ---@type table
        self.group = {};

        ---@type boolean
        self.enabled    = false;

        ---@type table
        self.preferences = {};

        ---@type table
        self.reports    = {};
        
        ---@type table
        self.uidCache = {};
        
        ---@type table
        self.blips = {};
        
        self.reportSound = "Hack_Success";
        self.reportSoundBank = "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS";

        CreateThread(function()
            while (Client.Player == nil or Client.PlayersManager == nil) do
                Wait(500)
            end
            
            self:Initialize()
        end)
    end

    function self:Initialize()
        self.Ped = AdminPed();
        self.Utils = AdminUtils();
        
        local AdminStorage = Shared.Storage:Get("Administration");
        mainMenu = AdminStorage:Get("admin_main");
        
        self.lastMenuRequest = 0
        self.menuCooldown = 1000
        self.menuReady = true
        
        if _G.preferAdvancedNoclip == nil then
            _G.preferAdvancedNoclip = self:GetPreferenceFromName("prefer_advanced_noclip") or false
        end
        
        if _G.noclipAdvancedActive == nil then
            _G.noclipAdvancedActive = self:GetPreferenceFromName("noclip_advanced_active") or false
        end
        
        self:LoadReportSoundPreference()
        self:RegisterEvents()
        self:SetupCommands()
        self:StartLoops()
    end

    -- function self:InitializeOwnGamerTag()
    -- end

    function self:RegisterEvents()
        RegisterNetEvent("Admin:MenuReady")
        AddEventHandler("Admin:MenuReady", function()
            self.menuReady = true
        end)
        
        Client.PlayersManager:OnDisconnected(function(player_id)
            if (self:IsInStaffMode() and self.Utils:GetBlipFromPlayer(player_id)) then
                return self.Utils:RemoveBlipForPlayer(player_id)
            end
        end)
    end

    function self:SetupCommands()
        Shared:RegisterKeyMapping("admin:open_menu", {
            label = "admin_open_menu"
        }, "F9", function ()
            local currentTime = GetGameTimer()
            if currentTime - self.lastMenuRequest < self.menuCooldown then
                return  
            end
            
            self.lastMenuRequest = currentTime
            self:TryOpenMenu()
        end);

        Shared:RegisterCommand("staffmode", function()
            self:SetStaffMode(not self:IsInStaffMode())
        end);
        
        Shared:RegisterKeyMapping("admin:toggle_noclip", {
            label = "admin_toggle_noclip"
        }, "F10", function ()
            if not self:IsInStaffMode() then
                return ESX.ShowNotification("Le mode staff doit être activé pour utiliser le noclip")
            end
            
            if _G.preferAdvancedNoclip then
                if not _G.noclipAdvancedActive then
                    _G.noclipAdvancedActive = true
                    toggleNoClip()
                else
                    _G.noclipAdvancedActive = false
                    toggleNoClip()
                    if cleanAllScaleforms then
                        cleanAllScaleforms()
                    end
                end
            else
                self.Ped:SetNoClipActive(not self.Ped:HasNoClipActive())
                self.Ped:OnNoClip()
            end
        end);
    end

    function self:TryOpenMenu()
        TriggerEvent("Admin:OpeningMenu")
        

        if not self.menuReady then
            Shared.Events:ToServer(Enums.Administration.Server.RequestOpenMenu)
        end
    end

    function self:StartLoops()
        CreateThread(function()
            while true do
                local loopInterval = (1000*3)
                local client_server_id = Client.Player:GetServerId()
                local client_player = Client.PlayersManager:GetFromId(client_server_id)
                local client_is_staff = (client_player ~= nil and client_player.group ~= "user")

                if (not client_is_staff) then
                    self:StopAll();
                    break
                elseif (client_is_staff and self:GetPreferenceFromName("report:number") == true) then
                    loopInterval = 0
                    local reportOnWait, reportTaken = self:GetCounterReport()
                    Game:DrawText({ 0.5, 0.01 }, ("Reports : ~b~%s~s~ en attente | ~y~%s~s~ en cours de traitement"):format(reportOnWait, reportTaken), 8, 0.5)
                end

                Wait(loopInterval)
            end
        end)
    end

    function self:IsInStaffMode()
        return self.enabled;
    end

    function self:SetStaffMode(state)
        self.enabled = state;
        Shared.Events:ToServer(Enums.Administration.Server.StaffChangeState, self.enabled)

        if (state == true) then
            self:Loop()
            self.Ped:Start()
            
            self.Utils:StartTagUpdates()
            self.Utils:StartBlipUpdates()
            
            if mainMenu and mainMenu:IsOpen() then
                mainMenu:RefreshIndex()
            end
        else
            self.Ped:Stop();
            
            self.Utils:StopTagUpdates()
            self.Utils:StopBlipUpdates()
            
            if mainMenu and mainMenu:IsOpen() then
                mainMenu:RefreshIndex()
            end
        end
    end

    function self:Loop()
        if (not self.enabled) then
            return;
        end

        local player = Client.Player;
        if (not player) then
            return;
        end

        local playerId = player:GetId();
        if (not playerId) then
            return;
        end

        local playerData = Client.PlayersManager:GetFromId(playerId);
        if (not playerData) then
            return;
        end

        local function tryCacheUID(id, data, context)
            local retries = 0
            local maxRetries = 3
            
            while retries < maxRetries do
                if not data then
                    return false
                end
                
                if not data.GetUID then
                    return false
                end
                
                local success, uid = pcall(function() return data:GetUID() end)
                if success then
                    if uid then
                        self:CachePlayerUID(id, uid)
                        return true
                    else
                        retries = retries + 1
                        Wait(100)
                    end
                else
                    retries = retries + 1
                    Wait(100)
                end
            end
            
            return false
        end

        tryCacheUID(playerId, playerData, "local")

        if (self.preferences.blips) then
            for _, v in pairs(GetActivePlayers()) do
                if (v ~= playerId) then
                    local target = Client.PlayersManager:GetFromId(v);
                    if (target) then
                        tryCacheUID(v, target, "blip")
                        
                        if (not self.blips[v]) then
                            self:AddBlip(v);
                        end
                    end
                end
            end
        end

        if (self.preferences.staffMode) then
            for _, v in pairs(GetActivePlayers()) do
                if (v ~= playerId) then
                    local target = Client.PlayersManager:GetFromId(v);
                    if (target) then
                        tryCacheUID(v, target, "staff")
                        
                        if (not self.staff[v]) then
                            self:AddStaff(v);
                        end
                    end
                end
            end
        end
    end

    function self:StopAll()
        self:SetStaffMode(false);
        local admin_menu = Shared.Storage:Get("Administration"):Get("admin_main");
        if (admin_menu:IsOpen()) then
            admin_menu:Close()
        end
        Client.Admin = nil;
    end

    function self:GetPreferenceFromName(name)
        if (name == nil) then
            return
        end

        local preferenceState = GetResourceKvpString(("admin:preferences:%s"):format(name))
        
        if name == "prefer_advanced_noclip" or name == "noclip_advanced_active" then
        end
        
        if preferenceState == "false" then
            return false
        elseif preferenceState == "true" then
            return true
        end

        return preferenceState
    end

    function self:SetPreferenceFromName(name, state)
        if (name == nil) then
            return
        end

        if name == "prefer_advanced_noclip" or name == "noclip_advanced_active" then
        end

        SetResourceKvp(("admin:preferences:%s"):format(name), tostring(state))
        
        if name == "own_gamertag" or name == "gamertag" or name == "advanced_gamertag" then
            if self:IsInStaffMode() and self.Utils and self.Utils.UpdateTags then
                self.Utils:UpdateTags()
            end
        end
        
        if name == "blip" then
            if self:IsInStaffMode() and self.Utils then
                if state then
                    self.Utils.showBlips = true
                    self.Utils:StartBlipUpdates()
                else
                    self.Utils.showBlips = false
                    self.Utils:StopBlipUpdates()
                end
            end
        end
        
        if name == "prefer_advanced_noclip" then
            _G.preferAdvancedNoclip = state
        elseif name == "noclip_advanced_active" then
            _G.noclipAdvancedActive = state
        end
    end

    function self:GetStaffList()
        return self.staff
    end

    function self:GetIfStaffIsRegistered(playerId)
        local staff_list = self:GetStaffList()
        for i = 1, #staff_list do
            local current_staff = staff_list[i]
            if (current_staff.source == playerId) then
                return true, i
            end
        end
        return false
    end

    function self:StaffGetValue(playerId, key)
        local isRegistered, index = self:GetIfStaffIsRegistered(playerId)
        local staff_selected = self.staff[index]
        if (key == nil or isRegistered == false or staff_selected == nil) then
            return
        end
        return staff_selected[key]
    end

    function self:StaffSetValue(playerId, key, value)
        local isRegistered, index = self:GetIfStaffIsRegistered(playerId)
        local staff_selected = self.staff[index]
        if (isRegistered ~= true or staff_selected == nil) then
            return
        end
        staff_selected[key] = value;
    end

    function self:AddStaff(playerData)
        if (playerData == nil) then
            return
        end
        if (self:GetIfStaffIsRegistered(playerData.source) == true) then
            return
        end
        table.insert(self.staff, playerData)
    end

    function self:RemoveStaff(playerId)
        local isRegistered, index = self:GetIfStaffIsRegistered(playerId)
        if (isRegistered ~= true) then
            return
        end
        table.remove(self.staff, index)
    end

    ---@return table
    function self:GetGroups()
        return self.group;
    end

    ---@param name string
    ---@return table
    function self:GetGroup(name)
        return self.group[name]
    end

    ---@param name string
    ---@return string
    function self:GetGroupLabel(name)
        return self.group[name] ~= nil and self.group[name].label
    end

    ---@param name string
    ---@return number
    function self:GetGroupLevel(name)
        return self.group[name] ~= nil and self.group[name].level
    end

    ---@param name string
    ---@param permission string
    ---@return boolean
    function self:GroupHasPermission(name, permission)
        return self.group[name] ~= nil and self.group[name]["permissions"] ~= nil and self.group[name]["permissions"][permission] == true
    end

    ---@param group string
    ---@param groupToCheck string
    ---@return boolean
    function self:GroupIsHigher(group, groupToCheck, equal)
        local group_data, groupToCheck_data = self:GetGroup(group), self:GetGroup(groupToCheck)
        if (group_data == nil or type(group_data) ~= "table") then
            return
        elseif (groupToCheck_data == nil or type(groupToCheck_data) ~= "table") then
            return true
        end
        return ((group_data.level < groupToCheck_data.level) or (equal == true and group_data.level == groupToCheck_data.level)) or nil
    end

    function self:UpdateGroup(name, key, value)
        if (name == nil or key == nil) then
            return
        end
        local group_selected = self:GetGroup(name)
        if (group_selected == nil) then
            return
        end
        self.group[name][key] = value;
    end

    function self:CreateGroup(data)
        if (data == nil or type(data) ~= "table") then
            return
        end
        local group_selected = self:GetGroup(data.name)
        if (group_selected ~= nil) then
            return
        end
        self.group[data.name] = data;
    end

    function self:DeleteGroup(name)
        local group_selected = self:GetGroup(name)
        if (group_selected == nil) then
            return
        end
        self.group[name] = nil;
    end

    ---@return table
    function self:GetReports()
        return self.reports;
    end

    function self:GetReportFromId(reportId)
        return ((type(self.reports[reportId]) == "table" and self.reports[reportId]) or nil)
    end

    function self:GetReportValue(reportId, key)
        if (key == nil) then
            return
        end
        return self.reports[reportId] ~= nil and self.reports[reportId][key]
    end

    function self:SetReportValue(reportId, key, value)
        if (key == nil) then
            return
        end
        if (self:GetReportFromId(reportId) == nil) then
            return
        end
        self.reports[reportId][key] = value;
    end

    function self:AddReport(reportData)
        if self:IsInStaffMode() then
            local sound, soundBank = self:GetReportSound()
            PlaySoundFrontend(-1, sound, soundBank, 1)
            end
        self.reports[reportData.id] = reportData;
    end

    function self:RemoveReport(reportIndex)
        self.reports[reportIndex] = nil;
    end

    function self:GetCounterReport()
        local reportCount = { 0, 0 }
        for _, selectedReport in pairs(self.reports) do
            if (type(selectedReport) == "table" and selectedReport.taken == nil) then
                reportCount[1] = reportCount[1] + 1
            elseif (type(selectedReport) == "table" and selectedReport.taken ~= nil) then
                reportCount[2] = reportCount[2] + 1
            end
        end
        return reportCount[1], reportCount[2]
    end

    function self:GetPlayerCount()
        return #GetActivePlayers()
    end
    
    function self:GetActiveStaffCount()
        local staffCount = 0
        for _, staffData in pairs(self:GetStaffList()) do
            if staffData and staffData.state == true then
                staffCount = staffCount + 1
            end
        end
        
        local localPlayerId = Client.Player:GetServerId()
        local isLocalPlayerCounted = false
        
        for _, staffData in pairs(self:GetStaffList()) do
            if staffData and staffData.source == localPlayerId and staffData.state == true then
                isLocalPlayerCounted = true
                break
            end
        end
        
        if self:IsInStaffMode() and not isLocalPlayerCounted then
            staffCount = staffCount + 1
        end
        
        return staffCount
    end
    
    function self:SetReportSound(sound, soundBank)
        self.reportSound = sound
        self.reportSoundBank = soundBank
        SetResourceKvp("admin:report_sound", sound)
        SetResourceKvp("admin:report_sound_bank", soundBank)
    end
    
    function self:GetReportSound()
        return self.reportSound, self.reportSoundBank
    end
    
    function self:LoadReportSoundPreference()
        local sound = GetResourceKvpString("admin:report_sound")
        local soundBank = GetResourceKvpString("admin:report_sound_bank")
        
        if sound and soundBank then
            self.reportSound = sound
            self.reportSoundBank = soundBank
        end
    end
    
    function self:RefreshAllGamertags()
        if not self:IsInStaffMode() or not self.Utils then
            return
        end
        
        CreateThread(function()
            local tag_list = self.Utils:GetTags()
            for tagId in pairs(tag_list) do
                if type(tagId) == "number" then
                    self.Utils:RemoveTagForPlayer(tagId)
                end
            end
            
            Wait(50)
            
            local client_player_server_id = Client.Player:GetServerId()
            local player_list = Client.PlayersManager:GetAll()
            
            if self:GetPreferenceFromName("gamertag") then
                for playerId in pairs(player_list) do
                    if playerId ~= client_player_server_id then
                        local player_data = Client.PlayersManager:GetFromId(playerId)
                        if player_data then
                            self.Utils:AddTagForPlayer(playerId)
                        end
                    end
                end
            end
            
            Wait(50)
            
            if self:GetPreferenceFromName("own_gamertag") then
                self.Utils:AddTagForPlayer(client_player_server_id)
            end
        end)
    end

    function self:CachePlayerUID(playerId, uid)
        if playerId and uid then
            self.uidCache[playerId] = uid
        end
    end

    function self:GetCachedUID(playerId)
        return self.uidCache[playerId]
    end

    function self:ClearUIDCache()
        self.uidCache = {}
    end

    function self:AddBlip(playerId)
        if (type(playerId) ~= "number") then
            return
        end
        
        if self.blips == nil then
            self.blips = {}
        end
        
        if self.Utils == nil then
            return
        end
        
        local player_data = Client.PlayersManager:GetFromId(playerId)
        if not player_data then
            return
        end
        
        self.Utils:AddBlipForPlayer(playerId)
    end

    return self;

end);