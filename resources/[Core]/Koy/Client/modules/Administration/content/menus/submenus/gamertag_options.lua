--[[
----
----Created Date: 2024
----Author: Koy
----Made with ❤
----
----File: [gamertag_options]
----
----Copyright (c) 2024 KoyWork, All Rights Reserved.
----This file is part of KoyWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

local AdminStorage = Shared.Storage:Get("Administration");

---@type UIMenu
local gamertag_options_menu = AdminStorage:Get("admin_gamertag_options");

gamertag_options_menu:IsVisible(function(Items)
    Items:Checkbox("Gamertag avancé", "Affiche des informations supplémentaires comme le job2", Client.Admin:GetPreferenceFromName("advanced_gamertag"), {}, {
        onSelected = function(Checked)
            Client.Admin:SetPreferenceFromName("advanced_gamertag", Checked)
            Client.Admin:RefreshAllGamertags()
        end
    });

    Items:Checkbox("Gamertag simple", "Affiche uniquement les informations de base", not Client.Admin:GetPreferenceFromName("advanced_gamertag"), {}, {
        onSelected = function(Checked)
            Client.Admin:SetPreferenceFromName("advanced_gamertag", not Checked)
            Client.Admin:RefreshAllGamertags()
        end
    });
end) 