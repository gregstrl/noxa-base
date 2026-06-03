Config = Config or {}
--[[ 
    Welcome to the inventory configuration!
    https://lcode.gitbook.io/documentation/inventory/
]]

--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗     
-- ██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║     
-- ██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║     
-- ██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║     
-- ╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗
--  ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
                                                           

Config.Language = "fr" -- Set your lang in locales folder (fr, en, es, ...)
Config.Framework = "esx" -- esx or qb
Config.Debug = false 
Config.UseNPC = false
--[[                                    
    'old' (Esx 1.1).
    'new' (Esx 1.2, v1 final, legacy or extendedmode).
]]
Config.esxVersion = 'old' 

Config.Trigger = {
    ['useItem'] = 'esx:useItem', -- for QBCore is : 'QBCore:Server:UseItem'
    ['getSharedObject'] = 'esx:getSharedObject',
    ['getStatus'] = 'esx_status:getStatus',
    ['saveSkin'] = 'esx_skin:save',
}


Config.KeyBinds = {
    -- Find keybinds here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    {Command = "inventory", Bind = "TAB", Description = "Ouvrir Inventaire"},-- toggle the inventaire
    {Command = "keybind_1", Bind = "1", Description = "Slot weapon 1"},-- 
    {Command = "keybind_2", Bind = "2", Description = "Slot weapon 2"},-- 
    {Command = "keybind_3", Bind = "3", Description = "Slot weapon 3"},-- 
    {Command = "keybind_4", Bind = "4", Description = "Slot weapon 4"},-- 
    {Command = "keybind_5", Bind = "5", Description = "Slot weapon 5"},-- 
    {Command = "trunk", Bind = "L", Description = "Ouvrir Coffre Voiture"},-- 
}

-- false : If you want use your custom notification in inventory (client/custom/framework/esx.lua)
Config.UseNotificationInventory = true

-- Name of the item when used will close the UI
Config.CloseUI = {
    ['water'] = true,
    ['bread'] = true,
    ['phone'] = true,
    ['boombox'] = true,
    ['spray_can'] = true,
    ['jumelles'] = true,
    ['jerican'] = true,
    ['ciseaux'] = true,
    ['carokit'] = true,
    ['kitcrochetage'] = true,
    ['kevlar'] = true,
    ['kq_outfitbag'] = true,
}

-- Names of weapons impossible to give
Config.WeaponNoGive = {

    -- ARME BOUTIQUE
    ["WEAPON_A15RC"] = true,

    ["WEAPON_NEVA"] = true,
    ["WEAPON_IAR"] = true,
    ["WEAPON_M133"] = true,
    ["WEAPON_JRBAK"] = true,
    ["WEAPON_UZI"] = true,
    ["weapon_carbinerifle_mk2"] = true,
    ["weapon_pumpshotgun"] = true,

    ["weapon_heavysniper"] = true,
    ["weapon_specialcarbine_mk2"] = true,

    ["weapon_smg_mk2"] = true,

    ["WEAPON_FAMASUS1"] = true,
    ["WEAPON_UMP45"] = true,
    ["WEAPON_GYS"] = true,
    ["WEAPON_M416P"] = true,
    ["WEAPON_G36"] = true,
    ["WEAPON_GLOCK17"] = true,

    ["WEAPON_ENERGYKNIFE"] = true,
    ["WEAPON_KARAMBIT"] = true,

    -- ARME VANILLA BLACKLIST DONNER
    ["WEAPON_COMBATPISTOL"] = true,
   -- ["WEAPON_PISTOL_MK2"] = true,
    --["WEAPON_APPISTOL"] = true,
    --["WEAPON_TECHPISTOL"] = true,
   -- ["WEAPON_MACHINEPISTOL"] = true,
    ["WEAPON_CARBINERIFLE"] = true,
    ["WEAPON_STUNGUN"] = true,
    ["WEAPON_ADVANCEDRIFLE"] = true,
    --["WEAPON_SAWNOFFSHOTGUN"] = true,
    ["WEAPON_MUSKET"] = true,
   -- ["WEAPON_DOUBLEACTION"] = true,
    ["WEAPON_SWITCHBLADE"] = true,




}

-- Names of item impossible to give
Config.ItemNoGive = {
    ["boombox"] = true,
    ["jetoncustom"] = true,
}

