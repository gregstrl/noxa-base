  -- Leaked By: Leaking Hub | J. Snow | leakinghub.com
Config = {}
Translation = {}

Translation = {
    ['de'] = {
        ['DJ_interact'] = 'Drücke ~s~E~s~, um auf das DJ Pult zuzugreifen',
        ['title_does_not_exist'] = '~s~Dieser Titel existiert nicht!',
    },

    ['en'] = {
        ['DJ_interact'] = 'Appuyez sur ~s~E~s~ pour accéder au bureau du DJ',
        ['title_does_not_exist'] = '~s~Ce titre n\'existe pas!',
    }
}

Config.Locale = 'en'

Config.useESX = true -- can not be disabled without changing the callbacks
Config.enableCommand = false

Config.enableMarker = true -- purple marker at the DJ stations

Config.DJPositions = {
    {
        name = 'Club77',
        pos = vector3(247.52, -3188.23, 0.50),
        requiredJob = 'club77', 
        range = 30.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },
    {
         name = 'Unicorn',
         pos = vector3(136.203873, -1332.810669, 19.389679),
         requiredJob = 'unicorn', 
         range = 25.0, 
         volume = 1.0 --[[ do not touch the volume! --]]
     },
    {
        name = 'Bahamas',
        pos = vector3(-1378.461914, -628.905334, 30.62),
        requiredJob = 'bahamas', 
        range = 30.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    }

    --{name = 'bahama', pos = vector3(-1381.01, -616.17, 31.5), requiredJob = 'DJ', range = 25.0}
}