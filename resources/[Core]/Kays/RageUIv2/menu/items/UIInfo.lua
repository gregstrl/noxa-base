function RageUIv2.Info(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    local baseX = 222 + 20 + 100
    local baseY = 4
    local width = 310

    -- Fond et barre
    RenderSprite("commonmenu", "gradient_bgd", baseX, baseY, width, Title ~= nil and 65 + (LineCount * 20) or ((LineCount + 1) * 20), 0)
    RenderRectangle(baseX + width - 2, baseY, 2, Title ~= nil and 65 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 85, 255, 255)

    -- Titre
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~s~", baseX + 20, baseY + 15, 8, 0.30, 255, 255, 255, 255, 0)
    end

    -- Textes alignés à gauche
    if RightText ~= nil then
        RenderText(table.concat(RightText, "\n"), baseX + 20, Title ~= nil and baseY + 40 or baseY + 15, 8, 0.25, 255, 255, 255, 255, 0)
    end

    if LeftText ~= nil then
        RenderText(table.concat(LeftText, "\n"), baseX + width/2 + 20, Title ~= nil and baseY + 40 or baseY + 15, 8, 0.25, 255, 255, 255, 255, 0)
    end
end