-- Name of the item that cannot be placed in slots
Config.BL_SlotInv = {
    ["phone"] = true,
    ["kq_outfitbag"] = true,
    ["bread"] = true,
    ["grip"] = true,
    ["scope"] = true,
    ["silencer"] = true,
    ["flashlight"] = true,

    ["clip"] = true,
    ["water"] = true,
    ['boombox'] = true,
}

--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗██╗      ██████╗ ████████╗██╗  ██╗███████╗███████╗
-- ██╔════╝██║     ██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔════╝
-- ██║     ██║     ██║   ██║   ██║   ███████║█████╗  ███████╗
-- ██║     ██║     ██║   ██║   ██║   ██╔══██║██╔══╝  ╚════██║
-- ╚██████╗███████╗╚██████╔╝   ██║   ██║  ██║███████╗███████║
--  ╚═════╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
                 

-- For interaction in the middle of the inventory
Config.Clothes = {
    ['helmet'] = {
        [0] = {['helmet_1'] = 8 --[[ type ]], ["helmet_2"] = 0--[[ color ]]}, -- men 
        [1] = {['helmet_1'] = 57 --[[ type ]], ["helmet_2"] = 0--[[ color ]]}  -- women
    },
    ['chain'] = {
        [0] = {['chain_1'] = 0, ["chain_2"] = 0}, -- //
        [1] = {['chain_1'] = 0, ["chain_2"] = 0}  -- //
    },
    ['torso'] = {
        [0] = {['torso_1'] = 15, ["torso_2"] = 0},
        [1] = {['torso_1'] = 84, ["torso_2"] = 5},
    },
    ['tshirt'] = {
        [0] = {['tshirt_1'] = 15, ["tshirt_2"] = 0},
        [1] = {['tshirt_1'] = 16, ["tshirt_2"] = 0},
    },
    ['arms'] = {
        [0] = {['arms_1'] = 15, ["arms_2"] = 0},
        [1] = {['arms_1'] = 300, ["arms_2"] = 0},
    },
    ['pants'] = {
        [0] = {['pants_1'] = 21, ["pants_2"] = 0},
        [1] = {['pants_1'] = 138, ["pants_2"] = 0}
    },
    ['shoes'] = {
        [0] = {['shoes_1'] = 166, ["shoes_2"] = 0},
        [1] = {['shoes_1'] = 109, ["shoes_2"] = 0}
    },
    ['bags'] = {
        [0] = {['bags_1'] = 0, ["bags_2"] = 0},
        [1] = {['bags_1'] = 0, ["bags_2"] = 0}
    },
    ['mask'] = {
        [0] = {['mask_1'] = 0, ["mask_2"] = 0},
        [1] = {['mask_1'] = 0, ["mask_2"] = 0}
    },
    ['glasses'] = {
        [0] = {['glasses_1'] = 0, ["glasses_2"] = 0},
        [1] = {['glasses_1'] = 0, ["glasses_2"] = 0}
    },
    ['ears'] = {
        [0] = {['ears_1'] = -1, ["ears_2"] = 0},
        [1] = {['ears_1'] = -1, ["ears_2"] = 0}
    },
    ['bracelets'] = {
        [0] = {['bracelets_1'] = -1, ["bracelets_2"] = 0},
        [1] = {['bracelets_1'] = -1, ["bracelets_2"] = 0}
    },
    ['watches'] = {
        [0] = {['watches_1'] = -1, ["watches_2"] = 0},
        [1] = {['watches_1'] = -1, ["watches_2"] = 0}
    },
    ['bproof'] = {
        [0] = {['bproof_1'] = 0, ["bproof_2"] = 0},
        [1] = {['bproof_1'] = 0, ["bproof_2"] = 0}
    },
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗██╗      ██████╗ ████████╗██╗  ██╗██╗███╗   ██╗ ██████╗     ███████╗████████╗ ██████╗ ██████╗ ███████╗
-- ██╔════╝██║     ██╔═══██╗╚══██╔══╝██║  ██║██║████╗  ██║██╔════╝     ██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
-- ██║     ██║     ██║   ██║   ██║   ███████║██║██╔██╗ ██║██║  ███╗    ███████╗   ██║   ██║   ██║██████╔╝█████╗  
-- ██║     ██║     ██║   ██║   ██║   ██╔══██║██║██║╚██╗██║██║   ██║    ╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  
-- ╚██████╗███████╗╚██████╔╝   ██║   ██║  ██║██║██║ ╚████║╚██████╔╝    ███████║   ██║   ╚██████╔╝██║  ██║███████╗
--  ╚═════╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
        
Config.ActiveClothShop = true

Config.ClothMarkerDistance = 10
Config.ClothMarkerType = 1
Config.ClothActiveText = false
Config.ClothMarkerText = '👕'

Config.ClothTypeMoney = 'bank'
Config.ClothPriceSave = 50
Config.ClothPriceRegister = 250
Config.ClothPrice = {
    ["top"] = 150,
    ["pants"] = 75,
    ["shoes"] = 75,
    ["bags"] = 150,
    ["glasses"] = 25,
    ["ears"] = 15,
    ["helmet"] = 40,
    ["bracelets"] = 20,
    ["watches"] = 30,
    ["chain"] = 50,
    ["mask"] = 50,
}

Config.PosClotheShop = {
    ['Boutique - Binco'] = {
        menu = 'shopui_title_lowendfashion2',
        type = 'clothes', -- or mask
        coords = {
            vector3(-822.42, -1073.55, 10.33),
            vector3(75.94217, -1398.301, 28.47),
            vector3(425.59, -806.15, 28.49),
            vector3(4.87, 6512.46, 30.88),
            vector3(1693.92, 4822.82, 41.06),
            vector3(1196.61, 2710.25, 37.22),
            vector3(-1101.48, 2710.57, 18.11),
            vector3(4484.643, -4452.004, 3.55), -- Cayo
            --vector3(-332.578, 7209.099, 6.79), -- Roxwood
        },
        blip = {
            color = 2,
            size = 0.6,
            style = 73
        }
    },
    ['Boutique - Magasin de Masque'] = {
        menu = 'shopui_title_lowendfashion2',
        type = 'mask', -- or mask
        coords = {
            vector3(-1337.108, -1277.87, 3.87),
            vector3(4489.492, -4458.419, 3.55),
            vector3(1705.674927, 3779.878662, 33.75),
        },
        blip = {
            color = 24,
            size = 0.6,
            style = 362
        }
    },
    ['Boutique - Suburban'] = {
        menu = 'shopui_title_midfashion',
        type = 'clothes', -- or mask
        coords = {
            vector3(-1193.16, -767.98, 16.32),
            vector3(125.77, -223.9, 53.56),
            vector3(614.19, 2762.79, 41.09),
            vector3(-3170.54, 1043.68, 19.86)
        },
        blip = {
            color = 81,
            size = 0.6,
            style = 73
        }
    },
    ['Boutique - Ponsonbys'] = {
        menu = 'shopui_title_highendfashion',
        type = 'clothes', -- or mask
        coords = {
            vector3(-709.86, -153.1, 36.42),
            vector3(-163.37, -302.73, 38.73),
            vector3(-1450.42, -237.66, 48.81)
        },
        blip = {
            color = 81,
            size = 0.6,
            style = 73
        }
    },
}


--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

--  █████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗███╗   ██╗████████╗
-- ██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║████╗  ██║╚══██╔══╝
-- ███████║██║     ██║     ██║   ██║██║   ██║██╔██╗ ██║   ██║   
-- ██╔══██║██║     ██║     ██║   ██║██║   ██║██║╚██╗██║   ██║   
-- ██║  ██║╚██████╗╚██████╗╚██████╔╝╚██████╔╝██║ ╚████║   ██║   
-- ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   
                                                             

-- Display accounts in inventory
Config.ActiveAccount = true
Config.Account = {["dirtycash"] = true, ["cash"] = true} 
Config.AccountName = {
    ["dirtycash"] = 'Argent Sale', 
    ["cash"] = 'Argent Propre'
}

Config.ClothingAnimations = {
    tshirt = {dict = "clothingtie", anim = "try_tie_neutral_d"},
    torso = {dict = "clothingtie", anim = "try_tie_neutral_d"},
    arms = {dict = "clothingtie", anim = "try_tie_neutral_d"},
    pants = {dict = "clothingtrousers", anim = "try_trousers_neutral_c"},
    shoes = {dict = "clothingshoes", anim = "try_shoes_neutral_d"},
    mask = {dict = "misscommon@van_put_on_masks", anim = "put_on_mask_ps"},
    bproof = {dict = "clothingtie", anim = "try_tie_neutral_b"},
    chain = {dict = "clothingtie", anim = "try_tie_neutral_d"},
    helmet = {dict = "misscommon@van_put_on_masks", anim = "put_on_mask_ps"},
    glasses = {dict = "clothingspecs", anim = "try_glasses_positive_a"},
    watches = {dict = "clothingtie", anim = "try_tie_neutral_d"},
    bracelets = {dict = "clothingtie", anim = "try_tie_neutral_d"},
    bags = {dict = "clothingshirt", anim = "try_shirt_negative_a"},
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗██████╗      ██████╗ █████╗ ██████╗ ██████╗ 
-- ██║██╔══██╗    ██╔════╝██╔══██╗██╔══██╗██╔══██╗
-- ██║██║  ██║    ██║     ███████║██████╔╝██║  ██║
-- ██║██║  ██║    ██║     ██╔══██║██╔══██╗██║  ██║
-- ██║██████╔╝    ╚██████╗██║  ██║██║  ██║██████╔╝
-- ╚═╝╚═════╝      ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
    

-- Display id card in inventory
Config.ActiveIdCard = true -- just for ESX
Config.ActiveMugShot = false -- https://github.com/BaziForYou/MugShotBase64
Config.PictureIdCard = 'https://cdn.discordapp.com/attachments/979486375218937946/1135635765397823488/47848.png'  -- if ActiveMugShot == false
Config.IdCardName = {
    ["idcard"] = {
        name = 'Carte d\'identité', 
        icon = 'assets/icons/icon.png',
        color = '#FFF'
    },
    ["drive"] = {
        name = 'Driver\'s license', 
        icon = 'assets/icons/permis.png',
        color = '#e2bab3'
    },
    ["weapon"] = {
        name = 'Weapon license', 
        icon = 'https://cdn.discordapp.com/attachments/979486375218937946/1135638696289382400/gun-4-xxl.png',
        color = '#cc352a'
    },
    ["police"] = { 
        name = 'Badge LSPD',
        icon = 'assets/icons/police.png', 
        color = '#05224d'
    }
}
Config.GenreIdCard = {
    ["0"] = 'Women', 
    ["1"] = 'Men', 
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗     ██████╗     ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
-- ██║     ██╔══██╗    ██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
-- ██║     ██████╔╝    ██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
-- ██║     ██╔══██╗    ██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
-- ███████╗██████╔╝    ██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
-- ╚══════╝╚═════╝     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
                                                               
-- LB Phone is unique with inventory
Config.ActivePhoneUnique = false
Config.ItemPhoneName = 'phone'

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██████╗  ██████╗  ██████╗ ███╗   ███╗██████╗  ██████╗ ██╗  ██╗
-- ██╔══██╗██╔═══██╗██╔═══██╗████╗ ████║██╔══██╗██╔═══██╗╚██╗██╔╝
-- ██████╔╝██║   ██║██║   ██║██╔████╔██║██████╔╝██║   ██║ ╚███╔╝ 
-- ██╔══██╗██║   ██║██║   ██║██║╚██╔╝██║██╔══██╗██║   ██║ ██╔██╗ 
-- ██████╔╝╚██████╔╝╚██████╔╝██║ ╚═╝ ██║██████╔╝╚██████╔╝██╔╝ ██╗
-- ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝
                                                              
-- Boombox with inventory
Config.ActiveBoombox = true
Config.BoomboxItem = 'boombox'

Config.MaxDistance = 15
Config.MinDistance = 0

Config.MaxVolume = 50
Config.MinVolume = 0

function UseBoombox(source)
    return true -- use condition for vip (exemple)
end

--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗      ██████╗  ██████╗ ████████╗
-- ██║     ██╔═══██╗██╔═══██╗╚══██╔══╝
-- ██║     ██║   ██║██║   ██║   ██║   
-- ██║     ██║   ██║██║   ██║   ██║   
-- ███████╗╚██████╔╝╚██████╔╝   ██║   
-- ╚══════╝ ╚═════╝  ╚═════╝    ╚═╝   
                      
Config.HandsupForLoot = true
Config.ActiveJobForLoot = false
Config.JobForLoot = {
    ['police'] = false,
    ['fbi'] = false,
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ████████╗██████╗ ██╗   ██╗███╗   ██╗██╗  ██╗
-- ╚══██╔══╝██╔══██╗██║   ██║████╗  ██║██║ ██╔╝
--    ██║   ██████╔╝██║   ██║██╔██╗ ██║█████╔╝ 
--    ██║   ██╔══██╗██║   ██║██║╚██╗██║██╔═██╗ 
--    ██║   ██║  ██║╚██████╔╝██║ ╚████║██║  ██╗
--    ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝


Config.JustOwnerVehicle = false        

Config.saveTrunkCommand = 'saveTrunk'
Config.savingTimer = 15 -- minutes

Config.AutoDeleteTrunk = false -- remove all trunk with not owner
Config.CommandDeleteTrunk = 'deleteTrunk'

Config.AccountTrunkName = {
    ["cash"] = 'Argent Propre',
    ["dirtycash"] = 'Argent Sale', 
}

Config.WeightVehicle = {
    [0] = 70, -- Compacts  
    [1] = 80, -- Sedans
    [2] = 150, -- SUVs
    [3] = 70, -- Coupes 
    [4] = 45, -- Muscle  
    [5] = 60, -- Sports Classics  
    [6] = 50, -- Sports  
    [7] = 50, -- Super  
    [8] = 10, -- Motorcycles  
    [9] = 80, -- Off-road 
    [10] = 250, -- Industrial
    [11] = 70, -- Utility  
    [12] = 250, -- Vans  
    [13] = 2, -- Cycles  
    [14] = 250, -- Boats  
    [15] = 150, -- Helicopters  
    [16] = 250, -- Planes  
    [17] = 70, -- Service  
    [18] = 50, -- Emergency  
    [19] = 0, -- Military  
    [20] = 500, -- Commercial  
    [21] = 0, -- Trains  
    [22] = 1000, -- Open Wheel
}

Config.WeaponDefaultWeight = 10
Config.WeaponWeight = {
    ["WEAPON_PISTOL"] = 10.0,
    ["WEAPON_DAGGER"] = 10.0,
    ["WEAPON_ASSAULTRIFLE"] = 20.0,
    ["WEAPON_GUSENBERG"] = 25.0,
    ["weapon_militaryrifle"] = 25.0,
    ["weapon_sawnoffshotgun"] = 20.0,
    ["weapon_assaultsmg"] = 20.0,
    ["weapon_smg"] = 20.0,
    ["weapon_specialcarbine"] = 20.0,
    ["weapon_bullpuprifle"] = 20.0,
    ["WEAPON_BAT"] = 10.0,
    ["WEAPON_BOTTLE"] = 10.0,
    ["WEAPON_CROWBAR"] = 10.0,
    ["WEAPON_FLASHLIGHT"] = 10.0,
    ["WEAPON_GOLFCLUB"] = 10.0,
    ["WEAPON_HAMMER"] = 10.0,
    ["WEAPON_HATCHET"] = 10.0,
    ["WEAPON_KNUCKLE"] = 10.0,
    ["WEAPON_KNIFE"] = 10.0,
    ["WEAPON_MACHETE"] = 10.0,
    ["WEAPON_SWITCHBLADE"] = 10.0,
    ["WEAPON_WRENCH"] = 10.0,
    ["WEAPON_BATTLEAXE"] = 10.0,
    ["WEAPON_POOLCUE"] = 10.0,
    ["WEAPON_PISTOL50"] = 10.0,
    ["WEAPON_SNSPISTOL"] = 10.0,
    ["WEAPON_HEAVYPISTOL"] = 10.0,
    ["WEAPON_REVOLVER"] = 10.0,
    ["WEAPON_MICROSMG"] = 10.0,
    ["WEAPON_MACHINEPISTOL"] = 10.0,
    ["WEAPON_DBSHOTGUN"] = 10.0,
    ["WEAPON_MINISMG"] = 10.0,
    ["WEAPON_BULLPUPSHOTGUN"] = 10.0,
    ["WEAPON_BULLPUPRIFLE"] = 10.0,
    ["WEAPON_COMPACTRIFLE"] = 10.0,
    ["WEAPON_MG"] = 20.0,
}

Config.ClothesWeight = {
    ["top"] = 0.0,
    ["pants"] = 0.0,
    ["outfit"] = 0,
    ["shoes"] = 0.0,
    ["bags"] = 0.0,
    ["glasses"] = 0.0,
    ["ears"] = 0.0,
    ["helmet"] = 0.0,
    ["bracelets"] = 0.0,
    ["watches"] = 0.0,
    ["chain"] = 0.0,
    ["mask"] = 0.0,
}

--╚════════════════════════════════════════════════════════════════════════════════╝

