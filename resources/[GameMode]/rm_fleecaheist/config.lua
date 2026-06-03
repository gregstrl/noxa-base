--rainmad#0678
--discord.gg/rccvdkmA5X
Config = {}

--Add gold, diamond item to database or change item names in bottom. (dont need add cash item)
Config['FleecaMain'] = {
    requiredPoliceCount = 4,
    requiredItems = {
        'drill', -- Add item to database
    },
    rewardItems = {
        cashTrolly = { 
            item = nil, -- cash
            count = 1000,
            multiGrabCount = 3, -- middle main grab
        },
        lockbox = function()
            local lockboxBag = { -- cash for safety box drill reward
                item = nil,
                count = 1000
            }
            return lockboxBag
        end,
    },
    grabReward = function() -- dont change this
        return 'cash'
    end,
    trollyReward = function() -- dont change this
        return 'cash'
    end,
    finishHeist = {
        buyerPos = vector3(1291.268799, -3142.987549, 5.906262)
    }
}

Config['FleecaHeist'] = {
    [1] = {
        scenePed = { model = 'csb_tomcasino', coords = vector3(-2960.715332, 479.675140, 15.696932), heading = 177.26629638672}, -- ped settings
        scenePos = vector3(-2958.695, 478.2697, 14.7), -- start ped pos
        sceneRot = vector3(0.0, 0.0, -92.24812), -- start ped rotation
        scenePedWalkCoords = vector3(-2964.6, 482.968, 15.7068),
        doorHeading = {300.0, 300.0}, -- inside doors rotation
        grab = { -- middle main grab point
            pos = vector3(-2954.2, 484.377, 15.525),
            heading = 270.0,
            loot = false
        },
        drills = { -- drill points
            {coords = vector3(-2952.2, 484.135, 15.9253), rotation = vector3(0.0, 0.0, 265.0), loot = false},
            {coords = vector3(-2954.0, 486.676, 15.9253), rotation = vector3(0.0, 0.0, 355.0), loot = false},
            {coords = vector3(-2954.2, 482.120, 15.9253), rotation = vector3(0.0, 0.0, 185.0), loot = false},
        },
        trollys = { -- trollys points
            {coords = vector3(-2957.3, 485.690, 14.6753), heading = 178.0, loot = false},
            {coords = vector3(-2958.4, 484.099, 14.6753), heading = 268.0, loot = false},
        },
        nextRob = 1800, -- seconds
    },
    [2] = {
        scenePed = { model = 'csb_tomcasino', coords = vector3(-1214.718384, -334.016113, 37.780918), heading = 121.32421875},
        scenePos = vector3(-1214.835, -336.3697, 36.78),
        sceneRot = vector3(0.0, 0.0, -152.9346),
        scenePedWalkCoords = vector3(-1213.6, -328.57, 37.7907),
        doorHeading = {240.0, 240.0},
        grab = {
            pos = vector3(-1207.6, -337.40, 37.6093),
            heading = 210.0,
            loot = false
        },
        drills = {
            {coords = vector3(-1205.1, -336.54, 37.9593), rotation = vector3(0.0, 0.0, -60.0), loot = false},
            {coords = vector3(-1206.4, -339.10, 37.9593), rotation = vector3(0.0, 0.0, 200.0), loot = false},
            {coords = vector3(-1209.1, -338.87, 37.9593), rotation = vector3(0.0, 0.0, 120.0), loot = false},
        },
        trollys = {
            {coords = vector3(-1207.6, -333.89, 36.7592), heading = 118.0, loot = false},
            {coords = vector3(-1209.4, -333.79, 36.7592), heading = 208.0, loot = false},
        },
        nextRob = 1800,
    },
    [3] = {
        scenePed = { model = 'csb_tomcasino', coords = vector3(-354.596649, -50.863094, 49.036423), heading = 66.326042175293},
        scenePos = vector3(-356.5303, -52.26782, 48.05),
        sceneRot = vector3(0.0, 0.0, -198.9691),
        scenePedWalkCoords = vector3(-350.10, -47.569, 49.0462),
        doorHeading = {200.0, 200.0},
        grab = {
            pos = vector3(-352.23, -58.215, 48.848),
            heading = 160.0,
            loot = false
        },
        drills = {
            {coords = vector3(-354.15, -57.592, 49.3147), rotation = vector3(0.0, 0.0, 75.0), loot = false},
            {coords = vector3(-352.81, -60.155, 49.3147), rotation = vector3(0.0, 0.0, 160.0), loot = false},
            {coords = vector3(-349.70, -59.020, 49.3147), rotation = vector3(0.0, 0.0, 260.0), loot = false},
        },
        trollys = {
            {coords = vector3(-349.86, -55.756, 48.0148), heading = 70.0, loot = false},
            {coords = vector3(-351.02, -54.136, 48.0148), heading = 162.0, loot = false},
        },
        nextRob = 1800,
    },
    [4] = {
        scenePed = { model = 'csb_tomcasino', coords = vector3(310.367279, -279.720062, 54.164635), heading = 66.476173400879},
        scenePos = vector3(308.598, -281.3508, 53.16),
        sceneRot = vector3(0.0, 0.0, -200.1235),
        scenePedWalkCoords = vector3(315.079, -276.63, 54.1744),
        doorHeading = {200.0, 200.0},
        grab = {
            pos = vector3(312.756, -287.41, 54.0),
            heading = 160.0,
            loot = false
        },
        drills = {
            {coords = vector3(310.867, -286.82, 54.4430), rotation = vector3(0.0, 0.0, 75.0), loot = false},
            {coords = vector3(312.411, -289.41, 54.4430), rotation = vector3(0.0, 0.0, 160.0), loot = false},
            {coords = vector3(315.230, -288.20, 54.4430), rotation = vector3(0.0, 0.0, 260.0), loot = false},
        },
        trollys = {
            {coords = vector3(315.230, -284.93, 53.1430), heading = 70.0, loot = false},
            {coords = vector3(314.184, -283.42, 53.1430), heading = 160.0, loot = false},
        },
        nextRob = 1800,
    },
    [5] = {
        scenePed = { model = 'csb_tomcasino', coords = vector3(1178.105713, 2708.849365, 38.087902), heading = 265.18615722656},
        scenePos = vector3(1179.56, 2710.876, 37.09),
        sceneRot = vector3(0.0, 0.0, 0.2100044),
        scenePedWalkCoords = vector3(1175.13, 2704.27, 38.0977),
        doorHeading = {40.0, 40.0},
        grab = {
            pos = vector3(1173.45, 2715.08, 37.9162),
            heading = 360.0,
            loot = false
        },
        drills = {
            {coords = vector3(1173.34, 2717.16, 38.3363), rotation = vector3(0.0, 0.0, 0.0), loot = false},
            {coords = vector3(1175.52, 2715.16, 38.3363), rotation = vector3(0.0, 0.0, 275.0), loot = false},
            {coords = vector3(1170.95, 2715.26, 38.3363), rotation = vector3(0.0, 0.0, 90.0), loot = false},
        },
        trollys = {
            {coords = vector3(1172.02, 2712.01, 37.0662), heading = 270.0, loot = false},
            {coords = vector3(1173.69, 2710.93, 37.0662), heading = 0.0, loot = false},
        },
        nextRob = 1800,
    },
    [6] = {
        scenePed = { model = 'csb_tomcasino', coords = vector3(146.259262, -1041.560181, 29.367928), heading = 69.901031494141},
        scenePos = vector3(144.2593, -1042.969, 28.37),
        sceneRot = vector3(0.0, 0.0, -200.384),
        scenePedWalkCoords = vector3(150.710, -1038.4, 29.3777),
        doorHeading = {200.0, 200.0},
        grab = {
            pos = vector3(148.431, -1049.1, 29.19),
            heading = 160.0,
            loot = false
        },
        drills = {
            {coords = vector3(146.459, -1048.4, 29.6162), rotation = vector3(0.0, 0.0, 70.0), loot = false},
            {coords = vector3(148.095, -1051.1, 29.6162), rotation = vector3(0.0, 0.0, 170.0), loot = false},
            {coords = vector3(150.969, -1049.8, 29.6162), rotation = vector3(0.0, 0.0, 250.0), loot = false},
        },
        trollys = {
            {coords = vector3(151.036, -1046.6, 28.3462), heading = 70.0, loot = false},
            {coords = vector3(149.887, -1045.1, 28.3462), heading = 160.0, loot = false},
        },
        nextRob = 1800,
    }
}

