Config["Shops"] = {};
Config["Shops"].list = {
    {
        label = "Ammu-Nation",
        blip = {
            sprite = 110,
            display = 4,
            scale = 0.6,
            color = 1,
            range = true
        },
        categories = {
            ["letal"] = { label = "Létale", placement = 1, licenses = { "weapon" } },
            ["melee"] = { label = "Mêlée", placement = 2 },
            ["munition"] = { label = "Muntions", placement = 3 }
        },
        items = {

            ["weapon"] = {
                type = "license",
                label = "Permis port d'armes",
                price = 250000
            },

            ["weapon_knife"] = {
                type = "weapon",
                cat = "melee",
                label = "Couteau",
                price = 30000
            },
            ["weapon_bat"] = {
                type = "weapon",
                cat = "melee",
                label = "Batte de baseball",
                price = 30000
            },
            ["weapon_machete"] = {
                type = "weapon",
                cat = "melee",
                label = "Machette",
                price = 30000
            },

            ["clip"] = {
                type = "item",
                cat = "munition",
                label = "clip",
                price = 145000
            },
            ["weapon_snspistol"] = {
                type = "weapon",
                cat = "letal",
                label = "Pistolet SNS",
                price = 200000
            },

            ["clip"] = {
                cat = "letal",
                label = "Chargeur",
                price = 3000
            },
            
            ["flashlight"] = {
                cat = "vip",
                label = "Flash Lights",
                price = 15000
            },
            ["grip"] = {
                cat = "vip",
                label = "Poignée Grip",
                price = 50000
            },

            ["scope"] = {
                cat = "vip",
                label = "Lunette de visé",
                price = 30000
            },

            ["silencer"] = {
                cat = "vip",
                label = "Silencieux",
                price = 75000
            },

        },
        positions = {
            vector3(-661.2042, -938.6090, 21.8294),
            vector3(814.4666, -2153.4207, 29.6192),
            vector3(1693.578, 3759.426, 34.7053),
            vector3(-330.4556, 6083.456, 31.45476),
            vector3(248.5865, -49.8596, 69.9412),
            vector3(16.5042, -1109.1306, 29.7972),
            vector3(2566.6489, 297.4254, 108.7350),
            vector3(-1114.6431, 2696.9915, 18.5543),
            vector3(842.4682, -1033.3, 28.19486),
            vector3(-1305.939, -394.0775, 36.69574), -- Cayo
        }
    }
}