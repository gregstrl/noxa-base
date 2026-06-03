

pSocietyCFG = {

    --[[ Script  ]]

    Language = "fr",

    ESX = Config.Get.ESX,
    AddonAccount = "esx_addonaccount:getSharedAccount",
    BlackMoney = "dirtycash",

    --[[ Menu  ]]

    Title = "",

    SubTitle = "~g~Gestion de votre entreprise",

    Banner = {
        Display = true,
        Texture = nil,
        Name = nil,
    },

    Marker = {
        Type = 6,
        Scale = {0.9, 0.9, 0.9},
        Color = {0, 85, 255},
    },

    --[[ Zone ]]

    Zone = {

        {
            pos = vector3(1823.730347, 3690.923096, 39.12), 
            name = "usms",
            label = "U.S Marshal",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(843.0200, -1301.2408, 31.7655), 
            name = "sahp",
            label = "S.A.H.P",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },
        {
            pos = vector3(-432.803101, 6005.949219, 36.99), 
            name = "lsco",
            label = "L.S.C.O",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-583.485718, -928.847656, 28.15), 
            name = "journalist",
            label = "Weazel News",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-601.423340, -347.088654, 35.24), 
            name = "avocat",
            label = "Avocat",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },
        {
            pos = vector3(244.35, -3151.41, 3.33), 
            name = "club77",
            label = "Club 77",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },
        {
            pos = vector3(-432.9886, 6006.41, 36.99565),
            name = "bcso",
            label = "Blaine County Sheriff Office",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },
        {
            pos = vector3(434.1253, -999.1669, 35.6837),
            name = "sasp",
            label = "San Andreas State Police",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },
        {
            pos = vector3(-1007.996765, -265.037842, 44.79),
            name = "studio",
            label = "Studio",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },
        {
            pos = vector3(559.6364, -199.9118, 58.1526),
            name = "autoexotic",
            label = "Auto Exotic",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },
        {
            pos = vector3(-329.3750, -576.3210, 32.7744), 
            name = "ambulance",
            label = "San Andreas Medical Center",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-317.9983, -791.9860, 32.8324),
            name = "cardealer",
            label = "Los Santos Concessionaire",
            percent = 20,
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-920.0969, -2044.6534, 14.4509),
            name = "mecano",
            label = "Mécano",
            salary_max = 5000,
            percent = 20,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(113.22, -1320.85, 24.71),
            name = "unicorn",
            label = "Vanilla Unicorn",
            percent = 20,
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-1198.0063, -897.1452, 13.7984),
            name = "burgershot",
            label = "BurgerShot",
            percent = 20,
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-1601.939, -837.1781, 10.27275), 
            name = "taxi",
            label = "Taxi",
            percent = 20,
            salary_max = 5000,
            options = {
                money = true,
                wash = false,
                employees = true,
                grades = true
            },
        },

        {
            pos = vector3(-1900.308, 2068.858, 141.0207),
            name = "vigneron",
            label = "Vigneron",
            percent = 20,
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-349.1227, -131.3566, 42.0368),
            name = "mecano2",
            label = "LS Custom",
            percent = 20,
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-574.489929, -583.988892, 34.68),
            name = "gouv",
            label = "Gouvernement",
            percent = 20,
            salary_max = 15000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-1366.098389, -624.076782, 30.32),
            name = "bahamas",
            label = "Bahamas",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-296.775879, 6262.441406, 31.482992),
            name = "henhouse",
            label = "Hen House",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-844.8228, -338.8665, 44.7110),
            name = "realestateagent",
            label = "Agent immobilier",
            salary_max = 5000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },
        
    },
}