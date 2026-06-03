--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- MENU FUNCTION --

local open = false 
local unicornDeTesMort = RageUI.CreateMenu('', 'Garage Unicorn')
unicornDeTesMort.Display.Header = true 
unicornDeTesMort.Closed = function()
  open = false
end

function OpenTesMortunicorn()
     if open then 
         open = false
         RageUI.Visible(unicornDeTesMort, false)
         return
     else
         open = true 
         RageUI.Visible(unicornDeTesMort, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(unicornDeTesMort,function() 

              RageUI.Button("Ranger le véhicule", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                  if dist4 < 4 then
                      DeleteEntity(veh)
                      RageUI.CloseAll()
                end
              end, })


               RageUI.Separator("↓ ~g~Gestion Véhicule ~s~ ↓")

                RageUI.Button("Véhicule de Fonction", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                      local model = GetHashKey("stretch")
                      RequestModel(model)
                      while not HasModelLoaded(model) do Wait(10) end
                      local pos = GetEntityCoords(PlayerPedId())
                      local vehicle = CreateVehicle(model, 91.3057, -1291.608, 29.21893, 29.82234, true, true)
                    end
                })
           end)
          Wait(0)
         end
      end)
   end
end

----OUVRIR LE MENU------------

local position = {
	{x = 95.53864, y = -1293.357, z = 29.21893}
}
Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'unicorn' then 
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 15.0 then
            wait = 0
            DrawMarker(36, 95.53864, -1293.357, 29.21893, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 1.3, 1.3, 1.3, 0, 255, 0, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
               ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le garage.")
                if IsControlJustPressed(1,51) then
                  OpenTesMortunicorn()
            end
        end
    end
    end
    Wait(wait)
    end
end
end)


