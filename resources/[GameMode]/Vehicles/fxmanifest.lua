



fx_version('bodacious')
game('gta5')

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'data/.jest.config.js',
}


shared_scripts {
	'debug.lua',
}


-- Oder

client_scripts({
	'client/main.lua',
})


ui_page 'idcard/html/index.html'

server_script {
	'idcard/server.lua'
}

client_script {
	'idcard/client.lua'
}

files {
	'idcard/html/index.html',
	'idcard/html/assets/css/*.css',
	'idcard/html/assets/js/*.js',
	'idcard/html/assets/fonts/roboto/*.woff',
	'idcard/html/assets/fonts/roboto/*.woff2',
	'idcard/html/assets/fonts/justsignature/JustSignature.woff',
	'idcard/html/assets/images/*.png',
}