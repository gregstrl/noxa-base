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

local open = false 
local mainMenu6 = RageUI.CreateMenu('', '~s~Véhicule')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenuGaragePolice()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 

              RageUI.Separator("~h~↓ Véhicules ↓")

                for k,v in pairs(Config.VehiculesPolice) do
                RageUI.Button(v.buttoname, nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzone.x, v.spawnzone.y, v.spawnzone.z), 10.0) then
                        ESX.ShowNotification("~s~Police\n~s~Point de spawn bloquée")
                        else
                        local model = GetHashKey(v.spawnname)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Wait(10) end
                        local policeveh = CreateVehicle(model, v.spawnzone.x, v.spawnzone.y, v.spawnzone.z, v.headingspawn, true, false)
                        SetVehicleNumberPlateText(policeveh, "police"..math.random(50, 999))
                        SetVehicleFixed(policeveh)
                        TaskWarpPedIntoVehicle(PlayerPedId(),  policeveh,  -1)
                        SetVehRadioStation(policeveh, 0)
                        RageUI.CloseAll()
                        end
                    end
                })


              end
            end)
          Wait(0)
         end
      end)
   end
end


Citizen.CreateThread(function()
  while true do 
      local wait = 750
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
          for k in pairs(Config.Position.GarageVehicule) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = Config.Position.GarageVehicule
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 20.0 then 
                  wait = 0
                  DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  Visual.Subtitle(Config.TextGarageVehicule, 1)
                  if IsControlJustPressed(1,51) then
                    OpenMenuGaragePolice()
                  end
              end
          end
      end
  Wait(wait)
  end
end)


function OpenMenuGarageHeliPolice()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 


              RageUI.Separator("~h~Véhicules")

                for k,v in pairs(Config.HelicoPolice) do
                RageUI.Button(v.buttonameheli, nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z), 10.0) then
                        ESX.ShowNotification("~s~Police\n~s~Point de spawn bloquée")
                        else
                        local model = GetHashKey(v.spawnnameheli)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Wait(10) end
                        local policeheli = CreateVehicle(model, v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z, v.headingspawnheli, true, false)
                        SetVehicleNumberPlateText(policeheli, "police"..math.random(50, 999))
                        SetVehicleFixed(policeheli)
                        TaskWarpPedIntoVehicle(PlayerPedId(),  policeheli,  -1)
                        SetVehRadioStation(policeheli, 0)
                        RageUI.CloseAll()
                        end
                    end
                })


              end
            end)
          Wait(0)
         end
      end)
   end
end

function OpenMenuGarageHeliSASP()
  if open then 
      open = false
      RageUI.Visible(mainMenu6, false)
      return
  else
      open = true 
      RageUI.Visible(mainMenu6, true)
      CreateThread(function()
      while open do 
         RageUI.IsVisible(mainMenu6,function() 


           RageUI.Separator("~h~Véhicules")

             for k,v in pairs(Config.HelicoSASP) do
             RageUI.Button(v.buttonameheli, nil, {RightLabel = "→"}, true , {
                 onSelected = function()
                     if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z), 10.0) then
                     ESX.ShowNotification("~s~SASP\n~s~Point de spawn bloquée")
                     else
                     local model = GetHashKey(v.spawnnameheli)
                     RequestModel(model)
                     while not HasModelLoaded(model) do Wait(10) end
                     local policeheli = CreateVehicle(model, v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z, v.headingspawnheli, true, false)
                     SetVehicleNumberPlateText(policeheli, "sasp"..math.random(50, 999))
                     SetVehicleFixed(policeheli)
                     TaskWarpPedIntoVehicle(PlayerPedId(),  policeheli,  -1)
                     SetVehRadioStation(policeheli, 0)
                     RageUI.CloseAll()
                     end
                 end
             })


           end
         end)
       Wait(0)
      end
   end)
end
end

function OpenMenuGarageHeliSAHP()
  if open then 
      open = false
      RageUI.Visible(mainMenu6, false)
      return
  else
      open = true 
      RageUI.Visible(mainMenu6, true)
      CreateThread(function()
      while open do 
         RageUI.IsVisible(mainMenu6,function() 


           RageUI.Separator("~h~Véhicules")

             for k,v in pairs(Config.HelicoSAHP) do
             RageUI.Button(v.buttonameheli, nil, {RightLabel = "→"}, true , {
                 onSelected = function()
                     if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z), 10.0) then
                     ESX.ShowNotification("~s~SAHP\n~s~Point de spawn bloquée")
                     else
                     local model = GetHashKey(v.spawnnameheli)
                     RequestModel(model)
                     while not HasModelLoaded(model) do Wait(10) end
                     local policeheli = CreateVehicle(model, v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z, v.headingspawnheli, true, false)
                     SetVehicleNumberPlateText(policeheli, "sahp"..math.random(50, 999))
                     SetVehicleFixed(policeheli)
                     TaskWarpPedIntoVehicle(PlayerPedId(),  policeheli,  -1)
                     SetVehRadioStation(policeheli, 0)
                     RageUI.CloseAll()
                     end
                 end
             })


           end
         end)
       Wait(0)
      end
   end)
