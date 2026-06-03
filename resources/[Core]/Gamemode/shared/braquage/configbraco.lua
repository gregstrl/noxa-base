--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ConfigBraco = {}
ConfigBraco.Locale = 'fr'
ConfigBraco.NumberOfCopsRequired = 5
ConfigBraco.RequiredCopsRob = 5
ConfigBraco.RequiredCopsSell = 0
ConfigBraco.MinJewels = 1
ConfigBraco.MaxJewels = 5
ConfigBraco.MaxWindows = 20
ConfigBraco.SecBetwNextRob = 7200 --1 hour
ConfigBraco.MaxJewelsSell = 10
ConfigBraco.PriceForOneJewel = 2500
ConfigBraco.EnableMarker = true
ConfigBraco.NeedBag = true
ConfigBraco.Borsoni = {11, 12, 13, 40, 41, 44, 45}

Banks = {
	['Casa'] = {
		position = vector3(3589.88, 3683.94, 27.62),
		reward = math.random(500000, 900000),
		nameofbank = "Maison de fabrication des billet",
		lastrobbed = 300000
	},
	['PacificBank'] = {
		position = vector3(265.249451, 214.057404, 101.68),
		reward = math.random(400000, 700000),
		nameofbank = "Pacifique Bank",
		lastrobbed = 300000
	}
}

Stores = {
	['jewelry'] = {
		position2 = { ['x'] = -629.99, ['y'] = -236.542, ['z'] = 38.05 },       
		nameofstore = "Bijouterie",
		lastrobbed = 300000
	}
}