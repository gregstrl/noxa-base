if _G.noclipPrefsInitialized == nil then
    _G.noclipPrefsInitialized = false
    
    Citizen.CreateThread(function()
        Wait(1000) 
        
        if Client and Client.Admin then
            local kvpValue = GetResourceKvpString("admin:preferences:prefer_advanced_noclip")
            
            if kvpValue == "true" then
                _G.preferAdvancedNoclip = true
                Client.Admin:SetPreferenceFromName("prefer_advanced_noclip", true)
                SetResourceKvp("admin:preferences:prefer_advanced_noclip", "true")
            elseif kvpValue == "false" then
                _G.preferAdvancedNoclip = false
                Client.Admin:SetPreferenceFromName("prefer_advanced_noclip", false)
                SetResourceKvp("admin:preferences:prefer_advanced_noclip", "false")
            else
                local prefNoclipAdvanced = Client.Admin:GetPreferenceFromName("prefer_advanced_noclip")
                _G.preferAdvancedNoclip = prefNoclipAdvanced
                SetResourceKvp("admin:preferences:prefer_advanced_noclip", tostring(prefNoclipAdvanced or false))
            end
            
            _G.noclipPrefsInitialized = true
        end
    end)
end 