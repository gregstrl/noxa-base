// Configuration des recettes
window.CRAFT_RECIPES = {
    // Cocktails Spéciaux (45sc)
    "manhattan": {
        "name": "Manhattan",
        "image": "assets/items/manhattan.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "french_whisky", "label": "Whisky Français", "quantity": 1, "image": "assets/items/french_whisky_bottle.png" },
            { "name": "lemon", "label": "Citron", "quantity": 1, "image": "assets/items/lemon.png" },
            { "name": "mint", "label": "Feuille de Menthe", "quantity": 2, "image": "assets/items/mint.png" }
        ],
        "time": 45
    },
    "chouquette": {
        "name": "Chouquette",
        "image": "assets/items/chouquette.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "french_whisky_bottle", "label": "Whisky Français", "quantity": 1, "image": "assets/items/french_whisky_bottle.png" },
            { "name": "lemon", "label": "Citron", "quantity": 2, "image": "assets/items/lemon.png" }
        ],
        "time": 45
    },
    "siraxe": {
        "name": "Siraxe",
        "image": "assets/items/siraxe.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "orange_juice_bottle", "label": "Jus d'Orange", "quantity": 1, "image": "assets/items/orange_juice_bottle.png" },
            { "name": "tomato_juice_bottle", "label": "Jus de Tomate", "quantity": 1, "image": "assets/items/tomato_juice_bottle.png" },
            { "name": "vodka_pure_bottle", "label": "Vodka Pure", "quantity": 1, "image": "assets/items/vodka_pure_bottle.png" }
        ],
        "time": 45
    },
    "tvn": {
        "name": "TVN",
        "image": "assets/items/tvn.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "mint", "label": "Feuille de Menthe", "quantity": 2, "image": "assets/items/mint.png" },
            { "name": "cherries", "label": "Cerises", "quantity": 4, "image": "assets/items/cherries.png" },
            { "name": "love_liqueur_bottle", "label": "Liqueur d'amour", "quantity": 1, "image": "assets/items/love_liqueur_bottle.png" }
        ],
        "time": 45
    },
    "ca2frere": {
        "name": "Cas2Frère",
        "image": "assets/items/ca2frere.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "rum_20_bottle", "label": "Rhum de 20ans", "quantity": 1, "image": "assets/items/rum_20_bottle.png" },
            { "name": "lime", "label": "Citron Vert", "quantity": 2, "image": "assets/items/lime.png" },
            { "name": "milk_bottle", "label": "Lait", "quantity": 1, "image": "assets/items/milk_bottle.png" },
            { "name": "grenadine_syrup_bottle", "label": "Sirop de Grenadine", "quantity": 1, "image": "assets/items/grenadine_syrup_bottle.png" }
        ],
        "time": 45
    },

    // Cocktails Avancés (30sc)
    "americano": {
        "name": "Americano",
        "image": "assets/items/americano.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "campari_bottle", "label": "Campari", "quantity": 1, "image": "assets/items/campari_bottle.png" },
            { "name": "sparkling_water_bottle", "label": "Eau Gazeuse", "quantity": 1, "image": "assets/items/sparkling_water_bottle.png" },
            { "name": "mint", "label": "Feuille de Menthe", "quantity": 1, "image": "assets/items/mint.png" }
        ],
        "time": 30
    },
    "air_mail": {
        "name": "Air Mail",
        "image": "assets/items/air_mail.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "white_wine_bottle", "label": "Vin Blanc", "quantity": 1, "image": "assets/items/white_wine_bottle.png" },
            { "name": "honey", "label": "Miel", "quantity": 1, "image": "assets/items/honey.png" },
            { "name": "champagne_bottle", "label": "Champagne", "quantity": 1, "image": "assets/items/champagne_bottle.png" }
        ],
        "time": 30
    },

    // Cocktails Basiques (15sc)
    "gin_tonic": {
        "name": "Gin Tonic",
        "image": "assets/items/gin_tonic.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "gin_bottle", "label": "Gin", "quantity": 1, "image": "assets/items/gin_bottle.png" },
            { "name": "sparkling_water_bottle", "label": "Eau Gazeuse", "quantity": 1, "image": "assets/items/sparkling_water_bottle.png" }
        ],
        "time": 15
    },
    "vodka_coca": {
        "name": "Vodka Coca",
        "image": "assets/items/vodka_coca.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "vodka_bottle", "label": "Vodka", "quantity": 1, "image": "assets/items/vodka_bottle.png" },
            { "name": "coca_bottle", "label": "Coca", "quantity": 1, "image": "assets/items/coca_bottle.png" }
        ],
        "time": 15
    },
    "vodka_citron": {
        "name": "Vodka Citron",
        "image": "assets/items/vodka_citron.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "vodka_bottle", "label": "Vodka", "quantity": 1, "image": "assets/items/vodka_bottle.png" },
            { "name": "lemon", "label": "Citron", "quantity": 1, "image": "assets/items/lemon.png" }
        ],
        "time": 15
    },

    // Boissons Simples (10sc)
    "coca_glass": {
        "name": "Verre de Coca",
        "image": "assets/items/coca_glass.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "coca_bottle", "label": "Coca", "quantity": 1, "image": "assets/items/coca_bottle.png" }
        ],
        "time": 10
    },
    "orange_juice_glass": {
        "name": "Verre de Jus d'Orange",
        "image": "assets/items/orange_juice_glass.png",
        "materials": [
            { "name": "verre", "label": "Verre", "quantity": 1, "image": "assets/items/verre.png" },
            { "name": "orange_juice_bottle", "label": "Jus d'Orange", "quantity": 1, "image": "assets/items/orange_juice_bottle.png" }
        ],
        "time": 10
    },

    // Nourriture (20sc)
    "fruit_salad": {
        "name": "Salade de Fruits",
        "image": "assets/items/fruit_salad.png",
        "materials": [
            { "name": "bowl", "label": "Bol", "quantity": 1, "image": "assets/items/bowl.png" },
            { "name": "mango", "label": "Mangue", "quantity": 1, "image": "assets/items/mango.png" },
            { "name": "grapes", "label": "Raisins", "quantity": 1, "image": "assets/items/grapes.png" },
            { "name": "raspberries", "label": "Framboises", "quantity": 1, "image": "assets/items/raspberries.png" },
            { "name": "strawberries", "label": "Fraises", "quantity": 1, "image": "assets/items/strawberries.png" }
        ],
        "time": 20
    },
    "chips_bowl": {
        "name": "Bol de Chips",
        "image": "assets/items/chips_bowl.png",
        "materials": [
            { "name": "bowl", "label": "Bol", "quantity": 1, "image": "assets/items/bowl.png" },
            { "name": "chips", "label": "Chips", "quantity": 1, "image": "assets/items/chips.png" }
        ],
        "time": 20
    },
    "peanuts_bowl": {
        "name": "Bol de Cacahuètes",
        "image": "assets/items/peanuts_bowl.png",
        "materials": [
            { "name": "bowl", "label": "Bol", "quantity": 1, "image": "assets/items/bowl.png" },
            { "name": "peanuts", "label": "Cacahuètes", "quantity": 1, "image": "assets/items/peanuts.png" }
        ],
        "time": 20
    }
};

window.DEFAULT_ITEM_IMAGE = "assets/items/default.png"; 