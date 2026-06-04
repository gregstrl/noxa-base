

fx_version 'cerulean'
game 'gta5'

author 'MKG'
description 'UI Mort'
version '1.0.0'

shared_scripts {
    'config.lua'
}

ui_page 'index.html'

files {
    'index.html',
    'style.css',
    'script.js',
    'assets/head.svg'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
'server.lua',
} 