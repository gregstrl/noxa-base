AK4Y = {}

AK4Y.Framework = "esx" 
AK4Y.Mysql = "oxmysql" 
AK4Y.OpenCommand = "caseKays"

AK4Y.WeaponsAreItem = false 

AK4Y.NeededPlayTime = 60
AK4Y.PlayTimeRewardType = "Wise"
AK4Y.PlayTimeRewardCoin = 0

AK4Y.WebsiteLink = "https://Koy.tebex.io/"
AK4Y.DiscordLink = "https://discord.gg/wisefa/"

AK4Y.LastItemCategories = {"uncommon", "rare", "mythical", "legendary"} -- When items of the type written on the left are won, they appear in the recently won items tab
AK4Y.ServerNotifyCategories = {"uncommon", "mythical", "legendary"} -- When items of the type written on the left are won, a notification is sent to the entire server

AK4Y.Translate = {
    title1 = "Caisses",
    title2 = "Mystères",
    premium = "PREMIUM",
    standard = "STANDARD",
    cases = "CAISSES",
    website = "SITE",
    discord = "DISCORD",
    premiumCases = "CAISSES PREMIUM",
    standardCases = "CAISSES STANDARD",
    openCase = "OUVRIR CAISSE",
    openFast = "OUVERTURE RAPIDE",
    coinShopTitle = "Coins",
    new = "",
    goBack = "RETOUR",
    caseItems = "Gains",
    items = "Objets :",
    congratulations = "FÉLICITATION !",
    congDescription = "Merci pour votre achat !",
    collect = "PRENDRE",
    sell = "VENDRE",
    accept = "ACCEPTER",
    creditLoaded = "Coins chargé avec succès",
    failed = "ERREUR",
    youDntHaveEnoughCredit = "VOUS N'AVEZ PAS ASSEZ DE STORYCOINS !",
}



