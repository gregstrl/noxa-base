Config = {
	AccessPalier = true,
	PlateLetters = 4,
	PlateNumbers = 4,
	TimeToRespawn = 400,
	TimeToJesus = 600,
	RespawningPlace = vector3(106.465744, -400.633301, 39.37),
	Percent = 0.05,
    Get = {
        ESX = "esx:getSharedObject",
		Marker = {
			Type = 2,
			Size = {0.2, 0.2, 0.2},
			Color = {115,101,240},
			Rotation = 180.0,
		},
    },



	
	Components = {
		{
			label = _U('sex'),
			name = 'sex',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65
		},
		{
			label = _U('mom'),
			name = 'mom',
			value = 21,
			min = 21,
			zoomOffset = 0.6,
			camOffset = 0.65
		},
		{
			label = _U('dad'),
			name = 'dad',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65
		},
		{
			label = _U('resemblance'),
			name = 'face_md_weight',
			value = 50,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65
		},
		{
			label = _U('skin_tone'),
			name = 'skin_md_weight',
			value = 50,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65
		},
		{
			label = _U('nose_1'),
			name = 'nose_1',
			value = 0,
			min = -10,
			zoomOffset = 0.6,
			camOffset = 0.65
		},
		{
			label = _U('nose_2'),
			name = 'nose_2',
			value = 0,
			min = -10,
			zoomOffset = 0.6,
			camOffset = 0.65
		},
		{
			label = _U('nose_3'),
			name = 'nose_3',
			value = 0,
			min = -10,
			zoomOffset = 0.6,
			camOffset = 0.65
		}, {
			label = _U('nose_4'),
			name = 'nose_4',
			value = 0,
			min = -10,
			zoomOffset = 0.6,
			camOffset = 0.65
		}, {
			label = _U('nose_5'),
			name = 'nose_5',
			value = 0,
			min = -10,
			zoomOffset = 0.6,
			camOffset = 0.65
		}, {
			label = _U('nose_6'),
			name = 'nose_6',
			value = 0,
			min = -10,
			zoomOffset = 0.6,
			camOffset = 0.65
		}, {
			label = _U('cheeks_1'),
			name = 'cheeks_1',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('cheeks_2'),
			name = 'cheeks_2',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('cheeks_3'),
			name = 'cheeks_3',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('lip_fullness'),
			name = 'lip_thickness',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('jaw_bone_width'),
			name = 'jaw_1',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('jaw_bone_length'),
			name = 'jaw_2',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('chin_height'),
			name = 'chin_1',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('chin_length'),
			name = 'chin_2',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('chin_width'),
			name = 'chin_3',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('chin_hole'),
			name = 'chin_4',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('neck_thickness'),
			name = 'neck_thickness',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('hair_1'),
			name = 'hair_1',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65
		}, {
			label = _U('hair_2'),
			name = 'hair_2',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65
		}, {
			label = _U('hair_color_1'),
			name = 'hair_color_1',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65
		}, {
			label = _U('hair_color_2'),
			name = 'hair_color_2',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65
		}, {
			label = _U('tshirt_1'),
			name = 'tshirt_1',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			componentId = 8
		}, {
			label = _U('tshirt_2'),
			name = 'tshirt_2',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			textureof = 'tshirt_1'
		}, {
			label = _U('torso_1'),
			name = 'torso_1',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			componentId = 11
		}, {
			label = _U('torso_2'),
			name = 'torso_2',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			textureof = 'torso_1'
		}, {
			label = _U('decals_1'),
			name = 'decals_1',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			componentId = 10
		}, {
			label = _U('decals_2'),
			name = 'decals_2',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			textureof = 'decals_1'
		}, {
			label = _U('arms'),
			name = 'arms',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15
		}, {
			label = _U('arms_2'),
			name = 'arms_2',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15
		}, {
			label = _U('pants_1'),
			name = 'pants_1',
			value = 0,
			min = 0,
			zoomOffset = 0.8,
			camOffset = -0.5,
			componentId = 4
		}, {
			label = _U('pants_2'),
			name = 'pants_2',
			value = 0,
			min = 0,
			zoomOffset = 0.8,
			camOffset = -0.5,
			textureof = 'pants_1'
		}, {
			label = _U('shoes_1'),
			name = 'shoes_1',
			value = 0,
			min = 0,
			zoomOffset = 0.8,
			camOffset = -0.8,
			componentId = 6
		}, {
			label = _U('shoes_2'),
			name = 'shoes_2',
			value = 0,
			min = 0,
			zoomOffset = 0.8,
			camOffset = -0.8,
			textureof = 'shoes_1'
		}, {
			label = _U('mask_1'),
			name = 'mask_1',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65,
			componentId = 1
		}, {
			label = _U('mask_2'),
			name = 'mask_2',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65,
			textureof = 'mask_1'
		}, {
			label = _U('bproof_1'),
			name = 'bproof_1',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			componentId = 9
		}, {
			label = _U('bproof_2'),
			name = 'bproof_2',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			textureof = 'bproof_1'
		}, {
			label = _U('chain_1'),
			name = 'chain_1',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65,
			componentId = 7
		}, {
			label = _U('chain_2'),
			name = 'chain_2',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65,
			textureof = 'chain_1'
		}, {
			label = _U('helmet_1'),
			name = 'helmet_1',
			value = -1,
			min = -1,
			zoomOffset = 0.6,
			camOffset = 0.65,
			componentId = 0
		}, {
			label = _U('helmet_2'),
			name = 'helmet_2',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65,
			textureof = 'helmet_1'
		}, {
			label = _U('glasses_1'),
			name = 'glasses_1',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65,
			componentId = 1
		}, {
			label = _U('glasses_2'),
			name = 'glasses_2',
			value = 0,
			min = 0,
			zoomOffset = 0.6,
			camOffset = 0.65,
			textureof = 'glasses_1'
		}, {
			label = _U('watches_1'),
			name = 'watches_1',
			value = -1,
			min = -1,
			zoomOffset = 0.75,
			camOffset = 0.15,
			componentId = 6
		}, {
			label = _U('watches_2'),
			name = 'watches_2',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			textureof = 'watches_1'
		}, {
			label = _U('bracelets_1'),
			name = 'bracelets_1',
			value = -1,
			min = -1,
			zoomOffset = 0.75,
			camOffset = 0.15,
			componentId = 7
		}, {
			label = _U('bracelets_2'),
			name = 'bracelets_2',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			textureof = 'bracelets_1'
		}, {
			label = _U('bag'),
			name = 'bags_1',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			componentId = 5
		}, {
			label = _U('bag_color'),
			name = 'bags_2',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15,
			textureof = 'bags_1'
		}, {
			label = _U('eye_color'),
			name = 'eye_color',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('eye_squint'),
			name = 'eye_squint',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('eyebrow_size'),
			name = 'eyebrows_2',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('eyebrow_type'),
			name = 'eyebrows_1',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('eyebrow_color_1'),
			name = 'eyebrows_3',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('eyebrow_color_2'),
			name = 'eyebrows_4',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('eyebrow_height'),
			name = 'eyebrows_5',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('eyebrow_depth'),
			name = 'eyebrows_6',
			value = 0,
			min = -10,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('makeup_type'),
			name = 'makeup_1',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('makeup_thickness'),
			name = 'makeup_2',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('makeup_color_1'),
			name = 'makeup_3',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('makeup_color_2'),
			name = 'makeup_4',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('lipstick_type'),
			name = 'lipstick_1',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('lipstick_thickness'),
			name = 'lipstick_2',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('lipstick_color_1'),
			name = 'lipstick_3',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('lipstick_color_2'),
			name = 'lipstick_4',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('ear_accessories'),
			name = 'ears_1',
			value = -1,
			min = -1,
			zoomOffset = 0.4,
			camOffset = 0.65,
			componentId = 2
		}, {
			label = _U('ear_accessories_color'),
			name = 'ears_2',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65,
			textureof = 'ears_1'
		}, {
			label = _U('chest_hair'),
			name = 'chest_1',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15
		}, {
			label = _U('chest_hair_1'),
			name = 'chest_2',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15
		}, {
			label = _U('chest_color'),
			name = 'chest_3',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15
		}, {
			label = _U('bodyb'),
			name = 'bodyb_1',
			value = -1,
			min = -1,
			zoomOffset = 0.75,
			camOffset = 0.15
		}, {
			label = _U('bodyb_size'),
			name = 'bodyb_2',
			value = 0,
			min = 0,
			zoomOffset = 0.75,
			camOffset = 0.15
		}, {
			label = _U('bodyb_extra'),
			name = 'bodyb_3',
			value = -1,
			min = -1,
			zoomOffset = 0.4,
			camOffset = 0.15
		}, {
			label = _U('bodyb_extra_thickness'),
			name = 'bodyb_4',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.15
		}, {
			label = _U('wrinkles'),
			name = 'age_1',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('wrinkle_thickness'),
			name = 'age_2',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('blemishes'),
			name = 'blemishes_1',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('blemishes_size'),
			name = 'blemishes_2',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('blush'),
			name = 'blush_1',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('blush_1'),
			name = 'blush_2',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('blush_color'),
			name = 'blush_3',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('complexion'),
			name = 'complexion_1',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('complexion_1'),
			name = 'complexion_2',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('sun'),
			name = 'sun_1',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('sun_1'),
			name = 'sun_2',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('freckles'),
			name = 'moles_1',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('freckles_1'),
			name = 'moles_2',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('beard_type'),
			name = 'beard_1',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('beard_size'),
			name = 'beard_2',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('beard_color_1'),
			name = 'beard_3',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		}, {
			label = _U('beard_color_2'),
			name = 'beard_4',
			value = 0,
			min = 0,
			zoomOffset = 0.4,
			camOffset = 0.65
		},
	},

	-- Clothes²

	Price = 250,

	Shops = {
		{pos = vector3(72.254, -1399.102, 28.876)},
		{pos = vector3(-703.776, -152.258, 36.915)},
		{pos = vector3(-167.863, -298.969, 39.233)},
		{pos = vector3(428.694, -800.106, 28.991)},
		{pos = vector3(-829.413, -1073.710, 10.828)},
		{pos = vector3(-1447.797, -242.461, 49.320)},
		{pos = vector3(11.632, 6514.224, 31.377)},
		{pos = vector3(123.646, -219.440, 54.057)},
		{pos = vector3(1696.291, 4829.312, 41.563)},
		{pos = vector3(618.093, 2759.629, 41.588)},
		{pos = vector3(1190.550, 2713.441, 37.722)},
		{pos = vector3(-1193.429, -772.262, 16.824)},
		{pos = vector3(-3172.496, 1048.133, 20.363)},
		{pos = vector3(-1108.441, 2708.923, 18.607)},
	},


    Identity = {
        spawnPos = vector3(-760.88, 325.48, 170.60-1),
        spawnHeading = 100.22,
        playerSpawn = vector3(1078.90, -689.74, 57.62),
        playerHeading = 198.00,
    },

	Bank = {
		{x = 149.92, y = -1040.83, z = 29.37}, 
		{x=-1212.980, y=-330.841, z=37.56},
		{x=-2962.582, y=482.627, z=15.703},
		{x=-112.202, y=6469.295, z=31.626},
		{x=314.187, y=-278.621, z=54.170},
		{x=-351.534, y=-49.529, z=49.042},
		{x=1175.0643310547, y=2706.6435546875, z=38.094036102295},
	},

	Bank2 = {
		{x = 237.3406, y = 217.8895, z = 106.2868},
	},

	ATMObjects = {
        "prop_fleeca_atm",
        "prop_atm_01",
        "prop_atm_03",
        "prop_atm_02",
    },

	Location = {
		allpos = {
			{pos = vector3(-791.728, -95.52898, 37.72), sortie = vector3(-797.3179, -115.8415, 37.50)},
		},
	},
	
	Bitcoin = {
		Recolte = vector3(1273.3, -1711.9, 54.7),
		Vente = vector3(606.0, -3089.3, 5.06),
		ValueVente = 90,
	},

	Tabac = {
		Recolte = vector3(2854.18, 4597.4, 47.8),
		Traitement = vector3(1997.21, 3039.24, 47.02),
		Vente = vector3(1952.4, 3842.1, 31.17),
		ValueVente = 160,
	},

	Acier = {
		Recolte = vector3(-452.236755, -1002.635132, 23.91),
		Traitement = vector3(970.4644, -1930.446, 31.13),
		Vente = vector3(1189.794, -3108.052, 4.52),
		ValueVente = 190,
	},

	Jobs = {
		usms = {
			Plainte = {
				{Plainte = vector3(1816.959839, 3672.314697, 34.71)}, 
			},
			RangerVehicule = {
				{pos = vector3(1846.638062, 3694.347656, 33.84)}, 
			},
			Peds = {
				{ped = {"s_m_y_cop_01", vector3(1818.623291, 3672.478271, 33.71), 128.08}},
			},
			Amende = {
				["amende"] = {
					{label = 'Usage abusif du klaxon', price = 1500},
					{label = 'Franchir une ligne continue', price = 1500},
					{label = 'Circulation à contresens', price = 1500},
					{label = 'Demi-tour non autorisé', price = 1500},
					{label = 'Circulation hors-route', price = 1500},
					{label = 'Non-respect des distances de sécurité', price = 1500},
					{label = 'Arrêt dangereux / interdit', price = 1500},
					{label = 'Stationnement gênant / interdit', price = 1500},
					{label = 'Non respect  de la priorité à droite', price = 1500},
					{label = 'Non-respect à un véhicule prioritaire', price = 1500},
					{label = 'Non-respect d\'un stop', price = 1500},
					{label = 'Non-respect d\'un feu rouge', price = 1500},
					{label = 'Dépassement dangereux', price = 1500},
					{label = 'Véhicule non en état', price = 1500},
					{label = 'Conduite sans permis', price = 1500},
					{label = 'Délit de fuite', price = 1500},
					{label = 'Excès de vitesse < 5 kmh', price = 1500},
					{label = 'Excès de vitesse 5-15 kmh', price = 1500},
					{label = 'Excès de vitesse 15-30 kmh', price = 1500},
					{label = 'Excès de vitesse > 30 kmh', price = 1500},
					{label = 'Entrave de la circulation', price = 1500},
					{label = 'Dégradation de la voie publique', price = 1500},
					{label = 'Trouble à l\'ordre publique', price = 1500},
					{label = 'Entrave opération de police', price = 1500},
					{label = 'Insulte envers / entre civils', price = 1500},
					{label = 'Outrage à agent de police', price = 1500},
					{label = 'Menace verbale ou intimidation envers civil', price = 1500},
					{label = 'Menace verbale ou intimidation envers policier', price = 1500},
					{label = 'Manifestation illégale', price = 1500},
					{label = 'Tentative de corruption', price = 1500},
					{label = 'Arme blanche sortie en ville', price = 1500},
					{label = 'Arme léthale sortie en ville', price = 1500},
					{label = 'Port d\'arme non autorisé (défaut de license)', price = 1500},
					{label = 'Port d\'arme illégal', price = 1500},
					{label = 'Pris en flag lockpick', price = 1500},
					{label = 'Vol de voiture', price = 1500},
					{label = 'Vente de drogue', price = 1500},
					{label = 'Fabriquation de drogue', price = 1500},
					{label = 'Possession de drogue', price = 1500},
					{label = 'Prise d\'ôtage civil', price = 1500},
					{label = 'Prise d\'ôtage agent de l\'état', price = 1500},
					{label = 'Braquage particulier', price = 1500},
					{label = 'Braquage magasin', price = 1500},
					{label = 'Braquage de banque', price = 1500},
					{label = 'Tir sur civil', price = 1500},
					{label = 'Tir sur agent de l\'état', price = 1500},
					{label = 'Tentative de meurtre sur civil', price = 1500},
					{label = 'Tentative de meurtre sur agent de l\'état', price = 1500},
					{label = 'Meurtre sur civil', price = 1500},
					{label = 'Meurte sur agent de l\'état', price = 1500}, 
					{label = 'Escroquerie à l\'entreprise', price = 1500},
				}
			},
			Zones = {
				{
					Armurerie = vector3(1835.103027, 3693.154785, 34.71),
					Vestiaire = vector3(1826.361694, 3677.847168, 34.71), 
					PosGarage1 = vector3(1836.913452, 3698.927979, 33.95),
				},
			},
			Uniforms = {
				recruit_wear = {
					male = {
						['tshirt_1'] = 207, ['tshirt_2'] = 4,
						['torso_1'] = 784, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 215,
						['pants_1'] = 5, ['pants_2'] = 4,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 156,  ['bproof_2'] = 1,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 187, ['chain_2'] = 3,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 356, ['tshirt_2'] = 0,
						['torso_1'] = 868, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 11,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = 84,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				officer_wear = {
					male = {
						['tshirt_1'] = 207, ['tshirt_2'] = 3,
						['torso_1'] = 783, ['torso_2'] = 4,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 214,
						['pants_1'] = 5, ['pants_2'] = 2,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 156,  ['bproof_2'] = 1,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 187, ['chain_2'] = 3,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 868, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 11,
						['pants_1'] = 325, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['glasses_1'] = 0, ['glasses_2'] = 0,
                        ['bproof_1'] = 0,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				sergeant_wear = {
					male = {
						['tshirt_1'] = 207, ['tshirt_2'] = 3,
						['torso_1'] = 783, ['torso_2'] = 4,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 214,
						['pants_1'] = 5, ['pants_2'] = 2,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 156,  ['bproof_2'] = 1,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 187, ['chain_2'] = 3,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 868, ['torso_2'] = 0,
						['decals_1'] = 150, ['decals_2'] = 2,
						['arms'] = 11,
						['pants_1'] = 325, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = 0,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				lieutenant_wear = {
					male = {
						['tshirt_1'] = 207, ['tshirt_2'] = 3,
						['torso_1'] = 783, ['torso_2'] = 4,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 214,
						['pants_1'] = 5, ['pants_2'] = 2,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 156,  ['bproof_2'] = 1,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 187, ['chain_2'] = 3,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 0,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				capitaine_wear = {
					male = {
						['tshirt_1'] = 207, ['tshirt_2'] = 3,
						['torso_1'] = 783, ['torso_2'] = 4,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 214,
						['pants_1'] = 5, ['pants_2'] = 2,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 156,  ['bproof_2'] = 1,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 187, ['chain_2'] = 3,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 1,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 1,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				commander_wear = {
					male = {
						['tshirt_1'] = 207, ['tshirt_2'] = 3,
						['torso_1'] = 783, ['torso_2'] = 4,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 214,
						['pants_1'] = 5, ['pants_2'] = 2,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 156,  ['bproof_2'] = 1,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 187, ['chain_2'] = 3,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 1,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 2,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				deputy_wear = {
					male = {
						['tshirt_1'] = 207, ['tshirt_2'] = 3,
						['torso_1'] = 783, ['torso_2'] = 4,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 214,
						['pants_1'] = 5, ['pants_2'] = 2,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 156,  ['bproof_2'] = 1,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 187, ['chain_2'] = 3,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 1,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 3,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				assistantboss_wear = {
					male = {
						['tshirt_1'] = 207, ['tshirt_2'] = 3,
						['torso_1'] = 783, ['torso_2'] = 4,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 214,
						['pants_1'] = 5, ['pants_2'] = 2,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 156,  ['bproof_2'] = 1,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 187, ['chain_2'] = 3,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 1,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 4,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				boss_wear = {
					male = {
						['tshirt_1'] = 207, ['tshirt_2'] = 3,
						['torso_1'] = 783, ['torso_2'] = 4,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 214,
						['pants_1'] = 5, ['pants_2'] = 2,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 156,  ['bproof_2'] = 1,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 187, ['chain_2'] = 3,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 1,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 5,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},	
				},
				bullet_wear = {
					male = {
						['bproof_1'] = 84,  ['bproof_2'] = 0,
					},
					female = {
						['bproof_1'] = 87,  ['bproof_2'] = 0
					}
				},
				gilet_wear = {
					male = {
						['bproof_1'] = 85,  ['bproof_2'] = 0,
					},
					female = {
						['bproof_1'] = 84,  ['bproof_2'] = 0
					}
				},
			},
		},
		lsco = {
			Plainte = {
				{Plainte = vector3(-446.622162, 6012.852539, 32.288662)}
			},
			RangerVehicule = {
				{pos = vector3(-462.028320, 5994.770508, 31.245657)}
			},
			Peds = {
				{ped = {"s_m_y_sheriff_01", vector3(-448.440735, 6014.130859, 32.288670), 224.99977111816}},
			},
			Amende = {
				["amende"] = {
					{label = 'Usage abusif du klaxon', price = 2500},
					{label = 'Franchir une ligne continue', price = 2500},
					{label = 'Circulation à contresens', price = 2500},
					{label = 'Demi-tour non autorisé', price = 2500},
					{label = 'Circulation hors-route', price = 2500},
					{label = 'Non-respect des distances de sécurité', price = 2500},
					{label = 'Arrêt dangereux / interdit', price = 2500},
					{label = 'Stationnement gênant / interdit', price = 2500},
					{label = 'Non respect  de la priorité à droite', price = 2500},
					{label = 'Non-respect à un véhicule prioritaire', price = 2500},
					{label = 'Non-respect d\'un stop', price = 2500},
					{label = 'Non-respect d\'un feu rouge', price = 2500},
					{label = 'Dépassement dangereux', price = 2500},
					{label = 'Véhicule non en état', price = 2500},
					{label = 'Conduite sans permis', price = 2500},
					{label = 'Délit de fuite', price = 2500},
					{label = 'Excès de vitesse < 5 kmh', price = 2500},
					{label = 'Excès de vitesse 5-15 kmh', price = 2500},
					{label = 'Excès de vitesse 15-30 kmh', price = 2500},
					{label = 'Excès de vitesse > 30 kmh', price = 2500},
					{label = 'Entrave de la circulation', price = 2500},
					{label = 'Dégradation de la voie publique', price = 2500},
					{label = 'Trouble à l\'ordre publique', price = 2500},
					{label = 'Entrave opération de police', price = 2500},
					{label = 'Insulte envers / entre civils', price = 2500},
					{label = 'Outrage à agent de police', price = 2500},
					{label = 'Menace verbale ou intimidation envers civil', price = 2500},
					{label = 'Menace verbale ou intimidation envers policier', price = 2500},
					{label = 'Manifestation illégale', price = 2500},
					{label = 'Tentative de corruption', price = 2500},
					{label = 'Arme blanche sortie en ville', price = 2500},
					{label = 'Arme léthale sortie en ville', price = 2500},
					{label = 'Port d\'arme non autorisé (défaut de license)', price = 2500},
					{label = 'Port d\'arme illégal', price = 2500},
					{label = 'Pris en flag lockpick', price = 2500},
					{label = 'Vol de voiture', price = 2500},
					{label = 'Vente de drogue', price = 2500},
					{label = 'Fabriquation de drogue', price = 2500},
					{label = 'Possession de drogue', price = 2500},
					{label = 'Prise d\'ôtage civil', price = 2500},
					{label = 'Prise d\'ôtage agent de l\'état', price = 2500},
					{label = 'Braquage particulier', price = 2500},
					{label = 'Braquage magasin', price = 2500},
					{label = 'Braquage de banque', price = 2500},
					{label = 'Tir sur civil', price = 2500},
					{label = 'Tir sur agent de l\'état', price = 2500},
					{label = 'Tentative de meurtre sur civil', price = 2500},
					{label = 'Tentative de meurtre sur agent de l\'état', price = 2500},
					{label = 'Meurtre sur civil', price = 2500},
					{label = 'Meurte sur agent de l\'état', price = 2500}, 
					{label = 'Escroquerie à l\'entreprise', price = 2500},
				}
			},
			Zones3 = {
				{
					Armurerie3 = vector3(-444.227539, 6013.699219, 37.008350),
					Vestiaire3 = vector3(-439.651764, 6010.479980, 35.995686),
					PosGarage3 = vector3(-455.351074, 5987.078613, 31.275099),
				},
			},
			Uniforms = {
				recruit_wear = {
					male = {
						['tshirt_1'] = 232, ['tshirt_2'] = 0,
						['torso_1'] = 542, ['torso_2'] = 3,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 87,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 0,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				officer_wear = {
					male = {
						['tshirt_1'] = 232, ['tshirt_2'] = 0,
						['torso_1'] = 542, ['torso_2'] = 3,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 87,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 0,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				sergeant_wear = {
					male = {
						['tshirt_1'] = 232, ['tshirt_2'] = 0,
						['torso_1'] = 542, ['torso_2'] = 3,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 87,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 0,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				lieutenant_wear = {
					male = {
						['tshirt_1'] = 232, ['tshirt_2'] = 0,
						['torso_1'] = 542, ['torso_2'] = 3,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 87,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 0,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				capitaine_wear = {
					male = {
						['tshirt_1'] = 232, ['tshirt_2'] = 0,
						['torso_1'] = 542, ['torso_2'] = 3,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 87,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 0,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				commander_wear = {
					male = {
						['tshirt_1'] = 232, ['tshirt_2'] = 0,
						['torso_1'] = 542, ['torso_2'] = 3,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 87,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 0,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				deputy_wear = {
					male = {
						['tshirt_1'] = 232, ['tshirt_2'] = 0,
						['torso_1'] = 542, ['torso_2'] = 3,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 87,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 0,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				assistantboss_wear = {
					male = {
						['tshirt_1'] = 232, ['tshirt_2'] = 0,
						['torso_1'] = 542, ['torso_2'] = 3,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 87,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 0,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				boss_wear = {
					male = {
						['tshirt_1'] = 232, ['tshirt_2'] = 0,
						['torso_1'] = 542, ['torso_2'] = 3,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 87,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 0,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				bullet_wear = {
					male = {
						['bproof_1'] = 84,  ['bproof_2'] = 0,
					},
					female = {
						['bproof_1'] = 87,  ['bproof_2'] = 0
					}
				},
				gilet_wear = {
					male = {
						['bproof_1'] = 85,  ['bproof_2'] = 0,
					},
					female = {
						['bproof_1'] = 84,  ['bproof_2'] = 0
					}
				},
			},
		},
		sasp = {
			Plainte = {
				{Plainte = vector3(445.0791, -985.9874, 30.7129)}
			},
			RangerVehicule = {
				{pos = vector3(441.4044, -991.6877, 25.7097)}
			},
			Peds = {
				{ped = {"s_m_y_sheriff_01", vector3(446.8786, -985.6836, 30.7107), 87.6315}},
			},
			Amende = {
				["amende"] = {
					{label = 'Usage abusif du klaxon', price = 2500},
					{label = 'Franchir une ligne continue', price = 2500},
					{label = 'Circulation à contresens', price = 2500},
					{label = 'Demi-tour non autorisé', price = 2500},
					{label = 'Circulation hors-route', price = 2500},
					{label = 'Non-respect des distances de sécurité', price = 2500},
					{label = 'Arrêt dangereux / interdit', price = 2500},
					{label = 'Stationnement gênant / interdit', price = 2500},
					{label = 'Non respect  de la priorité à droite', price = 2500},
					{label = 'Non-respect à un véhicule prioritaire', price = 2500},
					{label = 'Non-respect d\'un stop', price = 2500},
					{label = 'Non-respect d\'un feu rouge', price = 2500},
					{label = 'Dépassement dangereux', price = 2500},
					{label = 'Véhicule non en état', price = 2500},
					{label = 'Conduite sans permis', price = 2500},
					{label = 'Délit de fuite', price = 2500},
					{label = 'Excès de vitesse < 5 kmh', price = 2500},
					{label = 'Excès de vitesse 5-15 kmh', price = 2500},
					{label = 'Excès de vitesse 15-30 kmh', price = 2500},
					{label = 'Excès de vitesse > 30 kmh', price = 2500},
					{label = 'Entrave de la circulation', price = 2500},
					{label = 'Dégradation de la voie publique', price = 2500},
					{label = 'Trouble à l\'ordre publique', price = 2500},
					{label = 'Entrave opération de police', price = 2500},
					{label = 'Insulte envers / entre civils', price = 2500},
					{label = 'Outrage à agent de police', price = 2500},
					{label = 'Menace verbale ou intimidation envers civil', price = 2500},
					{label = 'Menace verbale ou intimidation envers policier', price = 2500},
					{label = 'Manifestation illégale', price = 2500},
					{label = 'Tentative de corruption', price = 2500},
					{label = 'Arme blanche sortie en ville', price = 2500},
					{label = 'Arme léthale sortie en ville', price = 2500},
					{label = 'Port d\'arme non autorisé (défaut de license)', price = 2500},
					{label = 'Port d\'arme illégal', price = 2500},
					{label = 'Pris en flag lockpick', price = 2500},
					{label = 'Vol de voiture', price = 2500},
					{label = 'Vente de drogue', price = 2500},
					{label = 'Fabriquation de drogue', price = 2500},
					{label = 'Possession de drogue', price = 2500},
					{label = 'Prise d\'ôtage civil', price = 2500},
					{label = 'Prise d\'ôtage agent de l\'état', price = 2500},
					{label = 'Braquage particulier', price = 2500},
					{label = 'Braquage magasin', price = 2500},
					{label = 'Braquage de banque', price = 2500},
					{label = 'Tir sur civil', price = 2500},
					{label = 'Tir sur agent de l\'état', price = 2500},
					{label = 'Tentative de meurtre sur civil', price = 2500},
					{label = 'Tentative de meurtre sur agent de l\'état', price = 2500},
					{label = 'Meurtre sur civil', price = 2500},
					{label = 'Meurte sur agent de l\'état', price = 2500}, 
					{label = 'Escroquerie à l\'entreprise', price = 2500},
				}
			},
			Zones2 = {
				{
					Armurerie2 = vector3(454.9992, -996.5037, 30.7107),
					Vestiaire2 = vector3(467.1207, -999.5149, 30.7107),
					PosGarage2 = vector3(457.6377, -985.3911, 25.7097),
				},
			},
			Uniforms = {
				recruit_wear = {
					male = {
						['tshirt_1'] = 236, ['tshirt_2'] = 0,
						['torso_1'] = 541, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 153,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 356, ['tshirt_2'] = 0,
						['torso_1'] = 868, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 11,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = 84,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				officer_wear = {
					male = {
						['tshirt_1'] = 236, ['tshirt_2'] = 0,
						['torso_1'] = 541, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 153,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 868, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 11,
						['pants_1'] = 325, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['glasses_1'] = 0, ['glasses_2'] = 0,
                        ['bproof_1'] = 0,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				sergeant_wear = {
					male = {
						['tshirt_1'] = 236, ['tshirt_2'] = 0,
						['torso_1'] = 541, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 153,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 868, ['torso_2'] = 0,
						['decals_1'] = 150, ['decals_2'] = 2,
						['arms'] = 11,
						['pants_1'] = 325, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = 0,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				lieutenant_wear = {
					male = {
						['tshirt_1'] = 236, ['tshirt_2'] = 0,
						['torso_1'] = 541, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 153,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 0,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 0,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				capitaine_wear = {
					male = {
						['tshirt_1'] = 122, ['tshirt_2'] = 0,
						['torso_1'] = 541, ['torso_2'] = 4,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 150,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 1,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 1,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				commander_wear = {
					male = {
						['tshirt_1'] = 236, ['tshirt_2'] = 0,
						['torso_1'] = 541, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 153,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 1,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 2,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				deputy_wear = {
					male = {
						['tshirt_1'] = 236, ['tshirt_2'] = 0,
						['torso_1'] = 541, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 153,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 1,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 3,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				assistantboss_wear = {
					male = {
						['tshirt_1'] = 236, ['tshirt_2'] = 0,
						['torso_1'] = 541, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 153,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 1,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 4,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},
				},
				boss_wear = {
					male = {
						['tshirt_1'] = 236, ['tshirt_2'] = 0,
						['torso_1'] = 541, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 4,
						['pants_1'] = 126, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = 0, ['helmet_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 153,  ['bproof_2'] = 0,
						['bags_1'] = 0, ['bags_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0,
						['ears_1'] = 0, ['ears_2'] = 0,
					},
					female = {
						['tshirt_1'] = 351, ['tshirt_2'] = 1,
						['torso_1'] = 837, ['torso_2'] = 0,
						['decals_1'] = 162, ['decals_2'] = 5,
						['arms'] = 14,
						['pants_1'] = 34, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['glasses_1'] = -1, ['glasses_2'] = 0,
                        ['bproof_1'] = -1,  ['bproof_2'] = 0,
						['mask_1'] = 0, ['mask_2'] = 0,
						['bags_1'] = 136, ['bags_2'] = 0,
						['chain_1'] = -1, ['chain_2'] = 0,
						['ears_1'] = -1, ['ears_2'] = 0,
					},	
				},
				bullet_wear = {
					male = {
						['bproof_1'] = 84,  ['bproof_2'] = 0,
					},
					female = {
						['bproof_1'] = 87,  ['bproof_2'] = 0
					}
				},
				gilet_wear = {
					male = {
						['bproof_1'] = 85,  ['bproof_2'] = 0,
					},
					female = {
						['bproof_1'] = 84,  ['bproof_2'] = 0
					}
				},
			},
		},
		Ambulance = {
			Gestion = {
				{gestion = vector3(-329.6968, -576.2896, 32.7744)},
			},
			Pharma = {
				{pharma = vector3(-664.4010, 322.1686, 83.0832)}, 
			},
			Clothes = {
				{clothes = vector3(-344.2069, -587.1069, 32.7744)},
			},
			Vehicle = {
				{vehicle = vector3(-280.5829, -587.7189, 27.7775)},
			},
			DeleteVeh = {
				{deleteveh = vector3(-308.1893, -577.5096, 27.6282)},
			},
			Uniforms = {
                male = {
                    ['bags_1'] = 0, ['bags_2'] = 0,
                    ['tshirt_1'] = 322, ['tshirt_2'] = 0,
                    ['torso_1'] = 780, ['torso_2'] = 0,
                    ['arms'] = 205,
                    ['pants_1'] = 390, ['pants_2'] = 0,
                    ['shoes_1'] = 110, ['shoes_2'] = 0,
                    ['mask_1'] = 0, ['mask_2'] = 0,
                    ['bproof_1'] = 146,
                    ['helmet_1'] = 122, ['helmet_2'] = 0,
                    ["decals_1"] = 0, ["decals_2"] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                },
                female = {
                    ['bags_1'] = 0, ['bags_2'] = 0,
                    ['tshirt_1'] = 443, ['tshirt_2'] = 0,
                    ['torso_1'] = 806, ['torso_2'] = 0,
                    ['arms'] = 0,
                    ['pants_1'] = 331, ['pants_2'] = 0,
                    ['shoes_1'] = 99, ['shoes_2'] = 0,
                    ['mask_1'] = 0, ['mask_2'] = 0,
                    ['bproof_1'] = 107,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ["decals_1"] = 0, ["decals_2"] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                }
            },
		},
		Bahamas = {
			Frigo = {
				{coords = vector3(-1401.45, -598.3256, 30.31994)},
			},
			Garage = {
				{coords = vector3(-1396.422, -591.1769, 30.30967)},
			},
			SpawnVehicule = {
				{coords = {vector3(-1407.241, -588.6468, 30.34681), 97.73}},
			},
			RangerVehicule = {
				{coords = vector3(-1414.619, -592.8475, 30.4287)},
			},
		},
		Mecano = {
			Clothes = {
				{clothes = vector3(-194.91, -1339.459, 31.30047)},
			},
			Uniforms = {
                male = {
                    ['bags_1'] = 0, ['bags_2'] = 0,
                    ['tshirt_1'] = 271, ['tshirt_2'] = 0,
                    ['torso_1'] = 139, ['torso_2'] = 0,
                    ['arms'] = 4,
                    ['pants_1'] = 9, ['pants_2'] = 7,
                    ['shoes_1'] = 24, ['shoes_2'] = 0,
                    ['mask_1'] = 0, ['mask_2'] = 0,
                    ['bproof_1'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ["decals_1"] = -1, ["decals_2"] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                },
                female = {
                    ['bags_1'] = 0, ['bags_2'] = 0,
                    ['tshirt_1'] = 392, ['tshirt_2'] = 0,
                    ['torso_1'] = 136, ['torso_2'] = 0,
                    ['arms'] = 3,
                    ['pants_1'] = 45, ['pants_2'] = 0,
                    ['shoes_1'] = 24, ['shoes_2'] = 0,
                    ['mask_1'] = 0, ['mask_2'] = 0,
                    ['bproof_1'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ["decals_1"] = -1, ["decals_2"] = 0,
                    ['chain_1'] = -1, ['chain_2'] = 0,
                }
            },
		},
		Cardealer = {
			Actions = {
				{actions = vector3(-319.8435, -811.9795, 32.7522)},
			},
		},
		Boat = {
			Actions = {
				{actions = vector3(-805.8289, -1368.581, 5.178345)},
			},
		},
		Plane = {
			Actions = {
				{actions = vector3(-941.18, -2954.36, 13.94)},
			},
		},
		Unicorn = {
			Blip = {
				{coords = vector3(129.6, -1300.6, 29.2)},
			},
		},

		Avocat = {

			Accueil = {
				{actions = vector3(-768.7946, -612.1107, 30.26001)},
			},
			
		},

		Brinks = {
			ArmurerieAll = { 
				{pos = vector3(11.10654, -661.1917, 33.44897)} 
			},
			Items = {
				{label = "Tazer", weapon = "WEAPON_STUNGUN", price = 0},
				{label = "Pistolet de combat", weapon = "WEAPON_COMBATPISTOL", price = 0},
				{label = "Fusil avancé", weapon = "WEAPON_ADVANCEDRIFLE", price = 0},
			},
			ListeVehicle = {
				{label = "Stockade", model = "stockade", grade = 0},
			},
			SortirVehicle = { 
				{pos = vector3(-11.50391, -698.5498, 32.49406)} 
			},
			PosSortirVehicule = vector3(-5.054764, -670.801, 31.94371),
			HeadingSortirVehicule = 183.98121643066,
			DeleteVehicle = {
				{pos = vector3(-5.064245, -670.3618, 32.33811)}
			},
		},

		studio = {

			RangerVehicule = {
				{pos = vector3(-994.288147, -292.115692, 37.80)}
			},

			Zones = {
				{
					PosGarage5 = vector3(-994.288147, -292.115692, 37.80),
				},
			},
			
		},
	},

	Garage = {
		showBlip = true,
		Positions = {
            infoBlip = { 
                Name = "Garage Public",
                Sprite = 290,
				Display = 4,
				Scale = 0.5,
				Color = 38,
				Range = true,
            },
            spawnZone = { 
                {spawn = vector3(233.77, -788.29, 30.81), pos = vector3(215.44, -810.39, 30.72), heading = 156.51}, -- central
				{spawn = vector3(215.324585, -810.220276, 30.734013), pos = vector3(234.179535, -795.535034, 30.537891), heading = 161.31187438965}, -- PLACE DE CUBE
                {spawn = vector3(1738.6, 3720.83, 34.02), pos = vector3(1737.43, 3710.22, 34.13), heading = 26.86}, -- sandy shores
				{spawn = vector3(124.63, 6603.73, 31.7), pos = vector3(106.85, 6612.20, 31.97), heading = 221.15}, -- Paleto
				{spawn = vector3(1869.28, 2577.80, 45.67), pos = vector3(1849.59, 2587.26, 45.67), heading = 267.83}, -- Prison 
				{spawn = vector3(1202.95, 334.7, 81.99), pos = vector3(1213.29, 341.14, 81.99), heading = 143.32}, -- Casino
				{spawn = vector3(-509.11, -602.58, 30.3), pos = vector3(-505.01, -612.00, 30.29), heading = 266.56}, -- Centre ville
				{spawn = vector3(1019.73, -766.36, 57.92), pos = vector3(1034.58, -762.12, 58.08), heading = 317.63}, -- Spawn
				{spawn = vector3(-1256.01, -385.77, 37.28), pos = vector3(-1255.85, -382.50, 37.28), heading = 295.75}, -- Bloods
				{spawn = vector3(-1134.93, 2672.06, 18.09), pos = vector3(-1145.17, 2668.37, 18.09), heading = 134.60}, -- Military
				{spawn = vector3(-947.39, -2439.93, 13.83), pos = vector3(-944.31, -2460.18, 13.98), heading = 214.11}, -- Airport
				{spawn = vector3(-1670.13, 65.48, 63.54), pos = vector3(-1677.86, 65.64, 63.93), heading = 290.65}, -- Garage Tenis
				{spawn = vector3(4474.42, -4460.30, 4.25), pos = vector3(4462.83, -4469.04, 4.24), heading = 197.38}, -- Garage Cayo
				{spawn = vector3(-425.382355, 1207.739014, 325.758240), pos = vector3(-420.339905, 1202.649414, 325.641754), heading = 219.6042175293}, -- Gouv
				{spawn = vector3(-324.01, -7638.55, 6.32), pos = vector3(-321.38, 7633.62, 6.32), heading = 127.95}, -- RoxWood 
				{spawn = vector3(-289.44, -887.02, 31.08), pos = vector3(-285.64, 888.44, 31.08), heading = 174.68}, -- Parking Pole Emploie 
				{spawn = vector3(-106.4022, 33.0441, 71.4314), pos = vector3(-109.5035, 39.4496, 71.4254), heading = 335.4359}, -- cardealer
            },
			deleteZone = {
                {pos = vector3(224.50, -757.70, 30.82)}, -- central
				{pos = vector3(224.238724, -758.830261, 30.820683)}, --place des cube
                {pos = vector3(1724.98, 3715.85, 34.18)}, -- sandy shores
				{pos = vector3(143.83, 6626.51, 31.7)}, -- Paleto
				{pos = vector3(1216.155, 356.29, 81.99)}, -- Casino
				{pos = vector3(-510.68, -623.23, 30.3)}, -- Centre ville
				{pos = vector3(1039.05, -785.38, 58.01)}, -- Spawn
				{pos = vector3(-1245.61, -394.23, 37.28)}, -- Bloods
				{pos = vector3(-1154.53, 2662.51, 18.09)}, -- Military
				{pos = vector3(-939.37, -2434.63, 13.83)}, -- Airport
				{pos = vector3(-1663.43, 77.48, 63.45)}, -- Garage Tenis
				{pos = vector3(4482.59, -4451.49, 4.09)}, -- Garage Cayo
				{pos = vector3(-549.5462, -157.9245, 37.66764)}, -- Gouv
				{pos = vector3(-115.3084, 31.4446, 71.3096)}, -- CARDEALER
			},
        },
	},

	Fourriere = {
		showBlip = true,
		Positions = {
            infoBlip = { 
                Name = "Fourriere",
                Sprite = 67,
				Display = 4,
				Scale = 0.6,
				Color = 64,
				Range = true,
            },
            interactionZone = { 
                {spawn = vector3(405.80, -1643.37, 29.29), pos = vector3(409.48, -1623.18, 29.29), heading = 222.32}, -- Los Santos
                {spawn = vector3(1642.38, 3796.84, 34.65), pos = vector3(1651.06, 3802.37, 38.65), heading = 219.77}, -- Sandy Shores
                {spawn = vector3(-239.82, 6194.65, 31.49), pos = vector3(-234.56, 6199.09, 31.93), heading = 129.75}, -- Paleto
				{spawn = vector3(4519.48, -4466.253, 4.18), pos = vector3(4443.31, -4470.25, 4.32), heading = 109.73}, -- Cayo
            },
        },
	},
	Parachute = {
		DrawDistance = 100,
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 255, g = 84, b = 84},
		Type = 40,
	}
}

Config['URL'] = 'https://www.youtube.com/embed/%s?autoplay=1&controls=1&disablekb=1&fs=0&rel=0&showinfo=0&iv_load_policy=3&start=%s'
Config['API'] = {
    ['URL'] = 'https://www.googleapis.com/youtube/v3/videos?id=%s&part=contentDetails&key=%s',
    ['Key'] = ''
}
Config['DurationCheck'] = false 

Config['Objects'] = {
    {
        ['Object'] = 'prop_tv_flat_01',
        ['Scale'] = 0.05,
        ['Offset'] = vec3(-0.925, -0.055, 1.0),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_michael',
        ['Scale'] = 0.035,
        ['Offset'] = vec3(-0.675, -0.055, 0.4),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_trev_tv_01',
        ['Scale'] = 0.012,
        ['Offset'] = vec3(-0.225, -0.01, 0.26),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_03b',
        ['Scale'] = 0.016,
        ['Offset'] = vec3(-0.3, -0.062, 0.18),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_03',
        ['Scale'] = 0.016,
        ['Offset'] = vec3(-0.3, -0.01, 0.4),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_02b',
        ['Scale'] = 0.026,
        ['Offset'] = vec3(-0.5, -0.012, 0.525),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_02',
        ['Scale'] = 0.026,
        ['Offset'] = vec3(-0.5, -0.012, 0.525),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_02',
        ['Scale'] = 0.026,
        ['Offset'] = vec3(-0.5, -0.012, 0.525),
        ['Distance'] = 7.5,
    },
}

Strings = {
    ['VideoHelp'] = 'Saisissez ~b~/tv youtube id~s~ pour lire une vidéo.\nExemple : ~b~/tv 3hqjseATp4g~s~',
    ['VolumeHelp'] = 'Saisissez ~b~/volume (0-10)~s~ pour modifier le volume.\nExemple : ~b~/volume 5~s~\n\nSaisissez ~b~/tv youtube id~s~ pour changer la vidéo.\nExemple : ~b~/tv 3hqjseATp4g~s~\n\nTapez ~b~/tvstop~s~ pour arrêter la vidéo\n\n~INPUT_CONTEXT~ Synchroniser l\'heure de la vidéo',
}

Config.Props = {
    {nameprops = 'Chaise',              modelprops = 'apa_mp_h_din_chair_12'},
    {nameprops = 'Carton',              modelprops = 'prop_cardbordbox_04a'},
    {nameprops = 'Sac',                 modelprops = 'prop_cs_heist_bag_02'},
    {nameprops = 'Table 1',             modelprops = 'prop_rub_table_02'},
    {nameprops = 'Table 2',             modelprops = 'prop_table_04'},
    {nameprops = 'Table 3',             modelprops = 'bkr_prop_weed_table_01b'},
    {nameprops = 'Chaise 1',            modelprops = 'bkr_prop_clubhouse_chair_01'},
    {nameprops = 'Chaise 2',            modelprops = 'bkr_prop_weed_chair_01a'},
    {nameprops = 'Chaise de Pêche',     modelprops = 'hei_prop_hei_skid_chair'},
    {nameprops = 'Chaise de Bureau',    modelprops = 'bkr_prop_clubhouse_offchair_01a'},
    {nameprops = 'Canapé',              modelprops = 'v_tre_sofa_mess_c_s'},
    {nameprops = 'Canapé 2',            modelprops = 'v_res_tre_sofa_mess_a'},
    {nameprops = 'Ordinateur',          modelprops = 'bkr_prop_clubhouse_laptop_01a'},
    {nameprops = 'Lit',                 modelprops = 'gr_prop_bunker_bed_01'},
    {nameprops = 'Outils',              modelprops = 'prop_cs_trolley_01'},
    {nameprops = 'Outils de mécanique', modelprops = 'prop_carcreeper'},
    {nameprops = 'Sac de sport',        modelprops = 'prop_cs_heist_bag_02'},
	{nameprops = 'Tele 4k',        modelprops = 'prop_tv_flat_michael'},
	{nameprops = 'Tele Stand',        modelprops = 'prop_tv_stand_01'},
	{nameprops = 'Valide de Billets',        modelprops = 'hei_prop_heist_trevor_case'},
    {nameprops = 'Trousse médical 2',   modelprops = 'xm_prop_x17_bag_med_01a'},
}

ActiveMenu = false

Restrein = true

Group = {
    Authorize1 = 'founder',
    Authorize2 = 'admin',
    --Authorize4 = '',
    --Authorize5 = '',
}

    ------ KEVLAR ------
    Config.eKevlar = {
        loadClothesEvent = 'skinchanger:loadClothes',
        ragdollOnKevlarBreak = false,
        radgollTime = 2, -- in seconds
        skin = {
            male = {
                kevID = 12,
                textureID = 1,
            },
            female = {
                kevID = 12,
                textureID = 1,
            }
        },
        BanAction = function(src)
            DropPlayer(src, "Cheat Kevlar")
        end,
        Translation = {
            KevlarBroken = 'Votre Kevlar s\'est briser.',
        },
    }


	
