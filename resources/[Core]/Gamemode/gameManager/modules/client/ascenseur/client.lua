local PositionAscSud = {
    {x = -406.9122, y = -345.4983, z = 38.42654}, -- 1
    {x = -406.5121, y = -345.5047, z = 43.59366}, -- 2
    {x = -406.6819, y = -345.5303, z = 48.53553}, -- 3
    {x = -406.6664, y = -345.5451, z = 53.26153}, -- 4
}

Citizen.CreateThread(function()
    while true do
        local fofo = 500
        local pCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(PositionAscSud) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, PositionAscSud[k].x, PositionAscSud[k].y, PositionAscSud[k].z)
			if distance <= 10.0 then
				fofo = 1
				DrawMarker(2, PositionAscSud[k].x, PositionAscSud[k].y, PositionAscSud[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 85, 255, 255, 0, 0, 0, 1, nil, nil, 0)
			
				if distance <= 1.5 then
					ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour prendre l'ascenseur")
					if IsControlJustPressed(0, 51) then
						openAscPolice()
					end
				end
			end
        end
        Wait(fofo)
    end
end)

openAscPolice = function()
    local mainMenuNord = RageUI.CreateMenu("", "Choisissez un étage")

    RageUI.Visible(mainMenuNord, not RageUI.Visible(mainMenuNord))

    while mainMenuNord do
        RageUI.IsVisible(mainMenuNord, function()
            RageUI.Button("~b~[3]~s~ FIB", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), -406.6664, -345.5451, 53.26153)
                end
            })
            RageUI.Button("~b~[2]~s~ Salle de Meeting", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), -406.6819, -345.5303, 48.53553)
                end
            })
            RageUI.Button("~b~[1]~s~ Salle de GYM", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), -406.5121, -345.5047, 43.59366)
                end
            })
            RageUI.Button("~b~[0]~s~ Hall Principal", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), -406.9122, -345.4983, 38.42654)
                end
            })
        end)
        if not RageUI.Visible(mainMenuNord) then
            mainMenuNord = RMenu:DeleteType(mainMenuNord, true)
        end
        Wait(0)
    end
end

local PositionAscEMS = {
    {x = 90.508392, y = -399.515869, z = 84.40}, -- 2
    {x = 96.846390, y = -419.096619, z = 39.37}, -- 1
}

Citizen.CreateThread(function()
    while true do
        local fofo2 = 500
        local pCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(PositionAscEMS) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, PositionAscEMS[k].x, PositionAscEMS[k].y, PositionAscEMS[k].z)
			if distance <= 10.0 then
				fofo2 = 1
				DrawMarker(2, PositionAscEMS[k].x, PositionAscEMS[k].y, PositionAscEMS[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 85, 255, 255, 0, 0, 0, 1, nil, nil, 0)
			
				if distance <= 1.5 then
					ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour prendre l'ascenseur")
					if IsControlJustPressed(0, 51) then
						openAscAmbulance()
					end
				end
			end
        end
        Wait(fofo2)
    end
end)

openAscAmbulance = function()
    local mainMenuNord = RageUI.CreateMenu("", "Choisissez un étage")

    RageUI.Visible(mainMenuNord, not RageUI.Visible(mainMenuNord))

    while mainMenuNord do
        RageUI.IsVisible(mainMenuNord, function()
            RageUI.Button("~b~[2]~s~ Helipad", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), 90.508392, -399.515869, 84.40)
                end
            })
            RageUI.Button("~b~[1]~s~ Salle Principale", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), 96.846390, -419.096619, 39.37)
                end
            })
        end)
        if not RageUI.Visible(mainMenuNord) then
            mainMenuNord = RMenu:DeleteType(mainMenuNord, true)
        end
        Wait(0)
    end
end


-- PIA

local PositionAscIMO = {
    {x = 2504.545, y = -433.305, z = 99.105}, -- 0
    {x = 2504.030, y = -433.068, z = 99.105}, -- 1
    {x = 2504.545, y = -433.160, z = 106.906}, -- 2

}

Citizen.CreateThread(function()
    while true do
        local fofo2 = 500
        local pCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(PositionAscIMO) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, PositionAscIMO[k].x, PositionAscIMO[k].y, PositionAscIMO[k].z)
			if distance <= 10.0 then
				fofo2 = 1
				DrawMarker(2, PositionAscIMO[k].x, PositionAscIMO[k].y, PositionAscIMO[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 85, 255, 255, 0, 0, 0, 1, nil, nil, 0)
			
				if distance <= 1.5 then
					ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour prendre l'ascenseur")
					if IsControlJustPressed(0, 51) then
						openAscAgentImmo()
					end
				end
			end
        end
        Wait(fofo2)
    end
end)

openAscAgentImmo = function()
    local mainMenuNord = RageUI.CreateMenu("", "Choisissez un étage")

    RageUI.Visible(mainMenuNord, not RageUI.Visible(mainMenuNord))

    while mainMenuNord do
        RageUI.IsVisible(mainMenuNord, function()
            RageUI.Button("~b~[0]~s~ Rez-Chaussée", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), 2504.545, -433.305, 99.105)
                end
            })
            RageUI.Button("~b~[1]~s~ Bureau", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), 2504.030, -433.068, 99.105)
                end
            })
            RageUI.Button("~b~[2]~s~ Hall", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), 2504.545, -433.160, 106.906)
                end
            })
        end)
        if not RageUI.Visible(mainMenuNord) then
            mainMenuNord = RMenu:DeleteType(mainMenuNord, true)
        end
        Wait(0)
    end
end

