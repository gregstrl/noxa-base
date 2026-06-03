ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(5000)
	end
end)

local open = false 
local MenuShopBurgerShot = RageUI.CreateMenu('', 'Frigo') 
MenuShopBurgerShot.Display.Header = true 
MenuShopBurgerShot.Closed = function()
  	open = false
end

function ShopBurgerShot()
	if open then
		open = false
		RageUI.Visible(MenuShopBurgerShot, false)
		return
	else
		open = true 
		RageUI.Visible(MenuShopBurgerShot, true)
		CreateThread(function()
			while open do
				RageUI.IsVisible(MenuShopBurgerShot, function() 
					RageUI.Separator("↓ Cuisine ↓")

					RageUI.Button("Cornichons", nil, {RightLabel = "~g~1$"}, true , {
						onSelected = function()
							TriggerServerEvent('burgershot:BuyItem', 'cornichons', 1)
						end
					})

					RageUI.Button("Salades", nil, {RightLabel = "~g~3$"}, true , {
						onSelected = function()
							TriggerServerEvent('burgershot:BuyItem', 'salade', 3)
						end
					})

					RageUI.Button("Tomates", nil, {RightLabel = "~g~2$"}, true , {
						onSelected = function()
							TriggerServerEvent('burgershot:BuyItem', 'tomates', 2)
						end
					})

					RageUI.Button("Steak Haché", nil, {RightLabel = "~g~5$"}, true , {
						onSelected = function()
							TriggerServerEvent('burgershot:BuyItem', 'steak', 5)
						end
					})

					RageUI.Button("Patate Douce", nil, {RightLabel = "~g~5$"}, true , {
						onSelected = function()
							TriggerServerEvent('burgershot:BuyItem', 'patate', 5)
						end
					})

					RageUI.Button("Pain", nil, {RightLabel = "~g~2$"}, true , {
						onSelected = function()
							TriggerServerEvent('burgershot:BuyItem', 'painburger', 2)
						end
					})


					RageUI.Separator("↓ Boissons ↓")

					RageUI.Button("Coca", nil, {RightLabel = "~g~1$"}, true , {
						onSelected = function()
							TriggerServerEvent('burgershot:BuyItem', 'coca', 1)
						end
					})
		
					RageUI.Button("Orangina", nil, {RightLabel = "~g~1$"}, true , {
						onSelected = function()
							TriggerServerEvent('burgershot:BuyItem', 'orangina', 1)
						end
					})

					RageUI.Separator("↓ Autre ↓")

					RageUI.Button("Sel", nil, {RightLabel = "~g~1$"}, true , {
						onSelected = function()
							TriggerServerEvent('burgershot:BuyItem', 'salt', 1)
						end
					})
					RageUI.Button("Barquette de Frite", nil, {RightLabel = "~g~1$"}, true , {
						onSelected = function()
							TriggerServerEvent('burgershot:BuyItem', 'boitedefrite', 1)
						end
					})

				end)
				Wait(wait)
			end
		end)
	end
end

local position = {
	{x = -1193.0874, y = -898.8658, z = 13.7984}
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
					DrawMarker(Config.MarkerType, -1193.0874, -898.8658, 13.7984, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 255, 0, 0, 0, 1, nil, nil, 0)

					if dist <= 1.0 then
						wait = 0
						ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le frigo")
						if IsControlJustPressed(1,51) then
							ShopBurgerShot()
						end
					end
				end
			end
			Wait(wait)
		end
	end
end)