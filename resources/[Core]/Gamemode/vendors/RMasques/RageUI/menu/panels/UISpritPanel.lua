local TextPanels = {
    Background = { Dictionary = "kaidomenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 42 },
}

function RageUIMasques.RenderSprite(Dictionary, Texture)
    local CurrentMenu = RageUIMasques.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, CurrentMenu.X, CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + RageUIMasques.ItemOffset + (RageUIMasques.StatisticPanelCount * 42), TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height + 200, 0, 255, 255, 255, 255);
            RageUIMasques.StatisticPanelCount = RageUIMasques.StatisticPanelCount + 1
        end
    end
end
