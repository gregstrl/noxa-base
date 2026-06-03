Koy = {}
Koy.newThread = Citizen.CreateThread
Koy.newWaitingThread = Citizen.SetTimeout
--Citizen.CreateThread, CreateThread, Citizen.SetTimeout, SetTimeout, InvokeNative = nil, nil, nil, nil, nil

Job = nil
Jobs = {}
Jobs.list = {}

KoyPrefixes = {
    zones = "^1ZONE",
    err = "^1ERREUR",
    blips = "^1BLIPS",
    npcs = "^1NPCS",
    dev = "^6INFOS",
    sync = "^6SYNC",
    jobs = "^6JOBS",
    succes = "^2SUCCÈS"
}

Koy.hash = function(notHashedModel)
    return GetHashKey(notHashedModel)
end

Koy.prefix = function(title, message)
    return ("[^5Koy^0] (%s^0) %s" .. "^0"):format(title, message)
end

local registredEvents = {}
local function isEventRegistred(eventName)
    for k,v in pairs(registredEvents) do
        if v == eventName then return true end
    end
    return false
end

Koy.netRegisterAndHandle = function(eventName, handler)
    print('REGISTER DE l\'EVENT '..eventName)
    local event = "Koy:" .. Koy.hash(eventName)
    if not isEventRegistred(event) then
        RegisterNetEvent(event)
        table.insert(registredEvents, event)
    end
    AddEventHandler(event, handler)
end


Koy.netRegister = function(eventName)
    local event = "Koy:" .. Koy.hash(eventName)
    RegisterNetEvent(event)
end


Koy.netHandle = function(eventName, handler)
    local event = "Koy:" .. Koy.hash(eventName)
    AddEventHandler(event, handler)
end


Koy.netHandleBasic = function(eventName, handler)
    AddEventHandler(eventName, handler)
end

Koy.second = function(from)
    return from*1000
end

Koy.toInternal = function(eventName, ...)
    TriggerEvent("Koy:" .. Koy.hash(eventName), ...)
end