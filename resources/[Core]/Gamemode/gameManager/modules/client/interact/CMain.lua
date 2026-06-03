--[[
  This file is part of wise RolePlay.
  Copyright (c) wise RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil
local ILALEPERMISMEK = false
local ILALEPPAMEK = false

local Freecam = exports['freecam']

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj)
            ESX = obj
        end)
        ESX.PlayerData = ESX.GetPlayerData()
        Wait(10)
    end
    while ESX.PlayerData.job == nil do
        Wait(100)
    end

    WeaponData = ESX.GetWeaponList()

    for i = 1, #WeaponData, 1 do
        if WeaponData[i].name == 'WEAPON_UNARMED' then
            WeaponData[i] = nil
        else
            WeaponData[i].hash = GetHashKey(WeaponData[i].name)
        end
    end
end)

RegisterNetEvent('send:me')
AddEventHandler('send:me', function(message)
    ExecuteCommand("me "..message.."")
end)

RegisterNetEvent('esx:setGroup')
AddEventHandler('esx:setGroup', function(group)
    ESX.PlayerData.group = group
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    RefreshMoney()
end)

RegisterNetEvent('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
    RefreshMoney2()
end)


function RefreshMoney()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
        ESX.TriggerServerCallback('pSociety:getSocietyMoney', function(money)
            societymoney = ESX.Math.GroupDigits(money)
        end, ESX.PlayerData.job.name)
    end
end

function RefreshMoney2()
    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' then
        ESX.TriggerServerCallback('pSociety:getSocietyMoney', function(money)
            societymoney2 = ESX.Math.GroupDigits(money)
        end, ESX.PlayerData.job2.name)
    end
end

Player = {
	isDead = false,
	inAnim = false,
	ragdoll = false,
	crouched = false,
	handsup = false,
	pointing = false,
	minimap = true,
	ui = true,
	noclip = false,
	godmode = false,
	ghostmode = false,
	showCoords = false,
	showName = false,
	gamerTags = {},
	cinematique = false,
	notifications = false,
	notificationsadvanced = false
}

loadAnimDict = function(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

object = {}
local inventaire = false
local status = true
local canChange = true

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

local PersonalMenu = {
    billing = {},
    engineActionList = {
        "Allumer",
        "Éteindre",
    },
    maxSpeedList = {
        "50",
        "80",
        "110",
        "130",
        "Personnaliser",
        "Retirer",
    },
    maxSpeedListIndex = 1,
    engineActionIndex = 1,
    vehicleDoors = {
        {label = "Porte Avant Gauche", index = 0},
        {label = "Porte Avant Droite", index = 1},
        {label = "Porte Arrière Gauche", index = 2},
        {label = "Porte Arrière Droite", index = 3},
        {label = "Capot", index = 4},
        {label = "Coffre", index = 5},
    },
    vehicleDoorsIndex = 1,
    windowsOpen = false, 
    speedLimiter = 0 
}


local doorLabels = {}
for _, door in ipairs(PersonalMenu.vehicleDoors) do
    table.insert(doorLabels, door.label)
end


local ItemSelected = {}
local engineCoolDown = false
local bank = nil
local sale = nil
local extraList = {"n°1","n°2","n°3","n°4","n°5","n°6","n°7","n°8","n°9","n°10","n°11","n°12","n°13","n°14","n°15"}
local extraIndex = 1
local extraCooldown = false
local extraStateIndex = 1
local doorActionIndex = 1
local windowsOpen = false

function GetCurrentWeight()
	local currentWeight = 0

	for i = 1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].count > 0 then
			currentWeight = currentWeight + (ESX.PlayerData.inventory[i].weight * ESX.PlayerData.inventory[i].count)
		end
	end

	return currentWeight
end

function getvehicleskey()
    getplayerkeys = {}
    ESX.TriggerServerCallback('esx_vehiclelock:allkey', function(mykey)
        for i = 1, #mykey, 1 do
			if mykey[i].NB == 1 then
				table.insert(getplayerkeys, {label = 'Clés : '.. ' [' .. mykey[i].plate .. ']', value = mykey[i].plate})
			elseif mykey[i].NB == 2 then
				table.insert(getplayerkeys, {label = '[DOUBLE] Véhicule : '.. ' [' .. mykey[i].plate .. ']', value = nil})
			end
		end
    end)
end

Society = { List = {} }

Citizen.CreateThread(function()
    ESX.TriggerServerCallback('entreprise:getStatus', function(state)
        Society.List = state
    end)
end)

RegisterNetEvent('entreprise:updateStatus')
AddEventHandler('entreprise:updateStatus', function(jobName, state)
    if Society.List[jobName] ~= nil then
        Society.List[jobName].state = state
    end
end)


--local canTogglePurge = true 
local playerName = GetPlayerServerId(PlayerId())

