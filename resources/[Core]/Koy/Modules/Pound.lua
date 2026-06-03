Config["Pound"] = {};
Config["Pound"]["Prices"] = {};
Config["Pound"]["Blips"] = {};
Config["Pound"]["Vehicles"] = {};

Config["Pound"]["Prices"]["SpawnVehicle"] = 1500;
Config["Pound"]["Prices"]["StoreVehicle"] = 3000;

Config["Pound"]["Blips"]["Enabled"] = true;
Config["Pound"]["Blips"]["Label"] = "Fourrières";
Config["Pound"]["Blips"]["Sprite"] = 402;
Config["Pound"]["Blips"]["Color"] = 60;

Config["Pound"]["Vehicles"]["SpawnLocked"] = true;
Config["Pound"]["Vehicles"]["SpawnIn"] = true;

Config["Pound"]["Zones"] = {

    --Pound_LosSantos
    {
        ["Menu"] = { x = 374.42, y = -1620.68, z = 29.29 },
        ["Spawn"] = { x = 391.74, y = -1619.0, z = 29.29, heading = 318.34 }
    },

    --Pound_Sandy
    {
        ["Menu"] = { x = 1644.10, y = 3808.20, z = 35.09 },
        ["Spawn"] = { x = 1627.84, y = 3788.45, z = 33.77, heading = 308.53 }
    },

    --Pound_Paleto
    {
        ["Menu"] = { x = -223.6, y = 6243.37, z = 31.49 },
        ["Spawn"] = { x = -230.88, y = 6255.89, z = 30.49, heading = 136.5 }
    },

    --Pound_LifeInvader
    {
        ["Menu"] = { x = -1151.388, y = -205.2902, z = 37.95996 },
        ["Spawn"] = { x = -1148.73, y = -219.06, z = 37.94, heading = 199.96 }
    },

    --Pound_CayoPerico
    {
        ["Menu"] = { x = 4502.879, y = -4530.963, z = 4.17 }, 
        ["Spawn"] = { x = 4505.094, y = -4535.754, z = 4.16, heading = 306.087 }
    },

        --Pound_Jail
    {
        ["Menu"] = { x = -1586.757, y = 5155.415, z = 19.637 },
        ["Spawn"] = { x = -1575.559, y = 5150.323, z = 19.98602, heading = 187.038223266 },
    },
  

     -- Pound_CentreVille
    {
        ["Menu"] = { x = 453.27, y = -1145.80, z = 29.51 },
        ["Spawn"] = { x = 450.37, y = -1157.92, z = 29.29, heading = 271.36 },
    },
    
         -- Pound_HautVille
    {
        ["Menu"] = { x = 599.09, y = 90.40, z = 92.82 },
        ["Spawn"] = { x = 610.31, y = 89.71, z = 92.38, heading = 162.40 },
    },

                 -- Pound_MirrorPark
    {
        ["Menu"] = { x = 1034.91, y = -766.63, z = 58.00 },
        ["Spawn"] = { x = 1028.08, y = -771.37, z = 58.03, heading = 145.39 },
    }
};