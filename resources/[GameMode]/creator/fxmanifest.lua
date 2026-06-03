

--  Tout droits revienne de Dehka 
-- https://github.com/Dehka2malade
-- Trop beau nasser wolla 
-- assya ma femme pour la vie 
fx_version 'adamant'
game 'gta5'
lua54 'yes'
ui_page 'dist/index.html'
files {
	'dist/**/*.*',
  'dist/**/**/*.*',
  'dist/**/**/**/*.*',
}
shared_scripts {
  'shared/*.lua',
}
client_scripts {
  'client/*.lua',
}
imports {
  'imports.lua',
}
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/*.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
}