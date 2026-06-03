ESX = nil
CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(500)
    end
end)

ZonesListe = {
    ["Jetski"] = {
        Position = vector3(-1596.89 , -1163.28, 1.10),
        Public = true,
        Job = nil, 
        Job2 = nil, 
        Blip = {
            Name = "Location Jetski",
            Sprite = 410,
            Display = 4,
            Scale = 0.6,
            Color = 57
        },
        Action = function()
            MenuJetski()
        end
    },
}

CreateThread(function()
    for _,marker in pairs(ZonesListe) do
        if marker.Blip then
            local blip = AddBlipForCoord(marker.Position)

            SetBlipSprite(blip, marker.Blip.Sprite)
            SetBlipScale(blip, marker.Blip.Scale)
            SetBlipColour(blip, marker.Blip.Color)
            SetBlipDisplay(blip, marker.Blip.Display)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(marker.Blip.Name)
            EndTextCommandSetBlipName(blip)
        end
	end
end)

local interval4 = 750
--- MenuJetski
CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        local pc = GetEntityCoords(pPed)
        local mc = ZonesListe["Jetski"].Position
        local dif = #(mc - pc)
        --if ESX.PlayerData.job and ESX.PlayerData.job.name == "fib" then
            if dif > 6 then
                interval4 = 750
            else
                interval4 = 1
                if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~s~Garage Jetski~w~.")
                    DrawMarker(6,mc.x,mc.y,mc.z,0.0,0.0,100.0,0.0,0.0,0.0,0.5,0.5,0.5,0,0,128,255,false,false,0,false,nil,nil,false)
                    if IsControlJustPressed(0, 51) then
                        MenuJetski()
                    end
                end
            end
            
        --end
        Wait(interval4)
    end
end)
