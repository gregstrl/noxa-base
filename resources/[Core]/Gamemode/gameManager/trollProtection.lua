ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

local blockedPatterns = {
  "<img", "src=", "<script", "javascript:", "onerror=", "onload=", "<iframe", 
  "data:image", "url%(", "background", "style=", "<svg", "eval%(", "onclick",
  "ondblclick", "onmouseover", "<object", "<embed", "<meta", "<a href",
  "trigger%(", "TriggerEvent", "TriggerClientEvent", "TriggerServerEvent", 
  "\\x", "&#", "\\u", "%x", "<div", "<body",
  "base64", "data:", ";base64", "atob%(", "btoa%(", 
  "fromcharcode", "charcodeat", "escape%(", "unescape%(", 
  "encodeuri", "decodeuri", "=/=", "=="
}

local function containsBlockedPattern(text)
  if not text then return false end
  
  local lowerText = string.lower(text)
  
  for _, pattern in ipairs(blockedPatterns) do
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

function sanitizeNUIMessage(message)
  if type(message) == "table" then
    local sanitized = {}
    for k, v in pairs(message) do
      if type(v) == "string" then
        local hasBlocked, pattern = containsBlockedPattern(v)
        if hasBlocked then
          return nil, pattern
        end
        sanitized[k] = v:gsub("<", "&lt;"):gsub(">", "&gt;")
      elseif type(v) == "table" then
        local safeValue, blockedPattern = sanitizeNUIMessage(v)
        if not safeValue then
          return nil, blockedPattern
        end
        sanitized[k] = safeValue
      else
        sanitized[k] = v
      end
    end
    return sanitized, nil
  elseif type(message) == "string" then
    local hasBlocked, pattern = containsBlockedPattern(message)
    if hasBlocked then
      return nil, pattern
    end
    return message:gsub("<", "&lt;"):gsub(">", "&gt;"), nil
  else
    return message, nil
  end
end

local originalSendNUIMessage = SendNUIMessage
SendNUIMessage = function(message)
  local sanitizedMessage, blockedPattern = sanitizeNUIMessage(message)
  if not sanitizedMessage then
    local playerServerId = GetPlayerServerId(PlayerId())
    TriggerServerEvent("toad:reportInjection", playerServerId, "SendNUIMessage", blockedPattern)
    return
  end
  originalSendNUIMessage(sanitizedMessage)
end

RegisterNetEvent("troll:me")
AddEventHandler("troll:me", function(text)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local hasBlockedPattern, pattern = containsBlockedPattern(text)
    if hasBlockedPattern then
        xPlayer.ban(0, string.format('Tentative d\'injection via troll:me (%s)', pattern))
        return
    end
    
    if string.find(text, "<img") or string.find(text, "src=") then
        xPlayer.ban(0, 'Tentative d\'injection d\'image via troll:me')
        return
    end
    
    text = text:gsub("<", "&lt;"):gsub(">", "&gt;")
    TriggerClientEvent("troll:me", -1, text)
end)

RegisterServerEvent("toad:reportInjection")
AddEventHandler("toad:reportInjection", function(playerId, method, pattern)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer then
        xPlayer.ban(0, string.format('Tentative d\'injection via %s (%s)', method, pattern))
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    print('[Kays - Protection] Ressource démarrée : ' .. resourceName)
end)

print('[Kays - Protection] Module de protection anti-injection activé')