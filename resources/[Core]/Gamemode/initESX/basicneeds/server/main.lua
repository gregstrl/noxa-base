--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Enregistrer l'item utilisable
ESX.RegisterUsableItem('staminaboost', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    -- Vérifier si le joueur possède l'item
    if xPlayer.getInventoryItem('staminaboost').count > 0 then
        -- Appliquer l'effet d'endurance infinie
        TriggerClientEvent('stamina:useBoost', source)
		TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
		TriggerClientEvent('esx_basicneeds:ondonut', source)

        -- Retirer l'item après utilisation
        xPlayer.removeInventoryItem('staminaboost', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas cet item.")
    end
end)

ESX.RegisterUsableItem('burgerclassique', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('burgerclassique', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 700000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Burger Classique')
end)

ESX.RegisterUsableItem('burger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('burger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 700000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Burger')
end)

ESX.RegisterUsableItem('chaklik', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('chaklik', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Chaklik')
end)

ESX.RegisterUsableItem('bœuf_stroganov', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('bœuf_stroganov', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Bœuf Stroganov')
end)

ESX.RegisterUsableItem('pate_au_truffe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('pate_au_truffe', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Pâte au Truffe')
end)

ESX.RegisterUsableItem('riz', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('riz', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Riz')
end)

ESX.RegisterUsableItem('entrecôte', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('entrecôte', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Entrecôte')
end)

ESX.RegisterUsableItem('homard_grillé ', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('homard_grillé ', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Homard Grillé')
end)

ESX.RegisterUsableItem('carpaccio_de_flétan', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('carpaccio_de_flétan', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Carpaccio de Flétan')
end)

ESX.RegisterUsableItem('salade_césar', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('salade_césar', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Salade César')
end)

ESX.RegisterUsableItem('crêpes', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('crêpes', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Crêpes')
end)

ESX.RegisterUsableItem('medovik', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('medovik', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Medovik')
end)

ESX.RegisterUsableItem('frite', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('frite', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Frite')
end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Pain')
end)

ESX.RegisterUsableItem('coffe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    if not xPlayer then return end

	xPlayer.removeInventoryItem('coffe', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:oncoffee', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Café')
end)

ESX.RegisterUsableItem('cofee', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    xPlayer.updateVIP(function() 
		if xPlayer.getVIP() == 2 or xPlayer.getVIP() == 3 then 
			xPlayer.removeInventoryItem('cofee', 1)
			TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
			TriggerClientEvent('esx_basicneeds:oncoffee', source)
			TriggerClientEvent('esx:showNotification', source, "~g~Vous venez de boire un Super-Café !") 
		else
			TriggerClientEvent('esx:showNotification', source, "~s~Vous devez être VIP pour boire un Super-Café !") 
		end
    end)
end)

ESX.RegisterUsableItem('donuts', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
	xPlayer.updateVIP(function() 
		if xPlayer.getVIP() == 2 or xPlayer.getVIP() == 3 then 
			xPlayer.removeInventoryItem('donuts', 1)
			TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
			TriggerClientEvent('esx_basicneeds:ondonut', source)
			TriggerClientEvent('esx:showNotification', source, "~g~Vous venez de manger un Super Donuts !")
		else
			TriggerClientEvent('esx:showNotification', source, "~s~Vous devez être VIP pour manger un Super Donuts !") 
		end
	end)
end)


ESX.RegisterUsableItem('bolnoixcajou', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
	xPlayer.removeInventoryItem('bolnoixcajou', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:oncoffee', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Bol de Noix de Cajou')
end)

ESX.RegisterUsableItem('bolpistache', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
	xPlayer.removeInventoryItem('bolpistache', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:oncoffee', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Bol de Pistache')
end)


ESX.RegisterUsableItem('water', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Eau')
end)


ESX.RegisterUsableItem('vine', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('vine', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Vin')

	Wait(2000)
    TriggerClientEvent('applyDrunkEffect', source)
end)

ESX.RegisterUsableItem('vin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('vin', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Vin')

	Wait(2000)
    TriggerClientEvent('applyDrunkEffect', source)
end)

ESX.RegisterUsableItem('whisky', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    xPlayer.removeInventoryItem('whisky', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Whisky')
    
	Wait(2000)
    TriggerClientEvent('applyDrunkEffect', source)
end)




ESX.RegisterUsableItem('chocolat', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('chocolat', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onchocolat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Chocolat')
end)

ESX.RegisterUsableItem('applepie', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('applepie', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Tarte aux Pommes')
end)

ESX.RegisterUsableItem('bolchips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('bolchips', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Bol de Chips')
end)

ESX.RegisterUsableItem('bolcacahuetes', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('bolcacahuetes', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)-- 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Bol de Cacahuètes')
end)

ESX.RegisterUsableItem('banana', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('banana', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Banane')
end)

ESX.RegisterUsableItem('beef', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('beef', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 450000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Steak de Boeuf')
end)

ESX.RegisterUsableItem('hamburger', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('hamburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Hamburger')
end)

ESX.RegisterUsableItem('cupcake', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('cupcake', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Cupcake')
end)


ESX.RegisterUsableItem('soda', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('soda', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
	TriggerClientEvent('esx_basicneeds:onsoda', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Soda')
end)

ESX.RegisterUsableItem('caprisun', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('caprisun', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
	TriggerClientEvent('esx_basicneeds:onsoda', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Caprisun')
end)

ESX.RegisterUsableItem('jusfruit', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('jusfruit', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 290000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Jus de Fruit')
end)


ESX.RegisterUsableItem('mixapero', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('mixapero', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Mix Apéro')

	Wait(2000)
    TriggerClientEvent('applyDrunkEffect', source)
end)

ESX.RegisterUsableItem('mojito', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('mojito', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 340000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Mojito')

	Wait(2000)
    TriggerClientEvent('applyDrunkEffect', source)
end)


ESX.RegisterUsableItem('limonade', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('limonade', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 290000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Limonade')
end)

ESX.RegisterUsableItem('fanta', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('fanta', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 290000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Fanta')
end)

ESX.RegisterUsableItem('icetea', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('icetea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 290000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Ice Tea')
end)

ESX.RegisterUsableItem('cocacola', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('cocacola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 290000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Coca-Cola')
end)

ESX.RegisterUsableItem('orangina', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('orangina', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Orangina')
end)

ESX.RegisterUsableItem('cola', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('cola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 290000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Cola')
 
end)

ESX.RegisterUsableItem('coca', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('coca', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 290000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Coca')
 
end)

ESX.RegisterUsableItem('raisin', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('raisin', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 290000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Raisin')

end)


ESX.RegisterUsableItem('loka', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('loka', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Loka')

end)

ESX.RegisterUsableItem('pizza', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('pizza', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Pizza')

end)

ESX.RegisterUsableItem('chips', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('chips', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 4000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Chips')

end)

ESX.RegisterUsableItem('cacahuete', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('cacahuete', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 4000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Cacahuète')

end)

ESX.RegisterUsableItem('olive', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('olive', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 4000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Olive')

end)

ESX.RegisterUsableItem('ice', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('ice', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Glaçon')

end)

ESX.RegisterUsableItem('wiskycoca', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('wiskycoca', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Wisky Coca')

	Wait(2000)
    TriggerClientEvent('applyDrunkEffect', source)
end)


ESX.RegisterUsableItem('fish', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('fish', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Fish')

end)

ESX.RegisterUsableItem('energy', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('energy', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu x1 ~s~Energy')

end)

ESX.RegisterUsableItem('chips', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('chips', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Chips')

end)

ESX.RegisterUsableItem('sandwich', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('sandwich', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onsandwich', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Sandwich')

end)

-------- Drogue effect 

ESX.RegisterUsableItem('coke', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('coke', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1)
	TriggerClientEvent('esx_basicneeds:onDrogue', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Feuillette de Cocaïne')

	Wait(2000)
	TriggerClientEvent('applyDrugEffect', source)
end)

ESX.RegisterUsableItem('weed', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('weed', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1)
	TriggerClientEvent('esx_basicneeds:onDrogue', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Feuillette de Weed')

	Wait(2000)
	TriggerClientEvent('applyDrugEffect', source)
end)


ESX.RegisterUsableItem('lsd', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('lsd', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1)
	TriggerClientEvent('esx_basicneeds:onDrogue', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Cachet de LSD')

	Wait(2000)
	TriggerClientEvent('applyDrugEffect', source)
end)


ESX.RegisterUsableItem('opium', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

	xPlayer.removeInventoryItem('opium', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1)
	TriggerClientEvent('esx_basicneeds:onDrogue', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mangé x1 ~s~Latex d\'Opium') 

	Wait(2000)
	TriggerClientEvent('applyDrugEffect', source)
end)
