resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

ui_page('hud/hud.html')

files {
    "hud/hud.html",
    "hud/assets/css/*.css",
    "hud/assets/fonts/*.ttf",
    "hud/assets/fonts/*.woff",
    "hud/assets/images/*.png",
    "hud/assets/js/*.js",
}

client_scripts {
    "configuration.lua",
	"client.lua",
}
