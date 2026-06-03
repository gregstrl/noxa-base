local TextPanels = {
    Background = { Dictionary = "kaidomenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 42 },
}

function RageUIDeath.RenderSprite(Dictionary, Texture)
    local CurrentMenu = RageUIDeath.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, CurrentMenu.X, CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + RageUIDeath.ItemOffset + (RageUIDeath.StatisticPanelCount * 42), TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height + 200, 0, 255, 255, 255, 255);
            RageUIDeath.StatisticPanelCount = RageUIDeath.StatisticPanelCount + 1
        end
    end
end