Strings = {
    ['wait_nextheist'] = 'Vous devez patienter afin de refaire un braquage',
    ['minute'] = 'minutes.',
    ['need_item'] = 'Vous avez besoin : ',
    ['police_alert'] = 'Alerte braquage de banque Fleeca ! Vérifiez votre GPS.',
    ['drill'] = 'Appuyez sur ~INPUT_CONTEXT~ pour utiliser l\'exercice',
    ['grab_trolly'] = 'Appuyez sur ~INPUT_CONTEXT~ pour récupérer le chariot',
    ['grab'] = 'Appuyez sur ~INPUT_CONTEXT~ pour saisir',
    ['deliver_to_buyer'] = 'Livrez le butin à l\'acheteur. Vérifiez le GPS.',
    ['buyer_blip'] = 'Acheteur',
    ['need_police'] = 'Pas assez de policiers dans la ville.',
    ['total_money'] = 'Tu as : '
}

--Dont change cuzz those main and required things.
GrabCash = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s'
    },
    ['animations'] = {
        {'enter', 'enter_bag'},
        {'grab', 'grab_bag', 'grab_cash'},
        {'grab_idle', 'grab_idle_bag'},
        {'exit', 'exit_bag'},
    },
    ['scenes'] = {},
    ['scenesObjects'] = {}
}

LaserDrill = {
    ['animations'] = {
        {'intro', 'bag_intro', 'intro_drill_bit'},
        {'drill_straight_start', 'bag_drill_straight_start', 'drill_straight_start_drill_bit'},
        {'drill_straight_end_idle', 'bag_drill_straight_idle', 'drill_straight_idle_drill_bit'},
        {'drill_straight_fail', 'bag_drill_straight_fail', 'drill_straight_fail_drill_bit'},
        {'drill_straight_end', 'bag_drill_straight_end', 'drill_straight_end_drill_bit'},
        {'exit', 'bag_exit', 'exit_drill_bit'},
    },
    ['scenes'] = {}
}

Trolly = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s'
    },
    ['animations'] = {
        {'intro', 'bag_intro'},
        {'grab', 'bag_grab', 'cart_cash_dissapear'},
        {'exit', 'bag_exit'}
    },
    ['scenes'] = {}
}