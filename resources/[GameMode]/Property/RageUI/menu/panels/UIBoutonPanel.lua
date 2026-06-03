local TextPanels = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 42 },
    Text = {
        Left = { X = 8, Y = 10, Scale = 0.35 },
        Right = { X = 8, Y = 10, Scale = 0.35 },
    },
}

local RightBadgeOffset = 5

---BoutonPanel
---@param LeftText string
---@param RightText string
---@public
function RageUI.BoutonPanel(LeftText, RightText, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        local leftTextSize = MeasureStringWidth(LeftText)
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then
            local buttonY = CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42)
            RenderRoundedRectangle(CurrentMenu.X, buttonY, TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height, 10, 0, 0, 0, 170) -- Couleur de fond

            RenderText(LeftText or "", CurrentMenu.X + TextPanels.Text.Left.X, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + TextPanels.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, TextPanels.Text.Left.Scale, 245, 245, 245, 255, 0)
            RenderText(RightText or "", CurrentMenu.X + TextPanels.Background.Width + CurrentMenu.WidthOffset - leftTextSize, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + TextPanels.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, TextPanels.Text.Left.Scale, 245, 245, 245, 255, 2)
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end
