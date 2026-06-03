--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterServerEvent('barbershop:pay')
AddEventHandler('barbershop:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeAccountMoney('cash', 250)
	TriggerClientEvent('esx:showNotification', _source, "Vous avez payé ~g~250$")
end)