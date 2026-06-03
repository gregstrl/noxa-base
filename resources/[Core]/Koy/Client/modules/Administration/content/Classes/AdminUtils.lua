---
--- @author Kadir#6666
--- Create at [26/04/2023] 20:26:41
--- Current project [Koy-V1]
--- File name [AdminUtils]
---


---@type AdminUtils
AdminUtils = Class.new(function(class)

    ---@class AdminUtils: BaseObject
    local self = class;

    function self:Constructor()

        self.items = {}

        self.INPUT_LOOK_LR = 1
        self.INPUT_LOOK_UD = 2
        self.INPUT_COVER = 44
        self.INPUT_MULTIPLAYER_INFO = 20
        self.INPUT_MOVE_UD = 31
        self.INPUT_MOVE_LR = 30
        self._internal_camera = nil
        self._internal_isFrozen = false
        self._internal_pos = nil
        self._internal_rot = nil
        self._internal_fov = nil
        self._internal_vecX = nil
        self._internal_vecY = nil
        self._internal_vecZ = nil
        self.settings = {
            fov = 45.0,
            mouseSensitivityX = 5,
            mouseSensitivityY = 5,
            normalMoveMultiplier = 1,
            fastMoveMultiplier = 10,
            slowMoveMultiplier = 0.1,
            enableEasing = false,
            easingDuration = 1000
        }
        self.controls = {12, 13, 14, 15, 16, 17, 18, 19, 50, 85, 96, 97, 99, 115, 180, 181, 198, 261, 262}

        self.blips = {}
        self.tags = {}
        self.debugDone = false
        self.showBlips = true
        self.blipsInitialized = false
        self.blipUpdateRunning = false
        
        AddEventHandler('onInventoryOpened', function()
            if Client.Admin and Client.Admin:IsInStaffMode() then
                Wait(100)
                self:RemoveAllTags()
                Wait(500)
                self:UpdateTags()
            end
        end)
        
        AddEventHandler('onInventoryClosed', function()
            if Client.Admin and Client.Admin:IsInStaffMode() then
                Wait(100)
                self:RemoveAllTags()
                Wait(200)
                self:UpdateTags()
            end
        end)
        
        RegisterNetEvent('esx:openInventory')
        AddEventHandler('esx:openInventory', function()
            if Client.Admin and Client.Admin:IsInStaffMode() then
                Wait(100)
                self:RemoveAllTags()
                Wait(500)
                self:UpdateTags()
            end
        end)
        
        RegisterNetEvent('esx:closeInventory')
        AddEventHandler('esx:closeInventory', function()
            if Client.Admin and Client.Admin:IsInStaffMode() then
                Wait(100)
                self:RemoveAllTags()
                Wait(200)
                self:UpdateTags()
            end
        end)

        RegisterNetEvent('esx:setJob')
        AddEventHandler('esx:setJob', function(job)
            if Client.Admin and Client.Admin:IsInStaffMode() then
                Wait(100)
                if self.tagUpdateRunning then
                    local playerId = GetPlayerServerId(PlayerId())
                    if self.tags[playerId] then
                        RemoveMpGamerTag(self.tags[playerId])
                        self.tags[playerId] = nil
                        self:AddTagForPlayer(playerId)
                    end
                end
            end
        end)

        RegisterNetEvent('esx:setJob2')
        AddEventHandler('esx:setJob2', function(job2)
            if Client.Admin and Client.Admin:IsInStaffMode() then
                Wait(100)
                if self.tagUpdateRunning then
                    local playerId = GetPlayerServerId(PlayerId())
                    if self.tags[playerId] then
                        RemoveMpGamerTag(self.tags[playerId])
                        self.tags[playerId] = nil
                        self:AddTagForPlayer(playerId)
                    end
                end
            end
        end)

        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function(xPlayer)
            if Client.Admin and Client.Admin:IsInStaffMode() then
                Wait(500)
                if self.tagUpdateRunning then
                    self:RemoveAllTags()
                    Wait(100)
                    self:UpdateTags()
                end
            end
        end)
    end

    function self:GetItems()

        return self.items

    end

    function self:SetItems(list)

        if (list == nil or type(list) ~= "table") then
            return
        end

        self.items = list;

    end

    function self:SetNoClipAttributes(ped, status)
        if status then
            FreezeEntityPosition(ped, true)
            SetEntityCollision(ped, false, false)
        else
            FreezeEntityPosition(ped, false)
            SetEntityCollision(ped, true, true)
        end
    end

    function self:IsFreecamFrozen()
        return self._internal_isFrozen;
    end

    function self:SetFreecamFrozen(frozen)
        self._internal_isFrozen = frozen == true
    end

    function self:GetFreecamPosition()
        return self._internal_pos
    end

    function self:SetFreecamPosition(x, y, z)
        local pos = vector3(x, y, z)
        SetCamCoord(self._internal_camera, pos)

        self._internal_pos = pos
    end

    function self:GetFreecamRotation()
        return self._internal_rot
    end

    function self:SetFreecamRotation(x, y, z)
        local x = self:Clamp(x, -90.0, 90.0)
        local y = y % 360
        local z = z % 360
        local rot = vector3(x, y, z)
        local vecX, vecY, vecZ = self:EulerToMatrix(x, y, z)

        LockMinimapAngle(math.floor(z))
        SetCamRot(self._internal_camera, rot)

        self._internal_rot = rot
        self._internal_vecX = vecX
        self._internal_vecY = vecY
        self._internal_vecZ = vecZ
    end

    function self:GetFreecamFov()
        return self._internal_fov
    end

    function self:SetFreecamFov(fov)
        local fov = self:Clamp(fov or 45.0, 0.0, 90.0)
        SetCamFov(self._internal_camera, fov)
        self._internal_fov = fov
    end

    function self:GetFreecamMatrix()
        return self._internal_vecX, self._internal_vecY, self._internal_vecZ, self._internal_pos
    end

    function self:GetFreecamTarget(distance)
        local target = self._internal_pos + (self._internal_vecY * distance)
        return target
    end

    function self:IsFreecamEnabled()
        return IsCamActive(self._internal_camera) == 1
    end

    function self:LockControls()
        for _, v in pairs(self.controls) do
            DisableControlAction(0, v, true)
        end
        EnableControlAction(0, 166, true)
    end

    function self:SetFreecamEnabled(enable)

        if (enable == self:IsFreecamEnabled()) then
            return
        end

        if (enable) then
            local pos = GetGameplayCamCoord();
            local rot = GetGameplayCamRot();

            self._internal_camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true);

            self:SetFreecamFov(self.settings.fov or 45.0)
            self:SetFreecamPosition(pos.x, pos.y, pos.z)
            self:SetFreecamRotation(rot.x or 0, rot.y, rot.z)
        else

            DestroyCam(self._internal_camera);
            ClearFocus();
            UnlockMinimapPosition();
            UnlockMinimapAngle();

        end

        --SetPlayerControl(PlayerId(), not enable)
        RenderScriptCams(enable, self.settings.enableEasing, self.settings.easingDuration);

    end

    function self:IsCamEnabled()
        return self:IsFreecamEnabled()
    end

    function self:SetCamEnabled(enable)
        return self:SetFreecamEnabled(enable)
    end

    function self:IsCamFrozen()
        return self:IsFreecamFrozen()
    end

    function self:SetCamFrozen(frozen)
        return self:SetFreecamFrozen(frozen)
    end

    function self:GetCamFov()
        return self:GetFreecamFov()
    end

    function self:SetCamFov(fov)
        return self:SetFreecamFov(fov)
    end

    function self:GetCamTarget(distance)
        return {table.unpack(self:GetFreecamTarget(distance))}
    end

    function self:GetCamPosition()
        return {table.unpack(self:GetFreecamPosition())}
    end

    function self:SetCamPosition(x, y, z)
        return self:SetFreecamPosition(x, y, z)
    end

    function self:GetCamRotation()
        return {table.unpack(self:GetFreecamRotation())}
    end

    function self:SetCamRotation(x, y, z)
        return self:SetFreecamRotation(x, y, z)
    end

    function self:GetCamPitch()
        return self:GetFreecamRotation().x
    end

    function self:GetCamRoll()
        return self:GetFreecamRotation().y
    end

    function self:GetCamYaw()
        return self:GetFreecamRotation().z
    end

    function self:GetSpeedMultiplier()
        if IsDisabledControlPressed(0, 180) then
            if self.settings.normalMoveMultiplier > 1.0 then
                self.settings.normalMoveMultiplier = self.settings.normalMoveMultiplier - 0.5
            elseif self.settings.normalMoveMultiplier > 0.2 then
                self.settings.normalMoveMultiplier = self.settings.normalMoveMultiplier - 0.1
            else
                self.settings.normalMoveMultiplier = self.settings.normalMoveMultiplier - 0.01
            end
        elseif IsDisabledControlPressed(0, 181) then
            if self.settings.normalMoveMultiplier < 0.2 then
                self.settings.normalMoveMultiplier = self.settings.normalMoveMultiplier + 0.01
            elseif self.settings.normalMoveMultiplier > 1.0 then
                self.settings.normalMoveMultiplier = self.settings.normalMoveMultiplier + 0.5
            else
                self.settings.normalMoveMultiplier = self.settings.normalMoveMultiplier + 0.1
            end
        end

        if self.settings.normalMoveMultiplier < 0 then
            self.settings.normalMoveMultiplier = 0
        end

        return self.settings.normalMoveMultiplier
    end

    function self:CameraLoop()
        if IsPauseMenuActive() then
            return
        end
        if not self:IsFreecamFrozen() then
            local ped = PlayerPedId();
            local vecX, vecY = self:GetFreecamMatrix()
            local vecZ = vector3(0, 0, 1)
            local pos = self:GetFreecamPosition()
            local rot = self:GetFreecamRotation()
            local frameMultiplier = GetFrameTime() * 60
            local speedMultiplier = self:GetSpeedMultiplier() * frameMultiplier
            local mouseX = GetDisabledControlNormal(0, self.INPUT_LOOK_LR)
            local mouseY = GetDisabledControlNormal(0, self.INPUT_LOOK_UD)
            local moveWS = GetDisabledControlNormal(0, self.INPUT_MOVE_UD)
            local moveAD = GetDisabledControlNormal(0, self.INPUT_MOVE_LR)
            local moveQZ = self:GetDisabledControlNormalBetween(0, self.INPUT_COVER, self.INPUT_MULTIPLAYER_INFO)
            local rotX = rot.x + (-mouseY * self.settings.mouseSensitivityY)
            local rotZ = rot.z + (-mouseX * self.settings.mouseSensitivityX)
            local rotY = 0.0
            pos = pos + (vecX * moveAD * speedMultiplier)
            pos = pos + (vecY * -moveWS * speedMultiplier)
            pos = pos + (vecZ * moveQZ * speedMultiplier)

            if #(pos - GetEntityCoords(ped)) > 20.0 then
                pos = GetEntityCoords(ped)
            end

            rot = vector3(rotX, rotY, rotZ)
            self:SetFreecamPosition(pos.x, pos.y, pos.z)
            self:SetFreecamRotation(rot.x, rot.y, rot.z)

            self:LockControls()
            SetEntityCoordsNoOffset(ped, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0)
        end
    end

    function self:Clamp(x, min, max)
        return math.min(math.max(x, min), max)
    end

    function self:GetDisabledControlNormalBetween(inputGroup, control1, control2)
        local normal1 = GetDisabledControlNormal(inputGroup, control1)
        local normal2 = GetDisabledControlNormal(inputGroup, control2)
        return normal1 - normal2
    end

    function self:EulerToMatrix(rotX, rotY, rotZ)
        local radX = math.rad(rotX)
        local radY = math.rad(rotY)
        local radZ = math.rad(rotZ)

        local sinX = math.sin(radX)
        local sinY = math.sin(radY)
        local sinZ = math.sin(radZ)
        local cosX = math.cos(radX)
        local cosY = math.cos(radY)
        local cosZ = math.cos(radZ)

        local vecX = {}
        local vecY = {}
        local vecZ = {}

        vecX.x = cosY * cosZ
        vecX.y = cosY * sinZ
        vecX.z = -sinY

        vecY.x = cosZ * sinX * sinY - cosX * sinZ
        vecY.y = cosX * cosZ - sinX * sinY * sinZ
        vecY.z = cosY * sinX

        vecZ.x = -cosX * cosZ * sinY + sinX * sinZ
        vecZ.y = -cosZ * sinX + cosX * sinY * sinZ
        vecZ.z = cosX * cosY

        vecX = vector3(vecX.x, vecX.y, vecX.z)
        vecY = vector3(vecY.x, vecY.y, vecY.z)
        vecZ = vector3(vecZ.x, vecZ.y, vecZ.z)

        return vecX, vecY, vecZ
    end

    function self:GetBlips()
        return (type(self.blips) == "table" and self.blips or {})
    end

    function self:GetBlipFromPlayer(player_id)

        if (type(player_id) ~= "number") then
            return
        end

        return (type(self.blips) == "table" and self.blips[player_id] or false)

    end

    function self:AddBlipForPlayer(player_id)
        if (type(player_id) ~= "number") then
            return
        end

        local blip_exist = self:GetBlipFromPlayer(player_id)
        if (blip_exist and DoesBlipExist(blip_exist)) then
            self:RemoveBlipForPlayer(player_id)
        end

        local player_data = Client.PlayersManager:GetFromId(player_id)
        if not player_data then
            return
        end
        
        local player_selected = GetPlayerFromServerId(player_id)
        local player_ped = nil
        local player_coords = nil
        
        if player_selected ~= -1 then
            player_ped = GetPlayerPed(player_selected)
            if player_ped and player_ped ~= 0 and DoesEntityExist(player_ped) then
                player_coords = GetEntityCoords(player_ped)
            end
        end
        
        if not player_coords or not player_coords.x then
            if player_data.coords and player_data.coords.x then
                player_coords = player_data.coords
            else
                player_coords = vector3(0.0, 0.0, 70.0)
            end
        end

        local blip = nil
        
        if player_ped and player_ped ~= 0 and player_selected ~= -1 and DoesEntityExist(player_ped) then
            blip = AddBlipForEntity(player_ped)
        else
            blip = AddBlipForCoord(player_coords.x, player_coords.y, player_coords.z)
        end
        
        if not blip or blip == 0 then
            return
        end

        SetBlipCategory(blip, 7)
        SetBlipScale(blip, 0.85)
        SetBlipSprite(blip, 1)
        SetBlipColour(blip, 0)
        SetBlipDisplay(blip, 2)
        SetBlipAsShortRange(blip, false)
        
        if player_selected == -1 then
            SetBlipColour(blip, 6)
        end

        if player_ped and player_ped ~= 0 and player_selected ~= -1 and DoesEntityExist(player_ped) then
            local player_selected_vehicle = GetVehiclePedIsIn(player_ped, false)

            if IsEntityDead(player_ped) then
                SetBlipSprite(blip, 303)
                SetBlipColour(blip, 1)
                ShowHeadingIndicatorOnBlip(blip, false)
            elseif player_selected_vehicle and player_selected_vehicle ~= 0 then
                if IsPedInAnyBoat(player_ped) then
                    SetBlipSprite(blip, 427)
                elseif IsPedInAnyHeli(player_ped) then
                    SetBlipSprite(blip, 43)
                elseif IsPedInAnyPlane(player_ped) then
                    SetBlipSprite(blip, 423)
                elseif IsPedInAnyPoliceVehicle(player_ped) then
                    SetBlipSprite(blip, 137)
                elseif IsPedInAnySub(player_ped) then
                    SetBlipSprite(blip, 308)
                elseif IsPedInAnyVehicle(player_ped) then
                    SetBlipSprite(blip, 225)
                end
                
                ShowHeadingIndicatorOnBlip(blip, false)
                SetBlipRotation(blip, math.ceil(GetEntityHeading(player_selected_vehicle)))
            else
                SetBlipSprite(blip, 1)
                ShowHeadingIndicatorOnBlip(blip, true)
                SetBlipRotation(blip, math.ceil(GetEntityHeading(player_ped)))
            end
        else
            if player_data.isDead then
                SetBlipSprite(blip, 303)
                SetBlipColour(blip, 1)
            elseif player_data.inVehicle then
                if player_data.vehicleType then
                    if player_data.vehicleType == "boat" then
                        SetBlipSprite(blip, 427)
                    elseif player_data.vehicleType == "heli" then
                        SetBlipSprite(blip, 43)
                    elseif player_data.vehicleType == "plane" then
                        SetBlipSprite(blip, 423)
                    elseif player_data.vehicleType == "police" then
                        SetBlipSprite(blip, 137)
                    elseif player_data.vehicleType == "submarine" then
                        SetBlipSprite(blip, 308)
                    else
                        SetBlipSprite(blip, 225)
                    end
                end
            end
        end

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(("(%s) - %s"):format(player_id, player_data.name or "Joueur"))
        EndTextCommandSetBlipName(blip)

        if player_data.group and player_data.group ~= "user" then
            SetBlipColour(blip, 27)
        end

        self.blips[player_id] = blip
        
        return blip
    end

    function self:RemoveBlipForPlayer(player_id)

        if (type(player_id) ~= "number") then
            return
        end

        local blip_exist = self:GetBlipFromPlayer(player_id)

        if (not blip_exist or not DoesBlipExist(blip_exist)) then
            return
        end

        RemoveBlip(blip_exist);
        self.blips[player_id] = nil;

    end

    function self:GetTags()
        return (type(self.tags) == "table" and self.tags or {})
    end

    function self:GetTagFromPlayer(player_id)
        if (type(player_id) ~= "number") then
            return
        end

        return (type(self.tags) == "table" and self.tags[player_id] or false)
    end

    function self:RemoveAllTags()
        for k, v in pairs(self.tags) do
            if type(v) == "number" then
                RemoveMpGamerTag(v)
            end
        end
        self.tags = {}
    end

    function self:AddTagForPlayer(player_id)
        if (type(player_id) ~= "number") then
            return
        end

        local tag_exist = self:GetTagFromPlayer(player_id)
        if tag_exist and type(tag_exist) == "number" then
            RemoveMpGamerTag(tag_exist)
            self.tags[player_id] = nil
        end

        local player_selected = GetPlayerFromServerId(player_id)
        if player_selected == -1 then return end
        
        local player_ped = GetPlayerPed(player_selected)
        if not player_ped or player_ped == 0 then return end
        
        local player_data = Client.PlayersManager:GetFromId(player_id)
        if not player_data then return end
        
        self:CreateTagForPlayer(player_id, player_selected, player_ped, player_data)
    end
    
    function self:CreateTagForPlayer(player_id, player_selected, player_ped, player_data)
        local useAdvancedTag = Client.Admin:GetPreferenceFromName("advanced_gamertag")
        local nameTag = ""
        local crewDisplay = ""
        
        local playerUID = nil
        local receivedUID = nil
        
        RegisterNetEvent('esx:retouruidjoueur')
        AddEventHandler('esx:retouruidjoueur', function(serverId, uid)
            if serverId == player_id then
                receivedUID = uid
            end
        end)
        
        TriggerServerEvent('esx:UIDClient', player_id)
        
        local attempts = 0
        while not receivedUID and attempts < 10 do
            Wait(100)
            attempts = attempts + 1
        end
        
        playerUID = receivedUID
        
        if useAdvancedTag then
            local uniqueId = player_data.uniqueId or player_data.unique_id or "U"
            
            if playerUID then
                nameTag = ('[UID %s | T %s] %s'):format(playerUID, player_id, player_data.name)
            else
                nameTag = ('[T %s] %s'):format(player_id, player_data.name)
            end
            
            if player_data.identity then
                nameTag = nameTag .. (' - %s'):format(player_data.identity)
            end
            
            if player_data.job and player_data.job.name and player_data.job.name ~= "unemployed" and player_data.job.name ~= "unemployed2" then
                nameTag = nameTag .. (' | JOB: %s'):format(player_data.job.label or player_data.job.name)
                if player_data.job.grade_label then
                    nameTag = nameTag .. (' %s'):format(player_data.job.grade_label)
                end
            end
            
            if player_data.job2 and player_data.job2.name and player_data.job2.name ~= "unemployed" and player_data.job2.name ~= "unemployed2" then
                crewDisplay = player_data.job2.name
            else
                crewDisplay = ""
            end
        else
            if playerUID then
                nameTag = ('[%s | UID %s] %s'):format(player_id, playerUID, player_data.name)
            else
                nameTag = ('[%s] %s'):format(player_id, player_data.name)
            end
            
            if player_data.identity then
                nameTag = nameTag .. (' | %s'):format(player_data.identity)
            end
            crewDisplay = ""
        end
        
        local gamerTag = CreateFakeMpGamerTag(player_ped, nameTag, false, false, crewDisplay, 0, 0, 0, 0)
        
        SetMpGamerTagVisibility(gamerTag, 0, true) 
        SetMpGamerTagVisibility(gamerTag, 2, true) 
        SetMpGamerTagVisibility(gamerTag, 4, NetworkIsPlayerTalking(player_selected))
        SetMpGamerTagVisibility(gamerTag, 5, (GetEntityHealth(player_ped) > GetEntityMaxHealth(player_ped) or GetPlayerInvincible(player_selected) or GetPlayerInvincible_2(player_selected)))
        SetMpGamerTagVisibility(gamerTag, 7, player_data.group ~= "user")
        SetMpGamerTagVisibility(gamerTag, 14, Client.Admin:StaffGetValue(player_id, "state") == true)
        
        if useAdvancedTag then
            SetMpGamerTagVisibility(gamerTag, 1, crewDisplay ~= "")
        else
            SetMpGamerTagVisibility(gamerTag, 1, false)
        end
        
        SetMpGamerTagAlpha(gamerTag, 0, 255)
        SetMpGamerTagAlpha(gamerTag, 1, 255)
        SetMpGamerTagAlpha(gamerTag, 2, 255)
        SetMpGamerTagAlpha(gamerTag, 4, 255)
        SetMpGamerTagAlpha(gamerTag, 7, 255)
        SetMpGamerTagHealthBarColor(gamerTag, 21)
        
        SetMpGamerTagColour(gamerTag, 5, 0)
        SetMpGamerTagColour(gamerTag, 7, 21)
        SetMpGamerTagColour(gamerTag, 14, 21)
        
        if NetworkIsPlayerTalking(player_selected) then
            SetMpGamerTagColour(gamerTag, 4, 211)
            SetMpGamerTagColour(gamerTag, 0, 211)
        else
            SetMpGamerTagColour(gamerTag, 4, 0)
            SetMpGamerTagColour(gamerTag, 0, 0)
        end
        
        self.tags[player_id] = gamerTag
        return gamerTag
    end

    function self:UpdateTags()
        if not Client.Admin:IsInStaffMode() then
            if not IsPauseMenuActive() then
                self:RemoveAllTags()
            end
            return
        end
        
        local showOwnTag = Client.Admin:GetPreferenceFromName("own_gamertag")
        local showOtherTags = Client.Admin:GetPreferenceFromName("gamertag")
        local useAdvancedTag = Client.Admin:GetPreferenceFromName("advanced_gamertag")
        local client_player_server_id = Client.Player:GetServerId()
        
        local tagNeedsUpdate = {}
        local activePlayers = {}
        
        for _, player in pairs(GetActivePlayers()) do
            local playerId = GetPlayerServerId(player)
            local playerPed = GetPlayerPed(player)
            
            if playerPed and playerPed ~= 0 then
                activePlayers[playerId] = true
                
                if playerId == client_player_server_id then
                    if showOwnTag and not self.tags[playerId] then
                        tagNeedsUpdate[playerId] = true
                    elseif not showOwnTag and self.tags[playerId] then
                        RemoveMpGamerTag(self.tags[playerId])
                        self.tags[playerId] = nil
                    end
                else
                    if showOtherTags and not self.tags[playerId] then
                        tagNeedsUpdate[playerId] = true
                    elseif not showOtherTags and self.tags[playerId] then
                        RemoveMpGamerTag(self.tags[playerId])
                        self.tags[playerId] = nil
                    end
                end
            end
        end
        
        for playerId, tagId in pairs(self.tags) do
            if type(tagId) == "number" and not activePlayers[playerId] then
                RemoveMpGamerTag(tagId)
                self.tags[playerId] = nil
            end
        end
        
        for playerId, _ in pairs(tagNeedsUpdate) do
            if activePlayers[playerId] then
                self:AddTagForPlayer(playerId)
            end
        end
    end

    function self:UpdateTagsRealtime()
        if not Client.Admin:IsInStaffMode() then
            return
        end
        
        for playerId, tagId in pairs(self.tags) do
            if type(tagId) == "number" then
                local player_selected = GetPlayerFromServerId(playerId)
                
                if player_selected ~= -1 then
                    local player_ped = GetPlayerPed(player_selected)
                    
                    if player_ped and player_ped ~= 0 and DoesEntityExist(player_ped) then
                        SetMpGamerTagVisibility(tagId, 4, NetworkIsPlayerTalking(player_selected))
                        SetMpGamerTagVisibility(tagId, 5, (GetEntityHealth(player_ped) > GetEntityMaxHealth(player_ped) or GetPlayerInvincible(player_selected) or GetPlayerInvincible_2(player_selected)))
                        
                        if NetworkIsPlayerTalking(player_selected) then
                            SetMpGamerTagColour(tagId, 4, 211)
                            SetMpGamerTagColour(tagId, 0, 211)
                        else
                            SetMpGamerTagColour(tagId, 4, 0)
                            SetMpGamerTagColour(tagId, 0, 0)
                        end
                    end
                end
            end
        end
    end

    function self:StartTagUpdates()
        if self.tagUpdateRunning then return end
        
        self.tagUpdateRunning = true
        local wasPauseMenuActive = false
        local wasInventoryOpen = false
        local wasKnownKeyPressed = false
        
        CreateThread(function()
            Wait(2000)
            
            for i = 1, 5 do
                if not self.tagUpdateRunning then break end
                self:UpdateTags()
                Wait(100)
            end
            
            while self.tagUpdateRunning do
                local isPauseMenuActive = IsPauseMenuActive()
                local isTabPressed = IsControlJustPressed(0, 37) 
                local isEscPressed = IsControlJustPressed(0, 200)
                local isAnyKeyPressed = isTabPressed or isEscPressed
                
                if isAnyKeyPressed and Client.Admin:IsInStaffMode() then
                    wasKnownKeyPressed = true
                    Wait(100)
                    self:RemoveAllTags()
                    Wait(300)
                    
                    CreateThread(function()
                        Wait(500)
                        if Client.Admin:IsInStaffMode() then
                            self:UpdateTags()
                            
                            Wait(100)
                            if not self.tags or Shared.Table:SizeOf(self.tags) == 0 then
                                self:RemoveAllTags()
                                Wait(200)
                                
                                local client_player_server_id = Client.Player:GetServerId()
                                for _, player in pairs(GetActivePlayers()) do
                                    local playerId = GetPlayerServerId(player)
                                    if playerId and (
                                        (playerId ~= client_player_server_id and Client.Admin:GetPreferenceFromName("gamertag")) or
                                        (playerId == client_player_server_id and Client.Admin:GetPreferenceFromName("own_gamertag"))
                                    ) then
                                        self:AddTagForPlayer(playerId)
                                        Wait(10)
                                    end
                                end
                            end
                        end
                        wasKnownKeyPressed = false
                    end)
                end
                
                if not isPauseMenuActive and not wasKnownKeyPressed then
                    if wasPauseMenuActive then
                        if Client.Admin:IsInStaffMode() then
                            self:RemoveAllTags()
                            Wait(100)
                            
                            local client_player_server_id = Client.Player:GetServerId()
                            for _, player in pairs(GetActivePlayers()) do
                                local playerId = GetPlayerServerId(player)
                                if playerId and (
                                    (playerId ~= client_player_server_id and Client.Admin:GetPreferenceFromName("gamertag")) or
                                    (playerId == client_player_server_id and Client.Admin:GetPreferenceFromName("own_gamertag"))
                                ) then
                                    self:AddTagForPlayer(playerId)
                                    Wait(10)
                                end
                            end
                        end
                    else
                        self:UpdateTags()
                    end
                end
                
                wasPauseMenuActive = isPauseMenuActive
                Wait(300)
            end
        end)

        CreateThread(function()
            while self.tagUpdateRunning do
                self:UpdateTagsRealtime()
                Wait(10)
            end
        end)
    end

    function self:StopTagUpdates()
        self.tagUpdateRunning = false
        self:RemoveAllTags()
    end

    function self:RemoveTagForPlayer(player_id)
        if (type(player_id) ~= "number") then
            return
        end

        local tag_exist = self:GetTagFromPlayer(player_id)

        if (not tag_exist or type(tag_exist) ~= "number") then
            return
        end

        RemoveMpGamerTag(tag_exist)
        self.tags[player_id] = nil
    end

    function self:UpdateBlips()
        if not self.showBlips then
            if self.blipsInitialized then
                self:RemoveAllBlips()
                self.blipsInitialized = false
            end
            return
        end

        self.blipsInitialized = true
        
        local localPlayerId = GetPlayerServerId(PlayerId())
        local allPlayers = {}
        local players = Client.PlayersManager:GetAll()
        
        for id, playerData in pairs(players) do
            if tonumber(id) then
                allPlayers[tonumber(id)] = playerData
            end
        end
        
        local playerCount = 0
        for _ in pairs(allPlayers) do
            playerCount = playerCount + 1
        end
        
        for id, _ in pairs(allPlayers) do
        end
        
        for player_id, blip in pairs(self.blips) do
            if not allPlayers[player_id] then
                self:RemoveBlipForPlayer(player_id)
            end
        end
        
        for player_id, playerData in pairs(allPlayers) do
            if player_id ~= localPlayerId then
                local blip = self:GetBlipFromPlayer(player_id)
                local player_selected = GetPlayerFromServerId(player_id)
                
                if player_selected ~= -1 then
                    local player_ped = GetPlayerPed(player_selected)
                    
                    if DoesEntityExist(player_ped) then
                        if blip and DoesBlipExist(blip) then
                            local player_selected_vehicle = GetVehiclePedIsIn(player_ped, false)
                            
                            if IsEntityDead(player_ped) then
                                SetBlipSprite(blip, 303)
                                SetBlipColour(blip, 1)
                                ShowHeadingIndicatorOnBlip(blip, false)
                            elseif player_selected_vehicle ~= 0 then
                                if IsPedInAnyBoat(player_ped) then
                                    SetBlipSprite(blip, 427)
                                elseif IsPedInAnyHeli(player_ped) then
                                    SetBlipSprite(blip, 43)
                                elseif IsPedInAnyPlane(player_ped) then
                                    SetBlipSprite(blip, 423)
                                elseif IsPedInAnyPoliceVehicle(player_ped) then
                                    SetBlipSprite(blip, 137)
                                elseif IsPedInAnySub(player_ped) then
                                    SetBlipSprite(blip, 308)
                                elseif IsPedInAnyVehicle(player_ped) then
                                    SetBlipSprite(blip, 225)
                                end
                                SetBlipColour(blip, 0)
                                ShowHeadingIndicatorOnBlip(blip, false)
                                SetBlipRotation(blip, math.ceil(GetEntityHeading(player_selected_vehicle)))
                            else
                                SetBlipSprite(blip, 1)
                                SetBlipColour(blip, 0)
                                ShowHeadingIndicatorOnBlip(blip, true)
                                SetBlipRotation(blip, math.ceil(GetEntityHeading(player_ped)))
                            end
                            
                            local coords = GetEntityCoords(player_ped)
                            SetBlipCoords(blip, coords.x, coords.y, coords.z)
                            
                            if playerData.group and playerData.group ~= "user" then
                                SetBlipColour(blip, 27)
                            end
                        else
                            self:AddBlipForPlayer(player_id)
                        end
                    end
                else
                    if blip and DoesBlipExist(blip) then
                        if playerData.coords then
                            SetBlipCoords(blip, playerData.coords.x, playerData.coords.y, playerData.coords.z)
                            
                            if playerData.isDead then
                                SetBlipSprite(blip, 303)
                                SetBlipColour(blip, 1)
                            elseif playerData.inVehicle then
                                if playerData.vehicleType then
                                    if playerData.vehicleType == "boat" then
                                        SetBlipSprite(blip, 427)
                                    elseif playerData.vehicleType == "heli" then
                                        SetBlipSprite(blip, 43)
                                    elseif playerData.vehicleType == "plane" then
                                        SetBlipSprite(blip, 423)
                                    elseif playerData.vehicleType == "police" then
                                        SetBlipSprite(blip, 137)
                                    elseif playerData.vehicleType == "submarine" then
                                        SetBlipSprite(blip, 308)
                                    else
                                        SetBlipSprite(blip, 225)
                                    end
                                else
                                    SetBlipSprite(blip, 225)
                                end
                            else
                                SetBlipSprite(blip, 1)
                            end
                            
                            if playerData.group and playerData.group ~= "user" then
                                SetBlipColour(blip, 27)
                            else
                                if not playerData.isDead then
                                    SetBlipColour(blip, 0)
                                end
                            end
                        end
                    else
                        self:AddBlipForPlayer(player_id)
                    end
                end
            end
        end
    end

    function self:RemoveAllBlips()
        for player_id, blip in pairs(self.blips) do
            if type(blip) == "number" and DoesBlipExist(blip) then
                RemoveBlip(blip)
            end
        end
        self.blips = {}
    end

    function self:StartBlipUpdates()
        if self.blipUpdateRunning then return end
        
        self.showBlips = true
        self.blipUpdateRunning = true
        
        
        CreateThread(function()
            Wait(1000)
            
            self:UpdateBlips()
            
            while self.blipUpdateRunning do
                if not IsPauseMenuActive() then
                    self:UpdateBlips()
                end
                Wait(500)
            end
        end)
    end

    function self:StopBlipUpdates()
        self.blipUpdateRunning = false
        for playerId, blip in pairs(self.blips) do
            if type(blip) == "number" and DoesBlipExist(blip) then
                RemoveBlip(blip)
            end
        end
        self.blips = {}
    end

    return self;

end);