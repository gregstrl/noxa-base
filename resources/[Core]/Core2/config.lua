Config = {
    ESX = "esx:getSharedObject",
    Liste = {
        {time = 1, text = "1 Heure", reward = 110000},
        {time = 2, text = "2 Heure", reward = 120000},
        {time = 3, text = "3 Heure", reward = 130000},
        {time = 5, text = "5 Heure", reward = 150000},
    },
    Marker = {
        Pos = vector3(258.57,-782.93,30.51),
        Type = 2,
        Size = {0.2, 0.2, 0.2},
        Color = {0,128,255},
        Rotation = 180.0,
    },
    Zone = vector3(139.1, -637.4, 261.8),
    zoneSizeProtection = 10,
    Catalogue = {
        Pos = vector3(123.0377, -140.8271, 54.80012), 
        PosPreview = vector3(-55.77708, 75.90689, 70.86399),
        Heading = 149.093,
    },
    Plane = {
        Actions = {
            {actions = vector3(-970.6, -2941.2, 14.9)},
        },
    },
    Boat = {
        Actions = {
            {actions = vector3(-735.018, -1344.49, 1.571926)},
        },
    },
    Gouv = {
        PosBlip = vector3(-551.7219, -194.0022, 38.2193),
        Armurerie = vector3(-571.3316, -204.0002, 38.2193),
        Vestiaire = vector3(-579.6986, -204.3693, 38.2194),
        Items = {
            {label = "Tazer", weapon = "WEAPON_STUNGUN", price = 0},
            {label = "Pistolet de combat", weapon = "WEAPON_COMBATPISTOL", price = 0},
            {label = "Fusil avancé", weapon = "WEAPON_ADVANCEDRIFLE", price = 0},
        },
        ListeVehicle = {
            {label = "OneBeast", model = "onebeast", grade = 2},
            {label = "4x4", model = "pressuv", grade = 2},
            {label = "Buffalo", model = "fbi", grade = 5},
            {label = "Cognoscenti blindé", model = "cog552", grade = 0},
            {label = "XLS blindé", model = "xls2", grade = 0},
        },
        SortirVehicule = vector3(-492.4998, -200.9892, 37.1147),
        PosSortirVehicule = vector3(-487.1270, -198.6895, 36.9900),
        HeadingSortirVehicule = 207.2617,
        RangerVehicle = vector3(-487.1270, -198.6895, 36.9900),
        BossActions = vector3(-570.0569, -194.3512, 38.2184),
    },
    FastFood = {
        blips = vector3(0,0,0),
        cuisine = vector3(0,0,0),
    },
    Vda = {
        OrgaOK = "ballas",
        Weapons = {
            {label = "Pétoire", model = "weapon_snspistol", price = 144500, type = "weapon"},
            {label = "Pistolet", model = "weapon_pistol", price = 176000, type = "weapon"},
            {label = "Pistolet Lourd", model = "weapon_heavypistol", price = 204000, type = "weapon"},
            {label = "Calibre 50", model = "weapon_pistol50", price = 200000, type = "weapon"},
            {label = "Mini SMG", model = "weapon_minismg", price = 756500, type = "weapon"},
            {label = "Micro SMG", model = "weapon_microsmg", price = 807500, type = "weapon"},
            {label = "AK-Compact", model = "weapon_compactrifle", price = 2312000, type = "weapon"},
            {label = "Carte de sécurité", model = "id_card_f", price = 63750, type = "item"},
        },
    },
    Illegal = {
        PosPoint = vector3(216.3, -800.9, 30.7),
        TypeMoneyUse = 'dirtycash',
        Items = {
            {name = "Menottes", price = 5000, type = "item", togivename = "menottes"},
            {name = "GHB", price = 2000, type = "item", togivename = "ghb"},
            {name = "Kevlar", price = 5000, type = "item", togivename = "kevlar"},
            {name = "Couteau", price = 10000, type = "weapon", togivename = "weapon_knife"},
        },
    },
    Peche = {
        fishingRod = "fishingrod",

        availableFish = {
            {name = "saumon", label = "Saumon", price = 29},
            {name = "cabillaud", label = "Cabillaud", price = 38},
            {name = "sardine", label = "Sardine", price = 30},
            {name = "truite", label = "Truite", price = 25},
            {name = "thon", label = "Thon", price = 48},
            {name = "brochet", label = "Brochet", price = 67},
        },
    
        vendor = {
            position = vector3(1961.89, 5184.36, 47.98),
            blipActive = true,
            sprite = 480,
            color = 51,
            size = 0.9,
            name = "Acheteur de poisson",

        },
    
        blips = {
            name = "Zone de pêche",
            sprite = 762,
            color = 38,
            size = 0.9
        },
    
        fishingZones = {
            {
                zoneCenter = vector3(2073.23, 4554.31, 31.31),
                radius = 10.0,
                heading = 202.01
            },
        },
    },
}

ConfigBlip = {
    fishingZones = {
        {pos = vector3(2073.23, 4554.31, 31.31)},
    },
    vendor = {
        {pos = vector3(1961.89, 5184.36, 47.98)}
    }
}

Config['usingOldESX'] = true

Config['enableNuiIndicator'] = false

Config['admingroups'] = {
    "founder",
}

Config["strings"] = {
    ['open'] = "~s~Appuyez sur [~b~E~s~] pour ~g~ouvrir~s~ la porte",
    ['close'] = "~s~Appuyez sur [~b~E~s~] pour ~r~fermer~s~ la porte",
}

_vCore = {}


-- Alerte Police
_vCore.pourcent = {
	withsupp = { -- Avec
		randommax = 25,
		thenbr = 2,
	},
	withoutsupp = { -- Sans
		randommax = 12, 
		thenbr = 2,
	},
}
_vCore.suppressorlist = {
     {name = "suppressor", model = "COMPONENT_AT_PI_SUPP"},
     {name = "suppressor", model = "COMPONENT_AT_PI_SUPP_02"},
     {name = "suppressor", model = "COMPONENT_AT_AR_SUPP"},
     {name = "suppressor", model = "COMPONENT_AT_AR_SUPP_02"},
     {name = "suppressor", model = "COMPONENT_M6IC_SUPP_01"},
     {name = "suppressor", model = "COMPONENT_M6IC_SUPP_02"},
     {name = "suppressor", model = "COMPONENT_M6IC_SUPP_03"},
     {name = "suppressor", model = "COMPONENT_AT_HK416B_SUPP"},
     {name = "suppressor", model = "COMPONENT_SCAR_BARREL_01"},
     {name = "suppressor", model = "COMPONENT_SCAR_BARREL_02"},
     {name = "suppressor", model = "COMPONENT_SCAR_BARREL_03"},
     {name = "suppressor", model = "COMPONENT_SCAR_BARREL_04"},
     {name = "suppressor", model = "COMPONENT_SCAR_BARREL_05"},
     {name = "suppressor", model = "COMPONENT_SCAR_BARREL_06"},
     {name = "suppressor", model = "COMPONENT_SCAR_BARREL_07"},
     {name = "suppressor", model = "COMPONENT_SCAR_BARREL_08"},
     {name = "suppressor", model = "COMPONENT_SCAR_BARREL_09"},
}