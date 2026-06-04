--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterServerEvent("tattoos:GetPlayerTattoos_s")
AddEventHandler("tattoos:GetPlayerTattoos_s", function()
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll("SELECT * FROM playerstattoos WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
		if (result[1] ~= nil) then
			local tattoosList = json.decode(result[1].tattoos)
			TriggerClientEvent("tattoos:getPlayerTattoos", xPlayer.source, tattoosList)
		else
			local tattooValue = json.encode({})
			MySQL.Async.execute("INSERT INTO playerstattoos (identifier, tattoos) VALUES (@identifier, @tattoo)", {['@identifier'] = xPlayer.identifier, ['@tattoo'] = tattooValue})
			TriggerClientEvent("tattoos:getPlayerTattoos", xPlayer.source, {})
		end
	end)
end)

local playersTimeded = {};

RegisterNetEvent("tattoos:remove", function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	local price = 50000;

	if (not playersTimeded[xPlayer.identifier] or GetGameTimer() - playersTimeded[xPlayer.identifier] > 10000) then
		playersTimeded[xPlayer.identifier] = GetGameTimer();
		if xPlayer.getAccount('cash').money >= price then
			xPlayer.removeAccountMoney('cash', price)

			MySQL.Async.execute("UPDATE playerstattoos SET tattoos = @tattoos WHERE identifier = @identifier", {['@tattoos'] = json.encode({}), ['@identifier'] = xPlayer.identifier})
			
			TriggerClientEvent("esx:showNotification", xPlayer.source, "[~r~Succès~h~] Vous venez de supprimer vos tatouages.")
			TriggerClientEvent("tattoos:getPlayerTattoos", xPlayer.source, {})
		else
			TriggerClientEvent("esx:showNotification", xPlayer.source, "[~r~Impossible~h~] Vous n'avez pas assez d'argent.")
		end
	else
		xPlayer.showNotification("Vous devez attendre 10 secondes avant de pouvoir effacer à nouveau.");
	end
end)

RegisterServerEvent("tattoos:save")
AddEventHandler("tattoos:save", function(tattoosList, price, value)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return end
	-- Securite : le prix vient du client. Entier strictement positif obligatoire,
	-- sinon un prix negatif/decimal credite le joueur au lieu de le debiter.
	price = tonumber(price)
	if (not price) or price <= 0 or price ~= math.floor(price) then return end

	if xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)

		table.insert(tattoosList, value)

		MySQL.Async.execute("UPDATE playerstattoos SET tattoos = @tattoos WHERE identifier = @identifier", {['@tattoos'] = json.encode(tattoosList), ['@identifier'] = xPlayer.identifier})
		
		TriggerClientEvent("tattoo:buySuccess", xPlayer.source, value)
		TriggerClientEvent("esx:showNotification", xPlayer.source, "[~g~Succès~h~] Vous venez d'acheter un tatouage.")
	else
		TriggerClientEvent("esx:showNotification", xPlayer.source, "[~r~Impossible~h~] Vous n'avez pas assez d'argent.")
	end
end)

ESX.RegisterServerCallback('esx_clotheshop:checkMoney', function(source, cb)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getAccount('cash').money >= 2500 then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx_clotheshop:pay')
AddEventHandler('esx_clotheshop:pay', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeAccountMoney('cash', 2500)
end)

