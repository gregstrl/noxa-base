Config = {}

Config.JobRecipes = {
    ['unicorn'] = {
        recipes = {'manhattan', 'americano', 'air_mail', 'gin_tonic', 'vodka_coca'}, 
        label = 'Unicorn',
        marker = {
            coords = vector3(131.765808, -1321.958740, 18.40955), 
            type = 25,
            size = vector3(0.8, 0.8, 0.8),
            color = {r = 0, g = 115, b = 243, a = 100},
            drawDistance = 6.0,
            interactDistance = 1.5
        }
    },
    ['bahamas'] = {
        recipes = {'siraxe', 'americano', 'air_mail', 'gin_tonic', 'vodka_coca'},
        label = 'Bahamas',
        marker = {
            coords = vector3(-1392.896606, -608.791077, 30.31),
            type = 25,
            size = vector3(0.8, 0.8, 0.8),
            color = {r = 0, g = 115, b = 243, a = 100},
            drawDistance = 6.0,
            interactDistance = 1.5
        }
    },
    ['club77'] = {
        recipes = {'siraxe', 'americano', 'air_mail', 'gin_tonic', 'vodka_coca'},
        label = 'Club 77',
        marker = {
            coords = vector3(-1401.237305, -597.804382, 29.319981),
            type = 25,
            size = vector3(0.8, 0.8, 0.8),
            color = {r = 0, g = 115, b = 243, a = 100},
            drawDistance = 6.0,
            interactDistance = 1.5
        }
    },
}

Config.Messages = {
    noAccess = "~y~Vous n'avez pas accès à ce système de craft",
} 