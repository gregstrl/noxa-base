SafeZone = {}

SafeZone.Config = {
    zoneRadius = 55.0,
    zoneList = {
        vector3(-1260.6801, -1481.1935, 6.8254), -- SPAWN
        vector3(442.2603, -1003.6946, 39.9454), -- POLICE
        vector3(-319.3955, -599.3098, 48.2254), -- HOPITAL
        vector3(-550.9971, -198.4927, 48.2254), -- GOUVERNEMENT
        vector3(-845.6816, -336.1464, 48.2254), -- AGENCE IMMO
        vector3(-345.2699, -129.1247, 48.2254), -- LSCUSTOM
        vector3(-937.6342, -2028.5861, 23.3854), -- BENNYS
        vector3(537.2555, -182.8709, 67.5454), -- AUTOEXOTIC
        vector3(-2182.3247, -400.1032, 12.3454), -- AUTO-ECOLE
        vector3(-1184.6952, -889.7031, 15.1054), -- BURGER SHOT
        vector3(-580.6718, -925.4343, 42.7054), -- Weazel News
        vector3(-69.3542, 73.7386, 73.0654), -- CONCESSIONNAIRE
        vector3(119.4454, -1293.8505, 26.8736), -- UNICORN
        vector3(-1396.2600, -604.0284, 29.5693), -- BAHAMAS
        vector3(232.9601, -3174.5918, 4.8655), -- CLUB 77
        vector3(236.3575, -397.7337, 51.6162), -- PALLAIS JUSTICE
        -- PARKING CENTRAL
        vector3(-322.3038, -904.4965, 37.5897), -- PRINCIPAL
        vector3(392.4436, -1623.8051, 31.9394), -- FOURRIERE
        vector3(185.6868, -946.6844, 34.5164), -- PLACE DES CUBE
        vector3(-766.2218, -20.3908, 45.0635), -- EGLISE
    },
    
    disabledKeys = {
        -- INVENTAIRE TAB {group = 2, key = 37, message = "~s~Il est impossible de sortir une arme dans cet endroit."},
        {group = 0, key = 24, message  = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 69, message  = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 92, message  = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 106, message = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 168, message = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 160, message = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 45, message  = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 25, message  = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 80, message  = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 140, message = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 250, message = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 263, message = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"},
        {group = 0, key = 310, message = "~o~Vous ne pouvez pas faire ça dans une zone sécurisée !"}
    },
    messages = {
        onEntered = "~g~Vous entrez dans une zone sécurisée.",
        onExited = "~o~Vous sortez d'une zone sécurisée."
    },
    bypassJob = {
        active = true,
        list = {
            ["lsco"] = true,
            ["sasp"] = true,
            ["sahp"] = true,
            ["gouv"] = true,
            ["usms"] = true,

            --["bcso"] = true,
            --["fib"] = true,
        }
    }
}