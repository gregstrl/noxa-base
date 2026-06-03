---
--- @author Kadir#6666
--- Create at [22/04/2023] 14:09:47
--- Current project [Koy-V1]
--- File name [Staff]
---

Shared.Events:OnNet(Enums.Administration.Client.Init, function(data)

    if (Client.Admin == nil and data ~= nil and type(data) == "table") then

        Client:LoadAdminListener(function()

            Client.Admin["staff"] = data["staff"] or {};
            Client.Admin["reports"] = data["reports"] or {};
            Client.Admin["group"] = data["group"] or {};

            while (Client.Admin.Utils == nil) do
                Wait(500)
            end

            Client.Admin.Utils:SetItems((data["items"] or {}))

        end)

    end

end);

Shared.Events:OnNet(Enums.Administration.Client.StaffSetValue, function(playerId, key, value)

    if (key == nil) then
        return
    end

    while (Client.Admin == nil) do
        Wait(500)
    end

    return Client.Admin:StaffSetValue(playerId, key, value)

end);

Shared.Events:OnNet(Enums.Administration.Client.StaffAdd, function(playerData)

    if (playerData == nil or type(playerData) ~= "table") then
        return
    end

    while (Client.Admin == nil) do
        Wait(500)
    end

    return Client.Admin:AddStaff(playerData)

end);

Shared.Events:OnNet(Enums.Administration.Client.StaffRemove, function(playerId)

    if (playerId == nil) then
        return
    end

    while (Client.Admin == nil) do
        Wait(500)
    end

    return Client.Admin:RemoveStaff(playerId)

end);

RegisterCommand("message", function(source, args)
    while (Client.Admin == nil) do
        Wait(500)
    end

    if not Client.Admin["staff"] or not next(Client.Admin["staff"]) then
        return ESX.ShowNotification("[~r~Impossible~h~] Vous n'avez pas accès à cette commande")
    end

    if not args[1] or not args[2] then
        return ESX.ShowNotification("[~r~Impossible~h~] Usage: /message [rayon] [message]")
    end

    local radius = tonumber(args[1])
    if not radius then
        return ESX.ShowNotification("[~r~Impossible~h~] Le rayon doit être un nombre")
    end

    table.remove(args, 1)
    local message = table.concat(args, " ")

    TriggerServerEvent('staff:sendRadiusMessage', radius, message)
end)