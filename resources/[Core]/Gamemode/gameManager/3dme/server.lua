ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

local lang = Languages[dmeC.language]

local function onMeCommand(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source) 
    local text = "* " .. lang.prefix .. table.concat(args, " ") .. " *"
    if (string.find(text, "<img src")) then
      xPlayer.ban(0, '(/me usebug)');
      return
    end
    TriggerClientEvent('3dme:shareDisplay', -1, text, source)
end

local function onMeCommand2(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local text = "* " .. lang.prefix .. ""..args .. " *"
    if (string.find(text, "<img src")) then
      xPlayer.ban(0, '(/me usebug)');
      return
    end
    TriggerClientEvent('3dme:shareDisplay', -1, text, source)
end

RegisterCommand(lang.commandName, onMeCommand)