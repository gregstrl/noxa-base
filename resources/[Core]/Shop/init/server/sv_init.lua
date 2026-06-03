KoyServerUtils = {}

KoyServerUtils.toClient = function(eventName, targetId, ...)
    TriggerClientEvent("Koy:" .. Koy.hash(eventName), targetId, ...)
end

KoyServerUtils.toAll = function(eventName, ...)
    TriggerClientEvent("Koy:" .. Koy.hash(eventName), -1, ...)
end

KoyServerUtils.registerConsoleCommand = function(command, func)
    RegisterCommand(command, function(source,args)
        if source ~= 0 then return end
        func(source, args)
    end, false)
end

KoyServerUtils.getLicense = function(source)
    for k, v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            return v
        end
    end
    return ""
end

KoyServerUtils.trace = function(message, prefix)
    print("[^6Koy^0] (^6" .. prefix .. "^0) ^6" .. message .. "^0")
end

local webhookColors = {
    ["red"] = 16711680,
    ["green"] = 56108,
    ["grey"] = 8421504,
    ["orange"] = 16744192
}

KoyServerUtils.getIdentifiers = function(source)
    if (source ~= nil) then
        local identifiers = {}
        local playerIdentifiers = GetPlayerIdentifiers(source)
        for _, v in pairs(playerIdentifiers) do
            local before, after = playerIdentifiers[_]:match("([^:]+):([^:]+)")
            identifiers[before] = playerIdentifiers[_]
        end
        return identifiers
    end
end