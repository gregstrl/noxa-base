function RageUI.Info(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~s~", 232 + 20 + 100 + 30, 30, 8, 0.30, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText, "\n"), 232 + 20 + 100 + 30, Title ~= nil and 55 or 30, 8, 0.25, 255, 255, 255, 255, 0)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText, "\n"), 232 + 20 + 100 + 30 + 150, Title ~= nil and 55 or 30, 8, 0.25, 255, 255, 255, 255, 0)
    end
    RenderSprite("k2r", "gradient_bgd", 232 + 20 + 100 + 0, 19, 310, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0)
    RenderRectangle(232 + 20 + 100 + 0 + 310, 19, 2, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 85, 255, 255)
end

function RageUI.InfoRight(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~s~", 232 + 20 + 100 + 30, 30, 8, 0.30, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText, "\n"), 232 + 20 + 100 + 30, Title ~= nil and 55 or 30, 8, 0.25, 255, 255, 255, 255, 0)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText, "\n"), 232 + 20 + 100 + 30 + 150, Title ~= nil and 55 or 30, 8, 0.25, 255, 255, 255, 255, 0)
    end
    RenderSprite("k2r", "gradient_bgd", 232 + 20 + 100 + 0, 19, 310, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0)
    RenderRectangle(232 + 20 + 100 + 0 + 310, 19, 2, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 85, 255, 255)
end