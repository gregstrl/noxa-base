local TextPanels = {
    Background = { Dictionary = "kaidomenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 42 },
}

function RageUIv3.RenderSprite(Dictionary, Texture)
    local CurrentMenu = RageUIv3.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, CurrentMenu.X, CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + RageUIv3.ItemOffset + (RageUIv3.StatisticPanelCount * 42), TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height + 200, 0, 255, 255, 255, 255);
            RageUIv3.StatisticPanelCount = RageUIv3.StatisticPanelCount + 1
        end
    end
end
