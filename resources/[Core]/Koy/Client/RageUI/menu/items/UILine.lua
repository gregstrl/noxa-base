--[[
--Created Date: Friday June 24th 2022
--Author: JustGod
--Made with ❤
-------
--Last Modified: Friday June 24th 2022 2:10:55 pm
-------
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of commonmenu project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
-------
--]]

---@type table
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 35 },
    Text = { X = 8, Y = 3, Scale = 0.30 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
    RightText = { X = 420, Y = 4, Scale = 0.35 },
    SelectedSprite = { Dictionary = "commonmenu", Texture = "percentagebar", Y = 0, Width = 431, Height = 44 },
}

function Items:Line()
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then

                RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X - 32 + (CurrentMenu.WidthOffset * 2.5 ~= 0 and CurrentMenu.WidthOffset * 2.5 or 200)-150+8, CurrentMenu.Y - 5 + RageUI.ItemOffset + 15, 300, 3, false, 255,255,255, 255)

                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height + 10
                if (CurrentMenu.Index == Option) then
                    if (RageUI.LastControl) then
                        CurrentMenu.Index = Option - 1
                        if (CurrentMenu.Index < 1) then
                            CurrentMenu.Index = RageUI.CurrentMenu.Options
                        end
                    else
                        CurrentMenu.Index = Option + 1
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end