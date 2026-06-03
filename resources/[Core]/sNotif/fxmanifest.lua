author ""
description ""

fx_version "adamant"
game "gta5"

version "3.0.0"

client_scripts {
    "/client/class/*.js",
    "/client/*.js"
}

files {
    "ui/assets/fonts/*.ttf",
    "ui/assets/images/*.jpg",
    "ui/css/*.css",
    "ui/css/*.scss",
    "ui/js/*.js",
    "ui/index.html",
}

ui_page "ui/index.html"

exports {
    'Notification',
    'HelpNotification'
}