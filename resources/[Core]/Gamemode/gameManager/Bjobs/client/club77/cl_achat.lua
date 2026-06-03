--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(5000)
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

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    
    blockinput = true 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "Somme", ExampleText, "", "", "", MaxStringLenght) 
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
         
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500) 
        blockinput = false
        return result 
    else
        Wait(500) 
        blockinput = false 
        return nil 
    end
end

--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('', 'Frigo Club 77') 
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
  nomprenom = nil
  numero = nil
  heurerdv = nil
  rdvmotif = nil
end

--- FUNCTION OPENMENU ---

function OpenMenuAccueilClub77() 
    if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
        RageUI.IsVisible(mainMenu, function()

        RageUI.Separator("↓ Boisson ↓")

        RageUI.Button("~g~Acheter~s~ x1 Vin", nil, {RightLabel = "20$"}, not codesCooldown5 , {
			onSelected = function()
			TriggerServerEvent('Club77:BuyVine')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
       end 
    })

        RageUI.Button("~g~Acheter~s~ x1 Mojito", nil, {RightLabel = "10$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('Club77:BuyMojito')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~g~Acheter~s~ x1 Ice Tea", nil, {RightLabel = "8$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('Club77:BuyIceTea')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~g~Acheter~s~ x1 Eau", nil, {RightLabel = "7$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('Club77:BuyEau')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~g~Acheter~s~ x1 Whisky-coca", nil, {RightLabel = "12$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('Club77:BuyWhiskycoca')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~g~Acheter~s~ x1 Coca", nil, {RightLabel = "6$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('Club77:BuyCoca')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~g~Acheter~s~ x1 Limonade", nil, {RightLabel = "7$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('Club77:BuyLimonade')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~g~Acheter~s~ x1 Fanta", nil, {RightLabel = "10$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('Club77:BuyFanta')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Separator("↓ Nouriture ↓")

    RageUI.Button("~g~Acheter~s~ x1 Chips", nil, {RightLabel = "2$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('Club77:BuyChips')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~g~Acheter~s~ x1 Cacahuète", nil, {RightLabel = "1$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('Club77:BuyCacahuete')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~g~Acheter~s~ x1 Olive", nil, {RightLabel = "1$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('Club77:BuyOlive')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

		end)			
		Wait(0)
	   end
	end)
 end
end

local position = {
    {x = 248.85, y = -3161.98, z = -0.18}
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
            DrawMarker(20, 248.85, -3161.98, -0.18, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 129, 0, 184, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                --Visual.Subtitle("Appuyer sur ~g~[E]~s~ pour intéragir avec le Frigo", 1)
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le frigo.")
                if IsControlJustPressed(1,51) then
                    OpenMenuAccueilClub77()
            end
        end
    end
    end
    Wait(wait)
    end
end
end)