-- giveItemType's = "item", "vehicle", "money"
-- items in the case should have a chance total of 100 !! IMPORTANT !! IMPORTANT !! IMPORTANT !!
AK4Y.PremiumCases = {
    {
        uniqueId = 1, -- IDs must be different and sequential
        label = "Caisse Amateur #1",
        price = 1000,
        priceType = "Coins", -- Coins OR SC
        caseTheme = "red", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = { -- giveItemType's = "item", "vehicle", "money", "weapon"
        { itemName = "Coins_2500", label = "2.500 Coins", chance = 1, sellCredit = 0, itemType = "mythical", itemCount = 2500, giveItemType = "coins", image = "./images/items/coins.png" },
        --{ itemName = "weapon_SCARSC", label = "SCARSC NON PERM", chance = 2, sellCredit = 500, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_SCARSC.png" },
        { itemName = "money_250000", label = "500.000$", chance = 4, sellCredit = 250, itemType = "mythical", itemCount = 500000, giveItemType = "money", image = "./images/items/money.png" },
        { itemName = "money_250000", label = "300.000$", chance = 6, sellCredit = 250, itemType = "legendary", itemCount = 300000, giveItemType = "money", image = "./images/items/money.png" },
        { itemName = "r820", label = "R8", chance = 7, sellCredit = 500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R8.png" },
        { itemName = "rmodr50", label = "R50", chance = 6, sellCredit = 500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R50.png" },
        { itemName = "rs5mans", label = "R5", chance = 8, sellCredit = 500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R5.png" },
        { itemName = "Coins_2000", label = "2.000 Coins", chance = 2, sellCredit = 0, itemType = "rare", itemCount = 2000, giveItemType = "coins", image = "./images/items/coins.png" },
        { itemName = "money_250000", label = "170.000$", chance = 11, sellCredit = 250, itemType = "rare", itemCount = 170000, giveItemType = "money", image = "./images/items/money.png" },
        { itemName = "money_250000", label = "150.000$", chance = 11, sellCredit = 250, itemType = "rare", itemCount = 150000, giveItemType = "money", image = "./images/items/money.png" },
        { itemName = "money_150000", label = "100.000$", chance = 10, sellCredit = 250, itemType = "rare", itemCount = 100000, giveItemType = "money", image = "./images/items/money.png" },
        { itemName = "Coins_1000", label = "1.000 Coins", chance = 12, sellCredit = 0, itemType = "common", itemCount = 1000, giveItemType = "coins", image = "./images/items/coins.png" },
        },
    },
    {
        uniqueId = 2, -- IDs must be different and sequential
        label = "Caisse intermédiaire #2",
        price = 2000,
        priceType = "Coins", -- Coins OR SC
        caseTheme = "blue", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "Coins_4000", label = "4.000 Coins", chance = 1, sellCredit = 0, itemType = "mythical", itemCount = 4000, giveItemType = "coins", image = "./images/items/coins.png" },
            { itemName = "money_750000", label = "750.000$", chance = 2, sellCredit = 500, itemType = "mythical", itemCount = 750000, giveItemType = "money", image = "./images/items/money.png" },
            --{ itemName = "weapon_ACWR", label = "ACWR NON PERM", chance = 2, sellCredit = 1000, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_ACWR.png" },
           -- { itemName = "weapon_AK47", label = "AK47 NON PERM", chance = 4, sellCredit = 1000, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_AK47.png" },
           -- { itemName = "weapon_SCARSC", label = "SCARSC NON PERM", chance = 2, sellCredit = 1000, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_SCARSC.png" },
           -- { itemName = "weapon_G3_2", label = "G32 NON PERM", chance = 2, sellCredit = 1000, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_G3_2.png" },
            { itemName = "weapon_pistol50", label = "Pistol Calibre 50 NON PERM", chance = 3, sellCredit = 500, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/items/snsmk2.png" },
            { itemName = "weapon_FN502", label = "FN502 NON PERM", chance = 17, sellCredit = 500, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_FN502.png" },
            { itemName = "money_500000", label = "500.000$", chance = 5, sellCredit = 500, itemType = "legendary", itemCount = 500000, giveItemType = "money", image = "./images/items/money.png" },
            { itemName = "rmodf40", label = "F40", chance = 6, sellCredit = 1000, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/F40.png" },
            { itemName = "gt63", label = "GT63", chance = 4, sellCredit = 1000, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/gt63.png" },
            { itemName = "rs5mans", label = "R5", chance = 5, sellCredit = 1500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R5.png" },
            { itemName = "rmodr50", label = "R50", chance = 5, sellCredit = 1500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R50.png" },
            { itemName = "r820", label = "R8", chance = 5, sellCredit = 1500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R8.png" },
            { itemName = "money_300000", label = "300.000$", chance = 6, sellCredit = 500, itemType = "rare", itemCount = 300000, giveItemType = "money", image = "./images/items/money.png" },
            { itemName = "Coins_2000", label = "2.000 Coins", chance = 11, sellCredit = 0, itemType = "common", itemCount = 2000, giveItemType = "coins", image = "./images/items/coins.png" },

        },
    },
    {
        uniqueId = 3, -- IDs must be different and sequential
        label = "Caisse Confirmé #3",
        price = 3000,
        priceType = "Coins", -- Coins OR SC
        caseTheme = "orange", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "Coins_6000", label = "6.000 Coins", chance = 1, sellCredit = 0, itemType = "mythical", itemCount = 6000, giveItemType = "coins", image = "./images/items/coins.png" },
            --{ itemName = "weapon_HOWA_2", label = "HOWA2 NON PERM", chance = 2, sellCredit = 1000, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_HOWA_2.png" },
           -- { itemName = "weapon_OWSHOTGUN", label = "OWSHOTGUN NON PERM", chance = 2, sellCredit = 1500, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_OWSHOTGUN.png" },
           -- { itemName = "weapon_AK47", label = "AK47 NON PERM", chance = 3, sellCredit = 1500, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_AK47.png" },
           -- { itemName = "weapon_LR300", label = "LR300 NON PERM", chance = 4, sellCredit = 1500, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_LR300.png" },
          --  { itemName = "weapon_ANARCHY", label = "ANARCHY NON PERM", chance = 5, sellCredit = 1000, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_ANARCHY.png" },
            { itemName = "money_75000", label = "750.000$", chance = 4, sellCredit = 2000, itemType = "legendary", itemCount = 750000, giveItemType = "money", image = "./images/items/money.png" },
            { itemName = "rmodf40", label = "F40", chance = 6, sellCredit = 2000, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/F40.png" },
            { itemName = "gt63", label = "GT63", chance = 5, sellCredit = 2000, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/gt63.png" },
            { itemName = "rs5mans", label = "R5", chance = 6, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R5.png" },
            { itemName = "rmodr50", label = "R50", chance = 6, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R50.png" },
            { itemName = "r820", label = "R8", chance = 7, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R8.png" },
            { itemName = "money_500000", label = "500.000$", chance = 5, sellCredit = 1000, itemType = "rare", itemCount = 500000, giveItemType = "money", image = "./images/items/money.png" },
            { itemName = "money_250000", label = "250.000$", chance = 6, sellCredit = 500, itemType = "common", itemCount = 250000, giveItemType = "money", image = "./images/items/money.png" },
            { itemName = "Coins_3000", label = "3.000 Coins", chance = 13, sellCredit = 0, itemType = "uncommon", itemCount = 3000, giveItemType = "coins", image = "./images/items/coins.png" },
        },
    },
    {
        uniqueId = 4, -- IDs must be different and sequential
        label = "Caisse Expert #4",
        price = 4000,
        priceType = "Coins", -- Coins OR SC
        caseTheme = "purple", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "Coins_8000", label = "8.000 Coins", chance = 1, sellCredit = 0, itemType = "mythical", itemCount = 8000, giveItemType = "coins", image = "./images/items/coins.png" },
            { itemName = "money_100000", label = "5.000.000$", chance = 4, sellCredit = 3000, itemType = "mythical", itemCount = 5000000, giveItemType = "money", image = "./images/items/money.png" },
           -- { itemName = "weapon_OWSHOTGUN", label = "OWSHOTGUN NON PERM", chance = 4, sellCredit = 1500, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_OWSHOTGUN.png" },
          --  { itemName = "weapon_HOWA_2", label = "HOWA2 NON PERM", chance = 6, sellCredit = 1000, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_HOWA_2.png" },
          --  { itemName = "weapon_ACWR", label = "ACWR NON PERM", chance = 9, sellCredit = 1500, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_ACWR.png" },
            { itemName = "rmodf40", label = "F40", chance = 6, sellCredit = 3000, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/F40.png" },
            { itemName = "ferrari812super", label = "812SUPER", chance = 6, sellCredit = 2500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/ferrari812super.png" },
            { itemName = "rs5mans", label = "R5", chance = 5, sellCredit = 3000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R5.png" },
            { itemName = "rmodr50", label = "R50", chance = 6, sellCredit = 3000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R50.png" },
            { itemName = "r820", label = "R8", chance = 7, sellCredit = 3000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R8.png" },
            { itemName = "money_750000", label = "750.000$", chance = 5, sellCredit = 2500, itemType = "rare", itemCount = 750000, giveItemType = "money", image = "./images/items/money.png" },
            { itemName = "money_500000", label = "500.000$", chance = 6, sellCredit = 1500, itemType = "common", itemCount = 500000, giveItemType = "money", image = "./images/items/money.png" },
            { itemName = "money_250000", label = "250.000$", chance = 5, sellCredit = 1000, itemType = "common", itemCount = 250000, giveItemType = "money", image = "./images/items/money.png" },
            { itemName = "Coins_4000", label = "4.000 Coins", chance = 12, sellCredit = 0, itemType = "uncommon", itemCount = 4000, giveItemType = "coins", image = "./images/items/coins.png" },
        },
    },
     {
         uniqueId = 5, -- IDs must be different and sequential
         label = "Caisse Argent #1",
         price = 1000,
         priceType = "Coins", -- Coins OR SC
         caseTheme = "green", -- red, blue, orange, purple, green
         caseType = "premium",
         isNew = true, -- If you set it true, the case will be labeled "new"
         items = {
             { itemName = "money", label = "150.000$", chance = 10, sellCredit = 500, itemType = "common", itemCount = 150000, giveItemType = "money", image = "./images/items/money.png" },
             { itemName = "money", label = "160.000$", chance = 8, sellCredit = 500, itemType = "common", itemCount = 160000, giveItemType = "money", image = "./images/items/money.png" },
             { itemName = "money", label = "170.000$", chance = 8, sellCredit = 500, itemType = "uncommon", itemCount = 170000, giveItemType = "money", image = "./images/items/money.png" },
             { itemName = "money", label = "180.000$", chance = 7, sellCredit = 500, itemType = "uncommon", itemCount = 180000, giveItemType = "money", image = "./images/items/money.png" },
             { itemName = "money", label = "200.000$", chance = 7, sellCredit = 500, itemType = "rare", itemCount = 200000, giveItemType = "money", image = "./images/items/money.png" },
             { itemName = "money", label = "250.000$", chance = 8, sellCredit = 500, itemType = "rare", itemCount = 250000, giveItemType = "money", image = "./images/items/money.png" },
             { itemName = "money", label = "300.000$", chance = 5, sellCredit = 500, itemType = "legendary", itemCount = 300000, giveItemType = "money", image = "./images/items/money.png" },
             { itemName = "money", label = "500.000$", chance = 4, sellCredit = 500, itemType = "legendary", itemCount = 500000, giveItemType = "money", image = "./images/items/money.png" },
             { itemName = "money", label = "1.000.000$", chance = 3, sellCredit = 500, itemType = "mythical", itemCount = 1000000, giveItemType = "money", image = "./images/items/money.png" },
             { itemName = "money", label = "5.000.000$", chance = 1, sellCredit = 500, itemType = "mythical", itemCount = 5000000, giveItemType = "money", image = "./images/items/money.png" },
         },
     },
    {
        uniqueId = 7, -- IDs must be different and sequential
        label = "Caisse Voiture #1",
        price = 2500,
        priceType = "Coins", -- Coins OR SC
        caseTheme = "orange", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "centuria", label = "Centuria", chance = 5, sellCredit = 1500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/centuria.png" },
            { itemName = "gcmlamboultimae", label = "GCM", chance = 6, sellCredit = 1500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/gcmlamboultimae.png" },
            { itemName = "sian", label = "SIAN", chance = 4, sellCredit = 1500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/sian.png" },
            { itemName = "gt63", label = "GT63", chance = 6, sellCredit = 1500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/gt63.png" },
            { itemName = "f8kspider", label = "F8 SPIDER", chance = 7, sellCredit = 1500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/f8kspider.png" },
            { itemName = "ferrari812super", label = "812SUPER", chance = 6, sellCredit = 1500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/ferrari812super.png" },
            { itemName = "488mishasp", label = "488MISHASHP", chance = 6, sellCredit = 1500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/488mishasp.png" },
            { itemName = "q8prior", label = "Q8", chance = 8, sellCredit = 1500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/q8prior.png" },
            { itemName = "g900przemo6x6", label = "G900", chance = 8, sellCredit = 1500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/g900przemo6x6.png" },
            { itemName = "rs5mans", label = "R5", chance = 12, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R5.png" },
            { itemName = "evo9", label = "EVO9", chance = 7, sellCredit = 1500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/evo9.png" },
            { itemName = "rmodr50", label = "R50", chance = 13, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R50.png" },
            { itemName = "r820", label = "R8", chance = 14, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/R8.png" },
        },
    },
    --[[{
        uniqueId = 9, -- IDs must be different and sequential
        label = "Caisse Noël",
        price = 2500,
        priceType = "Coins", -- Coins OR SC
        caseTheme = "orange", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "Coins_4000", label = "4.000 Coins", chance = 2, sellCredit = 0, itemType = "uncommon", itemCount = 4000, giveItemType = "coins", image = "./images/items/coins.png" },
            { itemName = "weapon_OWSHOTGUN", label = "OWSHOTGUN NON PERM", chance = 3, sellCredit = 1000, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_OWSHOTGUN.png" },
            { itemName = "22m5", label = "BMW M5 CS", chance = 4, sellCredit = 1000, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/m5.png" },
            { itemName = "centuria", label = "Centuria", chance = 6, sellCredit = 1000, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/centuria.png" },
            { itemName = "weapon_H2SMG", label = "H2SMG NON PERM", chance = 9, sellCredit = 1000, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_H2SMG.png" },
            { itemName = "sian", label = "SIAN", chance = 6, sellCredit = 1000, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/sian.png" },
            { itemName = "gt63", label = "GT63", chance = 7, sellCredit = 1000, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/gt63.png" },
            { itemName = "weapon_HOWA_2", label = "HOWA2 NON PERM", chance = 8, sellCredit = 1000, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_HOWA_2.png" },
            { itemName = "ferrari812super", label = "812SUPER", chance = 7, sellCredit = 1000, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/ferrari812super.png" },
            { itemName = "488mishasp", label = "488MISHASHP", chance = 8, sellCredit = 1000, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/488mishasp.png" },
            { itemName = "q8prior", label = "Q8", chance = 9, sellCredit = 1000, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/q8prior.png" },
            { itemName = "g900przemo6x6", label = "G900", chance = 9, sellCredit = 1000, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/g900przemo6x6.png" },
            { itemName = "weapon_AK47", label = "AK47 NON PERM", chance = 8, sellCredit = 1000, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_AK47.png" },
            { itemName = "evo9", label = "EVO9", chance = 8, sellCredit = 1000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/evo9.png" },
        },
    },]]
    
    --[[{
        uniqueId = 6, -- IDs must be different and sequential
        label = "Caisse Special #2 (Armes Blanche)",
        price = 1500,
        priceType = "Coins", -- Coins OR SC
        caseTheme = "green", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_switchblade", label = "Switchblade", chance = 13, sellCredit = 750, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_switchblade.png" },
            { itemName = "weapon_battleaxe", label = "Hache de combat", chance = 13, sellCredit = 750, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_battleaxe.png" },
            { itemName = "weapon_wrench", label = "Clé anglaise", chance = 13, sellCredit = 750, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_wrench.png" },
            { itemName = "weapon_karambit", label = "Karambit", chance = 13, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/karambit.png" },
            { itemName = "weapon_lucile", label = "Lucille", chance = 13, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/lucile.png" },
            { itemName = "weapon_tridagger", label = "Tri-Dagger", chance = 5, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/knife2.png" },
            { itemName = "weapon_pan", label = "Poêle", chance = 5, sellCredit = 750, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/items/poele.png" },
            { itemName = "weapon_bayonet", label = "Bayonet", chance = 2, sellCredit = 750, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/items/bayonet.png" },
            { itemName = "weapon_katana", label = "Katana", chance = 2, sellCredit = 750, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/items/katana.png" },
        },
    },
    {
        uniqueId = 7, -- IDs must be different and sequential
        label = "Caisse Special #3 (Vehicules)",
        price = 4000,
        priceType = "Coins", -- Coins OR SC
        caseTheme = "red", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "megrs18", label = "Renault Megane RS", chance = 10.0, sellCredit = 2500, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/items/megrs18.png" },
            { itemName = "golf75r19", label = "Volkswagen Golf 7.5R", chance = 10.0, sellCredit = 2500, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/items/golf75r19.png" },
            { itemName = "m5cs22", label = "BMW M5 CS", chance = 8.0, sellCredit = 2500, itemType = "uncommon", itemCount = 1, giveItemType = "vehicle", image = "./images/items/m5cs22.png" },
            { itemName = "cls63s", label = "Mercedes CLS 63", chance = 8.0, sellCredit = 2500, itemType = "uncommon", itemCount = 1, giveItemType = "vehicle", image = "./images/items/cls63s.png" },
            { itemName = "x6mf96", label = "BMW X6M F96", chance = 8.0, sellCredit = 2500, itemType = "uncommon", itemCount = 1, giveItemType = "vehicle", image = "./images/items/x6mf96.png" },
            { itemName = "gls63", label = "Mercedes GLS 63", chance = 7.5, sellCredit = 2500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/gls63.png" },
            { itemName = "panamturs21", label = "Porsche Panamera Turismo", chance = 7.0, sellCredit = 2500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/panamturs21.png" },
            { itemName = "m5tou", label = "BMW M5 Touring", chance = 7.0, sellCredit = 2500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/m5tou.png" },
            { itemName = "gcmrs3sedan2022", label = "Audi RS3 Sedan", chance = 7.0, sellCredit = 2500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/gcmrs3sedan2022.png" },
            { itemName = "vclass21", label = "Mercedes Classe V", chance = 7.0, sellCredit = 2500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/vclass21.png" },
            { itemName = "gcm992gt3", label = "Porsche 911 GT3", chance = 6.0, sellCredit = 2500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/gcm992gt3.png" },
            { itemName = "x7m60i", label = "BMW X7 M60i", chance = 5.0, sellCredit = 2500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/x7m60i.png" },
            { itemName = "gcmrsq82022", label = "Audi RSQ8", chance = 5.0, sellCredit = 2500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/gcmrsq82022.png" },
            { itemName = "golf8r", label = "Volkswagen Golf 8R", chance = 4.5, sellCredit = 2500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/golf8r.png" },
            { itemName = "taycants21m", label = "Taycan Mansory", chance = 3.5, sellCredit = 2500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/taycants21m.png" },
            { itemName = "m3touring", label = "BMW M3 Touring", chance = 3.5, sellCredit = 2500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/m3touring.png" },
            { itemName = "glsbrabus800", label = "Brabus GLS 800", chance = 3.0, sellCredit = 2500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/glsbrabus800.png" },
            { itemName = "ikx3m2p23", label = "BMW M2 Perf 2023", chance = 2.5, sellCredit = 2500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/ikx3m2p23.png" },
            { itemName = "718gt4rs", label = "Porsche 718 GT4RS", chance = 2.0, sellCredit = 2500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/718gt4rs.png" },
            { itemName = "bshadow800", label = "Brabus Classe G800", chance = 1.8, sellCredit = 2500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/bshadow800.png" },
            { itemName = "gcmferraripurosangue", label = "Ferrari Purosangue", chance = 1.6, sellCredit = 2500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/gcmferraripurosangue.png" },
            { itemName = "lp780r", label = "Lamborghini LP780", chance = 1.5, sellCredit = 2500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/lp780r.png" },
            { itemName = "sf90af", label = "Ferrari SF90", chance = 1.0, sellCredit = 2500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/sf90af.png" },
            { itemName = "x3utopia23", label = "Pagani Utopia", chance = 0.5, sellCredit = 2500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/items/x3utopia23.png" },
        },
    },]]
}

AK4Y.SellCoins = {
    {
        coinCount = 1000,
        realPrice = 12,
    },
    {
        coinCount = 2000,
        realPrice = 24,
    },
    {
        coinCount = 4000,
        realPrice = 48,
    },
    {
        coinCount = 5500,
        realPrice = 60,
    },
    {
        coinCount = 11500,
        realPrice = 120,
    },
    {
        coinCount = 22500,
        realPrice = 240,
    },
    {
        coinCount = 34400,
        realPrice = 360,
    },
    
}

