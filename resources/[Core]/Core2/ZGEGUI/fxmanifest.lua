



fx_version 'bodacious'
game 'gta5' 

ui_page 'web/index.html'
files {
    'web/**'
}

client_script {
    'init.lua',
    'client.lua',
    'inventory.lua',
    'ltd-job.lua',
    'notifications.lua',
    'charCreator.lua',
    'cl_charCreate.lua',
    'werewolf.lua',
    'clotheshop.lua',
    'accessoriesShop.lua',
    'hairshop.lua',
    'makeup.lua',
    'weazelnews.lua',
    "modules/**/shared/*.lua",
    "modules/**/client/*.lua",
    'Config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "init/server.lua",
    "modules/**/shared/*.lua",
    "modules/**/server/*.lua",
    "sv_charCreator.lua",
    'Config.lua',
}

exports {
    "isInInterface",
    'draw',
    "isInInventory",
}

shared_scripts {
    'Config.lua',
}

lua54 "yes"