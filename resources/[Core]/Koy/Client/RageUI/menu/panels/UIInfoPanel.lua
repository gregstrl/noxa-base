--[[
--Created Date: Friday August 26th 2022
--Author: JustGod
--Made with ❤
-------
--Last Modified: Friday August 26th 2022 12:51:40 pm
-------
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
-------
--]]

---@param Title string
---@param LeftText table
---@param RightText table
---@param Index number
---@param startAt number
function Panels:info(Title, LeftText, RightText, Index, startAt)
    local CurrentMenu = RageUI.CurrentMenu
    local LineCount = (RightText and LeftText and #LeftText >= #RightText and #LeftText or LeftText and #LeftText) or 1
    local baseX = 232 + 20 + 100
    local baseY = 2
    local width = 310
    if CurrentMenu then
        if (not Index and not startAt) or ((not Index and startAt) and CurrentMenu.Index >= startAt) or ((not startAt and Index) and CurrentMenu.Index == Index) then
            if Title ~= nil then
                RenderText("~h~" .. Title .. "~s~", baseX + 20, baseY + 15, 8, 0.30, 255, 255, 255, 255, 0)
            end
            if LeftText ~= nil then
                RenderText(table.concat(LeftText, "\n"), baseX + 20, Title ~= nil and baseY + 40 or baseY + 15, 8, 0.25, 255, 255, 255, 255, 0)
            end
            if RightText ~= nil then
                RenderText(table.concat(RightText, "\n"), baseX + 150, Title ~= nil and baseY + 40 or baseY + 15, 8, 0.25, 255, 255, 255, 255, 0)
            end
            RenderSprite("commonmenu", "gradient_bgd", baseX, baseY, width, Title ~= nil and 65 + (LineCount * 20) or ((LineCount + 1) * 20), 0)
            RenderRectangle(baseX + width - 2, baseY, 2, Title ~= nil and 65 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 85, 255, 255)
        end
    end
end