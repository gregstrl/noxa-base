local bankPositions = {
    vector3(149.92, -1040.83, 29.37),
    vector3(-1212.980, -330.841, 37.56),
    vector3(-2962.582, 482.627, 15.703),
    vector3(-112.202, 6469.295, 31.626),
    vector3(314.187, -278.621, 54.170),
    vector3(-351.534, -49.529, 49.042),
    vector3(1175.0643310547, 2706.6435546875, 38.094036102295),
    vector3(241.41120910645, 225.33403015137, 106.28697967529)
}

CreateThread(function()
    for i = 1, #bankPositions do
        local bankPosition = bankPositions[i]
        if (bankPosition ~= nil) then
            local blip = AddBlipForCoord(bankPosition)
            SetBlipSprite(blip, 108)
            SetBlipScale(blip, 0.6)
            SetBlipColour(blip, 2)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("[Public] Banque")
            EndTextCommandSetBlipName(blip)
        end
    end

    while true do
        local interval = 500
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for i = 1, #bankPositions do
            local bankPosition = bankPositions[i]
            if (bankPosition ~= nil) then
                if ((#(bankPosition - playerCoords) < 1.5) and (not IsPedInAnyVehicle(playerPed, true))) then
                    interval = 0
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder à la banque")
                    if IsControlJustReleased(0, 38) then
                        Bank:openMenu("bank")
                    end
                end
            end
        end

        Wait(interval)
    end
end)