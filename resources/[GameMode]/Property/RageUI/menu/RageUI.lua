---
--- @author Dylan MALANDAIN
--- @version 2.0.0
--- @since 2020
---
--- RageUI Is Advanced UI Libs in LUA for make beautiful interface like RockStar GAME.
---
---
--- Commercial Info.
--- Any use for commercial purposes is strictly prohibited and will be punished.
---
--- @see RageUI
---

function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

---@class RageUIMenus
RageUI.Menus = setmetatable({}, RageUI.Menus)

---@type table
---@return boolean
RageUI.Menus.__call = function()
    return true
end

---@type table
RageUI.Menus.__index = RageUI.Menus

---@type table
RageUI.CurrentMenu = nil

---@type table
RageUI.NextMenu = nil

---@type number
RageUI.Options = 0

---@type number
RageUI.ItemOffset = 0

---@type number
RageUI.StatisticPanelCount = 0

---@class UISize
RageUI.UI = {
    Current = "NativeUI",
    Style = {
        RageUI = {
            Width = 0
        },
        NativeUI = {
            Width = 0
        }
    }
}

---@class Settings
RageUI.Settings = {
    Debug = false,
    Controls = {
        Up = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 172 },
                { 1, 172 },
                { 2, 172 },
                { 0, 241 },
                { 1, 241 },
                { 2, 241 },
            },
        },
        Down = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 173 },
                { 1, 173 },
                { 2, 173 },
                { 0, 242 },
                { 1, 242 },
                { 2, 242 },
            },
        },
        Left = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 174 },
                { 1, 174 },
                { 2, 174 },
            },
        },
        Right = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 175 },
                { 1, 175 },
                { 2, 175 },
            },
        },
        SliderLeft = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 174 },
                { 1, 174 },
                { 2, 174 },
            },
        },
        SliderRight = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 175 },
                { 1, 175 },
                { 2, 175 },
            },
        },
        Select = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 201 },
                { 1, 201 },
                { 2, 201 },
            },
        },
        Back = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 177 },
                { 1, 177 },
                { 2, 177 },
                { 0, 199 },
                { 1, 199 },
                { 2, 199 },
            },
        },
        Click = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 24 },
            },
        },
        PageUp = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 10 },
            },
        },
        PageDown = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 11 },
            },
        },
        Enabled = {
            Controller = {
                { 0, 2 }, -- Look Up and Down
                { 0, 1 }, -- Look Left and Right
                { 0, 25 }, -- Aim
                { 0, 24 }, -- Attack
            },
            Keyboard = {
                { 0, 201 }, -- Select
                { 0, 195 }, -- X axis
                { 0, 196 }, -- Y axis
                { 0, 187 }, -- Down
                { 0, 188 }, -- Up
                { 0, 189 }, -- Left
                { 0, 190 }, -- Right
                { 0, 202 }, -- Back
                { 0, 217 }, -- Select
                { 0, 242 }, -- Scroll down
                { 0, 241 }, -- Scroll up
                { 0, 239 }, -- Cursor X
                { 0, 240 }, -- Cursor Y
                { 0, 31 }, -- Move Up and Down
                { 0, 30 }, -- Move Left and Right
                -- { 0, 21 }, -- Sprint
                -- { 0, 22 }, -- Jump
                { 0, 23 }, -- Enter
                { 0, 75 }, -- Exit Vehicle
                { 0, 71 }, -- Accelerate Vehicle
                { 0, 72 }, -- Vehicle Brake
                { 0, 59 }, -- Move Vehicle Left and Right
                { 0, 89 }, -- Fly Yaw Left
                { 0, 9 }, -- Fly Left and Right
                { 0, 8 }, -- Fly Up and Down
                { 0, 90 }, -- Fly Yaw Right
                { 0, 76 }, -- Vehicle Handbrake
            },
        },
    },
    Audio = {
        Id = nil,
        Use = "NativeUI",
        RageUI = {
            UpDown = {
                audioName = "HUD_FREEMODE_SOUNDSET",
                audioRef = "NAV_UP_DOWN",
            },
            LeftRight = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_LEFT_RIGHT",
            },
            Select = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "SELECT",
            },
            Back = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "BACK",
            },
            Error = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "ERROR",
            },
            Slider = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "CONTINUOUS_SLIDER",
                Id = nil
            },
        },
        NativeUI = {
            UpDown = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_UP_DOWN",
            },
            LeftRight = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_LEFT_RIGHT",
            },
            Select = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "SELECT",
            },
            Back = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "BACK",
            },
            Error = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "ERROR",
            },
            Slider = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "CONTINUOUS_SLIDER",
                Id = nil
            },
        }
    },
    Items = {
        Title = {
            Background = { Width = 350, Height = 87 },
            Text = { X = 175, Y = 16, Scale = 1.0 },
        },
        Subtitle = {
            Background = { Width = 370, Height = 30 },
            Text = { X = 5, Y = 5, Scale = 0.25 },
            PreText = { X = 345, Y = 5, Scale = 0.25 },
        },
        Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 0, Width = 350 },
        Navigation = {
            Rectangle = { Width = 350, Height = 15 },
            Offset = 4,
            Arrows = { Dictionary = "commonmenu", Texture = "shop_arrows_upanddown", X = 155, Y = -5, Width = 40, Height = 40 },
        },
        Description = {
            Bar = { Y = 3, Width = 350, Height = 3 },
            Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 3, Width = 350, Height = 25 },
            Text = { X = 7, Y = 4, Scale = 0.25 },
        },
    },
    Panels = {
        Grid = {
            Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 3, Width = 350, Height = 225 },
            Grid = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "nose_grid", X = 175, Y = 40, Width = 160, Height = 160 },
            Circle = { Dictionary = "mpinventory", Texture = "in_world_circle", X = 95, Y = 40, Width = 16, Height = 16 },
            Text = {
                Top = { X = 175, Y = 12, Scale = 0.30 },
                Bottom = { X = 175, Y = 205, Scale = 0.30 },
                Left = { X = 47, Y = 105, Scale = 0.30 },
                Right = { X = 303, Y = 105, Scale = 0.30 },
            },
        },
        Percentage = {
            Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 3, Width = 350, Height = 62 },
            Bar = { X = 7, Y = 40, Width = 336, Height = 8 },
            Text = {
                Left = { X = 20, Y = 12, Scale = 0.30 },
                Middle = { X = 175, Y = 12, Scale = 0.30 },
                Right = { X = 323, Y = 12, Scale = 0.30 },
            },
        },
    },
}

