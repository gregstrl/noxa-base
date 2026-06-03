--[[
----
----Created Date: 2024
----Author: Koy
----Made with ❤
----
----File: [noclip_options]
----
----Copyright (c) 2024 KoyWork, All Rights Reserved.
----This file is part of KoyWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

if _G.noclipPrefsInitialized == nil then
    _G.noclipPrefsInitialized = false
    
    Citizen.CreateThread(function()
        Wait(1000) 
        
        if Client and Client.Admin then
            local prefNoclipAdvanced = Client.Admin:GetPreferenceFromName("prefer_advanced_noclip")
            _G.preferAdvancedNoclip = prefNoclipAdvanced
            
            local kvpValue = GetResourceKvpString("admin:preferences:prefer_advanced_noclip")
            
            if kvpValue == "true" then
                _G.preferAdvancedNoclip = true
                SetResourceKvp("admin:preferences:prefer_advanced_noclip", "true")
            elseif kvpValue == "false" then
                _G.preferAdvancedNoclip = false
                SetResourceKvp("admin:preferences:prefer_advanced_noclip", "false")
            end
            
            _G.noclipPrefsInitialized = true
        end
    end)
end

local AdminStorage = Shared.Storage:Get("Administration");

---@type UIMenu
local noclip_options_menu = AdminStorage:Get("admin_noclip_options");

noclip_options_menu:IsVisible(function(Items)
    if _G.preferAdvancedNoclip == nil then
        _G.preferAdvancedNoclip = Client.Admin:GetPreferenceFromName("prefer_advanced_noclip") or false
    end
    
    if not _G.noclipPrefsInitialized then
        _G.noclipPrefsInitialized = true
        _G.preferAdvancedNoclip = Client.Admin:GetPreferenceFromName("prefer_advanced_noclip") or false
    end
    
    Items:Checkbox("Noclip simple", "Utilise le noclip standard du système", not _G.preferAdvancedNoclip, {}, {
        onSelected = function(Checked)
            _G.preferAdvancedNoclip = not Checked
            Client.Admin:SetPreferenceFromName("prefer_advanced_noclip", _G.preferAdvancedNoclip)
            
            SetResourceKvp("admin:preferences:prefer_advanced_noclip", tostring(_G.preferAdvancedNoclip))
            
            ESX.ShowNotification("[~g~Succès~s~] Mode noclip standard " .. (Checked and "activé" or "désactivé"))
            
            if Checked and _G.noclipAdvancedActive then
                _G.noclipAdvancedActive = false
                toggleNoClip()
                if cleanAllScaleforms then
                    cleanAllScaleforms()
                end
            end
        end
    });

    Items:Checkbox("Noclip avancé", "Utilise le noclip avancé avec plus d'options", _G.preferAdvancedNoclip, {}, {
        onSelected = function(Checked)
            _G.preferAdvancedNoclip = Checked
            Client.Admin:SetPreferenceFromName("prefer_advanced_noclip", Checked)
            
            SetResourceKvp("admin:preferences:prefer_advanced_noclip", tostring(Checked))
            
            ESX.ShowNotification("[~g~Succès~s~] Mode noclip avancé " .. (Checked and "activé" or "désactivé"))

            if Checked and Client.Admin.Ped:HasNoClipActive() then
                Client.Admin.Ped:SetNoClipActive(false)
                Client.Admin.Ped:OnNoClip()
                _G.noclipAdvancedActive = true
                toggleNoClip()
            end
        end
    });
end) 