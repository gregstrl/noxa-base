RegisterCommand('afk', function()
    OpenAFKMenu()
end)

ESX = nil
CreateThread(function()
    while ESX == nil do
        TriggerEvent(fInvest.ESXEvents, function(obj) ESX = obj end)
        Wait(10)
    end
end)

function DrawMissionText(msg, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(time and math.ceil(time) or 0, true)
end

local PositionPed = {
    {x = 259.15, y = -783.07, z = 30.51},
}  

Citizen.CreateThread(function()
    while true do
        local fofo = 1000
        local pCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(PositionPed) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, PositionPed[k].x, PositionPed[k].y, PositionPed[k].z)
			if distance <= 10.0 then
				fofo = 1
				DrawMarker(2, PositionPed[k].x, PositionPed[k].y, PositionPed[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 85, 255, 255, 0, 0, 0, 1, nil, nil, 0)
			
				if distance <= 1.5 then
					ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour parler au monsieur")
					if IsControlJustPressed(0, 51) then
						OpenAFKMenu()
					end
				end
			end
        end
        Citizen.Wait(fofo)
    end
end)

local AfkTime = 0
local InAfkZone = false

RegisterNetEvent('requestClientAfkTime')
AddEventHandler('requestClientAfkTime', function(result)
    AfkTime = result
end)

RegisterNetEvent('ForceLunchInvest')
AddEventHandler('ForceLunchInvest', function(result)
    InAfkZone = true
    InAFK = true
    Wait(150)
    OpenAFKMenuInvest()
end)

Citizen.CreateThread(function()
    Wait(2500)
    TriggerServerEvent("requteInvestTime")
    while true do
        if InAfkZone then
            if AfkTime >= 1 then
                Wait(60000)
                AfkTime = AfkTime - 1
                TriggerServerEvent("UpdateAfkTick", AfkTime)
            end
        end
        Wait(2500)
    end
end)

local PositionBACK = {
    {x = -197.7262, y = -580.7529, z = 135.0000},
}  

Citizen.CreateThread(function()
    while true do
        local wait = 1000
        local pCoords = GetEntityCoords(PlayerPedId())
        if not InAfkZone then
            for k,v in pairs(PositionBACK) do
                local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, PositionBACK[k].x, PositionBACK[k].y, PositionBACK[k].z)
                if distance <= 15.0 then
                    wait = 1
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour retourner en ville")
                    if IsControlJustPressed(0, 51) then
                        SetEntityCoords(PlayerPedId(), fInvest.PositionCommand)
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end)

function OpenAFKMenu()
    if #(GetEntityCoords(PlayerPedId()) - fInvest.PositionCommand) < fInvest.MaxDistance then

        local menu = RageUI.CreateMenu(fInvest.TitleMenu, fInvest.DescriptionMenu) 

        RageUI.Visible(menu, not RageUI.Visible(menu))

        while menu do
            Citizen.Wait(0)
            if #(GetEntityCoords(PlayerPedId()) - fInvest.PositionCommand) > fInvest.MaxDistance then
                RageUI.CloseAll()
            end
            RageUI.IsVisible(menu, function()
                if AfkTime <= 0 then
                    for k,v in pairs(fInvest.ListInvest) do
                        RageUI.Button(v.label, nil, {RightLabel = "~HUD_COLOUR_STUNT_1~"..v.heures}, true, {onSelected = function()
                            InAfkZone = true
                            TriggerServerEvent("GoInvest", v.type)
                            RageUI.CloseAll()
                            InAFK = true
                            Wait(150)
                            OpenAFKMenuInvest()
                        end})
                    end
                else
                    RageUI.Separator(fInvest.HaveInvest)
                    RageUI.Button(fInvest.RestartInvest, nil, {}, true, {onSelected = function()
                        InAfkZone = true
                        RageUI.CloseAll()
                        InAFK = true
                        Wait(150)
                        OpenAFKMenuInvest()
                    end})
                end
            end, function()
            end)

            if not RageUI.Visible(menu) then
                menu = RMenu:DeleteType('menu', true)
            end
        end
    else
        ESX.ShowNotification(fInvest.ZoneSafeMessage)
    end
end

local disabledSafeZonesKeys = {
	{group = 2, key = 37, message = "Il est impossible de sortir une arme dans cet endroit."},
	{group = 0, key = 24, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 69, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 92, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 106, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 168, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 160, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 45, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 25, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 80, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 140, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 250, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 263, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 310, message = "Il est impossible d'engager un combat dans cet endroit."},
}

local InAFK = false
Citizen.CreateThread(function()
    while true do
        if InAfkZone then
            if AfkTime >= 1 then
                if #(GetEntityCoords(PlayerPedId()) - fInvest.Position) > 50 then
                    SetEntityCoords(PlayerPedId(), fInvest.Position)
                end
                InAFK = true
            else
                InAFK = false
            end
        else
            InAFK = false
        end
        if InAfkZone and AfkTime >= 1 then
            Wait(100)
        else
            Wait(2500)
        end
    end
end)

function OpenAFKMenuInvest()
	local menu = RageUI.CreateMenu(fInvest.TitleMenu, fInvest.FirstMessageInInvestMenu) 
    menu.Closable = false
    RageUI.Visible(menu, not RageUI.Visible(menu))

	while menu do
		Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Separator("Temps restant: "..AfkTime.." min(s)")
            RageUI.Button(fInvest.ReturnMessage, fInvest.ReturnDescription, {}, true, {onSelected = function()
                InAfkZone = false
                SetEntityCoords(PlayerPedId(), fInvest.ReturnPosition)
                RageUI.CloseAll()
            end})
            if AfkTime <= 0 then 
                RageUI.CloseAll()
            end
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end