function RageUI.SetScaleformParams(scaleform, data)
    data = data or {}
    for k, v in pairs(data) do
        PushScaleformMovieFunction(scaleform, v.name)
        if v.param then
            for _, par in pairs(v.param) do
                if math.type(par) == "integer" then
                    PushScaleformMovieFunctionParameterInt(par)
                elseif type(par) == "boolean" then
                    PushScaleformMovieFunctionParameterBool(par)
                elseif math.type(par) == "float" then
                    PushScaleformMovieFunctionParameterFloat(par)
                elseif type(par) == "string" then
                    PushScaleformMovieFunctionParameterString(par)
                end
            end
        end
        if v.func then
            v.func()
        end
        PopScaleformMovieFunctionVoid()
    end
end

function RageUI.IsMouseInBounds(X, Y, Width, Height)
    local MX, MY = math.round(GetControlNormal(2, 239) * 1920) / 1920, math.round(GetControlNormal(2, 240) * 1080) / 1080
    X, Y = X / 1920, Y / 1080
    Width, Height = Width / 1920, Height / 1080
    return (MX >= X and MX <= X + Width) and (MY > Y and MY < Y + Height)
end

function RageUI.GetSafeZoneBounds()
    local SafeSize = GetSafeZoneSize()
    SafeSize = math.round(SafeSize, 2)
    SafeSize = (SafeSize * 100) - 90
    SafeSize = 10 - SafeSize

    local W, H = 1920, 1080

    return { X = math.round(SafeSize * ((W / H) * 5.4)), Y = math.round(SafeSize * 5.4) }