function OpenRzInteract()
    RefreshMoney()
    RefreshMoney2()
    if PersonalMenu.Menu then 
        PersonalMenu.Menu = false 
        RageUIv1.Visible(RMenu:Get('personalmenu', 'main'), false)
        return
    else
        RMenu.Add('personalmenu', 'main', RageUIv1.CreateMenu("", "Test"))
        RMenu.Add('personalmenu', 'inventory', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "main"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'inventory_use', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "inventory"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'wallet', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "main"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'weapon', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "main"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'gestion', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "main"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'accessoires', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "main"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'keys', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "gestion"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'keysmanagement', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "keys"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'gestionveh', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "main"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'clothes', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "main"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'boss', RageUIv1.CreateSubMenu(RMenu:Get('personalmenu', 'gestion'),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'boss2', RageUIv1.CreateSubMenu(RMenu:Get('personalmenu', 'gestion'),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'touches', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "main"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'portefeuille_money', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "wallet"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'portefeuille_blackmoney', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "wallet"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'portefeuille_work', RageUIv1.CreateSubMenu(RMenu:Get('personalmenu', 'wallet'), "", "Actions Personnel"))
        RMenu.Add('personalmenu', 'papers', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "wallet"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'billing', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "wallet"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'autres', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "main"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'visual', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "main"),"", "Actions Personnel"))
        RMenu.Add('personalmenu', 'infotouche', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "gestionveh"),"", "Actions Personnel")) 
        RMenu.Add('personalmenu', 'entreprise', RageUIv1.CreateSubMenu(RMenu:Get("personalmenu", "main"),"", "Status Entreprise"))         
        RMenu:Get('personalmenu', 'main'):SetSubtitle("Actions Personnel")
        RMenu:Get('personalmenu', 'main').EnableMouse = false
        RMenu:Get('personalmenu', 'main').Closed = function()
            PersonalMenu.Menu = false
            refresh()
        end
        PersonalMenu.Menu = true 
        RageUIv1.Visible(RMenu:Get('personalmenu', 'main'), true)
        Citizen.CreateThread(function()
			while PersonalMenu.Menu do
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'main'), true, true, true, function()
                    ESX.PlayerData = ESX.GetPlayerData()
                    pGrade = ESX.PlayerData.job.grade_name
                    pGrade2 = ESX.PlayerData.job2.grade_name

                    RageUIv1.Separator("[ ID Session : ~b~" .. playerName .. "~s~ | ID Unique : ~b~" .. exports['uid']:UIDClient() .. " ~s~]")

                    RageUIv1.Line()
                    RageUIv1.ButtonWithStyle("Portefeuille", nil, { RightLabel = "→" },true, function()
                    end, RMenu:Get('personalmenu', 'inventory'))

                    if IsPedSittingInAnyVehicle(PlayerPedId()) then
						RageUIv1.ButtonWithStyle("Véhicule", nil, {RightLabel = "→"},true, function()
						end, RMenu:Get('personalmenu', 'gestionveh'))
					end

                    RageUIv1.ButtonWithStyle("Préference", nil, { RightLabel = "→" },true, function(h,a,s)
                    end, RMenu:Get('personalmenu', 'autres'))

                    RageUIv1.ButtonWithStyle("Status Entreprise", nil, { RightLabel = "→" },true, function(h,a,s)
                    end, RMenu:Get('personalmenu', 'entreprise'))

                    RageUIv1.ButtonWithStyle("Touches", nil, { RightLabel = "→" },true, function()
                    end, RMenu:Get('personalmenu', 'touches'))

                    RageUIv1.ButtonWithStyle("Gestions", nil, { RightLabel = "→" },true, function(h,a,s)
                    end, RMenu:Get('personalmenu', 'gestion'))

                    RageUIv1.Checkbox('Boost FPS', nil, Player.VISUAL8, {}, function(h,a,s)
                        if s then
                            Player.VISUAL8 = not Player.VISUAL8
                            if Player.VISUAL8 == true then
                                SetTimecycleModifier('yell_tunnel_nodirect')
                            else
                                SetTimecycleModifier('')
                            end
                        end
                    end)
                    --[[
                    RageUIv1.ButtonWithStyle("VIP ⭐️", nil,{ RightLabel = "→" }, true, function(_,_,s)
                        if s then 
                            ExecuteCommand("vip")
                           RageUIv1.CloseAll()
                        end
                    end)
                    ]]--
                end)

                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'entreprise'), true, true, true, function()
                    local blacklist = { ['vigne'] = true }
                
                    for k, v in pairs(Society.List) do
                        if v.state then
                            if blacklist[k] then goto continue end
                
                            RageUIv1.ButtonWithStyle(v.label, nil, {RightLabel = "~g~Ouvert~s~"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    ESX.ShowNotification("Vous avez sélectionné : ~g~" .. v.label)
                                end
                            end)
                
                            ::continue::
                        end
                    end
                
                    for k, v in pairs(Society.List) do
                        if not v.state then
                            if blacklist[k] then goto continue end
                
                            RageUIv1.ButtonWithStyle(v.label, nil, {RightLabel = "~r~Fermé~s~"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    ESX.ShowNotification("L'entreprise ~r~" .. v.label .. " ~s~est actuellement fermée.")
                                end
                            end)
                
                            ::continue::
                        end
                    end
                end)
                
                
                
                
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'weapon'), true, true, true, function()
                    for i = 1, #WeaponData, 1 do
                        if HasPedGotWeapon(PlayerPedId(), WeaponData[i].hash, false) then
                            local ammo = GetAmmoInPedWeapon(Ped, WeaponData[i].hash)
            
                            RageUIv1.ButtonWithStyle(""..WeaponData[i].label, "Munition(s) : ~c~x"..ammo, {RightLabel = "~g~Donner~s~ →"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local isPermanent = ESX.IsWeaponPermanent(WeaponData[i].name)
                                    if isPermanent then
                                        ESX.ShowNotification("~r~Impossible~s~ Vous ne pouvez pas donner cette arme")
                                        return
                                    else
                                        local playerdst, distance = ESX.Game.GetClosestPlayer()
                                        if playerdst ~= -1 and distance <= 2.0 then
                                            local closestPed = GetPlayerPed(playerdst)
                                            if IsPedOnFoot(closestPed) then
                                                local ammo = GetAmmoInPedWeapon(PlayerPedId(), WeaponData[i].hash)
                                                TriggerServerEvent('interact:sendLogsGiveWeapon', WeaponData[i].label, GetPlayerServerId(playerdst))
                                                TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(playerdst), "item_weapon", WeaponData[i].name, ammo)
                                                RageUIv1.CloseAll()
                                                PersonalMenu.Menu = false
                                            else
                                             RageUIv1.Popup({message = "~r~Impossible~s~ de donner une arme dans un véhicule."})
                                            end
                                        else
                                            ESX.ShowNotification("~r~Impossible~s~ Aucune personne proche de vous")
                                        end             
                                    end
                                end
                            end)
                        end
                    end
                end)
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'gestion'), true, true, true, function()
                    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'bossassistantboss' then

                        RageUIv1.ButtonWithStyle("Gestion d'entreprise", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                        end
                    end, RMenu:Get('personalmenu', 'boss'))
                else
                    RageUIv1.ButtonWithStyle("Gestion d'entreprise", "Vous devez être patron pour y accéder.", {RightBadge = RageUIv1.BadgeStyle.Lock}, false, function(Hovered, Active, Selected)
                        if Selected then
                            end
                        end)
                    end 
                    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' then

                        RageUIv1.ButtonWithStyle("Gestion Organisation", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                        end
                    end, RMenu:Get('personalmenu', 'boss2'))
                else
                    RageUIv1.ButtonWithStyle("Gestion Organisation", "Vous devez être le chef pour y accéder.", {RightBadge = RageUIv1.BadgeStyle.Lock}, false, function(Hovered, Active, Selected)
                        if Selected then
                            end
                        end)
                    end 
                end)
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'keys'), true, true, true, function()
                    for k,v in pairs(getplayerkeys) do
                        RageUIv1.ButtonWithStyle(""..v.label, nil, {RightLabel = ""}, true, function(h,a,s)  
                            if s then
                                v.value = actualvalue
                            end
                        end,RMenu:Get("personalmenu","keysmanagement"))
                    end
                end)
                --[[RageUIv1.IsVisible(RMenu:Get('personalmenu', 'clothes'), true, true, true, function()

                    RageUIv1.ButtonWithStyle("Haut", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "haut")
                        end
                    end)                    
                    RageUIv1.ButtonWithStyle("Chapeau/Casque", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "casque")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Bas", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "bas")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Chaussures", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "chaussures")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Sac", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "sac")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Gilet par Balles", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "gilet")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Masque", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "masque")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Lunette", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "lunette")
                        end
                    end)

                end)]]
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'touches'), true, true, true, function()

                    RageUIv1.ButtonWithStyle("Quitte la Zone GF ", nil, {RightLabel = "/pvpexit"},true, function(h,a,s)  
                        if s then   

                        end
                    end)

                    RageUIv1.ButtonWithStyle("Téléphone ", nil, {RightLabel = "G"},true, function(h,a,s)  
                        if s then   

                        end
                    end) 

                    RageUIv1.ButtonWithStyle("Menu Emotes ", nil, {RightLabel = "K"},true, function(h,a,s)  
                    if s then   
        
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Actions Personnel ", nil, {RightLabel = "F5"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Menu Métiers ", nil, {RightLabel = "F6"},true, function(h,a,s)  
                        if s then   
                
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Menu Radio", nil, {RightLabel = "F3"},true, function(h,a,s)  
                        if s then   
                    
                        end
                    end)
                    

                    RageUIv1.ButtonWithStyle("Vérouiller/ Déverouiller son véhicule ", nil, {RightLabel = "U"},true, function(h,a,s)  
                        if s then   
        
                        end
                    end) 

                    RageUIv1.ButtonWithStyle("Mode de Voix", nil, {RightLabel = "F11"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Coffre de Vehicule ", nil, {RightLabel = "L"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)
            
                    RageUIv1.ButtonWithStyle("Annuler Annimation ", nil, {RightLabel = "W"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Lever les Mains", nil, {RightLabel = "Y"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Montrer du Doigt ", nil, {RightLabel = "B"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)
                end)
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'keysmanagement'), true, true, true, function()
                    local player, distance = ESX.Game.GetClosestPlayer()
					local playerPed = PlayerPedId()
					local plyCoords = GetEntityCoords(playerPed, false)
					local vehicle = GetClosestVehicle(plyCoords, 7.0, 0, 71)
					local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
					local vehPlate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                    RageUIv1.ButtonWithStyle("Donner le véhicule/clés", nil, {RightLabel = ""}, true, function(h,a,s)  
                        if s then
							if distance ~= -1 and distance <= 3.0 then
								TriggerServerEvent('esx_vehiclelock:changeowner', GetPlayerServerId(player), vehPlate, vehicleProps)
							else
                                ESX.ShowNotification("[~r~Impossible~h~] Aucune personne à proximité")
							end
                        end
                    end)
                end)

                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'autres'), true, true, true, function()
                    RageUIv1.Checkbox('Interface GPS', nil, Player.minimap, {}, function(h,a,s)
                        if s then
                            Player.minimap = not Player.minimap
                            DisplayRadar(Player.minimap)
                        end
                    end)
                    RageUIv1.Checkbox('Désactiver Casque de moto', nil, Player.casque, {}, function(h,a,s)
                        if s then
                            Player.casque = not Player.casque
                            if Player.casque == true then
                                SetPedHelmet(PlayerPedId(), false)
                            else
                                SetPedHelmet(PlayerPedId(), true)
                            end
                        end
                    end)

                    RageUIv1.Checkbox('Mode Cinématique', nil, Player.cinematique, {}, function(h,a,s)
                        if s then
                            Player.cinematique = not Player.cinematique
                            if Player.cinematique then
                                ExecuteCommand('noir')
                            else
                                ExecuteCommand('noir')
                            end
                        end
                    end)

                    RageUIv1.Checkbox('Mode Freecam', nil, Player.freecam, {}, function(h,a,s)
                        if s then
                            Player.freecam = not Player.freecam
                            if Player.freecam == true then
                                Freecam:SetActive(true)
                            else
                                Freecam:SetActive(false)
                            end
                        end
                    end)

                    RageUIv1.Line()
                    
                    RageUIv1.ButtonWithStyle("Temp de jeux", nil, { RightLabel = "→" }, true, function(_,_,s)
                        if s then 
                            ExecuteCommand("mytime");
                        end
                    end)
                    RageUIv1.ButtonWithStyle('~r~Debug', "Si vous êtes bloqué, ou bugé...",{ RightLabel = "→" }, true, function(_,_,s)
                        if s then
                            if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                                if not isHandcuffed then
                                    ExecuteCommand("stuck")
                                else
                                    ESX.ShowNotification("~b~Impossible quand vous êtes menotter")
                                end
                            else
                                ESX.ShowNotification("~b~Impossible en voiture")
                            end
                        end
                    end)
                end)
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'gestionveh'), true, true, true, function()
                    local playerPed = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(playerPed, false)
                
                    RageUIv1.ButtonWithStyle("Information Véhicule", nil, { RightLabel = "→" }, true, function() end, RMenu:Get('personalmenu', 'infotouche'))
                    RageUIv1.Line()
                
                    RageUIv1.ButtonWithStyle("Allumer / Éteindre le moteur", nil, {
                        RightLabel = GetIsVehicleEngineRunning(vehicle) and "~g~Allumé" or "~b~Éteint"
                    }, true, function(_, _, s)
                        if s then
                            local engineStatus = GetIsVehicleEngineRunning(vehicle)
                            SetVehicleEngineOn(vehicle, not engineStatus, false, true)
                            SetVehicleUndriveable(vehicle, not engineStatus)
                            ESX.ShowNotification(engineStatus and "~b~Moteur éteint" or "~g~Moteur allumé")
                        end
                    end)
                
                    RageUIv1.List("Gestion des Portes", doorLabels, PersonalMenu.vehicleDoorsIndex, nil, {}, true, {
                        onListChange = function(Index, Item)
                            PersonalMenu.vehicleDoorsIndex = Index
                        end,
                        onSelected = function(Index, Item)
                            local selectedDoor = PersonalMenu.vehicleDoors[Index]
                            if selectedDoor then
                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                local doorIndex = selectedDoor.index
                                local isDoorOpen = GetVehicleDoorAngleRatio(vehicle, doorIndex) > 0.0
                        
                                if isDoorOpen then
                                    SetVehicleDoorShut(vehicle, doorIndex, false)
                                    ESX.ShowNotification("~r~" .. selectedDoor.label .. " fermée.")
                                else
                                    SetVehicleDoorOpen(vehicle, doorIndex, false, false)
                                    ESX.ShowNotification("~g~" .. selectedDoor.label .. " ouverte.")
                                end
                            end
                        end
                    })
                    
                
                    RageUIv1.ButtonWithStyle('Fermer toutes les portes', nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            for i = 0, 5 do SetVehicleDoorShut(vehicle, i, false) end
                            ESX.ShowNotification("~g~Toutes les portes du véhicule sont fermées.")
                        end
                    end)
                
                    RageUIv1.Checkbox('Ouvrir / Fermer les fenêtres', nil, PersonalMenu.windowsOpen, {}, function(_, _, s)
                        if s then
                            PersonalMenu.windowsOpen = not PersonalMenu.windowsOpen
                            for i = 0, 3 do
                                if PersonalMenu.windowsOpen then
                                    RollDownWindow(vehicle, i)
                                else
                                    RollUpWindow(vehicle, i)
                                end
                            end
                            ESX.ShowNotification(PersonalMenu.windowsOpen and "~g~Fenêtres ouvertes" or "~r~Fenêtres fermées")
                        end
                    end)
                
                    RageUIv1.List("Limitateur de vitesse", PersonalMenu.maxSpeedList, PersonalMenu.maxSpeedListIndex, nil, {}, true, {
                        onListChange = function(Index, Item)
                            PersonalMenu.maxSpeedListIndex = Index
                        end,
                        onSelected = function(Index, Item)
                            if Index == 5 then 
                                local customSpeed = exports.input:ShowSync("Entrez une vitesse (km/h)", false, 150, "small_text")
                                if customSpeed and tonumber(customSpeed) then
                                    local maxSpeed = tonumber(customSpeed) / 3.6
                                    PersonalMenu.speedLimiter = maxSpeed
                                    SetVehicleMaxSpeed(vehicle, maxSpeed)
                                    ESX.ShowNotification("~g~Vitesse limitée à " .. customSpeed .. " km/h")
                                else
                                    ESX.ShowNotification("~b~Valeur invalide")
                                end
                            elseif Index == 6 then 
                                SetVehicleMaxSpeed(vehicle, 0.0)
                                PersonalMenu.speedLimiter = 0
                                ESX.ShowNotification("~b~Limiteur de vitesse retiré")
                            else
                                local maxSpeed = tonumber(PersonalMenu.maxSpeedList[Index]) / 3.6
                                PersonalMenu.speedLimiter = maxSpeed
                                SetVehicleMaxSpeed(vehicle, maxSpeed)
                                ESX.ShowNotification("~g~Vitesse limitée à " .. PersonalMenu.maxSpeedList[Index] .. " km/h")
                            end
                        end
                    })
                end)
                

                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'infotouche'), true, true, true, function()
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                
                    local vehicleData = {
                        plate = GetVehicleNumberPlateText(vehicle) or "Inconnu",
                        model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)) or "Inconnu",
                        health = math.floor(GetVehicleEngineHealth(vehicle) / 10),
                        fuel = math.floor(GetVehicleFuelLevel(vehicle)),
                        temp = math.floor(GetVehicleEngineTemperature and GetVehicleEngineTemperature(vehicle) or 0), 
                        engine = GetIsVehicleEngineRunning(vehicle) and "~g~Allumé" or "~b~Éteint"
                    }
                
                    RageUIv1.Separator(string.format("[Plaque] ~b~%s", vehicleData.plate))
                    RageUIv1.Separator(string.format("[Modèle] ~b~%s", vehicleData.model))
                    RageUIv1.Line()
                    RageUIv1.Separator(string.format("[Status du moteur] %s", vehicleData.engine))
                    RageUIv1.Separator(string.format("[État du véhicule] ~y~%d%%", vehicleData.health))
                    RageUIv1.Separator(string.format("[Niveau d'essence] ~g~%dL", vehicleData.fuel))
                    RageUIv1.Separator(string.format("[Température moteur] ~o~%d°C", vehicleData.temp))
                    RageUIv1.Line()
                end)
                
                
                
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'inventory'), true, true, true, function()

                    RageUIv1.Separator("Emploi ~c~→ ~g~" .. ESX.PlayerData.job.label .. "~s~ - ~g~" .. ESX.PlayerData.job.grade_label)
                    RageUIv1.Separator("Gang/Orga ~c~→ ~b~" .. ESX.PlayerData.job2.label .. "~s~ - ~b~" .. ESX.PlayerData.job2.grade_label)

                    RageUIv1.Line()

                    ESX.PlayerData = ESX.GetPlayerData()
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'cash'  then
                            cash = RageUIv1.ButtonWithStyle('Argent en Liquide :', description, {RightLabel = "~g~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.." ~g~$")}, true, function(h, a, s) 
                            end, RMenu:Get('personalmenu', 'portefeuille_money'))
                        end
                    end
            
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'bank'  then
                            bank = RageUIv1.ButtonWithStyle('Argent en Banque :', description, {RightLabel = "~b~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.." ~b~$")}, true, function(h, a, s) 
                        if s then
                            ESX.ShowNotification("[~r~Impossible~h~] Merci de vous rendre dans une banque")
                        end 
                    end)
            
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'dirtycash'  then
                            sale = RageUIv1.ButtonWithStyle('Source inconnue :', description, {RightLabel = "~b~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.." ~b~$")}, true, function() 
                            end, RMenu:Get('personalmenu', 'portefeuille_blackmoney'))
                        end
                    end
                        end
                    end
                    RageUIv1.ButtonWithStyle("Papiers", nil, { RightLabel = "→" },true, function()
                    end, RMenu:Get('personalmenu', 'papers'))
                    RageUIv1.ButtonWithStyle("Factures", nil, { RightLabel = "→" },true, function(h,a,s)
                        if s then
                            RefreshBilling()
                        end
                    end, RMenu:Get('personalmenu', 'billing'))
                end)
                --[[RageUIv1.IsVisible(RMenu:Get('personalmenu', 'inventory_use'), true, true, true, function()
                    RageUIv1.Separator(ItemSelected.label.." ~g~("..ItemSelected.count..")")
                    RageUIv1.ButtonWithStyle("Utiliser", nil, {}, true, function(h, a, s)
                        if s then
                            TriggerServerEvent('esx:useItem', ItemSelected.name)
                        end
                    end)]]
                   --[[ RageUIv1.ButtonWithStyle("Donner", nil, {}, true, function(h, a, s)
                        if a then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestPlayer ~= -1 and closestDistance <= 3 then
                                playerMarker(closestPlayer)
                            end
                        end
                        if s then
                            local sonner,quantity = CheckQuantity(CustomAmount())
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            local pPed = PlayerPedId()
                            local coords = GetEntityCoords(pPed)
                            local x,y,z = table.unpack(coords)
                            if sonner then
                                if closestDistance ~= -1 and closestDistance <= 3 then
                                    local closestPed = GetPlayerPed(closestPlayer)

                                    if IsPedOnFoot(closestPed) then
                                        TriggerServerEvent('interact:sendLogsGive', ItemSelected.name, quantity, GetPlayerServerId(closestPlayer))
                                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_standard', ItemSelected.name, quantity)
                                    else
                                        ESX.ShowNotification("Vous ne pouvez pas donner d'item en étant dans une voiture")
                                    end
                                else
                                    ESX.ShowNotification("Aucune personne à proximité")
                                end
                            end
                        end
                    end)]]
                    --[[RageUIv1.ButtonWithStyle("Jeter", nil, {}, true, function(h,a,s)
                        if s then
                            local sonner,quantity = CheckQuantity(CustomAmount())
                            if sonner then
                                if IsPedInAnyVehicle(PlayerPedId(), true) then
                                    ESX.ShowNotification("Vous ne pouvez pas jeter d'item en étant dans une voiture")
                                else
                                    ExecuteCommand("me jete "..quantity.." "..ItemSelected.label.." par terre")
                                    TriggerServerEvent('esx:dropInventoryItem', 'item_standard', ItemSelected.name, quantity)
                                    RageUIv1.GoBack()
                                end
                            else
                                ESX.ShowNotification("Valeur incorrect")
                            end
                        end
                    end) 
                end)]]
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'wallet'), true, true, true, function()
                    RageUIv1.Separator("Emploi ~c~→ ~g~" .. ESX.PlayerData.job.label .. "~s~ - ~g~" .. ESX.PlayerData.job.grade_label)
                    RageUIv1.Separator("Gang/Orga ~c~→ ~b~" .. ESX.PlayerData.job2.label .. "~s~ - ~b~" .. ESX.PlayerData.job2.grade_label)
                    
                    RageUIv1.Line()

                    ESX.PlayerData = ESX.GetPlayerData()
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'cash'  then
                            cash = RageUIv1.ButtonWithStyle('Argent en Liquide :', description, {RightLabel = "~g~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.." ~g~$")}, true, function(h, a, s) 
                            end, RMenu:Get('personalmenu', 'portefeuille_money'))
                        end
                    end
            
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'bank'  then
                            bank = RageUIv1.ButtonWithStyle('Argent en Banque :', description, {RightLabel = "~b~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.." ~b~$")}, true, function(h, a, s) 
                        if s then
                            ESX.ShowNotification("[~r~Impossible~h~] Merci de vous rendre dans une banque")
                        end 
                    end)
            
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'dirtycash'  then
                            sale = RageUIv1.ButtonWithStyle('Source inconnue :', description, {RightLabel = "~b~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.." ~b~$")}, true, function() 
                            end, RMenu:Get('personalmenu', 'portefeuille_blackmoney'))
                        end
                    end
                        end
                    end
                    RageUIv1.ButtonWithStyle("Papiers", nil, { RightLabel = "→" },true, function()
                    end, RMenu:Get('personalmenu', 'papers'))
                    RageUIv1.ButtonWithStyle("Factures", nil, { RightLabel = "→" },true, function(h,a,s)
                        if s then
                            RefreshBilling()
                        end
                    end, RMenu:Get('personalmenu', 'billing'))
                end)
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'billing'), true, true, true, function()
                    if #PersonalMenu.billing == 0 then
                        RageUIv1.Separator("")
                        RageUIv1.Separator("~b~Vous n'avez aucune facture")
                        RageUIv1.Separator("")
                    end
                    for i = 1, #PersonalMenu.billing, 1 do
						RageUIv1.ButtonWithStyle(""..PersonalMenu.billing[i].label, nil, {RightLabel = ESX.Math.GroupDigits(PersonalMenu.billing[i].amount.."~g~$")}, true, function(h,a,s)
							if s then
								ESX.TriggerServerCallback('esx_billing:payBill', function()
								end, PersonalMenu.billing[i].id)
                                ESX.SetTimeout(100, function()
                                    RefreshBilling()
                                    RageUIv1.GoBack()
                                end)
							end
						end)
					end
                end)
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'papers'), true, true, true, function()
                    RageUIv1.ButtonWithStyle("Regarder sa carte d'identité", nil, { RightLabel = "→" },true, function(h,a,s)
                        if s then
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Montrer sa carte d'identité", nil, { RightLabel = "→" },true, function(h,a,s)
                        if s then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                            if closestDistance ~= -1 and closestDistance <= 3.0 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                            else
                                ESX.ShowNotification("[~r~Impossible~h~] Aucune personne proche")
                            end
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Regarder son permis de conduire", nil, { RightLabel = "→" },true, function(h,a,s)
                        if s then
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Montrer son permis de conduire", nil, { RightLabel = "→" },true, function(h,a,s)
                        if s then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                            if closestDistance ~= -1 and closestDistance <= 3.0 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
                            else
                                ESX.ShowNotification("[~r~Impossible~h~] Aucune personne proche")
                            end
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Regarder son PPA", nil, { RightLabel = "→" },true, function(h,a,s)
                        if s then
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Montrer son PPA", nil, { RightLabel = "→" },true, function(h,a,s)
                        if s then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                            if closestDistance ~= -1 and closestDistance <= 3.0 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
                            else
                                ESX.ShowNotification("[~r~Impossible~h~] Aucune personne proche")
                            end
                        end
                    end)
                    RageUIv1.Separator("")
                    RageUIv1.ButtonWithStyle("~b~Quitter votre job Métier Entreprise", nil, { RightLabel = "→" }, true, function(h, a, s)
                        if s then
                            ESX.TriggerServerCallback('quitJob', function(success)
                                if success then
                                    ESX.ShowNotification("~g~Vous avez quitté votre Métier avec succès.")
                                else
                                    ESX.ShowNotification("~b~Une erreur s'est produite, veuillez réessayer.")
                                end
                            end, 'job') -- 'job' désigne le job principal
                        end
                    end)                                
                end)
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'boss'), true, true, true, function()
                    RageUIv1.Separator("Votre Métier : ~g~"..ESX.PlayerData.job.label.."")
                    RageUIv1.Separator("Votre Grade : ~g~"..ESX.PlayerData.job.grade_label.."")
                    if societymoney ~= nil then
                        RageUIv1.Separator("Argent dans la société : ~g~"..societymoney.."$")
                    end

                    RageUIv1.Separator("")
                RageUIv1.ButtonWithStyle('Recruter une personne', nil, {RightLabel = "→"}, canChange, function(Hovered, Active, Selected)
                    if (Selected) then
                        canChange = false
                        Citizen.SetTimeout(2000, function()
                            canChange = true
                        end)
                        if ESX.PlayerData.job.grade_name == 'boss' then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                            if closestPlayer == -1 or closestDistance > 3.0 then
                                ESX.ShowNotification("[~r~Impossible~h~] Aucune personne proche")
                            else
                                exports["Koy"]:RecruitPlayer("job", GetPlayerServerId(closestPlayer));
                                --TriggerServerEvent('recrutejoueur', GetPlayerServerId(closestPlayer), ESX.PlayerData.job.name, 0)
                            end
                        else
                            ESX.ShowNotification("[~r~Impossible~s~] Vous n'avez pas les droits")
                        end
                    end
                end)
                    end, function()
                end)

                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'boss2'), true, true, true, function()

                    RageUIv1.Separator("Organisation : ~b~"..ESX.PlayerData.job2.label.."")
                    RageUIv1.Separator("Votre Grade : ~b~"..ESX.PlayerData.job2.grade_label.."")
                    if societymoney ~= nil then
                        RageUIv1.Separator("Argent dans le coffre~s~ : ~b~"..societymoney2.."$")
                    end

                    RageUIv1.Separator("")
                    RageUIv1.ButtonWithStyle('Recruter une personne', nil, {RightLabel = "→"}, canChange, function(Hovered, Active, Selected)
                        if (Selected) then
                            canChange = false
                            Citizen.SetTimeout(2000, function()
                                canChange = true
                            end)
                            if ESX.PlayerData.job2.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification("[~r~Impossible~h~] Aucune personne proches")
                                else
                                    exports["Koy"]:RecruitPlayer("job2", GetPlayerServerId(closestPlayer));
                                    --TriggerServerEvent('recrutejoueur2', GetPlayerServerId(closestPlayer), ESX.PlayerData.job2.name, 0)
                                end
                            else
                                ESX.ShowNotification("[~r~Impossible~s~] Vous n'avez pas les droits")
                            end
                        end
                    end)
                        end, function()
                    end)
            
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'portefeuille_money'), true, true, true, function()
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'cash'  then
                            cash = RageUIv1.Separator('Argent liquide :~g~ '..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.." ~g~$")) 
                            RageUIv1.ButtonWithStyle("Donner", nil, {}, true, function(h,a,s)
                                if a then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer ~= -1 and closestDistance <= 3 then
                                        playerMarker(closestPlayer)
                                    end
                                end
                                if s then
                                    local black, quantity = CheckQuantity(CustomAmount())
                                        if black then
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                                if closestDistance ~= -1 and closestDistance <= 3 then
                                                    local closestPed = GetPlayerPed(closestPlayer)
                                                    if not IsPedSittingInAnyVehicle(closestPed) then
                                                        ExecuteCommand("me donne "..quantity.."$ à la personne")
                                                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                                    else
                                                        ESX.ShowNotification("[~r~Impossible~h~] Vous ne pouvez pas donner de l'argent dans un véhicle")
                                                    end
                                                else
                                                    ESX.ShowNotification("[~r~Impossible~h~] Aucune personne à proximité")
                                                end
                                        else
                                            ESX.ShowNotification("[~r~Impossible~h~] Somme invalide")
                                        end
                                end
                            end)
                            RageUIv1.ButtonWithStyle("Jeter", nil, {}, true, function(h,a,s)
                                if s then
                                    local black, quantity = CheckQuantity(CustomAmount())
                                    if black then
                                        if not IsPedSittingInAnyVehicle(PlayerPed) then
                                            ExecuteCommand("me jete "..quantity.."$ par terre")
                                            TriggerServerEvent('esx:dropInventoryItem', 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                        else
                                            ESX.ShowNotification("[~r~Impossible~h~] Vous pouvez pas jeter de l'argent depuis un véhicule")
                                        end
                                    else
                                        ESX.ShowNotification("[~r~Impossible~h~] Somme invalide")
                                    end
                                end
                            end)
                        end
                    end
                end)
                RageUIv1.IsVisible(RMenu:Get('personalmenu', 'portefeuille_blackmoney'), true, true, true, function()
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'dirtycash' then
                            RageUIv1.Separator("Source inconnue :~b~ "..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."$"), nil, {}, true, function(h,a,s)
                            end)
                            RageUIv1.ButtonWithStyle("Donner", nil, {}, true, function(h,a,s)
                                if a then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer ~= -1 and closestDistance <= 3 then
                                        playerMarker(closestPlayer)
                                    end
                                end
                                if s then
                                    local black, quantity = CheckQuantity(CustomAmount())
                                    if black then
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                        if closestDistance ~= -1 and closestDistance <= 3 then
                                            local closestPed = GetPlayerPed(closestPlayer)
            
                                            if not IsPedSittingInAnyVehicle(closestPed) then
                                                ExecuteCommand("me donne "..quantity.."$ à la personne")
                                                TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                            else
                                                ESX.ShowNotification("[~r~Impossible~h~] Vous ne pouvez pas donner de l'argent depuis un véhicule")
                                            end
                                        else
                                            ESX.ShowNotification("[~r~Impossible~h~] Aucune personne à proximité")
                                        end
                                    else
                                        ESX.ShowNotification("[~r~Impossible~h~] Somme invalide")
                                    end
                                end
                            end)
                            RageUIv1.ButtonWithStyle("Jeter", nil, {}, true, function(h,a,s)
                                if s then
                                    local black, quantity = CheckQuantity(CustomAmount())
                                    if black then
                                        if not IsPedSittingInAnyVehicle(PlayerPed) then
                                            ExecuteCommand("me jete "..quantity.."$ par terre")
                                            TriggerServerEvent('esx:dropInventoryItem', 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                        else
                                            ESX.ShowNotification("[~r~Impossible~h~] Vous ne pouvez pas jeter de l'argent depuis un véhicule")
                                        end
                                    else
                                        ESX.ShowNotification("[~r~Impossible~h~] Somme invalide")
                                    end
                                end
                            end)
                        end
                    end
                end)
				Wait(0)
			end
		end)
	end

