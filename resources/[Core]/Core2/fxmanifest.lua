fx_version('bodacious')
game('gta5')

shared_script {
    "game/Blanchiment/shared/*.lua",
    'config.lua',
}

client_scripts {
    'Libs/RageUI/RMenu.lua',
    'Libs/RageUI/menu/RageUI.lua',
    'Libs/RageUI/menu/Menu.lua',
    'Libs/RageUI/menu/MenuController.lua',
    'Libs/RageUI/components/*.lua',
    'Libs/RageUI/menu/elements/*.lua',
    'Libs/RageUI/menu/items/*.lua',
    'Libs/RageUI/menu/panels/*.lua',
    'Libs/RageUI/menu/windows/*.lua',

    -- Utils
    'Libs/Utils/client.lua',
    'Libs/Utils/BoxZone.lua',
    'Libs/Utils/EntityZone.lua',
    'Libs/Utils/CircleZone.lua',
    'Libs/Utils/ComboZone.lua',
    'Libs/Utils/creation/client/*.lua',

    "client/RMenu.lua",
    "client/menu/RageUI.lua",
    "client/menu/Menu.lua",
    "client/menu/MenuController.lua",
    "client/components/*.lua",
    "client/menu/elements/*.lua",
    "client/menu/items/*.lua",
    "client/menu/panels/*.lua",
    "client/menu/windows/*.lua",

    'game/ChestBuilder/client/*.lua',
    'game/Blanchiment/client/*.lua',

}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'game/Blanchiment/server/*.lua',
    'game/ChestBuilder/server/*.lua',

        -- Utils
        'Libs/Utils/creation/server/*.lua',
        'Libs/Utils/server.lua',
    
        -- Esx
        'Libs/Esx/server/*.lua',
        

}



