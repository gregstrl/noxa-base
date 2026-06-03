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
        Color = {115,101,240},
        Rotation = 180.0,
    },
    Zone = vector3(139.1, -637.4, 261.8),
    zoneSizeProtection = 10,
    Catalogue = {
        Pos = vector3(-205.139359, -1373.160645, 30.58), 
        PosPreview = vector3(-213.415421, -1381.547729, 29.82),
        Heading = 331.38,
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
    Illegal = {
        PosPoint = vector3(2670.257324, 3286.665771, 55.24),
        TypeMoneyUse = 'dirtycash',
        Items = {

            {name = "Pétoire", price = 250000, type = "weapon", togivename = "weapon_snspistol"},
            {name = "Kevlar", price = 60000, type = "item", togivename = "kevlar"},
            {name = "Kit de crochetage", price = 25000, type = "item", togivename = "kitcrochetage"},
            {name = "Perceuse", price = 18000, type = "item", togivename = "drill"},
            {name = "Cagoule", price = 10000, type = "item", togivename = "cagoule"},
            {name = "Ciseaux", price = 7000, type = "item", togivename = "ciseaux"},
            {name = "Graffiti", price = 6000, type = "item", togivename = "spray_can"},
            {name = "Sac de Vetement", price = 5000, type = "item", togivename = "kq_outfitbag"},
            {name = "Jerrican D'essence", price = 4000, type = "item", togivename = "jerican"},
            {name = "Jumelles", price = 4000, type = "item", togivename = "jumelles"},
            {name = "Nettoyant Graffiti", price = 3500, type = "item", togivename = "spray_cloth"},
            {name = "Redbull", price = 3000, type = "item", togivename = "staminaboost"},
            {name = "Chargeur", price = 2000, type = "item", togivename = "clip"},

        },
    },
    FastFood = {
        blips = vector3(0,0,0),
        cuisine = vector3(0,0,0),
    },
    Gouv = {
        Armurerie = vector3(-580.731812, -590.278564, 34.68),
        Vestiaire = vector3(-587.048889, -588.899780, 34.68),
        Items = {
            {label = "Tazer", weapon = "WEAPON_STUNGUN", price = 0},
            {label = "Pistolet de combat", weapon = "WEAPON_COMBATPISTOL", price = 0},
            {label = "M4", weapon = "weapon_carbinerifle", price = 0},
            {label = "Pompe", weapon = "weapon_pumpshotgun", price = 0},
        },
        ListeVehicle = {
            {label = "20 FPIU", model = "cst20fpiu", grade = 0},
            {label = "Cognoscenti", model = "cognoscenti", grade = 0},
            {label = "Baller", model = "baller4", grade = 2},
            {label = "Baller Blindé", model = "baller5", grade = 4},
        },
        SortirVehicule = vector3(-565.817932, -625.803711, 30.30),
        PosSortirVehicule = vector3(-569.480957, -617.094727, 30.44),
        HeadingSortirVehicule = 267.60,
        RangerVehicle = vector3(-565.817932, -625.803711, 30.30),
    },
    Peche = {
        fishingRod = "fishingrod",
        availableFish = {
            {name = "saumon", label = "Saumon", price = 125, chance = 45},  -- 30% de chance
            {name = "cabillaud", label = "Cabillaud", price = 160, chance = 35},  -- 25% de chance
            {name = "sardine", label = "Sardine", price = 190, chance = 25},  -- 20% de chance
            {name = "truite", label = "Truite", price = 210, chance = 15},  -- 10% de chance
            {name = "thon", label = "Thon", price = 250, chance = 10},  -- 10% de chance
            {name = "brochet", label = "Brochet", price = 350, chance = 5},  -- 5% de chance
        },
    
        vendor = {
            position = vector3(-1499.611, -933.3877, 10.18),
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
                zoneCenter = vector3(-1849.238, -1251.151, 8.61),
                radius = 15.0,
                heading = 140.14
            },
        },
    },
}


ConfigBlip = {
    fishingZones = {
        {pos = vector3(-1843.598, -1240.968, 13.01)},
    },
    vendor = {
        {pos = vector3(-1499.611, -933.3877, 10.18)}
    }
}

Config['usingOldESX'] = true

Config['enableNuiIndicator'] = false

Config['admingroups'] = {
    "founder",
}

Config["strings"] = {
    ['open'] = "🔒",
    ['close'] = "🔓",
}