end

local IsInPVP = false;

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F5','F5', 'Actions Personnel ', function()

	if not (IsInPVP) then
		
		refresh()
		OpenRzInteract();
	end
end)

function refresh()
    Citizen.CreateThread(function()
        ESX.PlayerData = ESX.GetPlayerData() ------ ca sert a rien de le laisser dans ton button il tourner en boucle et surtout te faire monter en ms
    end)
end

function RefreshBilling()
    ESX.TriggerServerCallback('esx_billing:getBills', function(bills)
        PersonalMenu.billing = bills
       -- print(PersonalMenu.billing)
        --print(bills)
    end)
end

function doorAction(door)
    if not IsPedInAnyVehicle(PlayerPedId(),false) then return end
    local veh = GetVehiclePedIsIn(PlayerPedId(),false)
    if door == -1 then
        if doorActionIndex == 1 then
            for i = 0, 7 do
                SetVehicleDoorOpen(veh,i,false,false)
            end
        else
            for i = 0, 7 do
                SetVehicleDoorShut(veh,i,false)
            end
        end
        doorCoolDown = true
        Citizen.SetTimeout(500, function()
            doorCoolDown = false
        end)
        return
    end
    if doorActionIndex == 1 then
        SetVehicleDoorOpen(veh,door,false,false)
        doorCoolDown = true
        Citizen.SetTimeout(500, function()
            doorCoolDown = false
        end)
    else
        SetVehicleDoorShut(veh,door,false)
        doorCoolDown = true
        Citizen.SetTimeout(500, function()
            doorCoolDown = false
        end)
    end
