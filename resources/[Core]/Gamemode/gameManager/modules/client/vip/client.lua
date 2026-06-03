--[[
  This file is part of SweetyLife RolePlay.
  Copyright (c) SweetyLife RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

local IsVip = false 
local IsPed = false 
local itemIndex = 1

local legalprops = { ---- Props catégorie légal / nameprops = 'Nom visible par le joueur' / modelprops = 'Model_du_props'
{nameprops = 'Télé 4k', modelprops = 'prop_tv_flat_01'},
{nameprops = 'Télé Stand', modelprops = 'prop_tv_stand_01'},
{nameprops = 'Boxe', modelprops = 'prop_drop_crate_01'},
{nameprops = 'Chaise', modelprops = 'apa_mp_h_din_chair_12'},
{nameprops = 'Carton', modelprops = 'prop_cardbordbox_04a'},
{nameprops = 'Sac', modelprops = 'prop_cs_heist_bag_02'},
{nameprops = 'Table 1', modelprops = 'prop_rub_table_02'},
{nameprops = 'Table 2', modelprops = 'prop_table_04'},
{nameprops = 'Table 3', modelprops = 'bkr_prop_weed_table_01b'},
{nameprops = 'Chaise 1', modelprops = 'bkr_prop_clubhouse_chair_01'},
{nameprops = 'Chaise 2', modelprops = 'bkr_prop_weed_chair_01a'},
{nameprops = 'Chaise de Pêche', modelprops = 'hei_prop_hei_skid_chair'},
{nameprops = 'Chaise de Bureau', modelprops = 'bkr_prop_clubhouse_offchair_01a'},
{nameprops = 'Canapé', modelprops = 'v_tre_sofa_mess_c_s'},
{nameprops = 'Canapé 2', modelprops = 'v_res_tre_sofa_mess_a'},
{nameprops = 'Canapé 3', modelprops = 'hei_prop_yah_seat_03'},
{nameprops = 'Canapé 4', modelprops = 'prop_couch_03'},
{nameprops = 'Ordinateur', modelprops = 'bkr_prop_clubhouse_laptop_01a'},
{nameprops = 'Lit', modelprops = 'gr_prop_bunker_bed_01'},
{nameprops = 'Outils', modelprops = 'prop_cs_trolley_01'},
{nameprops = 'Outils de mécanique', modelprops = 'prop_carcreeper'},
--{nameprops = 'Sac de sport', modelprops = 'prop_cs_heist_bag_02'},
{nameprops = 'Trousse médical 2', modelprops = 'xm_prop_x17_bag_med_01a'},
}


local illegalprops = { ---- Props catégorie illégal / nameprops = 'Nom visible par le joueur' / modelprops = 'Model_du_props'
{nameprops = 'Bloque de cocaïne', modelprops = 'bkr_prop_coke_block_01a'},
{nameprops = 'Chaise Torture', modelprops = 'prop_torture_ch_01'},
{nameprops = 'Bouteille de cocaïne', modelprops = 'bkr_prop_coke_bottle_01a'},
{nameprops = 'Balance', modelprops = 'bkr_prop_coke_scale_01'},
{nameprops = 'Table cocaine', modelprops = 'bkr_prop_coke_table01a'},
{nameprops = 'Caisse', modelprops = 'bkr_prop_crate_set_01a'},
{nameprops = 'Pot Weed 2', modelprops = 'bkr_prop_weed_bucket_01d'},
{nameprops = 'Cocaine', modelprops = 'bkr_prop_coke_block_01a'},
{nameprops = 'Acétone', modelprops = 'bkr_prop_meth_acetone'},
{nameprops = 'Bidon', modelprops = 'bkr_prop_meth_ammonia'},
{nameprops = 'Lithium', modelprops = 'bkr_prop_meth_lithium'},
{nameprops = 'Packet de weed', modelprops = 'bkr_prop_weed_bigbag_03a'},
{nameprops = 'Packet de weed Ouvert', modelprops = 'bkr_prop_weed_bigbag_open_01a'},
{nameprops = 'Chanvre', modelprops = 'bkr_prop_weed_lrg_01b'},
{nameprops =  'Weed séchée', modelprops = 'bkr_prop_weed_drying_01a'},
{nameprops = 'Sac de weed', modelprops = 'bkr_prop_weed_bigbag_03a'},
{nameprops = 'Block de coke', modelprops = 'bkr_prop_coke_cut_01'},
{nameprops = 'Weed', modelprops = 'bkr_prop_weed_01_small_01b'},
{nameprops = 'Malette d\'armes', modelprops = 'bkr_prop_biker_gcase_s'},
{nameprops = 'Caisse d\'armes lourdes', modelprops = 'ex_office_swag_guns04'},
{nameprops = 'Caisse Fermée', modelprops = 'ex_prop_adv_case_sm_03'},
{nameprops = 'Caisse de chargeurs', modelprops = 'gr_prop_gr_crate_mag_01a'},
}

SweetyLife = {
    -- Main
    MenusPeds = true,
    MenusArmes = true,
    MenusCars = true,
    Peds = {
        Gangs = {
            {name = "Ballas 1", spawn = "g_m_y_ballaeast_01"},
            {name = "Ballas 2", spawn = "g_m_y_ballaorig_01"},
            {name = "Ballas 4", spawn = "g_m_y_ballasout_01"},
            {name = "Families 1", spawn = "g_m_y_famca_01"},
            {name = "Families 2", spawn = "g_m_y_famdnf_01"},
            {name = "Families 3", spawn = "g_m_y_famfor_01"},
            {name = "Families 4 (Femme)", spawn = "g_f_y_families_01"},
            {name = "Marabunta 1", spawn = "g_m_y_salvaboss_01"},
            {name = "Marabunta 2", spawn = "g_m_y_salvagoon_01"},
            {name = "Marabunta 3", spawn = "g_m_y_salvagoon_02"},
            {name = "Marabunta 4", spawn = "g_m_y_salvagoon_03"},
            {name = "Bloods 1", spawn = "ig_claypain"},
            {name = "Vagos 1", spawn = "g_m_y_mexgoon_01"},
            {name = "Vagos 2", spawn = "g_m_y_mexgoon_02"},
            {name = "Vagos 3", spawn = "g_m_y_mexgoon_03"},
            {name = "Biker 1", spawn = "g_m_y_lost_01"},
            {name = "Biker 2", spawn = "g_m_y_lost_02"},
            {name = "Biker 3", spawn = "g_m_y_lost_03"},
            {name = "Biker 4 (Femme)", spawn = "g_f_y_lost_01"},
        },
        Civils = {
            {name = "Tonton", spawn = "a_m_y_downtown_01"},
            {name = "Mexicain 1", spawn = "a_m_m_mexlabor_01"},
            {name = "Mexicain 2", spawn = "a_m_y_mexthug_01"},
            {name = "Mexicain 3", spawn = "g_m_m_mexboss_01"},
            {name = "Mexicain 4", spawn = "g_m_m_mexboss_02"},
            {name = "Latino 1", spawn = "a_m_m_eastsa_01"},
            {name = "Latino 2", spawn = "a_m_y_eastsa_01"},
            {name = "Homme plage 1", spawn = "a_m_m_beach_01"},
            {name = "Homme plage 2", spawn = "a_m_m_beach_02"},
            {name = "Homme riche costard", spawn = "s_m_m_movprem_01"},
            {name = "Femme 1", spawn = "a_f_m_bevhills_01"},
            {name = "Femme 2", spawn = "mp_f_boatstaff_01"},
            {name = "Femme 3", spawn = "a_f_y_bevhills_01"},
            {name = "Femme 4", spawn = "a_f_m_bevhills_02"},
            {name = "Femme 5", spawn = "a_f_y_bevhills_02"},
            {name = "Femme 6", spawn = "a_f_y_bevhills_03"},
            {name = "Femme 7", spawn = "a_f_y_bevhills_04"},
            {name = "Femme 8", spawn = "u_f_y_bikerchic"},
        },
        Services = {
            {name = "Vigile", spawn = "s_m_y_doorman_01"},
            {name = "Autopsie", spawn = "s_m_y_autopsy_01"},
            {name = "Docteur 1", spawn = "s_m_m_doctor_01"},
            {name = "Paramedic 1", spawn = "s_m_m_paramedic_01"},
            {name = "LSPD 1", spawn = "s_m_y_cop_01"},
            {name = "LSPD 2 (Femme)", spawn = "s_f_y_cop_01"},
            {name = "LSPD 3 (Desert)", spawn = "csb_cop"},
            {name = "Mécano 1", spawn = "mp_m_waremech_01"},
            {name = "Mécano 2", spawn = "mp_m_weapexp_01"},
            {name = "Mécano 3", spawn = "mp_m_weapwork_01"},
            {name = "Mécano Benny's", spawn = "ig_benny"},
        },
        Autres = {
           -- {name = "Clown", spawn = "s_m_y_clown_01"},
            {name = "Prisonnier 1", spawn = "u_m_y_prisoner_01"},
            {name = "Prisonnier 2", spawn = "s_m_y_prisoner_01"},
            {name = "Prisonnier 3", spawn = "ig_rashcosvki"},
            {name = "Mec cagoulé", spawn = "g_m_m_chicold_01"},
            {name = "Dealer", spawn = "s_m_y_dealer_01"},
            --{name = "Lester", spawn = "ig_lestercrest"},
            {name = "Clochard 1", spawn = "u_m_y_militarybum"},
        },
        Addons = {
            {name = "Baby Male #1", spawn = "WC_Baby_Male_101"},
            {name = "Baby Male #2", spawn = "WC_Baby_Male_102"},
            {name = "Baby Male #3", spawn = "WC_Baby_Male_103"},
            {name = "Baby Male #4", spawn = "WC_Baby_Male_104"},
            {name = "Baby Male #5", spawn = "WC_Baby_Male_105"},
            {name = "Baby Male #6", spawn = "WC_Baby_Male_106"},
            {name = "Baby Male #7", spawn = "WC_Baby_Male_107"},
            {name = "Baby Male #8", spawn = "WC_Baby_Male_108"},
            {name = "Baby Male #9", spawn = "WC_Baby_Male_109"},
            {name = "Baby Male #10", spawn = "WC_Baby_Male_110"},
            {name = "Baby Male #11", spawn = "WC_Baby_Male_111"},
            {name = "Baby Male #12", spawn = "WC_Baby_Male_112"},
            {name = "Baby Male #13", spawn = "WC_Baby_Male_113"},
            {name = "Baby Male #14", spawn = "WC_Baby_Male_114"},
            {name = "Baby Male #15", spawn = "WC_Baby_Male_115"},
            {name = "Baby Male #16", spawn = "WC_Baby_Male_116"},
            {name = "Baby Male #17", spawn = "WC_Baby_Male_117"},
            {name = "Baby Male #18", spawn = "WC_Baby_Male_118"},
            {name = "Baby Male #19", spawn = "WC_Baby_Male_119"},
            {name = "Baby Male #20", spawn = "WC_Baby_Male_120"},
            {name = "Baby Female #1", spawn = "WC_Baby_Female_101"},
            {name = "Baby Female #2", spawn = "WC_Baby_Female_102"},
            {name = "Baby Female #3", spawn = "WC_Baby_Female_103"},
            {name = "Baby Female #4", spawn = "WC_Baby_Female_104"},
            {name = "Baby Female #5", spawn = "WC_Baby_Female_105"},
            {name = "Baby Female #6", spawn = "WC_Baby_Female_106"},
            {name = "Baby Female #7", spawn = "WC_Baby_Female_107"},
            {name = "Baby Female #8", spawn = "WC_Baby_Female_108"},
            {name = "Baby Female #9", spawn = "WC_Baby_Female_109"},
            {name = "Baby Female #10", spawn = "WC_Baby_Female_110"},
            {name = "Baby Female #11", spawn = "WC_Baby_Female_111"},
            {name = "Baby Female #12", spawn = "WC_Baby_Female_112"},
            {name = "Baby Female #13", spawn = "WC_Baby_Female_113"},
            {name = "Baby Female #14", spawn = "WC_Baby_Female_114"},
            {name = "Baby Female #15", spawn = "WC_Baby_Female_115"},
            {name = "Baby Female #16", spawn = "WC_Baby_Female_116"},
            {name = "Baby Female #17", spawn = "WC_Baby_Female_117"},
            {name = "Baby Female #18", spawn = "WC_Baby_Female_118"},
            {name = "Baby Female #19", spawn = "WC_Baby_Female_119"},
            {name = "Baby Female #20", spawn = "WC_Baby_Female_120"},
        }
    },


    -- Options
    particule = true,
    weaponsAllowed = {
        "WEAPON_PISTOL",
        "WEAPON_COMBATPISTOL",
        "WEAPON_APPISTOL",
        "WEAPON_PISTOL50",
        "WEAPON_SNSPISTOL",
        "WEAPON_HEAVYPISTOL",
        "WEAPON_VINTAGEPISTOL",
        "WEAPON_VINTAGEPISTOL",
        "WEAPON_REVOLVER",
        "WEAPON_RAYPISTOL",
        "WEAPON_CERAMICPISTOL",
        "WEAPON_MICROSMG",
        "WEAPON_SMG",
        "WEAPON_ASSAULTSMG",
        "WEAPON_COMBATPDW",
        "WEAPON_MACHINEPISTOL",
        "WEAPON_MINISMG",
        "WEAPON_RAYCARBINE",
        "WEAPON_PUMPSHOTGUN",
        "WEAPON_SAWNOFFSHOTGUN",
        "WEAPON_ASSAULTSHOTGUN",
        "WEAPON_BULLPUPSHOTGUN",
        "WEAPON_MUSKET",
        "WEAPON_HEAVYSHOTGUN",
        "WEAPON_DBSHOTGUN",
        "WEAPON_AUTOSHOTGUN",
        "WEAPON_COMBATSHOTGUN",
        "WEAPON_ASSAULTRIFLE",
        "WEAPON_CARBINERIFLE",
        "WEAPON_ADVANCEDRIFLE",
        "WEAPON_SPECIALCARBINE",
        "WEAPON_BULLPUPRIFLE",
        "WEAPON_COMPACTRIFLE",
        "WEAPON_MILITARYRIFLE",
        "WEAPON_HEAVYRIFLE",
        "WEAPON_TACTICALRIFLE",
        "WEAPON_MG",
        "WEAPON_COMBATMG",
        "WEAPON_GUSENBERG",
        "WEAPON_SNIPERRIFLE",
        "WEAPON_HEAVYSNIPER",
        "WEAPON_MARKSMANRIFLE",
        "WEAPON_PRECISIONRIFLE",
    },
    neonList = {
        "Blanc",
        "Rouge",
        "Rose",
        "Violet",
        "Bleu Sombre",
        "Bleu Clair",
        "Vert",
        "Menthe",
        "Jaune",
        "Orange"
    }
}

PedTimeout = true
isWPed = false
NeonsActive = false
NeonsRGB = false
ToggleRGB = false
local NeonSpeed = 400
PDesc = "Vous pouvez vous transformer"
AddEventHandler('playerSpawned', function()
	isDead = false
end)

AddEventHandler('esx:onPlayerDeath', function()
	isDead = true
	--RageUI.CloseAll()
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(100)
	end
end)

SweetyLife.Notification = function(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(msg)
    DrawNotification(false, true)
end

SweetyLife.TintWeapon = function(model, tint, color)
    for _, TintNum in pairs(SweetyLife.weaponsAllowed) do
        if model == GetHashKey(TintNum) then
            local playerPed = PlayerPedId()
            SetPedWeaponTintIndex(playerPed, GetHashKey(TintNum), tint)
        end
        if model == -1569615261 then
            SweetyLife.Notification("~s~Tu ne peux pas avoir de skin sur tes mains")
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local ms = 1000;
        if NeonsRGB then
            if IsPedInAnyVehicle(PlayerPedId(), true) then
                ms = 0;
                ChangeCouleurNeon(222, 222, 222)
                Wait(NeonSpeed)
                ChangeCouleurNeon(255, 1, 1)
                Wait(NeonSpeed)
                ChangeCouleurNeon(255, 5, 190)
                Wait(NeonSpeed)
                ChangeCouleurNeon(35, 1, 255)
                Wait(NeonSpeed)
                ChangeCouleurNeon(2, 21, 255)
                Wait(NeonSpeed)
                ChangeCouleurNeon(3, 83, 255)
                Wait(NeonSpeed)
                ChangeCouleurNeon(94, 255, 1)
                Wait(NeonSpeed)
                ChangeCouleurNeon(0, 255, 140)
                Wait(NeonSpeed)
                ChangeCouleurNeon(255, 255, 0)
                Wait(NeonSpeed)
                ChangeCouleurNeon(255, 62, 0)
                Wait(NeonSpeed)
            else
                ms = 1000;
                NeonsRGB = false
                ToggleRGB = false
            end
        end
        Wait(ms)
    end
end)

function OpenPedsMenu(vipLevel)
local OpenedPedsMenu = false
local PedsMenu = RageUI.CreateMenu("", "Menu Vip~s~", 10, 100, "k2r", "interaction_bgd")
local PedsSubMenu = RageUI.CreateSubMenu(PedsMenu, "", "Peds disponibles", 10, 100, "k2r", "interaction_bgd")
-- Categories
local PedsGangsMenu = RageUI.CreateSubMenu(PedsSubMenu, "", "Peds Gangs", 10, 100, "k2r", "interaction_bgd")
local PedsCivilsMenu = RageUI.CreateSubMenu(PedsSubMenu, "", "Peds Civils", 10, 100, "k2r", "interaction_bgd")
local PedsAutresMenu = RageUI.CreateSubMenu(PedsSubMenu, "", "Peds Divers", 10, 100, "k2r", "interaction_bgd")
local PedsAddonsMenu = RageUI.CreateSubMenu(PedsSubMenu, "", "Peds Add-ons", 10, 100, "k2r", "interaction_bgd")
-- Fin categories
local PedsSubMenu2 = RageUI.CreateSubMenu(PedsMenu, "", "Skins armes disponibles", 10, 100, "k2r", "interaction_bgd")
local PedsSubMenu3 = RageUI.CreateSubMenu(PedsMenu, "", "Options Vehicules VIP", 10, 100, "k2r", "interaction_bgd")
local VIPExtrasMenu = RageUI.CreateSubMenu(PedsSubMenu3, "", "Extras vehicule", 10, 100, "k2r", "interaction_bgd")
--local PedsSubCusMenu = RageUI.CreateSubMenu(PedsMenu, "", "Personnalisation", 10, 100, "k2r", "interaction_bgd")
local PropsSubMenu = RageUI.CreateSubMenu(PedsMenu, "", "Actions Disponibles", 10, 100, "k2r", "interaction_bgd")
local DeletePropsSubMenu = RageUI.CreateSubMenu(PedsMenu, "", "Actions Disponibles", 10, 100, "k2r", "interaction_bgd")

local Options = {
    List1 = 1
}

local Customs = {
    List1 = 1,
    List2 = 1,
    List4 = 1,
    List5 = 1,
    List6 = 1,
    List7 = 1, 
    List8 = 1,
    List9 = 1,
    List10 = 1
}

local ExtrasList = {}

PedsMenu.Closable = true
PedsMenu:DisplayHeader(true)
PedsSubMenu:DisplayHeader(true)
PedsSubMenu2:DisplayHeader(true)
PedsSubMenu3:DisplayHeader(true)
PropsSubMenu:DisplayHeader(true)

PedsMenu.EnableMouse = false;
PedsSubMenu.EnableMouse = false;
PedsSubMenu2.EnableMouse = false;
PedsSubMenu3.EnableMouse = false;

    if OpenedPedsMenu then
        OpenedPedsMenu = false
        RageUI.Visible(PedsMenu, false)
        return;
    else
        OpenedPedsMenu = true
        RageUI.Visible(PedsMenu, true)
        CreateThread(function()
            while OpenedPedsMenu do
                Wait(1.0)
                RageUI.IsVisible(PedsMenu, function()
                    local ped = PlayerPedId()
                    RageUI.Button("Liste des peds", "Voir la liste des peds disponibles.", {RightLabel = "~s~→"}, SweetyLife.MenusPeds, {
                    }, PedsSubMenu);
                    
                    RageUI.Button("Skins Arme", "Voir la liste des skins d'arme disponibles.", {RightLabel = "~s~→"}, SweetyLife.MenusArmes, {
                    }, PedsSubMenu2);

                    RageUI.Button("Options Vehicule VIP", "Voir les options vehicule VIP disponibles.", {RightLabel = "~s~→"}, SweetyLife.MenusArmes, {
                    }, PedsSubMenu3);

                    RageUI.Button("Liste des props", nil, {RightLabel = "→"}, true, {
                    }, PropsSubMenu);

                    RageUI.Button("Supprimer les props", nil, {RightLabel = "→"}, true, {
                    }, DeletePropsSubMenu);

                    RageUI.Separator("~s~~h~↓~s~ Autres ~s~~h~↓~s~")

                   --  RageUI.Button("Personnalisation", "Modifier son ped (Vip ~s~Diamond~s~)", {RightLabel = "→"}, vipLevel > 1, {
                   --  }, PedsSubCusMenu);


                    RageUI.Button("Information Vip", nil, {RightLabel = "~s~→"}, true, {
                        onSelected = function() 
                            ExecuteCommand("viptime")
                        end
                    });

                    RageUI.Button("Sortir un Scooter", nil, {RightLabel = "~s~→"}, true, {
                        onSelected = function()
                            local ped = PlayerPedId()
                            local PlayerScoot = GetEntityCoords(ped)
        
                            if scoot == true then
                                ESX.ShowNotification('~s~Vous avez déja sorti un scooter !')
                            else
                                ESX.Game.SpawnVehicle("faggio", PlayerScoot, 180.0, function(vehicle)
                                    scoot = true
                                end)
                            end
                    end
                    })
                    

                     RageUI.Button("Reset personnage", nil, {RightLabel = "~s~→"}, true, {
                         onSelected = function()
                             if IsPed == false then
                                 ESX.ShowNotification('Vous devez être en ped pour reset votre personnage.')
                             elseif isDead == true then
                                 ESX.ShowNotification('Vous ne pouvez pas faire cela en étant mort.')
                             else
                                 ResetPed()
                                 IsPed = false
                                 Wait(1)
                             end
                         end
                     });

                     RageUI.Checkbox('Mode drift', nil, driftmode, {}, {
                        onChecked = function()
                            driftmode = true
                            print("Mode drift activé")
                        end,
                        onUnChecked = function()
                            driftmode = false
                            print("Mode drift désactivé")
                        end
                    })


                end)

                 --[[RageUI.IsVisible(PedsSubCusMenu, function ()
                     local ped = PlayerPedId()

                     if ped then
                         RageUI.List("Visage", {"1", "2", "3"}, Customs.List1, "", {}, true, {
                             onListChange = function(i, Item)
                                 Customs.List1 = i;
                             end,
                             onActive = function()
                                 if Customs.List1 == 1 then
                                     SetCus(ped, 0, 0, 0, 0)
                                 end
                                 if Customs.List1 == 2 then
                                     SetCus(ped, 0, 0, 1, 0)
                                 end
                                 if Customs.List1 == 3 then
                                     SetCus(ped, 0, 1, 1, 0)
                                 end
                             end, 
                         })
    
                         RageUI.List("Cheveux", {"1", "2", "3", "4"}, Customs.List2, "", {}, true, {
                             onListChange = function(i, Item)
                                 Customs.List2 = i;
                             end,
                             onActive = function()
                                 if Customs.List2 == 1 then
                                     SetCus(ped, 2, 0, 0, 0)
                                 end
                                 if Customs.List2 == 2 then
                                     SetCus(ped, 2, 1, 1, 0)
                                 end
                                 if Customs.List2 == 3 then
                                     SetCus(ped, 2, 2, 1, 0)
                                 end
                                 if Customs.List2 == 4 then
                                     SetCus(ped, 2, 3, 1, 0)
                                 end
                             end, 
                         })
    
                         RageUI.List("Haut", {"1", "2", "3", "4", "5", "6"}, Customs.List4, "", {}, true, {
                             onListChange = function(i, Item)
                                 Customs.List4 = i;
                             end,
                             onActive = function()
                                 if Customs.List4 == 1 then
                                     SetCus(ped, 3, 0, 0, 0)
                                 end
                                 if Customs.List4 == 2 then
                                     SetCus(ped, 3, 0, 1, 0)
                                 end
                                 if Customs.List4 == 3 then
                                     SetCus(ped, 3, 0, 2, 0)
                                 end
                                 if Customs.List4 == 4 then
                                     SetCus(ped, 3, 1, 0, 0)
                                 end
                                 if Customs.List4 == 5 then
                                     SetCus(ped, 3, 1, 1, 0)
                                 end
                                 if Customs.List4 == 6 then
                                     SetCus(ped, 3, 1, 2, 0)
                                 end
                             end, 
                         })
    
                         RageUI.List("Bas", {"1", "2", "3", "4"}, Customs.List5, "", {}, true, {
                             onListChange = function(i, Item)
                                 Customs.List5 = i;
                             end,
                             onActive = function()
                                 if Customs.List5 == 1 then
                                     SetCus(ped, 4, 0, 0, 0)
                                 end
                                 if Customs.List5 == 2 then
                                     SetCus(ped, 4, 0, 1, 0)
                                 end
                                 if Customs.List5 == 3 then
                                     SetCus(ped, 4, 1, 0, 0)
                                 end
                                 if Customs.List5 == 4 then
                                     SetCus(ped, 4, 1, 1, 0)
                                 end
                             end, 
                         })
    
                         RageUI.List("Chaussures", {"1", "2", "3"}, Customs.List6, "", {}, true, {
                             onListChange = function(i, Item)
                                 Customs.List6 = i;
                             end,
                             onActive = function()
                                 if Customs.List6 == 1 then
                                     SetCus(ped, 6, 0, 0, 0)
                                 end
                                 if Customs.List6 == 2 then
                                     SetCus(ped, 6, 0, 1, 0)
                                 end
                                 if Customs.List6 == 3 then
                                     SetCus(ped, 6, 1, 0, 0)
                                 end
                             end, 
                         })
    
                         RageUI.List("Chapeau", {"1", "2", "3", "4", "5", "6"}, Customs.List8, "", {}, true, {
                             onListChange = function(i, Item)
                                 Customs.List8 = i;
                             end,
                             onActive = function()
                                 if Customs.List8 == 1 then
                                     Clear(ped, 0)
                                 end
                                 if Customs.List8 == 2 then
                                     SetProp(ped, 0, 0, 0, 0)
                                 end
                                 if Customs.List8 == 3 then
                                     SetProp(ped, 0, 0, 1, 0)
                                 end
                                 if Customs.List8 == 4 then
                                     SetProp(ped, 0, 0, 2, 0)
                                 end
                                 if Customs.List8 == 5 then
                                     SetProp(ped, 0, 1, 0, 0)
                                 end
                                 if Customs.List8 == 6 then
                                     SetProp(ped, 0, 1, 1, 0)
                                 end
                             end, 
                         })
    
                         RageUI.List("Lunettes", {"1", "2", "3", "4"}, Customs.List7, "", {}, true, {
                             onListChange = function(i, Item)
                                 Customs.List7 = i;
                             end,
                             onActive = function()
                                 if Customs.List7 == 1 then
                                     Clear(ped, 1)
                                 end
                                 if Customs.List7 == 2 then
                                     SetProp(ped, 1, 0, 0, 0)
                                 end
                                 if Customs.List7 == 3 then
                                     SetProp(ped, 1, 0, 1, 0)
                                 end
                                 if Customs.List7 == 4 then
                                     SetProp(ped, 1, 1, 0, 0)
                                 end
                             end, 
                         })
                     end]]


                RageUI.IsVisible(PedsSubMenu2, function()
                    RageUI.Separator("~s~↓~s~ Skins Basiques ~s~↓~s~")
                    --Or
                    RageUI.Button("Or", nil, {RightBadge = RageUI.BadgeStyle.Gun}, true, { 
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            weapon = GetSelectedPedWeapon(playerPed, true)
                            SweetyLife.TintWeapon(weapon, 2, "Or")
                        end
                    });
                    --bleu
                    RageUI.Button("Bleu", nil, {RightBadge = RageUI.BadgeStyle.Gun}, true, {
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            weapon = GetSelectedPedWeapon(playerPed, true)
                            SweetyLife.TintWeapon(weapon, 5, "Bleu")
                        end
                    });
                    --Rose
                    RageUI.Button("Rose", nil, {RightBadge = RageUI.BadgeStyle.Gun}, true, {
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            weapon = GetSelectedPedWeapon(playerPed, true)
                            SweetyLife.TintWeapon(weapon, 3, "Rose")
                        end
                    });
                    --Armée
                    RageUI.Button("Armée", nil, {RightBadge = RageUI.BadgeStyle.Gun}, true, {
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            weapon = GetSelectedPedWeapon(playerPed, true)
                            SweetyLife.TintWeapon(weapon, 4, "Armée")
                        end
                    });
                    --Orange
                    RageUI.Button("Orange", nil, {RightBadge = RageUI.BadgeStyle.Gun}, true, {
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            weapon = GetSelectedPedWeapon(playerPed, true)
                            SweetyLife.TintWeapon(weapon, 6, "Orange")
                        end
                    });
                    --vert
                    RageUI.Button("Vert", nil, {RightBadge = RageUI.BadgeStyle.Gun}, true, {
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            weapon = GetSelectedPedWeapon(playerPed, true)
                            SweetyLife.TintWeapon(weapon, 1, "Vert")
                        end
                    });
                    --platine
                    RageUI.Button("Platine", nil, {RightBadge = RageUI.BadgeStyle.Gun}, true, {
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            weapon = GetSelectedPedWeapon(playerPed, true)
                            SweetyLife.TintWeapon(weapon, 7, "Platine")
                        end
                    });

                end)

                RageUI.IsVisible(PedsSubMenu3, function()
                    local myP = PlayerPedId()

                    if IsPedInAnyVehicle(myP, true) then
                        RageUI.Separator("↓ Catégorie: ~s~Néons~s~ ↓")

                        RageUI.Checkbox("Néons", nil, NeonsActive, {}, {
                            onChecked = function()
                                NeonsActive = true
                                BourTonMarraineUnNeon(true)
                            end,
                            onUnChecked = function()
                                NeonsActive = false
                                BourTonMarraineUnNeon(false)
                            end,
                        });

                        RageUI.Checkbox("RGB Néons", nil, NeonsRGB, {}, {
                            onChecked = function()
                                NeonsRGB = true
                            end,
                            onUnChecked = function()
                                NeonsRGB = false
                            end,
                        });

                        if not NeonsRGB then
                            RageUI.List("Couleur", SweetyLife.neonList, Customs.List9, nil, {}, true, {
                                onListChange = function(i, Item)
                                    Customs.List9 = i;
                                end,
                                onActive = function()
                                    if Customs.List9 == 1 then
                                        ChangeCouleurNeon(222, 222, 222)
                                    end
                                    if Customs.List9 == 2 then
                                        ChangeCouleurNeon(255, 1, 1)
                                    end
                                    if Customs.List9 == 3 then
                                        ChangeCouleurNeon(255, 5, 190)
                                    end
                                    if Customs.List9 == 4 then
                                        ChangeCouleurNeon(35, 1, 255)
                                    end
                                    if Customs.List9 == 5 then
                                        ChangeCouleurNeon(2, 21, 255)
                                    end
                                    if Customs.List9 == 6 then
                                        ChangeCouleurNeon(3, 83, 255)
                                    end
                                    if Customs.List9 == 7 then
                                        ChangeCouleurNeon(94, 255, 1)
                                    end
                                    if Customs.List9 == 8 then
                                        ChangeCouleurNeon(0, 255, 140)
                                    end
                                    if Customs.List9 == 9 then
                                        ChangeCouleurNeon(255, 255, 0)
                                    end
                                    if Customs.List9 == 10 then
                                        ChangeCouleurNeon(255, 62, 0)
                                    end
                                end, 
                            })
                        end 

                        if NeonsRGB then
                            RageUI.List("Vitesse RGB", {"x1", "x2", "x3"}, Customs.List10, nil, {}, true, {
                                onListChange = function(i, Item)
                                    Customs.List10 = i;
                                end,
                                onActive = function()
                                    if Customs.List10 == 1 then
                                        NeonSpeed = 400
                                    end
                                    if Customs.List10 == 2 then
                                        NeonSpeed = 200
                                    end
                                    if Customs.List10 == 3 then
                                        NeonSpeed = 50
                                    end
                                end, 
                            })
                        end
                    else
                        RageUI.Separator("")
                        RageUI.Separator("~s~Vous n'etes pas dans un vehicule~s~")
                        RageUI.Separator("")
                    end


                end)

                RageUI.IsVisible(VIPExtrasMenu, function()

                    local pPed = PlayerPedId()
                    local pCoords = GetEntityCoords(pPed)
                    local pInVeh = IsPedInAnyVehicle(pPed, false)

                    if pInVeh then
                        local pVeh = GetVehiclePedIsIn(pPed, false)
                        for i = 1, 9 do
                            if DoesExtraExist(pVeh, i) then
                                if IsVehicleExtraTurnedOn(pVeh, i) then
                                    RageUI.Button("~s~Désactiver~s~ l'extra " .. i, nil, {}, true, {
                                        onSelected = function()
                                            SetVehicleExtra(pVeh, i, true)
                                        end
                                    })
                                else
                                    RageUI.Button("~g~Activer~s~ l'extra " .. i, nil, {}, true, {
                                        onSelected = function()
                                            SetVehicleExtra(pVeh, i, false)
                                        end
                                    })
                                end
                            end
                        end
                    end

                end)

                RageUI.IsVisible(PedsSubMenu, function()

					RageUI.Separator("~s~↓~s~ Catégories des peds ~s~↓~s~")

                    RageUI.Button("Gangs", nil, {RightLabel = "→"}, true, {
                    }, PedsGangsMenu);

                    RageUI.Button("Civils", nil, {RightLabel = "→"}, true, {
                    }, PedsCivilsMenu);

                    RageUI.Button("Autres", nil, {RightLabel = "→"}, true, {
                    }, PedsAutresMenu);

                    RageUI.Button("Enfants", 'Ped ADD-ONS (Vip ~s~Diamond)', {RightLabel = "→"}, vipLevel > 2, {
                    }, PedsAddonsMenu);

				end)

                RageUI.IsVisible(PedsGangsMenu, function()

                    for k,v in pairs(SweetyLife.Peds.Gangs) do
                        RageUI.Button(v.name, PDesc, {RightBadge = RageUI.BadgeStyle.None}, PedTimeout, {
                            onSelected = function()
                                if isDead == true then
                                    print("anti revive(:")
                                else
                                    SpawnPed(v.spawn)
                                    IsPed = true
                                end
                            end
                        });
                    end

                end)

                RageUI.IsVisible(PedsCivilsMenu, function()

                    for k,v in pairs(SweetyLife.Peds.Civils) do
                        RageUI.Button(v.name, PDesc, {RightBadge = RageUI.BadgeStyle.None}, PedTimeout, {
                            onSelected = function()
                                if isDead == true then
                                    print("anti revive(:")
                                else
                                    SpawnPed(v.spawn)
                                    IsPed = true
                                end
                            end
                        });
                    end

                end)

                RageUI.IsVisible(PedsAutresMenu, function()

                    for k,v in pairs(SweetyLife.Peds.Autres) do
                        RageUI.Button(v.name, PDesc, {RightBadge = RageUI.BadgeStyle.None}, PedTimeout, {
                            onSelected = function()
                                if isDead == true then
                                    print("anti revive(:")
                                else
                                    SpawnPed(v.spawn)
                                    IsPed = true
                                end
                            end
                        });
                    end

                end)

                RageUI.IsVisible(PedsAddonsMenu, function()

                    for k,v in pairs(SweetyLife.Peds.Addons) do
                        RageUI.Button(v.name, PDesc, {RightBadge = RageUI.BadgeStyle.None}, PedTimeout, {
                            onSelected = function()
                                if isDead == true then
                                    print("anti revive(:")
                                else
                                    SpawnPed(v.spawn)
                                    IsPed = true
                                end
                            end
                        });
                    end

                end)
RageUI.IsVisible(PropsSubMenu, function()
                        

    RageUI.Separator("~h~ABUS DE PROPS = ~s~BAN PERM")

          

    RageUI.List("Trier", {"Props | ~g~Civil", "Props | ~g~Illégal"}, itemIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                itemIndex = Index
            end,
                onSelected = function()
            end,
    })
        if itemIndex == 1 then
                for _, v in pairs (legalprops) do
                
                    RageUI.Button(v.nameprops, nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onSelected = function()
                            local _src = source
                            SpawnObj2(v.modelprops)
                            local nameprops = v.nameprops
                        end 
                    });
                end
            else
                for _, v in pairs (illegalprops) do
            
                    RageUI.Button(v.nameprops, nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                        onSelected = function()
                            local _src = source
                            SpawnObj2(v.modelprops)
                            local nameprops = v.nameprops
                        end 
                    });
                end
            end
    
end)
        
    RageUI.IsVisible(DeletePropsSubMenu, function()
            
            
            for k,v in pairs(object) do
                if GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(v))) == 0 then table.remove(object, k) end

                RageUI.Button("Props : "..GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(v))).." ["..v.."]", nil, {}, true, {
                    onActive = function()
                        local entity = NetworkGetEntityFromNetworkId(v)
                        local ObjCoords = GetEntityCoords(entity)
                        DrawMarker(20, ObjCoords.x, ObjCoords.y, ObjCoords.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 33, 172, 235, 255, 1, 0, 2, 1, nil, nil, 0)
                    end,
                    onSelected = function()
                        RemoveObj(v, k)
                    end 
            });
        end
    end)
end
end)
end
end

RegisterNetEvent("Koy:AimeLesPigeons", function(vipLevel, canAccess)
    if (canAccess) then
        OpenPedsMenu(vipLevel)
    else
        ESX.ShowNotification('Vous devez acheter le grade VIP dans la boutique !')
    end
end);

TriggerEvent('chat:addSuggestion', '/vip', 'Ouvrir le menu VIP', {})