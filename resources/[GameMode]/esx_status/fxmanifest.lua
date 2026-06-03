

fx_version 'adamant'
game 'gta5'
description 'Handles the overall status system for Hunger, Thrist and others'
version '1.1'
legacyversion '1.11.2'
lua54 'yes'
shared_script '@Framework/imports.lua'
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
'server/main.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'temp/.swc.config.js',
}
client_scripts {
	'config.lua',
	'client/classes/status.lua',
	'client/main.lua'
}
ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/css/app.css',
	'html/scripts/app.js'
}
dependency 'Framework'
