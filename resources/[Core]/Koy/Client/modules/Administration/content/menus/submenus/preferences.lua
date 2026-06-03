---
--- @author Kadir#6666
--- Create at [21/04/2023] 14:31:38
--- Current project [Koy-V1]
--- File name [preferences]
---

local AdminStorage = Shared.Storage:Get("Administration");

---@type UIMenu
local preferences_menu = AdminStorage:Get("admin_preferences");

preferences_menu:IsVisible(function(Items)
    local client_server_id = Client.Player:GetServerId()
    local client_player = Client.PlayersManager:GetFromId(client_server_id)

    Items:Checkbox("Noclip", nil, Client.Admin.Ped:HasNoClipActive() or _G.noclipAdvancedActive, {}, {

        onSelected = function()
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
                Client.Admin.Ped:SetNoClipActive(not Client.Admin.Ped:HasNoClipActive())
                Client.Admin.Ped:OnNoClip()
            end
        end

    });

    Items:Button("Mon personnage", nil, {
    }, true, {
        onSelected = function()
            AdminStorage:Get("hoveredPlayer")({ client_server_id, client_player, true })
        end
    }, AdminStorage:Get("admin_player_selected_me"))
end)