end
end

function OpenMenuGarageHeliLSCO()
  if open then 
      open = false
      RageUI.Visible(mainMenu6, false)
      return
  else
      open = true 
      RageUI.Visible(mainMenu6, true)
      CreateThread(function()
      while open do 
         RageUI.IsVisible(mainMenu6,function() 


           RageUI.Separator("~h~Véhicules")

             for k,v in pairs(Config.HelicoLSCO) do
             RageUI.Button(v.buttonameheli, nil, {RightLabel = "→"}, true , {
                 onSelected = function()
                     if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z), 10.0) then
                     ESX.ShowNotification("~s~LSCO\n~s~Point de spawn bloquée")
                     else
                     local model = GetHashKey(v.spawnnameheli)
                     RequestModel(model)
                     while not HasModelLoaded(model) do Wait(10) end
                     local policeheli = CreateVehicle(model, v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z, v.headingspawnheli, true, false)
                     SetVehicleNumberPlateText(policeheli, "lsco"..math.random(50, 999))
                     SetVehicleFixed(policeheli)
                     TaskWarpPedIntoVehicle(PlayerPedId(),  policeheli,  -1)
                     SetVehRadioStation(policeheli, 0)
                     RageUI.CloseAll()
                     end
                 end
             })


           end
         end)
       Wait(0)
      end
   end)
end
end

function OpenMenuGarageHeliAMBULANCE()
  if open then 
      open = false
      RageUI.Visible(mainMenu6, false)
      return
  else
      open = true 
      RageUI.Visible(mainMenu6, true)
      CreateThread(function()
      while open do 
         RageUI.IsVisible(mainMenu6,function() 


           RageUI.Separator("~h~Véhicules")

             for k,v in pairs(Config.HelicoAMBULANCE) do
             RageUI.Button(v.buttonameheli, nil, {RightLabel = "→"}, true , {
                 onSelected = function()
                     if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z), 10.0) then
                     ESX.ShowNotification("~s~AMBULANCE\n~s~Point de spawn bloquée")
                     else
                     local model = GetHashKey(v.spawnnameheli)
                     RequestModel(model)
                     while not HasModelLoaded(model) do Wait(10) end
                     local policeheli = CreateVehicle(model, v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z, v.headingspawnheli, true, false)
                     SetVehicleNumberPlateText(policeheli, "AMBULANCE"..math.random(50, 999))
                     SetVehicleFixed(policeheli)
                     TaskWarpPedIntoVehicle(PlayerPedId(),  policeheli,  -1)
                     SetVehRadioStation(policeheli, 0)
                     RageUI.CloseAll()
                     end
                 end
             })


           end
         end)
       Wait(0)
      end
   end)
end
end



Citizen.CreateThread(function()
  while true do 
      local wait = 750
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
          for k in pairs(Config.Position.GarageHeli) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = Config.Position.GarageHeli
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 5.0 then 
                  wait = 0
                  DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  Visual.Subtitle(Config.TextGarageHeli, 1)
                  if IsControlJustPressed(1,51) then
                    OpenMenuGarageHeliPolice()
                  end
              end
          end
      end
  Wait(wait)
  end
end)


Citizen.CreateThread(function()
  while true do 
      local wait = 750
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sasp' then
          for k in pairs(Config.Position.GarageHeli2) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = Config.Position.GarageHeli2
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 5.0 then 
                  wait = 0
                  DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  Visual.Subtitle(Config.TextGarageHeli, 1)
                  if IsControlJustPressed(1,51) then
                    OpenMenuGarageHeliSASP()
                  end
              end
          end
      end
  Wait(wait)
  end
end)


Citizen.CreateThread(function()
  while true do 
      local wait = 750
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sahp' then
          for k in pairs(Config.Position.GarageHeli4) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = Config.Position.GarageHeli4
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 5.0 then 
                  wait = 0
                  DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  Visual.Subtitle(Config.TextGarageHeli, 1)
                  if IsControlJustPressed(1,51) then
                    OpenMenuGarageHeliSAHP()
                  end
              end
          end
      end
  Wait(wait)
  end
end)


Citizen.CreateThread(function()
  while true do 
      local wait = 750
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'lsco' then
          for k in pairs(Config.Position.GarageHeli5) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = Config.Position.GarageHeli5
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 5.0 then 
                  wait = 0
                  DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  Visual.Subtitle(Config.TextGarageHeli, 1)
                  if IsControlJustPressed(1,51) then
                    OpenMenuGarageHeliLSCO()
                  end
              end
          end
      end
  Wait(wait)
  end
end)


Citizen.CreateThread(function()
  while true do 
      local wait = 750
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
          for k in pairs(Config.Position.GarageHeli3) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = Config.Position.GarageHeli3
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 5.0 then 
                  wait = 0
                  DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  Visual.Subtitle(Config.TextGarageHeli, 1)
                  if IsControlJustPressed(1,51) then
                    OpenMenuGarageHeliAMBULANCE()
                  end
              end
          end
      end
  Wait(wait)
  end
end)