end

function RageUI.Visible(Menu, Value)
    if Menu ~= nil and Menu() then
        if Value == true or Value == false then
            if Value then
                if RageUI.CurrentMenu ~= nil then
                    if RageUI.CurrentMenu.Closed ~= nil then
                        RageUI.CurrentMenu.Closed()
                    end
                    RageUI.CurrentMenu.Open = not Value
                    Menu:UpdateInstructionalButtons(Value);
                    Menu:UpdateCursorStyle();

                end
                RageUI.CurrentMenu = Menu
            else
                RageUI.CurrentMenu = nil
            end
            Menu.Open = Value
            RageUI.Options = 0
            RageUI.ItemOffset = 0
            RageUI.LastControl = false
        else
            return Menu.Open
        end
    end
end

function RageUI.CloseAll()
    if RageUI.CurrentMenu ~= nil then
        local parent = RageUI.CurrentMenu.Parent
        while parent ~= nil do
            parent.Index = 1
            parent.Pagination.Minimum = 1
            parent.Pagination.Maximum = parent.Pagination.Total
            parent = parent.Parent
        end
        RageUI.CurrentMenu.Index = 1
        RageUI.CurrentMenu.Pagination.Minimum = 1
        RageUI.CurrentMenu.Pagination.Maximum = RageUI.CurrentMenu.Pagination.Total
        RageUI.CurrentMenu.Open = false
        RageUI.CurrentMenu = nil
    end
    RageUI.Options = 0
    RageUI.ItemOffset = 0
    ResetScriptGfxAlign()
end

function RageUI.Banner()
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Display.Header) then
            RageUI.ItemsSafeZone(CurrentMenu)
            
            RenderSprite("commonmenu", "interaction_bgd", CurrentMenu.X, CurrentMenu.Y, RageUI.Settings.Items.Title.Background.Width + CurrentMenu.WidthOffset, RageUI.Settings.Items.Title.Background.Height, 0, 255, 255, 255, 255)

            RenderText(CurrentMenu.Title, CurrentMenu.X + RageUI.Settings.Items.Title.Text.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + RageUI.Settings.Items.Title.Text.Y + 10, CurrentMenu.TitleFont, CurrentMenu.TitleScale, 255, 255, 255, 255, 1)
            RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.Items.Title.Background.Height
        end
    end
end


function RageUI.Subtitle()
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Display.Subtitle) then
            RageUI.ItemsSafeZone(CurrentMenu)
            if CurrentMenu.Subtitle ~= "" then
                RenderSprite("RageUI_", "custom_gradient_nav",  CurrentMenu.X, CurrentMenu.Y + RageUI.ItemOffset - 8, RageUI.Settings.Items.Subtitle.Background.Width + CurrentMenu.WidthOffset - 22,  RageUI.Settings.Items.Subtitle.Background.Height + CurrentMenu.SubtitleHeight, 0, 17, 17, 17, 255)


                
                RenderText(CurrentMenu.PageCounterColour .. CurrentMenu.Subtitle, CurrentMenu.X + RageUI.Settings.Items.Subtitle.Text.X + 8, CurrentMenu.Y + RageUI.Settings.Items.Subtitle.Text.Y + RageUI.ItemOffset - 8, 0, RageUI.Settings.Items.Subtitle.Text.Scale, 255, 255, 255, 255, nil, false, false, RageUI.Settings.Items.Subtitle.Background.Width + CurrentMenu.WidthOffset)
                if CurrentMenu.Index > CurrentMenu.Options or CurrentMenu.Index < 0 then
                    CurrentMenu.Index = 1
                end
                if (CurrentMenu ~= nil) then
                    if (CurrentMenu.Index > CurrentMenu.Pagination.Total) then
                        local offset = CurrentMenu.Index - CurrentMenu.Pagination.Total
                        CurrentMenu.Pagination.Minimum = 1 + offset
                        CurrentMenu.Pagination.Maximum = CurrentMenu.Pagination.Total + offset
                    else
                        CurrentMenu.Pagination.Minimum = 1
                        CurrentMenu.Pagination.Maximum = CurrentMenu.Pagination.Total
                    end
                end
                
                if CurrentMenu.Display.PageCounter then
                    if CurrentMenu.PageCounter == nil then
                        RenderText(CurrentMenu.PageCounterColour .. CurrentMenu.Index .. " / " .. CurrentMenu.Options, CurrentMenu.X + RageUI.Settings.Items.Subtitle.PreText.X + CurrentMenu.WidthOffset - 8, CurrentMenu.Y + RageUI.Settings.Items.Subtitle.PreText.Y + RageUI.ItemOffset - 8, 0, RageUI.Settings.Items.Subtitle.PreText.Scale, 255, 255, 255, 255, 2)
                    else
                        RenderText(CurrentMenu.PageCounter, CurrentMenu.X + RageUI.Settings.Items.Subtitle.PreText.X + CurrentMenu.WidthOffset - 8, CurrentMenu.Y + RageUI.Settings.Items.Subtitle.PreText.Y + RageUI.ItemOffset - 8, 0, RageUI.Settings.Items.Subtitle.PreText.Scale, 255, 255, 255, 255, 2)
                    end
                end
                RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.Items.Subtitle.Background.Height + 7
            end
        end
    end
