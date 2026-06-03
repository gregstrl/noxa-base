--[[
  This file is part of wise RolePlay.
  Copyright (c) wise RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
		Wait(10)
    end
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Wait(50)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Wait(100)
		blockinput = false
		return result
	else
		Wait(100)
		blockinput = false
		return nil
	end
end

function CustomAmount()
    local montant = nil
    AddTextEntry("BANK_CUSTOM_AMOUNT", "Entrez le montant")
    DisplayOnscreenKeyboard(1, "BANK_CUSTOM_AMOUNT", '', "", '', '', '', 15)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(50)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        montant = GetOnscreenKeyboardResult()
        Wait(50)
    else
        Wait(50)
    end
    return tonumber(montant)
end

RegisterNetEvent('requestClothes')
AddEventHandler('requestClothes', function(clothesType)
    local animDicts = {
        haut = {"clothingtie", "try_tie_neutral_a"},
        bas = {"clothingtrousers", "try_trousers_neutral_c"},
        chaussures = {"clothingshoes", "try_shoes_positive_a"},
        sac = {"clothingtie", "try_tie_neutral_a"},
        masque = {"missfbi4", "takeoff_mask"},
        casque = {"missfbi4", "takeoff_mask"},
        lunette = {"missfbi4", "takeoff_mask"},
        gilet = {"clothingtie", "try_tie_neutral_a"}
    }

    local animData = animDicts[clothesType]
    if not animData then return end

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)
        TriggerEvent('skinchanger:getSkin', function(skinb)
            ESX.Streaming.RequestAnimDict(animData[1], function()
                TaskPlayAnim(PlayerPedId(), animData[1], animData[2], 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(1000)
                ClearPedTasks(PlayerPedId())

                local clothesData = {
                    haut = {['torso_1'] = skina.torso_1, ['torso_2'] = skina.torso_2, ['tshirt_1'] = skina.tshirt_1, ['tshirt_2'] = skina.tshirt_2, ['arms'] = skina.arms},
                    bas = {['pants_1'] = skina.pants_1, ['pants_2'] = skina.pants_2},
                    chaussures = {['shoes_1'] = skina.shoes_1, ['shoes_2'] = skina.shoes_2},
                    sac = {['bags_1'] = skina.bags_1, ['bags_2'] = skina.bags_2},
                    masque = {['mask_1'] = skina.mask_1, ['mask_2'] = skina.mask_2},
                    casque = {['helmet_1'] = skina.helmet_1, ['helmet_2'] = skina.helmet_2},
                    lunette = {['glasses_1'] = skina.glasses_1, ['glasses_2'] = skina.glasses_2},
                    gilet = {['bproof_1'] = skina.bproof_1, ['bproof_2'] = skina.bproof_2}
                }

                local currentClothes = clothesData[clothesType]
                if currentClothes then
                    TriggerEvent('skinchanger:loadClothes', skinb, currentClothes)
                end
            end)
        end)
    end)
end)
