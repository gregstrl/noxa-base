ESX = exports.Framework:getSharedObject()

local CASH_ACCOUNTS = {'cash', 'dirtycash'} -- Comptes d'argent disponibles

if Config.UseESX then 

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)

		if price > 0 then
			local paid = false
			
			-- Essayer de payer avec les comptes disponibles
			for _, accountName in ipairs(CASH_ACCOUNTS) do
				local account = xPlayer.getAccount(accountName)
				if account and account.money >= amount then
					xPlayer.removeAccountMoney(accountName, amount)
					paid = true
					break
				end
			end
			
			if not paid then
				-- Aucun compte n'a suffisamment d'argent
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas assez d\'argent pour payer le carburant')
			end
		end
	end)
end