end

function RageUI.Background()
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Display.Background) then
            RageUI.ItemsSafeZone(CurrentMenu)
            SetScriptGfxDrawOrder(0)

            RenderSprite("commonmenu", "gradient_bgd", CurrentMenu.X, CurrentMenu.Y + 30 + RageUI.Settings.Items.Background.Y + CurrentMenu.SubtitleHeight - 15, RageUI.Settings.Items.Background.Width + CurrentMenu.WidthOffset - 2, RageUI.ItemOffset, 0)
            SetScriptGfxDrawOrder(1)
        end
    end
end

function RageUI.Description()
    local CurrentMenu = RageUI.CurrentMenu;
    local Description = RageUI.Settings.Items.Description;
    if CurrentMenu ~= nil and CurrentMenu.Description ~= nil then
        if CurrentMenu() then
            RageUI.ItemsSafeZone(CurrentMenu)
            
            RenderSprite("commonmenu", "bouton", CurrentMenu.X, CurrentMenu.Y + 2 + Description.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 13, RageUI.Settings.Items.Background.Width + CurrentMenu.WidthOffset - 2, CurrentMenu.DescriptionHeight, 0, 17, 17, 17, 255)

            RenderText(CurrentMenu.Description, CurrentMenu.X + Description.Text.X, CurrentMenu.Y + 2 + Description.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 17, 0, Description.Text.Scale, 255, 255, 255, 255, nil, false, false, Description.Background.Width + CurrentMenu.WidthOffset - 10.0)
            RageUI.ItemOffset = RageUI.ItemOffset + CurrentMenu.DescriptionHeight + Description.Bar.Y
        end
    end
end

function RageUI.Render()
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            if CurrentMenu.Safezone then
                ResetScriptGfxAlign()
            end
            if (CurrentMenu.Display.InstructionalButton) then
                if not CurrentMenu.InitScaleform then
                    CurrentMenu:UpdateInstructionalButtons(true)
                    CurrentMenu.InitScaleform = true
                end
                DrawScaleformMovieFullscreen(CurrentMenu.InstructionalScaleform, 255, 255, 255, 255, 0)
            end
            CurrentMenu.Options = RageUI.Options
            CurrentMenu.SafeZoneSize = nil
            RageUI.Controls()
            RageUI.Options = 0
            RageUI.StatisticPanelCount = 0
            RageUI.ItemOffset = 0
            if CurrentMenu.Controls.Back.Enabled then
                if CurrentMenu.Controls.Back.Pressed and CurrentMenu.Closable then
                    CurrentMenu.Controls.Back.Pressed = false
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].Back.audioName, Audio[Audio.Use].Back.audioRef)
                    if CurrentMenu.Closed ~= nil then
                        collectgarbage()
                        CurrentMenu.Closed()
                    end

                    if CurrentMenu.Parent ~= nil then
                        if CurrentMenu.Parent() then
                            RageUI.NextMenu = CurrentMenu.Parent
                            CurrentMenu:UpdateCursorStyle()
                        else
                            RageUI.NextMenu = nil
                            RageUI.Visible(CurrentMenu, false)
                        end
                    else
                        RageUI.NextMenu = nil
                        RageUI.Visible(CurrentMenu, false)
                    end
                elseif CurrentMenu.Controls.Back.Pressed and not CurrentMenu.Closable then
                    CurrentMenu.Controls.Back.Pressed = false
                end
            end
            if RageUI.NextMenu ~= nil then
                if RageUI.NextMenu() then
                    RageUI.Visible(CurrentMenu, false)
                    RageUI.Visible(RageUI.NextMenu, true)
                    CurrentMenu.Controls.Select.Active = false
                    RageUI.NextMenu = nil
                    RageUI.LastControl = false
                end
            end
        end
    end
