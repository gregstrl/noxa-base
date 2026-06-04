lua54 "yes"

fx_version('bodacious')
game('gta5')

author ''
description ''
version '1.0'

ui_page "ui/index.html"

files {
	"ui/index.html",
	"ui/Inter-Medium.ttf",
	"ui/css/*.css",
	"ui/img/*.png",
	"ui/img/*.jpg",
	"ui/js/*.js"
}


shared_scripts {
	'@Framework/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'config2.lua',
	'configConcess.lua',
	'concess_config.lua',
	'playersManager/skin/shared/config.lua',
	--'gameManager/ipls/config.lua',
	'shared/society/*.lua',
	'shared/braquage/*.lua',
	'cfg_robb.lua',
	'gameManager/3dme/config.lua',
	'shared/clotheshop/configs/cConfig.lua',
	'shared/creator/configs/cConfig.lua',
	'shared/creator/src/translation/*.lua',
}


client_scripts {
	-----------------------
	-------- Libs ---------
	-----------------------
	'vendors/RageUI/RMenu.lua',
	'vendors/RageUI/menu/RageUI.lua',
	'vendors/RageUI/menu/Menu.lua',
	'vendors/RageUI/menu/MenuController.lua',
	'vendors/RageUI/components/*.lua',
	'vendors/RageUI/menu/elements/*.lua',
	'vendors/RageUI/menu/items/*.lua',
	'vendors/RageUI/menu/panels/*.lua',
	'vendors/RageUI/menu/panels/*.lua',
	'vendors/RageUI/menu/windows/*.lua',

	'vendors/RageUIv1/RMenu.lua',
	'vendors/RageUIv1/menu/RageUI.lua',
	'vendors/RageUIv1/menu/Menu.lua',
	'vendors/RageUIv1/menu/MenuController.lua',

	'vendors/RageUIv1/components/*.lua',

	'vendors/RageUIv1/menu/elements/*.lua',

	'vendors/RageUIv1/menu/items/*.lua',

	'vendors/RageUIv1/menu/panels/*.lua',

	'vendors/RageUIv1/menu/panels/*.lua',
	'vendors/RageUIv1/menu/windows/*.lua',

	"vendors/RageUIv3/RMenu.lua",
	"vendors/RageUIv3/menu/RageUI.lua",
	"vendors/RageUIv3/menu/Menu.lua",
	"vendors/RageUIv3/menu/MenuController.lua",
	"vendors/RageUIv3/components/*.lua",
	"vendors/RageUIv3/menu/elements/*.lua",
	"vendors/RageUIv3/menu/items/*.lua",
	"vendors/RageUIv3/menu/panels/*.lua",
	"vendors/RageUIv3/menu/windows/*.lua",

	"vendors/RageUIv4/RMenu.lua",
	"vendors/RageUIv4/menu/RageUI.lua",
	"vendors/RageUIv4/menu/Menu.lua",
	"vendors/RageUIv4/menu/MenuController.lua",
	"vendors/RageUIv4/components/*.lua",
	"vendors/RageUIv4/menu/elements/*.lua",
	"vendors/RageUIv4/menu/items/*.lua",
	"vendors/RageUIv4/menu/panels/*.lua",
	"vendors/RageUIv4/menu/windows/*.lua",

	"vendors/RageUIjh/RMenu.lua",
	"vendors/RageUIjh/menu/RageUI.lua",
	"vendors/RageUIjh/menu/Menu.lua",
	"vendors/RageUIjh/menu/MenuController.lua",
	"vendors/RageUIjh/components/*.lua",
	"vendors/RageUIjh/menu/elements/*.lua",
	"vendors/RageUIjh/menu/items/*.lua",
	"vendors/RageUIjh/menu/panels/*.lua",
	"vendors/RageUIjh/menu/windows/*.lua",

	"vendors/src/RMenu.lua",
	"vendors/src/menu/RageUI.lua",
	"vendors/src/menu/Menu.lua",
	"vendors/src/menu/MenuController.lua",
	"vendors/src/components/*.lua",
	"vendors/src/menu/elements/*.lua",
	"vendors/src/menu/items/*.lua",
	"vendors/src/menu/panels/*.lua",
	"vendors/src/menu/panels/*.lua",
	"vendors/src/menu/windows/*.lua",

	'shared/clotheshop/src/libs/RageUI//RMenu.lua',
	'shared/clotheshop/src/libs/RageUI//menu/RageUI.lua',
	'shared/clotheshop/src/libs/RageUI//menu/Menu.lua',
	'shared/clotheshop/src/libs/RageUI//menu/MenuController.lua',
	'shared/clotheshop/src/libs/RageUI//components/*.lua',
	'shared/clotheshop/src/libs/RageUI//menu/elements/*.lua',
	'shared/clotheshop/src/libs/RageUI//menu/items/*.lua',
	'shared/clotheshop/src/libs/RageUI//menu/panels/*.lua',
	'shared/clotheshop/src/libs/RageUI/menu/windows/*.lua',

	"vendors/RMasques/RageUI/RMenu.lua",
	"vendors/RMasques/RageUI/menu/RageUI.lua",
	"vendors/RMasques/RageUI/menu/Menu.lua",
	"vendors/RMasques/RageUI/menu/MenuController.lua",
	"vendors/RMasques/RageUI/components/*.lua",
	"vendors/RMasques/RageUI/menu/elements/*.lua",
	"vendors/RMasques/RageUI/menu/items/*.lua",
	"vendors/RMasques/RageUI/menu/panels/*.lua",
	"vendors/RMasques/RageUI/menu/windows/*.lua",

	"vendors/RageUICustom/RMenu.lua",
	"vendors/RageUICustom/menu/RageUI.lua",
	"vendors/RageUICustom/menu/Menu.lua",
	"vendors/RageUICustom/menu/MenuController.lua",
	"vendors/RageUICustom/components/*.lua",
	"vendors/RageUICustom/menu/elements/*.lua",
	"vendors/RageUICustom/menu/items/*.lua",
	"vendors/RageUICustom/menu/panels/*.lua",
	"vendors/RageUICustom/menu/windows/*.lua",

	"vendors/RageUIv5/RMenu.lua",
	"vendors/RageUIv5/menu/RageUI.lua",
	"vendors/RageUIv5/menu/Menu.lua",
	"vendors/RageUIv5/menu/MenuController.lua",
	"vendors/RageUIv5/components/*.lua",
	"vendors/RageUIv5/menu/elements/*.lua",
	"vendors/RageUIv5/menu/items/*.lua",
	"vendors/RageUIv5/menu/panels/*.lua",
	"vendors/RageUIv5/menu/panels/*.lua",
	"vendors/RageUIv5/menu/windows/*.lua",

	"vendors/RageUIPolice/RMenu.lua",
	"vendors/RageUIPolice/menu/RageUI.lua",
	"vendors/RageUIPolice/menu/Menu.lua",
	"vendors/RageUIPolice/menu/MenuController.lua",
	"vendors/RageUIPolice/components/*.lua",
	"vendors/RageUIPolice/menu/elements/*.lua",
	"vendors/RageUIPolice/menu/items/*.lua",
	"vendors/RageUIPolice/menu/panels/*.lua",
	"vendors/RageUIPolice/menu/panels/*.lua",
	"vendors/RageUIPolice/menu/windows/*.lua",
	-----------------------
	---- InitRessource ----
	-----------------------
	'playersManager/spawn/*.lua',
	'playersManager/skin/client/cl_main.lua',
	'playersManager/skin/client/module.lua',
	'playersManager/commands/client/*.lua',

	'playersManager/*.lua',

	'gameManager/functions/client/cl_main.lua',
	--'gameManager/ipls/iplprops.lua',
	--'gameManager/ipls/main.lua',
	-----------------------
	------- Modules -------
	-----------------------
	'PrivateAC/client/*.lua',
	'shared/creator/src/utils.lua',
	'shared/creator/src/client/*.lua',
	'shared/creator/src/client/menu\'s/*.lua',
	'gameManager/modules/client/bank/**/**',

	'gameManager/modules/client/interact/*.lua',
	'mecano/client/*.lua',
	'gameManager/modules/client/society/*.lua',
	'gameManager/modules/client/autoecole/*.lua',
	'gameManager/modules/client/carwash/*.lua',
	'gameManager/modules/client/barber/*.lua',
	'gameManager/modules/client/location/*.lua',
	'gameManager/modules/client/braquage/*.lua',
	'gameManager/modules/client/deathui/*.lua',
	'gameManager/modules/client/blips/*.lua',
	'gameManager/modules/client/safezone/*.lua',
	'gameManager/modules/client/robberies/main.lua',
	'gameManager/modules/client/brasfer/*.lua',
	'gameManager/modules/client/masque/*.lua',
	'gameManager/modules/client/travel/*.lua',
	'gameManager/modules/client/utils/*.lua',
	'gameManager/modules/client/jail/*.lua',
	'gameManager/modules/client/autoevent/*.lua',
	'gameManager/modules/client/vip/*.lua',
	'gameManager/modules/client/meteo/*.lua',
	'gameManager/3dme/client.lua',
	'gameManager/modules/client/logsOther/*.lua',
	'gameManager/modules/client/ascenseur/*.lua',
	'gameManager/modules/client/GTAUI/*.lua',
	'gameManager/modules/client/knockout/*.lua',
	'gameManager/modules/client/tatouages/*.lua',
	'gameManager/modules/client/bitcoin/*.lua',
	'gameManager/modules/client/tabac/*.lua',
	'gameManager/modules/client/acier/*.lua',
	'gameManager/modules/client/gofast/*.lua',

	'gameManager/modules/client/menuprops/*.lua',
	'gameManager/modules/client/parachute/*.lua',


	'gameManager/modules/client/spotlight/*.lua',
	'gameManager/modules/client/vehicledamage/*.lua',
	'gameManager/modules/client/kevlar/*.lua',

	'shared/clotheshop/src/utils.lua',
	'shared/clotheshop/data/client/*.lua',
	'shared/clotheshop/src/client/*.lua',
	-------------------
	------ JOBS -------
	-------------------
	---
	'gameManager/Bjobs/client/*.lua',
	'gameManager/Bjobs/client/**/*.lua',

	---------------------
	------ ASSETS -------
	---------------------
	-----------------------
	------- InitESX -------
	-----------------------
	'initESX/basicneeds/cfg_basic.lua',
	'initESX/basicneeds/client/main.lua',
	'initESX/billing/client/*.lua',
	'initESX/instance/client/main.lua',

}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'svconfig.lua',
	'gameManager/functions/server/eventSecurity.lua',
	'gameManager/trollProtection.lua',
	'configwipe.lua',
	-----------------------
	---- InitRessource ----
	-----------------------
	'playersManager/skin/server/sv_main.lua',
	'playersManager/game/server/game.lua',
	'playersManager/commands/server/*.lua',
	'playersManager/tackle/server/*.lua',

	'playersManager/*.lua',

	-----------------------
	------- Modules -------
	-----------------------
	'PrivateAC/server/*.lua',
	'property/server/*.lua',
	'shared/creator/configs/sConfig.lua',
	'gameManager/Bjobs/server/sv_*.lua',
	'shared/creator/src/server/*.lua',
	'gameManager/modules/server/bank/**/**',
	'gameManager/modules/server/personal/*.lua',
	'gameManager/modules/server/society/*.lua',
	'gameManager/modules/server/autoecole/*.lua',
	'gameManager/modules/server/carwash/*.lua',
	'gameManager/modules/server/barber/*.lua',
	'gameManager/modules/server/location/*.lua',
	'gameManager/modules/server/braquage/*.lua',
	'gameManager/modules/server/deathui/*.lua',
	'gameManager/modules/server/vip/*.lua',
	'gameManager/modules/server/robberies/*.lua',
	'gameManager/modules/server/travel/*.lua',
	'gameManager/modules/server/utils/*.lua',
	'gameManager/modules/server/jail/*.lua',
	'gameManager/modules/server/brasfer/*.lua',
	'gameManager/modules/server/autoevent/*.lua',

	'gameManager/3dme/server.lua',
	'gameManager/modules/server/logsOther/*.lua',
	'gameManager/modules/server/tatouages/*.lua',
	'gameManager/modules/server/maintenance/*.lua',
	'gameManager/modules/server/meteo/*.lua',
	'shared/clotheshop/configs/sConfig.lua',
	'gameManager/modules/server/spotlight/*.lua',
	'gameManager/modules/server/menuprops/*.lua',
	'gameManager/modules/server/parachute/*.lua',

	'gameManager/modules/server/vehicledamage/*.lua',
	'gameManager/modules/server/kevlar/*.lua',
	'gameManager/modules/server/gofast/*.lua',

	'shared/clotheshop/data/server/*.lua',
	'shared/clotheshop/src/server/*.lua',
	-------------------
	------ JOBS -------
	-------------------
	---
	'gameManager/Bjobs/server/*.lua',
	'gameManager/Bjobs/server/**/*.lua',

	-----------------------
	------- InitESX -------
	-----------------------
	'initESX/license/main.lua',
	'initESX/addoninventory/server/classes/addoninventory.lua',
	'initESX/addoninventory/server/main.lua',
	'initESX/addonaccount/server/classes/addonaccount.lua',
	'initESX/addonaccount/server/main.lua',
	'initESX/datastore/server/classes/datastore.lua',
	'initESX/datastore/server/main.lua',
	'initESX/basicneeds/cfg_basic.lua',
	'initESX/basicneeds/server/main.lua',
	'initESX/billing/server/*.lua',
	'initESX/instance/cfg_instance.lua',
	'initESX/instance/server/bite.lua',
	'mecano/server/*.lua',
}

exports {
    'IsInMenotte',
    'IsInPorter',
	'IsInEscorte',
    'IsInTrunk',
	'isInJail',
    'IsInOtage',
	'IsLsCustomsOpen',
    'IsInStaff',
	'getPlayerLevel',
	'IsInTravel',
	'IsInCreator',
}

fx_version('cerulean')
game('gta5')

data_file "DLC_ITYP_REQUEST" "stream/mads_no_exp_pumps.ytyp"