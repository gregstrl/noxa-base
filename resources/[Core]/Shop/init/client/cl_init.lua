KoyClientUtils = {}

KoyClientUtils.toServer = function(eventName, ...)
    TriggerServerEvent("Koy:" .. Koy.hash(eventName), ...)
end