end

function RageUI.ItemsDescription(CurrentMenu, Description, Selected)
    ---@type table
    if Description ~= "" or Description ~= nil then
        local SettingsDescription = RageUI.Settings.Items.Description;
        if Selected and CurrentMenu.Description ~= Description then
            CurrentMenu.Description = Description or nil
            ---@type number
            local DescriptionLineCount = GetLineCount(CurrentMenu.Description, CurrentMenu.X + SettingsDescription.Text.X, CurrentMenu.Y + SettingsDescription.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsDescription.Text.Scale, 255, 255, 255, 255, nil, false, false, SettingsDescription.Background.Width + (CurrentMenu.WidthOffset - 5.0))
            if DescriptionLineCount > 1 then
                CurrentMenu.DescriptionHeight = SettingsDescription.Background.Height * DescriptionLineCount
            else
                CurrentMenu.DescriptionHeight = SettingsDescription.Background.Height + 7
            end
        end
    end
end

function RageUI.ItemsMouseBounds(CurrentMenu, Selected, Option, SettingsButton)
    ---@type boolean
    local Hovered = false
    Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + SettingsButton.Rectangle.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.Rectangle.Width + CurrentMenu.WidthOffset, SettingsButton.Rectangle.Height)
    if Hovered and not Selected then
        RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButton.Rectangle.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.Rectangle.Width + CurrentMenu.WidthOffset, SettingsButton.Rectangle.Height, 255, 255, 255, 20)
        if CurrentMenu.Controls.Click.Active then
            CurrentMenu.Index = Option
            local Audio = RageUI.Settings.Audio
            RageUI.PlaySound(Audio[Audio.Use].UpDown.audioName, Audio[Audio.Use].UpDown.audioRef)
        end
    end
    return Hovered;
end

function RageUI.ItemsSafeZone(CurrentMenu)
    if not CurrentMenu.SafeZoneSize then
        CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }
        if CurrentMenu.Safezone then
            CurrentMenu.SafeZoneSize = RageUI.GetSafeZoneBounds()
            SetScriptGfxAlign(76, 84)
            SetScriptGfxAlignParams(0, 0, 0, 0)
        end
    end
end

function RageUI.CurrentIsEqualTo(Current, To, Style, DefaultStyle)
    return Current == To and Style or DefaultStyle or {};
end

function RageUI.IsVisible(Menu, Items, Panels)
    if (RageUI.Visible(Menu)) and (UpdateOnscreenKeyboard() ~= 0) and (UpdateOnscreenKeyboard() ~= 3) then
        RageUI.Banner()
        RageUI.Subtitle()
        if (Items ~= nil) then
            Items()
        end
        RageUI.Background();
        RageUI.Navigation();
        RageUI.Description();
        if (Panels ~= nil) then
            Panels()
        end
        RageUI.Render()
    end
end

---SetStyleAudio
---@param StyleAudio string
---@return void
---@public
function RageUI.SetStyleAudio(StyleAudio)
    RageUI.Settings.Audio.Use = StyleAudio or "RageUI"
end

function RageUI.GetStyleAudio()
    return RageUI.Settings.Audio.Use or "RageUI"
end

