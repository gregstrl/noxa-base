Config = {
    Vehicles = {
        {name = "bmx", basePrice = 150, image = './img/bmx.png'},
        {name = "faggio2", basePrice = 250, image = './img/faggio.png'},
        {name = "sanchez", basePrice = 450, image = './img/sanchez.png'}
    },

    RentalDurations = {
        {duration = 15, label = "15 minutes", multiplier = 1},
        {duration = 30, label = "30 minutes", multiplier = 1.8}, 
        {duration = 60, label = "1 heure", multiplier = 3} 
    },

    RentalLocations = {
        {
            menuMarker = vector3(-1251.0498, -1475.0575, 4.3232),
            spawnPoint = vector4(-1241.0916, -1467.6696, 4.2686, 305.7878),
            blipInfo = {sprite = 226, color = 3, label = "Location de véhicules"}
        },
    },

    MarkerSettings = {
        type = 36,
        size = vector3(0.5, 0.5, 0.5),
        color = {r = 108, g = 0, b = 166, a = 100},
        bobUpAndDown = false,
        faceCamera = false,
        rotate = false,
        drawDistance = 10.0
    }
}