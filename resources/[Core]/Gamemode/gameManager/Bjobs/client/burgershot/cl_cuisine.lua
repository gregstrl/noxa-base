Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
		Wait(10)
    end
    while ESX.GetPlayerData().job2 == nil do
		Wait(10)
    end
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	  ESX.PlayerData = xPlayer
end)

local open = false 
local tacosMain5 = RageUI.CreateMenu('', 'Interaction')
tacosMain5.Display.Header = true 
tacosMain5.Closed = function()
    open = false
end

function OpenCuisineBurgershot()
    if open then
        open = false
        RageUI.Visible(tacosMain5, false)
        return
    else
        open = true
        RageUI.Visible(tacosMain5, true)
        CreateThread(function()
            while open do
              RageUI.IsVisible(tacosMain5,function()
                  RageUI.Separator("↓ BurgerShot ↓")
                  RageUI.Button("Préparer un Burger Classique", "Requis : Pain + Steak Haché + Garnitures", {RightLabel = "→"}, true , {
                      onSelected = function()
                        local playerPed = PlayerPedId()
                        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                        exports["rprogress"]:Start('', 7000)
                        --Wait(7000)
                        TriggerServerEvent('burgershot:brugerclassique')
                        ClearPedTasksImmediately(playerPed)
                    end
                  })
                  RageUI.Button("Préparer un Burger", "Requis : Pain + Steak Haché + Garnitures", {RightLabel = "→"}, true , {
                    onSelected = function()
                      local playerPed = PlayerPedId()
                      TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                      exports["rprogress"]:Start('', 7000)
                     -- Wait(7000)

                      TriggerServerEvent('burgershot:burger')
                      ClearPedTasksImmediately(playerPed)
                  end
                })
                RageUI.Button("Préparer une Frite", "Requis : Patate Douce + Sel + Barquette de frite", {RightLabel = "→"}, true , {
                    onSelected = function()
                      local playerPed = PlayerPedId()
                      TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                      exports["rprogress"]:Start('', 7000)
                     -- Wait(7000)

                      TriggerServerEvent('burgershot:frite')
                      ClearPedTasksImmediately(playerPed)
                  end
                })

              end)
              Wait(0)
            end
        end)
    end
end

local position = {
    {x = -1196.105347, y = -898.042908, z = 13.88}
}

Citizen.CreateThread(function()
    while true do
        local wait = 750
        for k in pairs(position) do
          if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

              if dist <= 5.0 then
                  wait = 0
                  DrawMarker(Config.MarkerType, -1196.105347, -898.042908, 13.88, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 255, 0, 0, 0, 1, nil, nil, 0)

                if dist <= 1.0 then
                    wait = 0
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour préparer un burger")
                    if IsControlJustPressed(1,51) then
                        OpenCuisineBurgershot()
                    end
                end
            end
        end
        Wait(wait)
    end
end
end)