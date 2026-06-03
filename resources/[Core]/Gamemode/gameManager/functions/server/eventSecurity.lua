ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

local textEvents = {
  '3dme:shareDisplay',
  'troll:me',
  'chat:addMessage',
  'esx:showNotification',
  'notifY:send',
  'notifY:sendAdvanced',
}

local dangerousPatterns = {
  "<img", "src=", "<script", "javascript:", "onerror=", "onload=", "<iframe", 
  "data:image", "url%(", "background", "style=", "<svg", "eval%(", "onclick",
  "ondblclick", "onmouseover", "<object", "<embed", "<meta", "<a href",
  "trigger%(", "TriggerEvent", "TriggerClientEvent", "TriggerServerEvent", 
  "\\x", "&#", "\\u", "%x", "<div", "<body",
  "base64", "data:", ";base64", "atob%(", "btoa%(", 
  "fromcharcode", "charcodeat", "escape%(", "unescape%(", 
  "encodeuri", "decodeuri", "=/=", "=="
}

local function hasBlockedContent(text)
  if type(text) ~= "string" then return false end
  
  local lowerText = string.lower(text)
  
  for _, pattern in ipairs(dangerousPatterns) do
    if string.find(lowerText, string.lower(pattern)) then
      return true, pattern
    end
  end
  
  local potentialBase64Pattern = "[A-Za-z0-9+/=]+"
  local matches = {}
  for match in string.gmatch(text, potentialBase64Pattern) do
    if #match >= 30 then
      table.insert(matches, match)
    end
  end
  
  for _, match in ipairs(matches) do
    local base64Chars = 0
    for i = 1, #match do
      local char = string.sub(match, i, i)
      if string.match(char, "[A-Za-z0-9+/=]") then
        base64Chars = base64Chars + 1
      end
    end
    
    local ratio = base64Chars / #match
    if ratio > 0.9 and #match >= 40 then
      return true, "potential_base64_encoding"
    end
  end
  
  return false, nil
end

local function sanitizeText(text)
  if type(text) ~= "string" then return text end
  
  text = text:gsub("<", "&lt;")
  text = text:gsub(">", "&gt;")
  
  text = text:gsub("javascript:", "")
  text = text:gsub("onerror=", "")
  text = text:gsub("onload=", "")
  
  return text
end

local function sanitizeTable(data)
  if type(data) ~= "table" then
    if type(data) == "string" then
      return sanitizeText(data)
    end
    return data
  end
  
  local result = {}
  for k, v in pairs(data) do
    if type(v) == "table" then
      result[k] = sanitizeTable(v)
    elseif type(v) == "string" then
      result[k] = sanitizeText(v)
    else
      result[k] = v
    end
  end
  
  return result
end

local function isAuthorizedSource(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if not xPlayer then return false end
  
  local group = xPlayer.getGroup()
  return group == 'admin' or group == 'founder'
end

local originalTriggerClientEvent = TriggerClientEvent

TriggerClientEvent = function(eventName, target, ...)
  local args = {...}
  local source = source
  
  for _, textEvent in ipairs(textEvents) do
    if eventName == textEvent then
      if (eventName == "esx:showNotification" or eventName == "notifY:send" or eventName == "notifY:sendAdvanced") and target == -1 then
        if not isAuthorizedSource(source) then
          print(string.format("[Kays - Protection] Tentative d'envoi de notification globale bloquée pour %s", GetPlayerName(source)))
          return 
        end
      end
      
      local newArgs = {}
      
      for i, arg in ipairs(args) do
        if type(arg) == "string" then
          local hasBlocked, pattern = hasBlockedContent(arg)
          if hasBlocked then
            print(string.format("[Kays - Protection] Tentative d'injection via %s: %s", eventName, pattern))
            
            if source and eventName ~= "esx:showNotification" then
              local xPlayer = ESX.GetPlayerFromId(source)
              if xPlayer then
                xPlayer.ban(0, string.format('Tentative d\'injection via %s (%s)', eventName, pattern))
                return 
              end
            end
            
            newArgs[i] = sanitizeText(arg)
          else
            newArgs[i] = arg
          end
        elseif type(arg) == "table" then
          newArgs[i] = sanitizeTable(arg)
        else
          newArgs[i] = arg
        end
      end
      
      return originalTriggerClientEvent(eventName, target, table.unpack(newArgs))
    end
  end
  
  return originalTriggerClientEvent(eventName, target, ...)
end

RegisterServerEvent("toad:reportInjection")
AddEventHandler("toad:reportInjection", function(playerId, method, pattern)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer then
        xPlayer.ban(0, string.format('Tentative d\'injection via %s (%s)', method, pattern))
    end
end)

RegisterNetEvent("notifY:send")
AddEventHandler("notifY:send", function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then
        print("[Kays - Protection] Tentative d'envoi de notification par un joueur non valide")
        return
    end
    
    local isAuthorized = xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'founder'
    
    if not isAuthorized then
        print("[Kays - Protection] Tentative d'envoi de notification non autorisée par " .. GetPlayerName(source))
        xPlayer.kick('Tentative d\'envoi de notification non autorisée')
        return
    end
    
    if type(data) == "table" then
        local sanitizedData = sanitizeTable(data)
        TriggerClientEvent("notifY:send", -1, sanitizedData)
    else
        if type(data) == "string" then
            local hasBlocked, pattern = hasBlockedContent(data)
            if hasBlocked then
                xPlayer.ban(0, string.format('Tentative d\'injection via notifY:send (%s)', pattern))
                return
            end
            data = sanitizeText(data)
        end
        TriggerClientEvent("notifY:send", -1, data)
    end
end)

RegisterNetEvent("esx:showNotification")
AddEventHandler("esx:showNotification", function(message)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    
    local hasBlocked, pattern = hasBlockedContent(message)
    if hasBlocked then
        print(string.format("[Kays - Protection] Contenu bloqué dans esx:showNotification: %s", pattern))
        message = sanitizeText(message)
    end
    
    TriggerClientEvent("esx:showNotification", source, message)
end)

print('[Kays - Protection] Module de protection des événements activé')

function sendToDiscord(title, message, color)
  local webhook = 'https://discord.com/api/webhooks/1366914611277729863/4AVkQP3lgnrwXo6gOlUrnSRn9rRBhf91HRwZtgNvKrwMpGc32z1j3su2fktmuUkgqZYF'
  local embed = {
      {
          ["title"] = title,
          ["description"] = message,
          ["color"] = color,
          ["footer"] = {
              ["text"] = os.date("%Y-%m-%d %H:%M:%S")
          }
      }
  }

  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "Annonce Entreprise", embeds = embed}), { ['Content-Type'] = 'application/json' })
end
