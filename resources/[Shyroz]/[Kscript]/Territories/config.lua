CONFIG = {}

CONFIG.TERRITOIRES = {
    ["GrapeSeed"] = {
        POS = vector3(1675.04, 4858.30, 42.00), -- La position au centre du territoire
        RADIUS = 150.0,  -- La largeur du territoire depuis le centre (un cercle)
        --
        WEAPONS_NPC = {MODEL = 'g_m_m_chicold_01'},
        WEAPONS_NPC_POS = vector4(1657.69, 4839.00, 42.02, 280.55),
        --
        SELLER_NPC = {MODEL = 'a_m_m_trampbeac_01', Scena = "WORLD_HUMAN_SMOKING"},
        SELL_POS = { -- La position de vente de la drogue (la position du PED)
            [1] = vector4(1655.16, 4865.49, 41.99, 280.15),
            [2] = vector4(1681.54, 4835.91, 42.12, 104.08),
            [3] = vector4(1682.57, 4886.56, 42.02, 64.04),
            [4] = vector4(1654.12, 4892.12, 42.06, 251.47),
            [5] = vector4(1663.28, 4818.45, 41.96, 329.28),
            [6] = vector4(1637.63, 4823.39, 41.88, 296.47),
        },
        DRUG_PRICES = {
            [1] = {name = 'weed_pooch', label = "Pochons de Weed", price = 490, points_gagner = 4},
            [2] = {name = 'coke_pooch', label = "Pochons de Cocaine", price = 550, points_gagner = 6},
            [3] = {name = 'meth_pooch', label = "Pochons de Meth", price = 570, points_gagner = 7},
            [4] = {name = 'opium_pooch', label = "Pochons d'Opium", price = 620, points_gagner = 10},
            [5] = {name = 'lsd_pooch', label = "Pochons d'lsd", price = 650, points_gagner = 12},
        },
        SELL_TIME = 2000, -- Combien de temps prend la vente
        -- NE PAS TOUCHER
        CURRENT_SELLER_POS = nil,
        OWNED_BY = nil,
        CREWS_POINTS = {},
        ARMES = {
            -- Armes
            {label = 'SNS', hash = "WEAPON_SNSPISTOL", price = 95000, points_retirer = 1000, type = "weapon"},
            {label = 'BERETTA', hash = "WEAPON_PISTOL", price = 150000, points_retirer = 2000, type = "weapon"},
            {label = 'Cran d\'arrêt', hash = "WEAPON_SWITCHBLADE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Couteau simple', hash = "WEAPON_KNIFE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Bouteille cassée', hash = "WEAPON_BOTTLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Club de golf', hash = "WEAPON_GOLFCLUB", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Batte de baseball', hash = "WEAPON_BAT", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Marteau', hash = "WEAPON_HAMMER", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Machette', hash = "WEAPON_MACHETE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'clé anglaise', hash = "WEAPON_WRENCH", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            -- Items
            {label = 'Chargeur', hash = "clip", price = 1000, points_retirer = 25, type = "item"},
            {label = 'Kevlar', hash = "kevlar", price = 50000, points_retirer = 500, type = "item"},
        }
    },
    ["Vinewood Boulevard"] = {
        POS = vector3(455.6350, 280.7108, 103.0186), -- La position au centre du territoire
        RADIUS = 150.0,  -- La largeur du territoire depuis le centre (un cercle)
        --
        WEAPONS_NPC = {MODEL = 'g_m_m_chicold_01'},
        WEAPONS_NPC_POS = vector4(478.5706, 258.9094, 103.1676, 62.0226),
        --
        SELLER_NPC = {MODEL = 'a_m_m_tramp_01', Scena = "WORLD_HUMAN_SMOKING"},
        SELL_POS = { -- La position de vente de la drogue (la position du PED)
            [1] = vector4(508.8596, 272.6514, 103.0561, 68.7086),
            [2] = vector4(475.9390, 266.9789, 103.0830, 330.5210),
            [3] = vector4(448.9591, 278.2351, 103.0595, 17.4133),
            [4] = vector4(439.6188, 299.4130, 103.0198, 165.3624),
            [5] = vector4(419.5919, 275.6662, 102.8927, 118.5312),
            [6] = vector4(405.8962, 289.6901, 102.9877, 314.8864),
        },
        DRUG_PRICES = {
            [1] = {name = 'weed_pooch', label = "Pochons de Weed", price = 490, points_gagner = 4},
            [2] = {name = 'coke_pooch', label = "Pochons de Cocaine", price = 550, points_gagner = 6},
            [3] = {name = 'meth_pooch', label = "Pochons de Meth", price = 570, points_gagner = 7},
            [4] = {name = 'opium_pooch', label = "Pochons d'Opium", price = 620, points_gagner = 10},
            [5] = {name = 'lsd_pooch', label = "Pochons d'lsd", price = 650, points_gagner = 12},
        },
        SELL_TIME = 2000, -- Combien de temps prend la vente
        -- NE PAS TOUCHER
        CURRENT_SELLER_POS = nil,
        OWNED_BY = nil,
        CREWS_POINTS = {},
        ARMES = {
            -- Armes
            {label = 'SNS', hash = "WEAPON_SNSPISTOL", price = 95000, points_retirer = 1000, type = "weapon"},
            {label = 'BERETTA', hash = "WEAPON_PISTOL", price = 150000, points_retirer = 2000, type = "weapon"},
            {label = 'Cran d\'arrêt', hash = "WEAPON_SWITCHBLADE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Couteau simple', hash = "WEAPON_KNIFE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Bouteille cassée', hash = "WEAPON_BOTTLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Club de golf', hash = "WEAPON_GOLFCLUB", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Batte de baseball', hash = "WEAPON_BAT", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Marteau', hash = "WEAPON_HAMMER", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Machette', hash = "WEAPON_MACHETE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'clé anglaise', hash = "WEAPON_WRENCH", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            -- Items
            {label = 'Chargeur', hash = "clip", price = 1000, points_retirer = 25, type = "item"},
            {label = 'Kevlar', hash = "kevlar", price = 50000, points_retirer = 500, type = "item"},
        }
    },
    ["San Andreas"] = {
        POS = vector3(-1254.29, -1478.07, 4.35), -- La position au centre du territoire
        RADIUS = 150.0,  -- La largeur du territoire depuis le centre (un cercle)
        --
        WEAPONS_NPC = {MODEL = 'g_m_m_chicold_01'},
        WEAPONS_NPC_POS = vector4(-1311.31, -1521.71, 4.41, 178.41),
        --
        SELLER_NPC = {MODEL = 'a_f_y_topless_01', Scena = "WORLD_HUMAN_SMOKING"},
        SELL_POS = { -- La position de vente de la drogue (la position du PED)
            [1] = vector4(-1253.71, -1452.42, 4.35, 138.2),
            [2] = vector4(-1226.71, -1467.73, 4.31, 42.46),
            [3] = vector4(-1232.31, -1522.75, 4.32, 357.93),
            [4] = vector4(-1224.82, -1447.45, 4.27, 179.82),
            [5] = vector4(-1210.17, -1456.87, 4.37, 34.15),
            [6] = vector4(-1261.72, -1518.18, 4.31, 24.40),
        },
        DRUG_PRICES = {
            [1] = {name = 'weed_pooch', label = "Pochons de Weed", price = 490, points_gagner = 4},
            [2] = {name = 'coke_pooch', label = "Pochons de Cocaine", price = 550, points_gagner = 6},
            [3] = {name = 'meth_pooch', label = "Pochons de Meth", price = 570, points_gagner = 7},
            [4] = {name = 'opium_pooch', label = "Pochons d'Opium", price = 620, points_gagner = 10},
            [5] = {name = 'lsd_pooch', label = "Pochons d'lsd", price = 650, points_gagner = 12},
        },
        SELL_TIME = 2000, -- Combien de temps prend la vente
        -- NE PAS TOUCHER
        CURRENT_SELLER_POS = nil,
        OWNED_BY = nil,
        CREWS_POINTS = {},
        ARMES = {
            -- Armes
            {label = 'SNS', hash = "WEAPON_SNSPISTOL", price = 95000, points_retirer = 1000, type = "weapon"},
            {label = 'BERETTA', hash = "WEAPON_PISTOL", price = 150000, points_retirer = 2000, type = "weapon"},
            {label = 'Cran d\'arrêt', hash = "WEAPON_SWITCHBLADE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Couteau simple', hash = "WEAPON_KNIFE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Bouteille cassée', hash = "WEAPON_BOTTLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Club de golf', hash = "WEAPON_GOLFCLUB", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Batte de baseball', hash = "WEAPON_BAT", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Marteau', hash = "WEAPON_HAMMER", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Machette', hash = "WEAPON_MACHETE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'clé anglaise', hash = "WEAPON_WRENCH", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            -- Items
            {label = 'Chargeur', hash = "clip", price = 1000, points_retirer = 25, type = "item"},
            {label = 'Kevlar', hash = "kevlar", price = 50000, points_retirer = 500, type = "item"},
        }
    },
    ["Grand Senora Desert"] = {
        POS = vector3(2409.1052, 3102.4785, 48.1529), -- La position au centre du territoire
        RADIUS = 110.0,  -- La largeur du territoire depuis le centre (un cercle)
        --
        WEAPONS_NPC = {MODEL = 'g_m_m_chicold_01'},
        WEAPONS_NPC_POS = vector4(2399.9199, 3081.3052, 49.0949, 3.7133),
        --
        SELLER_NPC = {MODEL = 'a_m_m_hillbilly_01', Scena = "WORLD_HUMAN_SMOKING"},
        SELL_POS = { -- La position de vente de la drogue (la position du PED)
            [1] = vector4(2354.6587, 3067.5825, 48.2027, 319.3498),
            [2] = vector4(2374.9385, 3069.0171, 48.1528, 248.4535),
            [3] = vector4(2393.9771, 3073.2537, 48.1530, 46.2837),
            [4] = vector4(2385.8726, 3096.2463, 48.1601, 302.2762),
            [5] = vector4(2404.8311, 3117.1262, 48.1708, 150.2019),
            [6] = vector4(2420.9382, 3104.3994, 48.1530, 111.5213),
        },
        DRUG_PRICES = {
            [1] = {name = 'weed_pooch', label = "Pochons de Weed", price = 490, points_gagner = 4},
            [2] = {name = 'coke_pooch', label = "Pochons de Cocaine", price = 550, points_gagner = 6},
            [3] = {name = 'meth_pooch', label = "Pochons de Meth", price = 570, points_gagner = 7},
            [4] = {name = 'opium_pooch', label = "Pochons d'Opium", price = 620, points_gagner = 10},
            [5] = {name = 'lsd_pooch', label = "Pochons d'lsd", price = 650, points_gagner = 12},
        },
        SELL_TIME = 2000, -- Combien de temps prend la vente
        -- NE PAS TOUCHER
        CURRENT_SELLER_POS = nil,
        OWNED_BY = nil,
        CREWS_POINTS = {},
        ARMES = {
            -- Armes
            {label = 'SNS', hash = "WEAPON_SNSPISTOL", price = 95000, points_retirer = 1000, type = "weapon"},
            {label = 'BERETTA', hash = "WEAPON_PISTOL", price = 150000, points_retirer = 2000, type = "weapon"},
            {label = 'Cran d\'arrêt', hash = "WEAPON_SWITCHBLADE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Couteau simple', hash = "WEAPON_KNIFE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Bouteille cassée', hash = "WEAPON_BOTTLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Club de golf', hash = "WEAPON_GOLFCLUB", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Batte de baseball', hash = "WEAPON_BAT", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Marteau', hash = "WEAPON_HAMMER", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Machette', hash = "WEAPON_MACHETE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'clé anglaise', hash = "WEAPON_WRENCH", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            -- Items
            {label = 'Chargeur', hash = "clip", price = 1000, points_retirer = 25, type = "item"},
            {label = 'Kevlar', hash = "kevlar", price = 50000, points_retirer = 500, type = "item"},
        }
    },
    ["Chantier Paleto"] = {
        POS = vector3(53.6205, 6543.0093, 31.3326), -- La position au centre du territoire
        RADIUS = 85.0,  -- La largeur du territoire depuis le centre (un cercle)
        --
        WEAPONS_NPC = {MODEL = 'g_m_m_chicold_01'},
        WEAPONS_NPC_POS = vector4(34.1541, 6515.5889, 31.5483, 122.4688),
        --
        SELLER_NPC = {MODEL = 'a_m_m_trampbeac_01', Scena = "WORLD_HUMAN_SMOKING"},
        SELL_POS = { -- La position de vente de la drogue (la position du PED)
            [1] = vector4(56.2493, 6539.9780, 31.5974, 77.8355),
            [2] = vector4(55.4176, 6524.8535, 31.4709, 1.6491),
            [3] = vector4(39.3111, 6519.1479, 33.8722, 11.1599),
            [4] = vector4(39.5818, 6553.4365, 31.4265, 265.4561),
            [5] = vector4(58.9282, 6557.9077, 29.8821, 251.6792),
            [6] = vector4(70.4651, 6569.2593, 28.4366, 98.4567),
        },
        DRUG_PRICES = {
            [1] = {name = 'weed_pooch', label = "Pochons de Weed", price = 490, points_gagner = 4},
            [2] = {name = 'coke_pooch', label = "Pochons de Cocaine", price = 550, points_gagner = 6},
            [3] = {name = 'meth_pooch', label = "Pochons de Meth", price = 570, points_gagner = 7},
            [4] = {name = 'opium_pooch', label = "Pochons d'Opium", price = 620, points_gagner = 10},
            [5] = {name = 'lsd_pooch', label = "Pochons d'lsd", price = 650, points_gagner = 12},
        },
        SELL_TIME = 2000, -- Combien de temps prend la vente
        -- NE PAS TOUCHER
        CURRENT_SELLER_POS = nil,
        OWNED_BY = nil,
        CREWS_POINTS = {},
        ARMES = {
            -- Armes
            {label = 'SNS', hash = "WEAPON_SNSPISTOL", price = 95000, points_retirer = 1000, type = "weapon"},
            {label = 'BERETTA', hash = "WEAPON_PISTOL", price = 150000, points_retirer = 2000, type = "weapon"},
            {label = 'Cran d\'arrêt', hash = "WEAPON_SWITCHBLADE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Couteau simple', hash = "WEAPON_KNIFE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Bouteille cassée', hash = "WEAPON_BOTTLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Club de golf', hash = "WEAPON_GOLFCLUB", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Batte de baseball', hash = "WEAPON_BAT", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Marteau', hash = "WEAPON_HAMMER", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Machette', hash = "WEAPON_MACHETE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'clé anglaise', hash = "WEAPON_WRENCH", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            -- Items
            {label = 'Chargeur', hash = "clip", price = 1000, points_retirer = 25, type = "item"},
            {label = 'Kevlar', hash = "kevlar", price = 50000, points_retirer = 500, type = "item"},
        }
    },
    ["Mirror Park"] = {
        POS = vector3(1145.5359, -656.2181, 56.8555), -- La position au centre du territoire
        RADIUS = 125.0,  -- La largeur du territoire depuis le centre (un cercle)
        --
        WEAPONS_NPC = {MODEL = 'g_m_m_chicold_01'},
        WEAPONS_NPC_POS = vector4(1135.1648, -663.8149, 57.0826, 106.0979),
        --
        SELLER_NPC = {MODEL = 'a_m_m_soucent_03', Scena = "WORLD_HUMAN_SMOKING"},
        SELL_POS = { -- La position de vente de la drogue (la position du PED)
            [1] = vector4(1124.7463, -647.2480, 56.7115, 297.3045),
            [2] = vector4(1144.2257, -642.9001, 56.8609, 303.0575),
            [3] = vector4(1145.1844, -673.7883, 57.0732, 328.2390),
            [4] = vector4(1144.5980, -704.7587, 56.6896, 187.7217),
            [5] = vector4(1176.3234, -711.7021, 59.3056, 324.1720),
            [6] = vector4(1170.1937, -670.8774, 60.9459, 50.5124),
        },
        DRUG_PRICES = {
            [1] = {name = 'weed_pooch', label = "Pochons de Weed", price = 490, points_gagner = 4},
            [2] = {name = 'coke_pooch', label = "Pochons de Cocaine", price = 550, points_gagner = 6},
            [3] = {name = 'meth_pooch', label = "Pochons de Meth", price = 570, points_gagner = 7},
            [4] = {name = 'opium_pooch', label = "Pochons d'Opium", price = 620, points_gagner = 10},
            [5] = {name = 'lsd_pooch', label = "Pochons d'lsd", price = 650, points_gagner = 12},
        },
        SELL_TIME = 2000, -- Combien de temps prend la vente
        -- NE PAS TOUCHER
        CURRENT_SELLER_POS = nil,
        OWNED_BY = nil,
        CREWS_POINTS = {},
        ARMES = {
            -- Armes
            {label = 'SNS', hash = "WEAPON_SNSPISTOL", price = 95000, points_retirer = 1000, type = "weapon"},
            {label = 'BERETTA', hash = "WEAPON_PISTOL", price = 150000, points_retirer = 2000, type = "weapon"},
            {label = 'Cran d\'arrêt', hash = "WEAPON_SWITCHBLADE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Couteau simple', hash = "WEAPON_KNIFE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Bouteille cassée', hash = "WEAPON_BOTTLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Club de golf', hash = "WEAPON_GOLFCLUB", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Batte de baseball', hash = "WEAPON_BAT", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Marteau', hash = "WEAPON_HAMMER", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Machette', hash = "WEAPON_MACHETE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'clé anglaise', hash = "WEAPON_WRENCH", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            -- Items
            {label = 'Chargeur', hash = "clip", price = 1000, points_retirer = 25, type = "item"},
            {label = 'Kevlar', hash = "kevlar", price = 50000, points_retirer = 500, type = "item"},
        }
    },
    ["Davis"] = {
        POS = vector3(216.63, -1717.27, 29.67), -- La position au centre du territoire
        RADIUS = 150.0,  -- La largeur du territoire depuis le centre (un cercle)
        --
        WEAPONS_NPC = {MODEL = 'g_m_m_chicold_01'},
        WEAPONS_NPC_POS = vector4(194.75, -1764.06, 29.33, 29.33),
        --
        SELLER_NPC = {MODEL = 'a_m_m_soucent_03', Scena = "WORLD_HUMAN_SMOKING"},
        SELL_POS = { -- La position de vente de la drogue (la position du PED)
            [1] = vector4(227.49, -1741.76, 29.13, 23.93),
            [2] = vector4(256.24, -1682.59, 29.18, 259.26),
            [3] = vector4(192.62, -1764.83, 29.25, 105.53),
            [4] = vector4(180.19, -1746.38, 29.19, 191.29),
            [5] = vector4(145.37, -1775.56, 29.16, 320.61),
            [6] = vector4(207.4707, -1779.97, 29.12, 119.57),
        },
        DRUG_PRICES = {
            [1] = {name = 'weed_pooch', label = "Pochons de Weed", price = 490, points_gagner = 4},
            [2] = {name = 'coke_pooch', label = "Pochons de Cocaine", price = 550, points_gagner = 6},
            [3] = {name = 'meth_pooch', label = "Pochons de Meth", price = 570, points_gagner = 7},
            [4] = {name = 'opium_pooch', label = "Pochons d'Opium", price = 620, points_gagner = 10},
            [5] = {name = 'lsd_pooch', label = "Pochons d'lsd", price = 650, points_gagner = 12},
        },
        SELL_TIME = 2000, -- Combien de temps prend la vente
        -- NE PAS TOUCHER
        CURRENT_SELLER_POS = nil,
        OWNED_BY = nil,
        CREWS_POINTS = {},
        ARMES = {
            -- Armes
            {label = 'SNS', hash = "WEAPON_SNSPISTOL", price = 95000, points_retirer = 1000, type = "weapon"},
            {label = 'BERETTA', hash = "WEAPON_PISTOL", price = 150000, points_retirer = 2000, type = "weapon"},
            {label = 'Cran d\'arrêt', hash = "WEAPON_SWITCHBLADE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Couteau simple', hash = "WEAPON_KNIFE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Bouteille cassée', hash = "WEAPON_BOTTLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Club de golf', hash = "WEAPON_GOLFCLUB", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Batte de baseball', hash = "WEAPON_BAT", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Marteau', hash = "WEAPON_HAMMER", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Machette', hash = "WEAPON_MACHETE", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'clé anglaise', hash = "WEAPON_WRENCH", price = 25000, points_retirer = 500, type = "weapon"},
            {label = 'Poing américain', hash = "WEAPON_KNUCKLE", price = 25000, points_retirer = 500, type = "weapon"},
            -- Items
            {label = 'Chargeur', hash = "clip", price = 1000, points_retirer = 25, type = "item"},
            {label = 'Kevlar', hash = "kevlar", price = 50000, points_retirer = 500, type = "item"},
        }
    },
}