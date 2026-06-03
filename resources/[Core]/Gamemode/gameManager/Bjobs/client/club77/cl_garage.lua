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
local club77DeTesMort = RageUI.CreateMenu('', 'Garage Club 77')
club77DeTesMort.Display.Header = true 
club77DeTesMort.Closed = function()
  open = false
end

function OpenTesMortclub77()
     if open then 
         open = false
         RageUI.Visible(club77DeTesMort, false)
         return
     else
         open = true 
         RageUI.Visible(club77DeTesMort, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(club77DeTesMort,function() 

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
                      local vehicle = CreateVehicle(model, 188.418152, -3152.098633, 1.07, 76.63, true, true)
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
	{x = 193.32, y = -3160.73, z = 5.79}
}
Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'club77' then 
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 15.0 then
            wait = 0
            DrawMarker(36, 188.418152, -3152.098633, 1.07, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 1.3, 1.3, 1.3, 0, 85, 255, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
               ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le garage.")
                if IsControlJustPressed(1,51) then
                  OpenTesMortclub77()
            end
        end
    end
    end
    Wait(wait)
    end
end
end)


