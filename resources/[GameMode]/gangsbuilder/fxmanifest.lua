fx_version 'adamant'
author ''
game 'gta5'
lua54 "yes"

client_script {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
    
    "client/main.lua",
    "client/functions.lua",
    "client/gang_menu.lua",
    "client/gang_builder.lua",
    "client/gang_modify.lua",
    "client/gang_f7.lua"
}

server_script {
    "@oxmysql/lib/MySQL.lua",
    "server/main.lua",
    "server/functions.lua"
}

shared_script "config.lua"


escrow_ignore {
    'config.lua'
}

server_scripts {
}
