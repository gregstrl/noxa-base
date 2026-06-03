CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(500)
    end
end)
DoScreenFadeIn(500)

local selected = nil;
local lockmenu = true
local quittest = false 
local blabla = true
--local VehicleJournalier = {}
--[[local components = {
    ["clip_default"] = 250,
    ["clip_extended"] = 250,
    ["clip_drum"] = 250,
    ["suppressor"] = 250,
    ["scope"] = 250,
    ["flashlight"] = 250,
    ["grip"] = 250,
    ["luxary_finish"] = 250
};
local blacklistedComponents = {
    ["luxary_finish"] = false,
    ["clip_default"] = false,
    ["suppressor"] = false,
    ["ammo_tracer"] = true,
    ["ammo_armor"] = true,
    ["ammo_fmj"] = true,
    ["ammo_explosive"] = true,
    ["ammo_hollowpoint"] = true,
    ["shells_explosive"] = true,
    ["shells_hollowpoint"] = true,
    ["shells_armor"] = true,
    ["shells_incendiary"] = true
};]]
local IsInPVP = false;

AddEventHandler("Koy:rezu:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

--[[Keys.Register("f1", "menuboutique", "Actions Boutique", function()

    if (IsInPVP) then return; end
     
    OpenMenuMain()
end);
]]

Keys.Register("f1", "menuboutique", "Actions Boutique", function()
    -- Vérifier si le menu custom est ouvert
    if exports["Gamemode"]:IsLsCustomsOpen() then
        ESX.ShowNotification("~s~Vous ne pouvez pas ouvrir la boutique pendant que le menu custom est ouvert")
        return
    end
    if (IsInPVP) then return; end
     
    OpenMenuMain()
end);

local Coins = 0
local LastVeh = nil
local LastLastVeh = nil
local lastPos = nil
local rot = nil
local index = {
    list = 1
}

local Button = 1

local Action = {
    'Visualiser',
    'Acheter'
 }

local ActionNN = {
   'Visualiser',
   'Essayer',
   'Acheter'
}

CreateThread(function()
    Wait(2500)
    TriggerServerEvent('ewen:getFivemID')
end)

RegisterNetEvent('ewen:ReceiveFivemId', function(ReceiveInfo)
    fivemid = ReceiveInfo
end)

RegisterNetEvent("hello:bro", function()
    ESX.TriggerServerCallback('ewen:getPoints', function(result)
        Coins = result
    end)    
end)

local VehicleSpawned = {}


function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
	blockinput = true

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

function OpenMenuMain()
    local menu = RageUI.CreateMenu("", "Actions Boutique")
    local vehicles = RageUI.CreateSubMenu(menu, "", "Actions Boutique")
    local menu_voiture = RageUI.CreateSubMenu(menu, "", "Actions Boutique")
    local voitures = RageUI.CreateSubMenu(menu, "", "Actions Boutique")
    local avionhelico = RageUI.CreateSubMenu(menu, "", "Actions Boutique")
    local bateaux = RageUI.CreateSubMenu(menu, "", "Actions Boutique")
    local PacksMenu = RageUI.CreateSubMenu(menu, "", "Actions Boutique")
    local ArmesMenu = RageUI.CreateSubMenu(menu, "", "Actions Boutique")
    local ArmesShopMenu = RageUI.CreateSubMenu(menu, "", "Actions Boutique")
    --local CustomArmesShopMenu = RageUI.CreateSubMenu(menu, "", "Actions Boutique")
    local CaseMenu = RageUI.CreateSubMenu(menu, "", "Actions Boutique")
    local VipMenu = RageUI.CreateSubMenu(menu, "", "Actions Boutique")
    --[[CustomArmesShopMenu.onIndexChange = function(index)
        if (selected ~= nil) then
            GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(selected.name), selected.components[index].hash)
            if (selected.components[index - 1] ~= nil) and (selected.components[index - 1].hash ~= nil) then
                RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(selected.name), selected.components[index - 1].hash)
            end
            if (index == 1) then
                RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(selected.name), selected.components[#selected.components].hash)
            end
        end
    end
    CustomArmesShopMenu.Closed = function() 
        TriggerEvent('esx:restoreLoadout')
    end]]--
    voitures.Closed = function() 
        if not blabla then 
            quittest = true
        end 
        DoScreenFadeOut(500)
        Wait(1000)
        lockmenu = true
        DeleteEntity(LastVeh)
        DeleteEntity(LastLastVeh)
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityVisible(PlayerPedId(), true, 0)
        SetEntityCoords(PlayerPedId(), lastPos)
        SetFollowPedCamViewMode(1)
        for k,v in pairs(VehicleSpawned) do 
            if DoesEntityExist(v.model) then
                Wait(150)
                DeleteEntity(v.model)
                table.remove(VehicleSpawned, k)
            end
        end
        TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
        DoScreenFadeIn(500)   
    end
     avionhelico.Closed = function() 
         DeleteEntity(LastVeh)
         DeleteEntity(LastLastVeh)
         FreezeEntityPosition(PlayerPedId(), false)
         SetEntityVisible(PlayerPedId(), true, 0)
         SetEntityCoords(PlayerPedId(), lastPos)
         SetFollowPedCamViewMode(1)
         for k,v in pairs(VehicleSpawned) do 
             if DoesEntityExist(v.model) then
                 Wait(150)
                 DeleteEntity(v.model)
                 table.remove(VehicleSpawned, k)
             end
         end
         TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
     end
     bateaux.Closed = function() 
         DeleteEntity(LastVeh)
         DeleteEntity(LastLastVeh)
         FreezeEntityPosition(PlayerPedId(), false)
         SetEntityVisible(PlayerPedId(), true, 0)
         SetEntityCoords(PlayerPedId(), lastPos)
         SetFollowPedCamViewMode(1)
         for k,v in pairs(VehicleSpawned) do 
             if DoesEntityExist(v.model) then
                 Wait(150)
                 DeleteEntity(v.model)
                 table.remove(VehicleSpawned, k)
             end
         end
         TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
     end
    ESX.TriggerServerCallback('ewen:getPoints', function(result)
        Coins = result
    end)
    RageUI.Visible(menu, not RageUI.Visible(menu))
    while menu ~= nil do
        RageUI.IsVisible(menu, function()
            if fivemid == nil then 
                fivemid = 'Fivem non liée'
            end
            --RageUI.Separator('Code Boutique : ~s~'..fivemid)
            --RageUI.Separator('Coins : ~s~'..Coins)
            RageUI.Button('~s~Historique', nil, {  RightLabel = "→" }, true, {
                onActive = function()
                    RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~b~'..fivemid..'~s~', "~w~Coins : ~b~"..Coins.."", "~w~ID Temporaire : ~b~"..GetPlayerServerId(PlayerId()).."~s~" }, {})
                    end,
                onSelected = function()
                    RageUI.CloseAll()
                    OpenHistoryMenu()
                end
            })
            RageUI.Separator('~s~_______________')
            RageUI.Button('~s~Vehicules', nil,  {  RightLabel = "→" }, true, {
                onActive = function()
                    RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~b~'..fivemid..'~s~', "~w~Coins : ~b~"..Coins.."", "~w~ID Temporaire : ~b~"..GetPlayerServerId(PlayerId()).."~s~" }, {})
                end,
                onSelected = function()

                end
            }, menu_voiture)
                            RageUI.Button("~s~Arme", nil, {  RightLabel = "→" }, true, {
                    onActive = function()
                        RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~b~'..fivemid..'~s~', "~w~Coins : ~b~"..Coins.."", "~w~ID Temporaire : ~b~"..GetPlayerServerId(PlayerId()).."~s~" }, {})
                    end,
                    onSelected = function()
                        
                    end
                }, ArmesShopMenu)
                --[[RageUI.Button("~s~Customisation d'armes", nil, {  RightLabel = "→" }, true, {
                    onActive = function()
                        RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~ID Temporaire : ~s~"..GetPlayerServerId(PlayerId()).."" }, {})
                    end,
                    onSelected = function()
                        
                    end
                }, CustomArmesShopMenu)]]
                RageUI.Button('~s~Packs', nil,  {  RightLabel = "→" }, true, {
                onActive = function()
                    RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~ID Temporaire : ~s~"..GetPlayerServerId(PlayerId()).."" }, {})
                    end,
                onSelected = function()
                    
                end
            }, PacksMenu)
            --[[RageUI.Button('~s~Caisse Mystère', nil, {}, true, {
                onActive = function()
                    RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins..""}, {})
                    end,
                onSelected = function()
                    
                end
            }, CaseMenu)]]

            RageUI.Button("~s~VIP", nil, {  RightLabel = "→" }, true, {
                onActive = function()
                    RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~ID Temporaire : ~s~"..GetPlayerServerId(PlayerId()).."" }, {})
                    end,
                onSelected = function()
                    
                end
            }, VipMenu)
        end)


        RageUI.IsVisible(menu_voiture, function()
            if exports.Gamemode:IsInSafeZone() and not exports.Gamemode:IsInMenotte() and not exports.Gamemode:IsInPorter() and not exports.Gamemode:IsInOtage() then
                RageUI.Button('~s~Voitures', nil,  {  RightLabel = "→→" }, true, {
                    onActive = function()
                        RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~ID Temporaire : ~s~"..GetPlayerServerId(PlayerId()).."" }, {})
                    end,
                        onSelected = function()
                            DoScreenFadeOut(500)
                            Wait(1000)
                            lastPos = GetEntityCoords(PlayerPedId())
                            rot = 1.0
                            SetEntityCoords(PlayerPedId(), vector3(-1072.5211181641, -76.566101074219, -95.524160766602))
                            SetEntityHeading(PlayerPedId(), 182.28536987304688)
                            TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', true)
                            DoScreenFadeIn(500)
                        end
                    }, voitures)
            else
                RageUI.Button('~s~Voitures', "~h~Vous devez être en ~s~Zone Safe~s~.",  { RightLabel = "→→" }, false, {
                    onActive = function()
                        RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~ID Temporaire : ~s~"..GetPlayerServerId(PlayerId()).."" }, {})
                    end,
                        onSelected = function()
                            ESX.ShowNotification("Vous devez être en Zone Safe pour acceder à cette catégorie")
                        end
                    })
            end
            if exports.Gamemode:IsInSafeZone() and not exports.Gamemode:IsInMenotte() and not exports.Gamemode:IsInPorter() and not exports.Gamemode:IsInOtage() then
                RageUI.Button('~s~Bateaux', nil,  {  RightLabel = "→→" }, true, {
                    onActive = function()
                        RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~ID Temporaire : ~s~"..GetPlayerServerId(PlayerId()).."" }, {})
                    end,
                        onSelected = function()
                            DoScreenFadeOut(500)
                            Wait(1000)
                            lastPos = GetEntityCoords(PlayerPedId())
                            rot = 1.0
                            SetEntityCoords(PlayerPedId(), vector3(-1501.0750732422, -1130.7200927734, 10.739769935608))
                            SetEntityHeading(PlayerPedId(), 314.2040710449219)
                            TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', true)
                            DoScreenFadeIn(500)
                        end
                    }, bateaux)
            else
                RageUI.Button('~s~Bateaux', "~h~Vous devez être en ~s~Zone Safe~s~.",  { RightLabel = "→→" }, false, {
                    onActive = function()
                        RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~ID Temporaire : ~s~"..GetPlayerServerId(PlayerId()).."" }, {})
                    end,
                        onSelected = function()
                            ESX.ShowNotification("Vous devez être en Zone Safe pour acceder à cette catégorie")
                        end
                    })
            end
            if exports.Gamemode:IsInSafeZone() and not exports.Gamemode:IsInMenotte() and not exports.Gamemode:IsInPorter() and not exports.Gamemode:IsInOtage() then
                RageUI.Button('~s~Avions / Hélicos', nil,  {  RightLabel = "→→" }, true, {
                    onActive = function()
                        RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~ID Temporaire : ~s~"..GetPlayerServerId(PlayerId()).."" }, {})
                    end,
                        onSelected = function()
                            DoScreenFadeOut(500)
                            Wait(1000)
                            lastPos = GetEntityCoords(PlayerPedId())
                            rot = 1.0
                            SetEntityCoords(PlayerPedId(), vector3(-978.84301757812, -2976.0131835938, 18.131383895874))
                            SetEntityHeading(PlayerPedId(), 193.26377868652344)
                            TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', true)
                            DoScreenFadeIn(500)
                        end
                    }, avionhelico)
            else
                RageUI.Button('~s~Avions / Hélicos', "~h~Vous devez être en ~s~Zone Safe~s~.",  { RightLabel = "→→" }, false, {
                    onActive = function()
                        RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~ID Temporaire : ~s~"..GetPlayerServerId(PlayerId()).."" }, {})
                    end,
                        onSelected = function()
                            ESX.ShowNotification("Vous devez être en Zone Safe pour acceder à cette catégorie")
                        end
                    })
            end
        end)
        RageUI.IsVisible(voitures, function()
            for k,v in pairs(BoutiqueVehicles) do
                RageUI.List(v.label..'', ActionNN, index.list, nil, {}, lockmenu, {
                        onActive = function()
                            RageUI.Info('~s~Boutique wise', {'~w~Prix : ~s~'..v.price..' Coins', "~w~Place(s) : ~s~"..v.place.."", "~w~Coffre : ~s~"..v.trunk.." kg", }, {})
                            FreezeEntityPosition(PlayerPedId(), true)
                            SetEntityVisible(PlayerPedId(), false, 0)
                            SetWeatherTypeNow('EXTRASUNNY')
                            SetFollowPedCamViewMode(4)
                            if LastVeh ~= nil then
                                rot = rot + 0.10
                                SetEntityHeading(LastVeh, rot)
                            end
                        end,
                        onListChange = function(Index, Item)
                            index.list = Index;
                            Button = Index;
                        end,
                        onSelected = function()
                            if lockmenu then 
                                if Button == 1 then
                                    if not blabla then 
                                        quittest = true
                                    end 
                                    lockmenu = false
                                    SetEntityCoords(PlayerPedId(), vector3(-1072.5211181641, -76.566101074219, -95.524160766602))
                                    if ESX.Game.IsSpawnPointClear(vector3(-1072.5295410156, -80.985336303711, -94.599838256836), 100) then
                                        ESX.Game.SpawnLocalVehicle(v.model, vector3(-1072.5295410156, -80.985336303711, -94.599838256836), 111.14987182617188, function(vehicle)
                                            lockmenu = true
                                            LastVeh = vehicle
                                            FreezeEntityPosition(vehicle, true)
                                            SetVehicleDoorsLocked(vehicle, 2)
                                            SetEntityInvincible(vehicle, true)
                                            SetVehicleFixed(vehicle)
                                            SetVehicleDirtLevel(vehicle, 0.0)
                                            SetVehicleEngineOn(vehicle, true, true, true)
                                            SetVehicleLights(vehicle, 2)
                                            SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                            SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                            table.insert(VehicleSpawned, {model = vehicle})
                                        end)
                                    else
                                        lockmenu = false
                                        DeleteEntity(LastVeh)
                                        DeleteEntity(LastLastVeh)
                                        ESX.Game.SpawnLocalVehicle(v.model, vector3(-1072.5295410156, -80.985336303711, -94.599838256836), 111.14987182617188, function(vehicle)
                                            lockmenu = true
                                            LastVeh = vehicle
                                            FreezeEntityPosition(vehicle, true)
                                            SetVehicleDoorsLocked(vehicle, 2)
                                            SetEntityInvincible(vehicle, true)
                                            SetVehicleFixed(vehicle)
                                            SetVehicleDirtLevel(vehicle, 0.0)
                                            SetVehicleEngineOn(vehicle, true, true, true)
                                            SetVehicleLights(vehicle, 2)
                                            SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                            SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                            table.insert(VehicleSpawned, {model = vehicle})
                                        end)
                                    end
                                elseif Button == 2 then
                                    if LastLastVeh == nil then
                                        lockmenu = false
                                        blabla = false
                                        if not blabla then 
                                            quittest = false
                                        end 
                                        DoScreenFadeOut(500)
                                        Wait(1000)
                                        ESX.ShowNotification("Vous disposez de 30 secondes pour votre test")
                                        FreezeEntityPosition(PlayerPedId(), false)
                                        SetEntityVisible(PlayerPedId(), true, 0)
                                        SetFollowPedCamViewMode(1)
                                        SetEntityCoords(PlayerPedId(), -871.19, -3220.34, 13.94)
                                        DeleteEntity(LastVeh)
                                        DeleteEntity(LastLastVeh)
                                        ESX.Game.SpawnLocalVehicle(v.model, vector3(-871.19, -3220.34, 13.94), 111.14987182617188, function(vehicle)
                                            lockmenu = true
                                            LastLastVeh = vehicle
                                            SetVehicleDoorsLocked(vehicle, 2)
                                            SetEntityInvincible(vehicle, true)
                                            SetVehicleDirtLevel(vehicle, 0.0)
                                            SetVehicleEngineOn(vehicle, true, true, true)
                                            SetVehicleLights(vehicle, 2)
                                            SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                            SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                            table.insert(VehicleSpawned, {model = vehicle})
                                            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                        end)
                                        SetTimeout(31000, function()
                                            if not quittest then
                                                lockmenu = false
                                                DoScreenFadeOut(500)
                                                Wait(1000)
                                                DeleteEntity(LastLastVeh)
                                                ESX.ShowNotification("Vous venez de finir votre test de 30 secondes")
                                                SetEntityCoords(PlayerPedId(), vector3(-1072.5211181641, -76.566101074219, -95.524160766602))
                                                ESX.Game.SpawnLocalVehicle(v.model, vector3(-1072.5295410156, -80.985336303711, -94.599838256836), 111.14987182617188, function(vehicle)
                                                    lockmenu = true
                                                    LastVeh = vehicle
                                                    FreezeEntityPosition(vehicle, true)
                                                    SetVehicleDoorsLocked(vehicle, 2)
                                                    SetEntityInvincible(vehicle, true)
                                                    SetVehicleFixed(vehicle)
                                                    SetVehicleDirtLevel(vehicle, 0.0)
                                                    SetVehicleEngineOn(vehicle, true, true, true)
                                                    SetVehicleLights(vehicle, 2)
                                                    SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                                    SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                                    table.insert(VehicleSpawned, {model = vehicle})
                                                end)
                                                LastLastVeh = nil
                                                DoScreenFadeIn(500)
                                            end
                                            LastLastVeh = nil
                                            blabla = true
                                            quittest = false
                                        end)
                                        DoScreenFadeIn(500)
                                    else
                                        ESX.ShowNotification("Vous venez de faire un test attendez un peut")
                                    end
                                elseif Button == 3 then
                                    if not blabla then 
                                        quittest = true
                                    end 
                                    local Confirm = KeyboardInput("Confirmer par Oui pour le posséder.", "oui / non", 10)

                                    if Confirm == "oui" then 
                                        TriggerServerEvent('aBoutique:BuyVehicle', v.model, v.price, v.label)
                                        DeleteEntity(LastVeh)
                                        DeleteEntity(LastLastVeh)
                                        FreezeEntityPosition(PlayerPedId(), false)
                                        SetEntityVisible(PlayerPedId(), true, 0)
                                        SetEntityCoords(PlayerPedId(), lastPos)
                                        SetFollowPedCamViewMode(1)
                                        for k,v in pairs(VehicleSpawned) do 
                                            if DoesEntityExist(v.model) then
                                                Wait(150)
                                                DeleteEntity(v.model)
                                                table.remove(VehicleSpawned, k)
                                            end
                                        end
                                        TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
                                        RageUI.CloseAll()     
                                    else
                                        ESX.ShowNotification("Achat non confirmer")
                                        DeleteEntity(LastVeh)
                                        DeleteEntity(LastLastVeh)
                                        FreezeEntityPosition(PlayerPedId(), false)
                                        SetEntityVisible(PlayerPedId(), true, 0)
                                        SetEntityCoords(PlayerPedId(), lastPos)
                                        SetFollowPedCamViewMode(1)
                                        for k,v in pairs(VehicleSpawned) do 
                                            if DoesEntityExist(v.model) then
                                                Wait(150)
                                                DeleteEntity(v.model)
                                                table.remove(VehicleSpawned, k)
                                            end
                                        end
                                        TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
                                        RageUI.CloseAll()     
                                    end                     
                                end
                        end
                    end
                })
            end
        end)
         RageUI.IsVisible(avionhelico, function()
             for k,v in pairs(BoutiqueAirPlaines) do 
                 RageUI.List(GetLabelText(v.model)..' | Prix : ~s~'..v.price, Action, index.list, nil, {}, true, {
                     onActive = function()
                         FreezeEntityPosition(PlayerPedId(), true)
                         SetEntityVisible(PlayerPedId(), false, 0)
                         SetWeatherTypeNow('EXTRASUNNY')
                         SetFollowPedCamViewMode(4)
                         if LastVeh ~= nil then
                             rot = rot + 0.10
                             SetEntityHeading(LastVeh, rot)
                         end
                     end,
                     onListChange = function(Index, Item)
                         index.list = Index;
                         Button = Index;
                     end,
                     onSelected = function()
                         if Button == 1 then
                            if ESX.Game.IsSpawnPointClear(vector3(-970.8639, -2999.831, 13.945), 100) then
                                ESX.Game.SpawnLocalVehicle(v.model, vector3(-970.8639, -2999.831, 13.945), 337.120, function(vehicle)
                                    LastVeh = vehicle
                                     FreezeEntityPosition(vehicle, true)
                                     SetVehicleDoorsLocked(vehicle, 2)
                                     SetEntityInvincible(vehicle, true)
                                     SetVehicleFixed(vehicle)
                                     SetVehicleDirtLevel(vehicle, 0.0)
                                     SetVehicleEngineOn(vehicle, true, true, true)
                                     SetVehicleLights(vehicle, 2)
                                     SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                     SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                     table.insert(VehicleSpawned, {model = vehicle})
                                 end)
                             else
                                 DeleteEntity(LastVeh)
                                 DeleteEntity(LastLastVeh)
                                 ESX.Game.SpawnLocalVehicle(v.model, vector3(-970.8639, -2999.831, 13.945), 337.120, function(vehicle)
                                    LastVeh = vehicle
                                     FreezeEntityPosition(vehicle, true)
                                     SetVehicleDoorsLocked(vehicle, 2)
                                     SetEntityInvincible(vehicle, true)
                                     SetVehicleFixed(vehicle)
                                     SetVehicleDirtLevel(vehicle, 0.0)
                                     SetVehicleEngineOn(vehicle, true, true, true)
                                     SetVehicleLights(vehicle, 2)
                                     SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                     SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                     table.insert(VehicleSpawned, {model = vehicle})
                                 end)
                             end
                         elseif Button == 2 then
                             TriggerServerEvent('aBoutique:BuyVehiclePlane', v.model, GetLabelText(v.model))
                             DeleteEntity(LastVeh)
                             DeleteEntity(LastLastVeh)
                             FreezeEntityPosition(PlayerPedId(), false)
                             SetEntityVisible(PlayerPedId(), true, 0)
                             SetEntityCoords(PlayerPedId(), lastPos)
                             SetFollowPedCamViewMode(1)
                             for k,v in pairs(VehicleSpawned) do 
                                 if DoesEntityExist(v.model) then
                                     Wait(150)
                                     DeleteEntity(v.model)
                                     table.remove(VehicleSpawned, k)
                                 end
                             end
                             TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
                             RageUI.CloseAll()     
                         end
                     end
                 })
             end
		 end)

         RageUI.IsVisible(bateaux, function()
             for k,v in pairs(BoutiqueBoat) do 
                 RageUI.List(GetLabelText(v.model)..' | Prix : ~s~'..v.price, Action, index.list, nil, {}, true, {
                     onActive = function()
                         FreezeEntityPosition(PlayerPedId(), true)
                         SetEntityVisible(PlayerPedId(), false, 0)
                         SetWeatherTypeNow('EXTRASUNNY')
                         SetFollowPedCamViewMode(4)
                         if LastVeh ~= nil then
                             rot = rot + 0.10
                             SetEntityHeading(LastVeh, rot)
                         end
                     end,
                     onListChange = function(Index, Item)
                         index.list = Index;
                         Button = Index;
                     end,
                     onSelected = function()
                         if Button == 1 then
                            if ESX.Game.IsSpawnPointClear(vector3(-1509.9216308594, -1143.5646972656, 0.29253068566322), 100) then
                                ESX.Game.SpawnLocalVehicle(v.model, vector3(-1509.9216308594, -1143.5646972656, 0.29253068566322), 249.82501220703125, function(vehicle)
                                    LastVeh = vehicle
                                     FreezeEntityPosition(vehicle, true)
                                     SetVehicleDoorsLocked(vehicle, 2)
                                     SetEntityInvincible(vehicle, true)
                                     SetVehicleFixed(vehicle)
                                     SetVehicleDirtLevel(vehicle, 0.0)
                                     SetVehicleEngineOn(vehicle, true, true, true)
                                     SetVehicleLights(vehicle, 2)
                                     SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                     SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                     table.insert(VehicleSpawned, {model = vehicle})
                                 end)
                             else
                                 DeleteEntity(LastVeh)
                                 DeleteEntity(LastLastVeh)
                                 ESX.Game.SpawnLocalVehicle(v.model, vector3(550.243, -3378.061, 5.843), 282.959, function(vehicle)
                                    LastVeh = vehicle
                                     FreezeEntityPosition(vehicle, true)
                                     SetVehicleDoorsLocked(vehicle, 2)
                                     SetEntityInvincible(vehicle, true)
                                     SetVehicleFixed(vehicle)
                                     SetVehicleDirtLevel(vehicle, 0.0)
                                     SetVehicleEngineOn(vehicle, true, true, true)
                                     SetVehicleLights(vehicle, 2)
                                     SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                     SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                     table.insert(VehicleSpawned, {model = vehicle})
                                 end)
                             end
                         elseif Button == 2 then
                             TriggerServerEvent('aBoutique:BuyVehicleBoat', v.model, GetLabelText(v.model))
                             DeleteEntity(LastVeh)
                             DeleteEntity(LastLastVeh)
                             FreezeEntityPosition(PlayerPedId(), false)
                             SetEntityVisible(PlayerPedId(), true, 0)
                             SetEntityCoords(PlayerPedId(), lastPos)
                             SetFollowPedCamViewMode(1)
                             for k,v in pairs(VehicleSpawned) do 
                                 if DoesEntityExist(v.model) then
                                     Wait(150)
                                     DeleteEntity(v.model)
                                     table.remove(VehicleSpawned, k)
                                 end
                             end
                             TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
                             RageUI.CloseAll() 
                         end
                     end
                 })
             end
		 end)
        RageUI.IsVisible(PacksMenu, function() 
            RageUI.Button('Crée ton Organisation', nil, {RightLabel = 5000}, true, {
                onActive = function()
                    RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~Prix : ~s~5000"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('aBoutique:Illegal')
                    RageUI.CloseAll()
                end
            })
            RageUI.Button('Crée ton Gang', nil, {RightLabel = 4000}, true, {
                onActive = function()
                    RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~Prix : ~s~4000"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('aBoutique:Illegal2')
                    RageUI.CloseAll()
                end
            })
            RageUI.Button('Crée ton Entreprise Mécano', nil, {RightLabel = 12000}, true, {
                onActive = function()
                    RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~Prix : ~s~12000"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('aBoutique:entreprise')
                    RageUI.CloseAll()
                end
            })
            RageUI.Button('Crée ton Entreprise Farm', nil, {RightLabel = 8000}, true, {
                onActive = function()
                    RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~Prix : ~s~8000", "~w~Bonus : ~s~Accès Blanchiment"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('aBoutique:entreprise')
                    RageUI.CloseAll()
                end
            })
        end)

         RageUI.IsVisible(ArmesMenu, function() 
             RageUI.Button('Armes', nil, {}, true, {
                 onSelected = function()

                 end
             }, ArmesShopMenu)
         end)
         RageUI.IsVisible(ArmesShopMenu, function()
             for k,v in pairs(WeaponBoutique) do
                 RageUI.Button(v.label, v.description, {RightLabel = 'Prix : '.. v.price}, true, {
                     onActive = function()
                         RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~Arme : ~s~"..v.label.."", "~w~Prix : ~s~"..v.price..""}, {})
                         RageUI.RenderWeapons("weapon", v.name)
                     end,
                     onSelected = function()
                         TriggerServerEvent('ewen:buyweapon', v.name, v.price, v.label)
                         RageUI.CloseAll()
                     end
                 })
              end
         end)

        --[[RageUI.IsVisible(CustomArmesShopMenu, function()
            local sWeapon = GetSelectedPedWeapon(PlayerPedId())
            local weapon = ESX.GetWeaponFromHash(sWeapon)
            if sWeapon ~= GetHashKey("WEAPON_UNARMED") then
                local isPermanent = ESX.IsWeaponPermanent(weapon.name)
                if isPermanent then
                    RageUI.Separator(weapon.label)
                    RageUI.Separator("")
                    if (ESX.Table.SizeOf(weapon) > 0) then
                        for _, v in pairs(weapon.components) do
                            if v.name ~= "luxary_finish" and v.name ~= "clip_default" and v.name ~= "ammo_tracer" and v.name ~= "ammo_incendiary" and v.name ~= "ammo_armor" and v.name ~= "ammo_fmj" and v.name ~= "ammo_explosive" and v.name ~= "ammo_hollowpoint" and v.name ~= "shells_explosive" and v.name ~= "shells_hollowpoint" and v.name ~= "shells_armor" and v.name ~= "shells_incendiary" and v.name ~= "shells_incendiary" then
                                RageUI.Button(v.label, nil, {}, not HasPedGotWeaponComponent(PlayerPedId(), sWeapon, v.hash), {
                                    onActive = function()
                                        if v.name == "clip_extended" then
                                            RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~Composant : ~s~"..v.label.."", "~w~Prix : ~s~500"}, {})
                                        elseif v.name == "clip_drum" then
                                            RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~Composant : ~s~"..v.label.."", "~w~Prix : ~s~750"}, {})
                                        elseif v.name == "clip_box" then
                                            RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~Composant : ~s~"..v.label.."", "~w~Prix : ~s~1000"}, {})
                                        else
                                            RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~Composant : ~s~"..v.label.."", "~w~Prix : ~s~250"}, {})
                                        end
                                    end,
                                    onSelected = function()
                                        TriggerServerEvent('tebex:on-process-checkout-weapon-custom', weapon.name, GetHashKey(v.name))
                                    end,
                                })
                            end
                        end
                    else
                        RageUI.Separator("Aucune personnalisation disponible")
                    end
                else
                    RageUI.Separator("Aucune personnalisation sur ce type d'arme")
                end
            else
                RageUI.Separator("")
                RageUI.Separator("~s~Vous n'avez pas d'armes en main~s~")
                RageUI.Separator("")
            end
        end)]]
        --[[RageUI.IsVisible(CaseMenu, function() 
            for k,v in pairs(BoutiqueMysteryBox) do
                if v.model ~= 'caisse_fidelite' then
                    RageUI.List(v.label..' | Prix : ~s~'..v.price, Action, index.list, v.description, {}, true, {
                        onActive = function()
                            RageUI.RenderCaisse("caisse", v.model)
                            RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins..""}, {})
                        end,
                        onListChange = function(Index, Item)
                            index.list = Index;
                            Button = Index;
                        end,
                        onSelected = function()
                            if Button == 1 then
                                OpenMenuPreviewCaisse(v.model, v.label)
                            elseif Button == 2 then
                                RageUI.CloseAll()
                                TriggerServerEvent('Koy:process_checkout_case', v.model)
                            end
                        end
                    })
                else
                    RageUI.List(v.label..' | Bonus Fidélité', Action, index.list, nil, {}, true, {
                        onActive = function()
                            RageUI.RenderCaisse("caisse", v.model)
                            RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins..""}, {})
                        end,
                        onListChange = function(Index, Item)
                            index.list = Index;
                            Button = Index;
                        end,
                        onSelected = function()
                            if Button == 1 then
                                OpenMenuPreviewCaisse(v.model, v.label)
                            elseif Button == 2 then
                                ESX.ShowNotification("Vous ne povuez pas acheter cette caisse")
                            end
                        end
                    })
                end
            end
        end)]]
        RageUI.IsVisible(VipMenu, function() 
            RageUI.Button('VIP ~o~Gold (1 mois)', nil, { RightLabel = 1250}, true, {
                onActive = function()
                    RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~Temps : ~s~1 Mois","~w~VIP : ~s~Gold", "~w~Bonus: ~s~100K Argent Propre"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('eBoutique:BuyVIP', "gold")
                end,
            })
            RageUI.Button('VIP ~b~Diamond (1 mois)', nil, { RightLabel = 2000}, true, {
                onActive = function()
                    RageUI.Info('~s~Boutique wise', {'~w~Code Boutique : ~s~'..fivemid..'', "~w~Coins : ~s~"..Coins.."", "~w~Temps : ~s~1 Mois","~w~VIP : ~s~Diamond", "~w~Bonus: ~s~250K Argent Propre"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('eBoutique:BuyVIP', "diamond")
                end,
            })
        end)
        if not RageUI.Visible(menu) 
        and not RageUI.Visible(vehicles) 
        and not RageUI.Visible(voitures) 
        and not RageUI.Visible(avionhelico) 
        and not RageUI.Visible(bateaux) 
        and not RageUI.Visible(menu_voiture)
        and not RageUI.Visible(PacksMenu) 
        and not RageUI.Visible(ArmesMenu) 
        and not RageUI.Visible(ArmesShopMenu) 
        --and not RageUI.Visible(CustomArmesShopMenu) 
       -- and not RageUI.Visible(CaseMenu)
        and not RageUI.Visible(VipMenu)
        then
            menu = RMenu:DeleteType('menu', true)
		end
		Wait(0)
    end
end

RegisterNetEvent('aBoutique:BuyCustomMaxClient', function()
    local vehicle = GetVehiclePedIsUsing(PlayerPedId())
    FullCustom(vehicle)
end)


--[[function OpenMenuPreviewCaisse(model, label)
    local CaissePreview = RageUI.CreateMenu('Boutique Modern', "Actions Boutique")
    RageUI.Visible(CaissePreview, not RageUI.Visible(CaissePreview))
    while CaissePreview do
        Wait(0)
        RageUI.IsVisible(CaissePreview, function()
            RageUI.Separator('Prévisualisation de la caisse : '..label)
            for k,v in pairs(VisualitionCaisse[model]) do
                if v.rarity == 4 then
                    RageUI.Button(v.label, nil, {RightLabel = '~s~Ultime'}, true, {
                        onActive = function()
                            RageUI.RenderCaissePreview('caissemystere', v.model)
                        end,
                        onSelected = function()
        
                        end
                    })
                end
            end
            for k,v in pairs(VisualitionCaisse[model]) do
                if v.rarity == 3 then
                    RageUI.Button(v.label, nil, {RightLabel = '~y~Légendaire'}, true, {
                        onActive = function()
                            RageUI.RenderCaissePreview('caissemystere', v.model)
                        end,
                        onSelected = function()
        
                        end
                    })
                end
            end
            for k,v in pairs(VisualitionCaisse[model]) do
                if v.rarity == 2 then
                    RageUI.Button(v.label, nil, {RightLabel = '~s~Rare'}, true, {
                        onActive = function()
                            RageUI.RenderCaissePreview('caissemystere', v.model)
                        end,
                        onSelected = function()
        
                        end
                    })
                end
            end
            for k,v in pairs(VisualitionCaisse[model]) do
                if v.rarity == 1 then
                    RageUI.Button(v.label, nil, {RightLabel = '~s~Commun'}, true, {
                        onActive = function()
                            RageUI.RenderCaissePreview('caissemystere', v.model)
                        end,
                        onSelected = function()
        
                        end
                    })
                end
            end
        end, function()
        end)

        if not RageUI.Visible(CaissePreview) then
            CaissePreview = RMenu:DeleteType('BoutiqueSub', true)
            Wait(100)
            OpenMenuMain()
        end
    end
end]]

-- OPENING CASE

--[[local picture;

local mysterybox = RageUI.CreateMenu("Caisse Mystère", "Bonne chance !")

RegisterNetEvent('ewen:caisseopenclientside')
AddEventHandler('ewen:caisseopenclientside', function(animations, name, message)
    RageUI.Visible(mysterybox, not RageUI.Visible(mysterybox))
    CreateThread(function()
        Wait(250)
        for k, v in pairs(animations) do
            picture = v.name
            RageUI.PlaySound("HUD_FREEMODE_SOUNDSET", "NAV_UP_DOWN")
            if v.time == 5000 then
                RageUI.PlaySound("HUD_AWARDS", "FLIGHT_SCHOOL_LESSON_PASSED")
                ESX.ShowNotification('Notification', 'Boutique', message, 'CHAR_REZU', 6)
                Wait(4000)
            end
            Wait(v.time)
        end
    end)
end)

CreateThread(function()
    while (true) do
        Wait(1.0)

        RageUI.IsVisible(mysterybox, function()
        end, function()
            if (picture) then
                RageUI.CaissePreviewOpen("caissemystere", picture)
            end
        end)


    end
end)]]
