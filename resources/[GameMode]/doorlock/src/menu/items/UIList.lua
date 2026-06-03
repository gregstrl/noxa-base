---@type table
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 43 },
    Text = { X = 24, Y = 7, Scale = 0.25 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 375, Y = 0, Width = 40, Height = 40 },
    RightText = { X = 420, Y = 7, Scale = 0.25 },
    SelectedSprite = { Dictionary = "RageUI_", Texture = "gradient_nav", Y = 0, Width = 400, Height = 38 },
}

---@type table
local SettingsList = {
    LeftArrow = { Dictionary = "RageUI_", Texture = "arrow_left", X = 300, Y = 1, Width = 30, Height = 30 },
    RightArrow = { Dictionary = "RageUI_", Texture = "arrow_right", X = 320, Y = 1, Width = 30, Height = 30 },
    Text = { X = 400, Y = 4.5, Scale = 0.25 },
}

---List
---@param Label string
---@param Items table
---@param Index number
---@param Description string
---@param Enabled boolean
---@param Callback function
---@return nil
---@public
function RageUI.List(Label, Items, Index, Description, Style, Enabled, Callback, onListChange, Submenu)
    ---@type table
    local CurrentMenu = RageUI.CurrentMenu;

    if CurrentMenu ~= nil then
        if CurrentMenu() then
            ---@type number
            local Option = RageUI.Options + 1

            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                ---@type number
                local Selected = CurrentMenu.Index == Option
                ---@type boolean
                local LeftArrowHovered, RightArrowHovered = false, false

                RageUI.ItemsSafeZone(CurrentMenu)

                local Hovered = false;
                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)
                local RightOffset = 0
                ---@type boolean
                if CurrentMenu.EnableMouse == true and (CurrentMenu.CursorStyle == 0) or (CurrentMenu.CursorStyle == 1) then
                    Hovered = RageUI.ItemsMouseBounds(CurrentMenu, Selected, Option, SettingsButton);
                end


                if Selected then
                    RenderSprite("commonmenu", "gradient_nav", CurrentMenu.X + 15,
                        CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI
                        .ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset,
                        SettingsButton.SelectedSprite.Height - 1, 0, 0, 85, 255, 255)
                end

                local ListText = (type(Items[Index]) == "table") and string.format("← %s →", Items[Index].Name) or string.format("← %s →", Items[Index]) or "NIL"

                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 0, 0, 0, 255, 2)
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                        end
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                        end
                    end
                end
                
                RightOffset = RightBadgeOffset * 1.3 + RightOffset

                if Enabled == true or Enabled == nil then
                    if Selected then
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 255, 255, 255, 255)
                        RenderText(ListText, CurrentMenu.X + SettingsList.Text.X + 15 + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 255, 255, 255, 255, 2)
                    else
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                        RenderText(ListText, CurrentMenu.X + SettingsList.Text.X + 15 + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 245, 245, 245, 255, 2)
                    end
                else
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)
                    if Selected then
                        RenderText(ListText, CurrentMenu.X + SettingsList.Text.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 163, 159, 148, 255, 2)
                    else
                        RenderText(ListText, CurrentMenu.X + SettingsList.Text.X + 15 + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 163, 159, 148, 255, 2)
                    end
                end

                if type(Style) == "table" then
                    if Style.Enabled == true or Style.Enabled == nil then
                        if type(Style) == 'table' then
                            if Style.LeftBadge ~= nil then
                                if Style.LeftBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.LeftBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end

                            if Style.RightBadge ~= nil then
                                if Style.RightBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.RightBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                        end
                    else
                        ---@type table
                        local LeftBadge = RageUI.BadgeStyle.Lock
                        ---@type number
                        if LeftBadge ~= RageUI.BadgeStyle.None and LeftBadge ~= nil then
                            local BadgeData = LeftBadge(Selected)
                            RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour.A or 255)
                        end
                    end
                else
                    error("UICheckBox Style is not a `table`")
                end

                -- Correction des zones de clic pour les flèches
                local arrowsBaseY = CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset
                local textWidth = MeasureStringWidth(ListText, 0, SettingsList.Text.Scale)
                local arrowWidth = 20
                local arrowHeight = 20
                local arrowPadding = 10

                LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsList.Text.X + CurrentMenu.WidthOffset - RightOffset + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 2.5  + CurrentMenu.SafeZoneSize.Y , 15, 22.5)

                RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsList.Text.X + CurrentMenu.WidthOffset + CurrentMenu.SafeZoneSize.X - RightOffset - MeasureStringWidth(ListText, 0, SettingsList.Text.Scale), CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 2.5 + CurrentMenu.SafeZoneSize.Y , 15, 22.5)

                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height + 10

                RageUI.ItemsDescription(CurrentMenu, Description, Selected);

                if Selected and (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    Index = Index - 1
                    if Index < 0 then -- Changed from 1 to 0
                        Index = #Items
                    end
                    if (onListChange ~= nil) and Items[Index] ~= nil then
                        onListChange(Index, Items[Index]);
                    end
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                elseif Selected and (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    Index = Index + 1
                    if Index > #Items then
                        Index = 0 -- Changed from 1 to 0
                    end
                    if (onListChange ~= nil) and Items[Index] ~= nil then
                        onListChange(Index, Items[Index]);
                    end
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                end

                if Selected and (CurrentMenu.Controls.Select.Active or ((Hovered and CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) then
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)

                    if Submenu ~= nil and type(Submenu) == "table" then
                        RageUI.NextMenu = Submenu[Index]
                    end
                end

                if (Enabled) then
                    Callback(Hovered, Selected, ((CurrentMenu.Controls.Select.Active or ((Hovered and CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) and Selected), Index)
                end
            end

            RageUI.Options = RageUI.Options + 1
        end
    end
end