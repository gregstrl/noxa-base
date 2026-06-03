local inTrunk = false
local IsInPVP = false

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP
end)

IsInTrunk = function()
    return inTrunk -- Retourne directement la valeur de inTrunk
end