end

function vehicleIsDamaged()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
    return GetVehicleEngineHealth(vehicle) < 1000
end

function isAllowedToManageVehicle()
    if IsPedInAnyVehicle(PlayerPedId(),false) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
        if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
            return true
        end
        return false
    end
    return false
end

function CheckQuantity(number)
    number = tonumber(number)
  
    if type(number) == 'number' then
      number = ESX.Math.Round(number)
  
      if number > 0 then
        return true, number
      end
    end
  
    return false, number
end

RegisterNetEvent('CloseMenu')
AddEventHandler('CloseMenu', function()
	RageUIv1.Visible(RMenu:Get('personalmenu', 'main'), false)
end)

function playerMarker(player)
    local ped = GetPlayerPed(player)
    local pos = GetEntityCoords(ped)
    DrawMarker(2, pos.x, pos.y, pos.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 170, 0, 1, 2, 0, nil, nil, 0)
end

RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job.name == society then
		societymoney = ESX.Math.GroupDigits(money)
	end
    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job2.name == society then
		societymoney2 = ESX.Math.GroupDigits(money)
    end
end)


--[[RegisterNetEvent("PlayPurgeSound")
AddEventHandler("PlayPurgeSound", function(input)
    CreateDui('https://www.petit-fichier.fr/2024/10/30/partage-du-script-the-purge1-1/partage-du-script-the-purge1.mp3', 1, 1)
end)]]