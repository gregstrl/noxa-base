

fx_version "cerulean"
use_fxv2_oal "yes"
lua54 "yes"
game "gta5"
version "0.1"

client_scripts {
    'client/*.lua', 
}
server_scripts {
    'server/*.lua',
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js',
    'ui/img/*.png',
}