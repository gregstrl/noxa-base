local inputMappings = {
    ["~INPUT_VEH_DUCK~"] = "X",
    ["~INPUT_CELLPHONE_LEFT~"] = "←",
    ["~INPUT_FRONTEND_LEFT~"] = "←",
    ["~INPUT_CELLPHONE_RIGHT~"] = "→",
    ["~INPUT_FRONTEND_RIGHT~"] = "→",
    ["~INPUT_FRONTEND_RDOWN~"] = "↵",
    ["~INPUT_FRONTEND_RRIGHT~"] = "⌫",
    ["~INPUT_MULTIPLAYER_INFO~"] = "W",
    ["~INPUT_CONTEXT~"] = "E",
    ["~INPUT_PICKUP~"] = "E",
    ["~INPUT_DETONATE~"] = "G",
    ["~INPUT_VEH_EXIT~"] = "F",
    ["~INPUT_RELOAD~"] = "R",
    ["~INPUT_THROW_GRENADE~"] = "G",
    ["~INPUT_VEH_FLY_ROLL_LEFT_ONLY~"] = "4",
    ["~INPUT_VEH_FLY_ROLL_RIGHT_ONLY~"] = "6",
    ["~INPUT_VEH_FLY_SELECT_TARGET_LEFT~"] = "7",
    ["~INPUT_VEH_FLY_SELECT_TARGET_RIGHT~"] = "9",
    ["~INPUT_FRONTEND_ACCEPT~"] = "↵",
    ["~INPUT_REPLAY_TIMELINE_PICKUP_CLIP~"] = "X",
    ["~INPUT_VEH_HEADLIGHT~"] = "H",
    ["~INPUT_CELLPHONE_OPTION~"] = "Suppr",
    ["~INPUT_FRONTEND_PAUSE_ALTERNATE~"] = "Echap",
    ["~INPUT_ENTER~"] = "ENTER",
    ["~INPUT_ALT~"] = "ALT",
    ["~INPUT_TAB~"] = "TAB"
}

local colorCodes = {
    ["~s~"] = "rgba(136, 0, 0, 1)",
    ["~w~"] = "#4f8dad",
    ["~g~"] = "rgb(114, 204, 114)",
    ["~b~"] = "rgba(0, 89, 255, 1)",
    ["~d~"] = "rgb(47, 92, 115)",
    ["~s~"] = "rgba(65, 0, 102, 1)",
    ["~c~"] = "rgb(155, 155, 155)",
    ["~m~"] = "rgb(77, 77, 77)",
    ["~u~"] = "rgb(0, 0, 0)",
    ["~o~"] = "rgba(255, 115, 0, 1)",
    ["~y~"] = "rgba(214, 214, 82, 1)",
    ["~b~"] = "rgba(0, 85, 255, 1)"
}

local cachedResults = {}

function ShowHelpNotification(msg)
    if not msg then return end
    
    if cachedResults[msg] then
        SendNUIMessage({
            message = cachedResults[msg]
        })
        return
    end
    
    local result = msg
    
    result = result:gsub("~h~(.-)~s~", "<b>%1</b>")
           :gsub("%*%*(.-)%*%*", "<b>%1</b>")
           :gsub("*", "")
           :gsub("~h~", "<b>")
           :gsub("~s~", "</span>")
           :gsub("~n~", "<br>")
           :gsub("\n", "<br>")
    
    for key, value in pairs(colorCodes) do
        result = result:gsub(key, string.format("<span style='color:%s;'>", value))
    end
    
    for key, value in pairs(inputMappings) do
        result = result:gsub(key, "<span class='INPUT_CONTEXT'>" .. value .. "</span>")
    end
    
    result = "<span style='color:currentColor'>" .. result .. "</span>"
    
    cachedResults[msg] = result
    
    local cacheSize = 0
    for _ in pairs(cachedResults) do
        cacheSize = cacheSize + 1
        if cacheSize > 100 then
            cachedResults = {}
            break
        end
    end
    
    SendNUIMessage({
        message = result
    })
end

exports("ShowHelpNotification", ShowHelpNotification)

RegisterNetEvent('showHelpNotification')
AddEventHandler('showHelpNotification', function(msg)
    ShowHelpNotification(msg)
end)
