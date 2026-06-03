ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

---@class Afk
Afk = {

    Zone = vector3(-1266.943115, -3013.040771, -48.490223),
    NPC = {
        pos = vector3(-259.2175, -901.0394, 32.31),
        heading = 70.82,
        name = "Zone AFK"
    },

    Leaderboard = {
        [1] = vector3(-1266.710083, -3008.387451, -48.490223),
    },

    Case = {
           {label = 'Caisse Diamond', name = 'Caisse Diamond AFK', price = 500, rewards = {

            {label = '250.000$', name = 'money_750000', type = 'money', count = 250000, chance = 1},
            {label = '200.000$', name = 'money_500000', type = 'money', count = 200000, chance = 2},
            {label = '100.000$', name = 'money_300000', type = 'money', count = 100000, chance = 3},
            {label = '75.000$', name = 'money_300000', type = 'money', count = 75000, chance = 4},
            {label = '250 Bitcoin', name = 'bitcoin', type = 'item', count = 250, chance = 5},
            {label = 'FN502', name = 'weapon_FN502', type = 'weapon', count = 1, chance = 3},
            {label = '3 Kevlar Lourd', name = 'kevlar', type = 'item', count = 5, chance = 5},
        }},

        -- Case 2

        {label = 'Caisse Ruby', name = 'Caisse Ruby AFK', price = 1000, rewards = {

            {label = '400.000$', name = 'money_1000000', type = 'money', count = 400000, chance = 1},
            {label = '250.000$', name = 'money_500000', type = 'money', count = 250000, chance = 1},
            {label = '200.000$', name = 'money_300000', type = 'money', count = 200000, chance = 2},
            {label = '150.000$', name = 'money_300000', type = 'money', count = 150000, chance = 3},
            {label = '500 Bitcoin', name = 'bitcoin', type = 'item', count = 500, chance = 4},
            {label = 'H2SMG', name = 'weapon_H2SMG', type = 'weapon', count = 1, chance = 2},
            {label = '5 Kevlar Lourd', name = 'kevlar', type = 'item', count = 5, chance = 4},
          {label = '500 StoryCoins', name = 'coins', type = 'coins', count = 500, chance = 1},
        }},

        {label = 'Caisse Argent #1', name = 'Caisse Argent AFK', price = 2500, rewards = {
            {label = '1.000.000$', name = 'money_1000000', type = 'money', count = 1000000, chance = 1},
            {label = '800.000$', name = 'money_1000000', type = 'money', count = 800000, chance = 2},
            {label = '650.000$', name = 'money_500000', type = 'money', count = 650000, chance = 2},
            {label = '400.000$', name = 'money_300000', type = 'money', count = 400000, chance = 3},
            {label = '300.000$', name = 'money_300000', type = 'money', count = 300000, chance = 3},
            {label = '200.000$', name = 'money_300000', type = 'money', count = 200000, chance = 4},
            {label = '180.000$', name = 'money_300000', type = 'money', count = 180000, chance = 4},
        }},

        {label = 'Caisse Arme #1', name = 'Caisse Arme AFK', price = 3500, rewards = {
            {label = 'KNR', name = 'weapon_KNR', type = 'weapon', count = 1, chance = 1},
             {label = 'H2SMG', name = 'weapon_H2SMG', type = 'weapon', count = 1, chance = 1},
             {label = 'CZ75', name = 'weapon_CZ75', type = 'weapon', count = 1, chance = 2},
             {label = 'PL14', name = 'weapon_PL14', type = 'weapon', count = 1, chance = 2},
             {label = 'FN502', name = 'weapon_FN502', type = 'weapon', count = 1, chance = 3},
             {label = 'Pistolet Calibre 50', name = 'weapon_pistol50', type = 'weapon', count = 1, chance = 3},
         }},
    },
}

