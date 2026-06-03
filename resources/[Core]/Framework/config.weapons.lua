local Hash = GetHashKey;	

Config.DefaultWeaponTints = {
	[0] = _U('tint_default'),
	[1] = _U('tint_green'),
	[2] = _U('tint_gold'),
	[3] = _U('tint_pink'),
	[4] = _U('tint_army'),
	[5] = _U('tint_lspd'),
	[6] = _U('tint_orange'),
	[7] = _U('tint_platinum')
}


Config.Weapons = {
	-- Weapon Imports

    {
        name = 'WEAPON_A15RC',
        label = _U('WEAPON_A15RC'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
        components = {
            {name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_a15rc_mag1') },
            {name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_a15rc_mag2') },
            {name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_a15rc_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_a15rc_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_a15rc_grip')}
        }
    },

    -- GLOCK 17 PERM


    {
		name = 'WEAPON_GLOCK17',
		label = _U('WEAPON_GLOCK17'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
        tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default', label = "CLIP DEFAULT", hash = GetHashKey('COMPONENT_COMBATPISTOL_CLIP_01')},
			{ name = 'clip_extended', label = "EXTENDED CLIP", hash = GetHashKey('COMPONENT_GLOCKLEOSHOP_CLIP_02')},
			{ name = 'flashlight', label = "FLASHLIGHT", hash = GetHashKey('COMPONENT_AT_GLOCKLEOSHOP_FLSH')},
			{ name = 'suppressor', label = "SUPPRESSOR", hash = GetHashKey('COMPONENT_AT_GLOCKLEOSHOP_SUPP')}
		}
	},
    
    --
    {
        name = 'WEAPON_NEVA',
        label = _U('WEAPON_NEVA'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = Hash('w_ar_neva_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = Hash('w_ar_neva_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = Hash('w_at_ar_neva_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = Hash('w_at_ar_neva_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = Hash('w_at_ar_neva_grip')}
        }
    },
    --
    {
        name = 'WEAPON_IAR',
        label = _U('WEAPON_IAR'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_iar_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_iar_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_iar_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_iar_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_iar_grip')}
        }
    },
    --
    {
        name = 'WEAPON_M133',
        label = _U('WEAPON_M133'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_m133_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_m133_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_m133_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_m133_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_m133_grip')}
        }
    },
    --
    {
        name = 'WEAPON_JRBAK',
        label = _U('WEAPON_JRBAK'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_jrbak_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_jrbak_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_jrbak_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_jrbak_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_jrbak_grip')}
        }
    },
    --
    {
        name = 'WEAPON_FAMASU1',
        label = _U('WEAPON_FAMASU1'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_famasu1_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_famasu1_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_famasu1_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_famasu1_supp')}
        }
    },
    --
    {
        name = 'WEAPON_GRAU',
        label = _U('WEAPON_GRAU'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_grau_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_grau_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_grau_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_grau_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_grau_grip')}
        }
    },
    --
    {
        name = 'WEAPON_AK47S',
        label = _U('WEAPON_AK47S'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_ak47s_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_ak47s_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_ak47s_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_ak47s_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_ak47s_grip')}
        }
    },
    --
    {
        name = 'WEAPON_SR47',
        label = _U('WEAPON_SR47'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_sr47_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_sr47_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_sr47_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_sr47_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_sr47_grip')}
        }
    },
    --
    {
        name = 'WEAPON_AK4K',
        label = _U('WEAPON_AK4K'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_ak4k_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_ak4k_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_ak4k_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_ak4k_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_ak4k_grip')}
        }
    },
    --
    {
        name = 'WEAPON_AKMKH',
        label = _U('WEAPON_AKMKH'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_akmkh_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_akmkh_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_akmkh_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_akmkh_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_akmkh_grip')}
        }
    },
    --
    {
        name = 'WEAPON_BULLDOG',
        label = _U('WEAPON_BULLDOG'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_bulldog_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_bulldog_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_bulldog_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_bulldog_supp')}
        }
    },
    --
    {
        name = 'WEAPON_CASR',
        label = _U('WEAPON_CASR'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_casr_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_casr_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_casr_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_casr_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_casr_grip')}
        }
    },
    --
    {
        name = 'WEAPON_DRH',
        label = _U('WEAPON_DRH'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_drh_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_drh_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_drh_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_drh_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_drh_grip')}
        }
    },
    --
    {
        name = 'WEAPON_FMR',
        label = _U('WEAPON_FMR'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_fmr_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_fmr_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_fmr_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_fmr_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_fmr_grip')}
        }
    },
    --
    {
        name = 'WEAPON_FN42',
        label = _U('WEAPON_FN42'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_fn42_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_fn42_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_fn42_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_fn42_supp')}
        }
    },
    --
    {
        name = 'WEAPON_GALILAR',
        label = _U('WEAPON_GALILAR'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_galilar_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_galilar_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_galilar_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_galilar_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_galilar_grip')}
        }
    },
    --
    {
        name = 'WEAPON_M16A3',
        label = _U('WEAPON_M16A3'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_m16a3_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_m16a3_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_m16a3_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_m16a3_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_m16a3_grip')}
        }
    },
    --
    {
        name = 'WEAPON_SLR15',
        label = _U('WEAPON_SLR15'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_slr15_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_slr15_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_slr15_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_slr15_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_slr15_grip')}
        }
    },
    --
    {
        name = 'WEAPON_ARC15',
        label = _U('WEAPON_ARC15'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_arc15_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_arc15_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_arc15_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_arc15_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_arc15_grip')}
        }
    },
    --
    {
		name = 'WEAPON_ARS',
		label = _U('WEAPON_ARS'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_ars_mag1') },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_ars_mag2') },
			{ name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_ars_scope') },
			{name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_ars_supp')},
			{name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_ars_grip')}
		}
	},
    --
    {
        name = 'WEAPON_HOWA_2',
        label = _U('WEAPON_HOWA_2'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_howa_2_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_howa_2_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_howa_2_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_howa_2_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_howa_2_grip')}
        }
    },
    --
    {
        name = 'WEAPON_MZA',
        label = _U('WEAPON_MZA'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_mza_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_mza_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_mza_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_mza_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_mza_grip')}
        }
    },
    --
    {
        name = 'WEAPON_SAFAK',
        label = _U('WEAPON_SAFAK'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_safak_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_safak_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_safak_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_safak_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_safak_grip')}
        }
    },
    --
    {
        name = 'WEAPON_SAR',
        label = _U('WEAPON_SAR'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_sar_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_sar_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_sar_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_sar_supp')}
        }
    },
    --
    {
        name = 'WEAPON_SFAK',
        label = _U('WEAPON_SFAK'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_sfak_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_sfak_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_sfak_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_sfak_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_sfak_grip')}
        }
    },
    --
    {
        name = 'WEAPON_ARMA1',
        label = _U('WEAPON_ARMA1'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_arma1_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_arma1_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_arma1_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_arma1_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_arma1_grip')}
        }
    },
    --
    {
        name = 'WEAPON_G36',
        label = _U('WEAPON_G36'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_g36_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_g36_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_g36_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_g36_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_g36_grip')}
        }
    },
    --
    {
        name = 'WEAPON_LR300',
        label = _U('WEAPON_LR300'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_lr300_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_lr300_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_lr300_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_lr300_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_lr300_grip')}
        }
    },
    --
    {
        name = 'WEAPON_M416P',
        label = _U('WEAPON_M416P'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_m416p_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_m416p_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_m416p_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_m416p_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_m416p_grip')}
        }
    },
    --
    {
        name = 'WEAPON_NANITE',
        label = _U('WEAPON_NANITE'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_nanite_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_nanite_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_nanite_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_nanite_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_nanite_grip')}
        }
    },
    --
    {
        name = 'WEAPON_SF2',
        label = _U('WEAPON_SF2'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_sf2_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_sf2_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_sf2_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_sf2_supp')}
        }
    },
    --
    {
        name = 'WEAPON_SFRIFLE',
        label = _U('WEAPON_SFRIFLE'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_sfrifle_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_sfrifle_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_sfrifle_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_sfrifle_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_sfrifle_grip')}
        }
    },
    --
    {
        name = 'WEAPON_CFS',
        label = _U('WEAPON_CFS'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_cfs_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_cfs_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_cfs_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_cfs_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_cfs_grip')}
        }
    },
    --
    {
        name = 'WEAPON_AK47',
        label = _U('WEAPON_AK47'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_ak47_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_ak47_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_ak47_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_ak47_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_ak47_grip')}
        }
    },
    --
    {
        name = 'WEAPON_AUG',
        label = _U('WEAPON_AUG'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_aug_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_aug_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_aug_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_aug_supp')}
        }
    },
    --
    {
        name = 'WEAPON_SUNDA',
        label = _U('WEAPON_SUNDA'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_sunda_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_sunda_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_sunda_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_sunda_supp')}
        }
    },
    --
    {
        name = 'WEAPON_G3_2',
        label = _U('WEAPON_G3_2'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_g3_2_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_g3_2_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_g3_2_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_g3_2_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_g3_2_grip')}
        }
    },
    --
    {
        name = 'WEAPON_GROZA',
        label = _U('WEAPON_GROZA'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_groza_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_groza_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_groza_scope') },
            { name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_groza_supp')}
        }
    },
    --
    {
        name = 'WEAPON_ACR',
        label = _U('ACR'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_acr_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_acr_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_acr_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_acr_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_acr_grip')}
        }
    },
    --
    {
        name = 'WEAPON_ACWR',
        label = _U('ACWR'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_acwr_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_acwr_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_acwr_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_acwr_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_acwr_grip')}
        }
    },
    --
    {
        name = 'WEAPON_ANARCHY',
        label = _U('ANARCHY'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_anarchy_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_anarchy_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_anarchy_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_anarchy_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_anarchy_grip')}
        }
    },
    --
    {
        name = 'WEAPON_FAR',
        label = _U('FAR'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_far_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_far_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_far_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_far_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_far_grip')}
        }
    },
    --
    --
    {
        name = 'WEAPON_TAR21',
        label = _U('TAR21'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_tar21_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_tar21_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_tar21_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_tar21_supp')}
        }
    },
    --
    {
        name = 'WEAPON_AKPU',
        label = _U('AKPU'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_akpu_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_akpu_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_akpu_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_akpu_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_akpu_grip')}
        }
    },
    --
    {
        name = 'WEAPON_AN94_2',
        label = _U('AN94_2'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_an94_2_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_an94_2_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_an94_2_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_an94_2_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_an94_2_grip')}
        }
    },
    --
    {
        name = 'WEAPON_ART64',
        label = _U('ART64'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_art64_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_art64_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_art64_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_art64_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_art64_grip')}
        }
    },
    --
    {
        name = 'WEAPON_GYS',
        label = _U('WEAPON_GYS'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_gys_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_gys_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_gys_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_gys_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_gys_grip')}
        }
    },
    --
    {
        name = 'WEAPON_SM237',
        label = _U('SM237'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_sm237_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_sm237_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_sm237_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_sm237_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_sm237_grip')}
        }
    },
    --
    {
        name = 'WEAPON_SS2_2',
        label = _U('SS2_2'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_ss2_2_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_ss2_2_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_ss2_2_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_ss2_2_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_ss2_2_grip')}
        }
    },
    --
    {
        name = 'WEAPON_SCARSC',
        label = _U('SCARSC'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_scarsc_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_scarsc_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_scarsc_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_scarsc_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_scarsc_grip')}
        }
    },
    --
    {
        name = 'WEAPON_VA030',
        label = _U('VA030'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_va030_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_va030_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_va030_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_va030_supp')}
        }
    },
    --
    {
        name = 'WEAPON_AR121',
        label = _U('AR121'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_ar121_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_ar121_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_ar121_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_ar121_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_ar121_grip')}
        }
    },
    --
    {
        name = 'WEAPON_LGWII',
        label = _U('Lewis Gun WWII'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
		 { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_lgwii_mag1') },
		 { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_lgwii_mag2') },
		 { name = 'grip', label = _U('component_grip'), hash = GetHashKey('w_at_ar_lgwii_grip') }
	    }
    },
    --
    {
        name = 'WEAPON_AR727',
        label = _U('AR727'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_ar727_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_ar727_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_ar727_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_ar727_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_ar727_grip')}
        }
    },
    --
    {
        name = 'WEAPON_ANR15',
        label = _U('ANR15'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_anr15_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_anr15_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_anr15_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_anr15_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_anr15_grip')}
        }
    },
    --
    {
        name = 'WEAPON_DKS501',
        label = _U('DKS501'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_dks501_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_dks501_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_dks501_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_dks501_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_dks501_grip')}
        }
    },
    --
    {
        name = 'WEAPON_SCIFW',
        label = _U('SCIFW'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_scifw_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_scifw_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_scifw_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_scifw_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_scifw_grip')}
        }
    },
    --
    {
        name = 'WEAPON_SSR56',
        label = _U('SSR56'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_ssr56_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_ssr56_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_ssr56_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_ssr56_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_ssr56_grip')}
        }
    },
    --
    {
        name = 'WEAPON_AKBG',
        label = _U('AKBG'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_akbg_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_akbg_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_akbg_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_akbg_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_akbg_grip')}
        }
    },
    --
    {
        name = 'WEAPON_ANM4',
        label = _U('ANM4'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_anm4_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_anm4_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_anm4_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_anm4_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_anm4_grip')}
        }
    },
    --
    {
        name = 'WEAPON_GVANDAL',
        label = _U('GVANDAL'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_gvandal_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_gvandal_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_gvandal_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_gvandal_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_gvandal_grip')}
        }
    },
    --
    {
        name = 'WEAPON_L85',
        label = _U('L85'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_l85_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_l85_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_l85_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_l85_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_l85_grip')}

        }
    },
    --
    {
        name = 'WEAPON_LIMPID',
        label = _U('LIMPID'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_limpid_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_limpid_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_limpid_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_limpid_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_limpid_grip')}
        }
    },
    --
    {
        name = 'WEAPON_TRUVELO',
        label = _U('TRUVELO'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_ar_truvelo_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_ar_truvelo_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_ar_truvelo_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_ar_truvelo_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_ar_truvelo_grip')}
        }
    },
    --

    -- DoItDigital Submachine Guns
    {
        name = 'WEAPON_SB4S',
        label = _U('SB4S'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_sb4s_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_sb4s_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_sb4s_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_sb4s_supp')}
        }
    },
    --
    {
        name = 'WEAPON_H2SMG',
        label = _U('H2SMG'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_h2smg_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_h2smg_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_h2smg_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_h2smg_supp')}
        }
    },
    --
    {
        name = 'WEAPON_HFSMG',
        label = _U('HFSMG'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_hfsmg_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_hfsmg_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_hfsmg_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_hfsmg_supp')}
        }
    },
    --
    {
        name = 'WEAPON_MS32',
        label = _U('MS32'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_ms32_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_ms32_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_ms32_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_ms32_supp')}
        }
    },
    --
    {
        name = 'WEAPON_SARB',
        label = _U('SARB'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_sarb_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_sarb_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_sarb_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_sarb_supp')}
        }
    },
    --
    {
        name = 'WEAPON_UE4',
        label = _U('UE4'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_ue4_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_ue4_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_ue4_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_ue4_supp')}
        }
    },
    --
    {
        name = 'WEAPON_UZI',
        label = _U('WEAPON_UZI'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_uzi_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_uzi_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_uzi_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_uzi_supp')}
        }
    },
    --
    {
        name = 'WEAPON_IDW',
        label = _U('IDW'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_idw_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_idw_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_idw_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_idw_supp')}
        }
    },
    --
    {
        name = 'WEAPON_HEAVYSMG',
        label = _U('HEAVYSMG'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_heavysmg_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_heavysmg_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_heavysmg_scope') },
            { name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_heavysmg_supp')},
            { name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_sb_heavysmg_grip')}
        }
    },
    --
    {
        name = 'WEAPON_SMG9',
        label = _U('SMG9'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_smg9_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_smg9_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_smg9_scope') },
            { name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_smg9_supp')},
            { name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_sb_smg9_grip')}
        }
    },
    --
    {
        name = 'WEAPON_R99',
        label = _U('R99'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_r99_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_r99_mag2') }
        }
    },
    --
    {
        name = 'WEAPON_SB181',
        label = _U('SB181'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_sb181_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_sb181_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_sb181_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_sb181_supp')}
        }
    },
    --
    {
        name = 'WEAPON_UMP45',
        label = _U('UMP45'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_ump45_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_ump45_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_ump45_scope') },
            { name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_ump45_supp')},
            { name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_sb_ump45_grip')}

        }
    },
    --
    {
        name = 'WEAPON_SMG1311',
        label = _U('SMG1311'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_smg1311_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_smg1311_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_smg1311_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_smg1311_supp')}
        }
    },
    --
    {
        name = 'WEAPON_AUTOSMG',
        label = _U('AUTOSMG'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_autosmg_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_autosmg_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_autosmg_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_autosmg_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_sb_autosmg_grip')}
        }
    },
    --
    {
        name = 'WEAPON_MX4',
        label = _U('MX4'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_mx4_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_mx4_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_mx4_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_mx4_supp')},
            {name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_sb_mx4_grip')}
        }
    },
    --
    {
        name = 'WEAPON_PASMG',
        label = _U('PASMG'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sb_pasmg_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_sb_pasmg_mag2') },
            { name = 'scope', label = _U('component_scope'), hash = GetHashKey('w_at_sb_pasmg_scope') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sb_pasmg_supp')}
        }
    },
    --

    -- DoItDigital Handguns
    {
        name = 'WEAPON_FN502',
        label = _U('FN502'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_pi_fn502_mag1') },
            { name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_pi_fn502_mag2') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_pi_fn502_supp')}
        }
    },
    --
    {
		name = 'WEAPON_HFAP',
		label = _U('HFAP'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
        tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_pi_hfap_mag1') },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_pi_hfap_mag2') },
			{ name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('w_at_pi_hfap_supp') }
		}
	},
	--
    {
        name = 'WEAPON_KNR',
        label = _U('KNR'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip', label = _U('component_clip_default'), hash = 'w_pi_knr_mag1' },
            { name = 'flashlight', label = _U('component_flashlight'), hash = 'w_at_pi_knr_flsh' },
            { name = 'scope', label = _U('component_scope'), hash = 'w_at_pi_knr_scope' },
            { name = 'compensator', label = _U('component_compensator'), hash = 'w_at_pi_knr_comp' }
        }
    },
    --
    {
		name = 'WEAPON_CZ75',
		label = _U('CZ75'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
        tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_pi_cz75_mag1') },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_pi_cz75_mag2') },
			{ name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('w_at_pi_cz75_supp') }
		}
	},
	--
    {
		name = 'WEAPON_PL14',
		label = _U('PL14'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
        tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_pi_pl14_mag1') },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('w_pi_pl14_mag2') },
			{ name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('w_at_pi_pl14_supp') },
			{ name = 'flashlight', label = _U('component_flashlight'), hash = 'w_at_pi_pl14_flsh' }
		}
	},
	--


    -- DoItDigital Sniper Rifle
    {
        name = 'WEAPON_AWP',
        label = _U('AWP'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SNIPER')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sr_awp_mag1') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sr_awp_supp')}
        }
    },
    --
    {
        name = 'WEAPON_DITDG',
        label = _U('DITDG'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SNIPER')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('w_sr_ditdg_mag1') },
            {name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sr_ditdg_supp')}
        }
    },
    --


    -- DoItDigital Shotguns
    {
        name = 'WEAPON_M90S',
        label = _U('M90S'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SHOTGUN')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip', label = _U('component_clip_default'), hash = GetHashKey('w_sg_m90s_mag1') }
        }
    },
    --
    {
        name = 'WEAPON_DCS',
        label = _U('DCS'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SHOTGUN')},
        tints = Config.DefaultWeaponTints,
        components = {
            { name = 'clip', label = _U('component_clip_default'), hash = GetHashKey('w_sg_dcs_mag1') },
            { name = 'suppressor',         label = _U('component_suppressor'),     hash = GetHashKey('w_at_sg_dcs_supp')},
			{ name = 'grip',         label = _U('component_grip'),     hash = GetHashKey('w_at_sg_dcs_grip')}
        }
    },
    --
    {
        name = 'WEAPON_OWSHOTGUN',
        label = _U('OWSHOTGUN'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SHOTGUN')},
        tints = Config.DefaultWeaponTints,
        components = {
        }
    },

    --

    -- DoItDigital Meelee/Throwables
	{
        name = 'WEAPON_BOOK',
        label = _U('BOOK'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_BOOK')},
        tints = Config.DefaultWeaponTints,
    },
    --
    {
        name = 'WEAPON_BRICK',
        label = _U('BRICK'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_BRICK')},
        tints = Config.DefaultWeaponTints,
    },
    --
    {
        name = 'WEAPON_ENERGYKNIFE',
        label = _U('WEAPON_ENERGYKNIFE'),
        tints = Config.DefaultWeaponTints,
        components = {}
    },
    --
    {
        name = 'WEAPON_HIGHBOOT',
        label = _U('HIGHBOOT'),
        ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_HIGHBOOT')},
        tints = Config.DefaultWeaponTints,
    },
    --
    {
        name = 'WEAPON_KARAMBIT',
        label = _U('WEAPON_KARAMBIT'),
        tints = Config.DefaultWeaponTints,
        components = {}
    },
	


	-- Melee
	{name = 'WEAPON_DAGGER', label = _U('weapon_dagger'), components = {}},
	{name = 'WEAPON_BAT', label = _U('weapon_bat'), components = {}},
	{name = 'WEAPON_BATTLEAXE', label = _U('weapon_battleaxe'), components = {}},
	{
		name = 'WEAPON_KNUCKLE',
		label = _U('weapon_knuckle'),
		components = {
			{name = 'knuckle_base', label = _U('component_knuckle_base'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_BASE")},
			{name = 'knuckle_pimp', label = _U('component_knuckle_pimp'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_PIMP")},
			{name = 'knuckle_ballas', label = _U('component_knuckle_ballas'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_BALLAS")},
			{name = 'knuckle_dollar', label = _U('component_knuckle_dollar'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_DOLLAR")},
			{name = 'knuckle_diamond', label = _U('component_knuckle_diamond'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_DIAMOND")},
			{name = 'knuckle_hate', label = _U('component_knuckle_hate'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_HATE")},
			{name = 'knuckle_love', label = _U('component_knuckle_love'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_LOVE")},
			{name = 'knuckle_player', label = _U('component_knuckle_player'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_PLAYER")},
			{name = 'knuckle_king', label = _U('component_knuckle_king'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_KING")},
			{name = 'knuckle_vagos', label = _U('component_knuckle_vagos'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_VAGOS")}
		}
	},
	{name = 'WEAPON_BOTTLE', label = _U('weapon_bottle'), components = {}},
	{name = 'WEAPON_CROWBAR', label = _U('weapon_crowbar'), components = {}},
	{name = 'WEAPON_FLASHLIGHT', label = _U('weapon_flashlight'), components = {}},
	{name = 'WEAPON_GOLFCLUB', label = _U('weapon_golfclub'), components = {}},
	{name = 'WEAPON_HAMMER', label = _U('weapon_hammer'), components = {}},
	{name = 'WEAPON_HATCHET', label = _U('weapon_hatchet'), components = {}},
	{name = 'WEAPON_KNIFE', label = _U('weapon_knife'), components = {}},
	{name = 'WEAPON_MACHETE', label = _U('weapon_machete'), components = {}},
	{name = 'WEAPON_NIGHTSTICK', label = _U('weapon_nightstick'), components = {}},
	{name = 'WEAPON_WRENCH', label = _U('weapon_wrench'), components = {}},
	{name = 'WEAPON_POOLCUE', label = _U('weapon_poolcue'), components = {}},
	{name = 'WEAPON_STONE_HATCHET', label = _U('weapon_stone_hatchet'), components = {}},
	{
		name = 'WEAPON_SWITCHBLADE',
		label = _U('weapon_switchblade'),
		components = {
			{name = 'handle_default', label = _U('component_handle_default'), hash = GetHashKey("COMPONENT_SWITCHBLADE_VARMOD_BASE")},
			{name = 'handle_vip', label = _U('component_handle_vip'), hash = GetHashKey("COMPONENT_SWITCHBLADE_VARMOD_VAR1")},
			{name = 'handle_bodyguard', label = _U('component_handle_bodyguard'), hash = GetHashKey("COMPONENT_SWITCHBLADE_VARMOD_VAR2")}
		}
	},
	-- Handguns
	{
		name = 'WEAPON_APPISTOL',
		label = _U('weapon_appistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_APPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_APPISTOL_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE")}
		}
	},
	{name = 'WEAPON_CERAMICPISTOL', label = _U('weapon_ceramicpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")}},
	{
		name = 'WEAPON_COMBATPISTOL',
		label = _U('weapon_combatpistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_COMBATPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER")}
		}
	},
	{name = 'WEAPON_DOUBLEACTION', label = _U('weapon_doubleaction'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")}},
	{name = 'WEAPON_NAVYREVOLVER', label = _U('weapon_navyrevolver'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")}},
	{name = 'WEAPON_FLAREGUN', label = _U('weapon_flaregun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_flaregun'), hash = GetHashKey("AMMO_FLAREGUN")}},
	{name = 'WEAPON_GADGETPISTOL', label = _U('weapon_gadgetpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")}},
	{
		name = 'WEAPON_HEAVYPISTOL',
		label = _U('weapon_heavypistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_REVOLVER',
		label = _U('weapon_revolver'),
		ammo = {label = _U('ammo_rounds'),hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_REVOLVER_CLIP_01")},
			{name = 'vip_finish', label = _U('component_vip_finish'), hash = GetHashKey("COMPONENT_REVOLVER_VARMOD_BOSS")},
			{name = 'bodyguard_finish', label = _U('component_bodyguard_finish'), hash = GetHashKey("COMPONENT_REVOLVER_VARMOD_GOON")}
		}
	},
	{
		name = 'WEAPON_REVOLVER_MK2',
		label = _U('weapon_revolver_mk2'),
		ammo = {label = _U('ammo_rounds'),hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_01")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_FMJ")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_small', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'compensator', label = _U('component_compensator'), hash = GetHashKey("COMPONENT_AT_PI_COMP_03")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_IND_01")}
		}
	},
	{name = 'WEAPON_MARKSMANPISTOL', label = _U('weapon_marksmanpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")}},
	{
		name = 'WEAPON_PISTOL',
		label = _U('weapon_pistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_PISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_PISTOL_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_PISTOL_MK2',
		label = _U('weapon_pistol_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_FMJ")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_PI_RAIL")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH_02")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP_02")},
			{name = 'compensator', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_COMP")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_IND_01")},
			{name = 'camo_slide_finish', label = _U('component_camo_slide_finish'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_SLIDE")},
			{name = 'camo_slide_finish2', label = _U('component_camo_slide_finish2'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_02_SLIDE")},
			{name = 'camo_slide_finish3', label = _U('component_camo_slide_finish3'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_03_SLIDE")},
			{name = 'camo_slide_finish4', label = _U('component_camo_slide_finish4'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_04_SLIDE")},
			{name = 'camo_slide_finish5', label = _U('component_camo_slide_finish5'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_05_SLIDE")},
			{name = 'camo_slide_finish6', label = _U('component_camo_slide_finish6'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_06_SLIDE")},
			{name = 'camo_slide_finish7', label = _U('component_camo_slide_finish7'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_07_SLIDE")},
			{name = 'camo_slide_finish8', label = _U('component_camo_slide_finish8'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_08_SLIDE")},
			{name = 'camo_slide_finish9', label = _U('component_camo_slide_finish9'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_09_SLIDE")},
			{name = 'camo_slide_finish10', label = _U('component_camo_slide_finish10'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_10_SLIDE")},
			{name = 'camo_slide_finish11', label = _U('component_camo_slide_finish11'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_IND_01_SLIDE")}
		}
	},
	{
		name = 'WEAPON_PISTOL50',
		label = _U('weapon_pistol50'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_PISTOL50_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_PISTOL50_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_SNSPISTOL',
		label = _U('weapon_snspistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SNSPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SNSPISTOL_CLIP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_SNSPISTOL_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_SNSPISTOL_MK2',
		label = _U('weapon_snspistol_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_FMJ")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_PI_RAIL_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH_03")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP_02")},
			{name = 'compensator', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_COMP_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_IND_01")},
			{name = 'camo_slide_finish', label = _U('component_camo_slide_finish'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_SLIDE")},
			{name = 'camo_slide_finish2', label = _U('component_camo_slide_finish2'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_02_SLIDE")},
			{name = 'camo_slide_finish3', label = _U('component_camo_slide_finish3'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_03_SLIDE")},
			{name = 'camo_slide_finish4', label = _U('component_camo_slide_finish4'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_04_SLIDE")},
			{name = 'camo_slide_finish5', label = _U('component_camo_slide_finish5'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_05_SLIDE")},
			{name = 'camo_slide_finish6', label = _U('component_camo_slide_finish6'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_06_SLIDE")},
			{name = 'camo_slide_finish7', label = _U('component_camo_slide_finish7'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_07_SLIDE")},
			{name = 'camo_slide_finish8', label = _U('component_camo_slide_finish8'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_08_SLIDE")},
			{name = 'camo_slide_finish9', label = _U('component_camo_slide_finish9'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_09_SLIDE")},
			{name = 'camo_slide_finish10', label = _U('component_camo_slide_finish10'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_10_SLIDE")},
			{name = 'camo_slide_finish11', label = _U('component_camo_slide_finish11'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_IND_01_SLIDE")}
		}
	},
	{name = 'WEAPON_STUNGUN', label = _U('weapon_stungun'), tints = Config.DefaultWeaponTints, components = {}},
	{name = 'WEAPON_RAYPISTOL', label = _U('weapon_raypistol'), tints = Config.DefaultWeaponTints, components = {}},
	{
		name = 'WEAPON_VINTAGEPISTOL',
		label = _U('weapon_vintagepistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_02")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")}
		}
	},
	-- Shotguns
	{
		name = 'WEAPON_ASSAULTSHOTGUN',
		label = _U('weapon_assaultshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")}
		}
	},
	{name = 'WEAPON_AUTOSHOTGUN', label = _U('weapon_autoshotgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")}},
	{
		name = 'WEAPON_BULLPUPSHOTGUN',
		label = _U('weapon_bullpupshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")}
		}
	},
	{
		name = 'WEAPON_COMBATSHOTGUN',
		label = _U('weapon_combatshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")}
		}
	},
	{name = 'WEAPON_DBSHOTGUN', label = _U('weapon_dbshotgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")}},
	{
		name = 'WEAPON_HEAVYSHOTGUN',
		label = _U('weapon_heavyshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")}
		}
	},
	{name = 'WEAPON_MUSKET', label = _U('weapon_musket'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SHOTGUN")}},
	{
		name = 'WEAPON_PUMPSHOTGUN',
		label = _U('weapon_pumpshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_SR_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_PUMPSHOTGUN_MK2',
		label = _U('weapon_pumpshotgun_mk2'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'shells_default', label = _U('component_shells_default'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_01")},
			{name = 'shells_incendiary', label = _U('component_shells_incendiary'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY")},
			{name = 'shells_armor', label = _U('component_shells_armor'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING")},
			{name = 'shells_hollowpoint', label = _U('component_shells_hollowpoint'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT")},
			{name = 'shells_explosive', label = _U('component_shells_explosive'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_small', label = _U('component_scope_small'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_SR_SUPP_03")},
			{name = 'muzzle_squared', label = _U('component_muzzle_squared'), hash = GetHashKey("COMPONENT_AT_MUZZLE_08")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_SAWNOFFSHOTGUN',
		label = _U('weapon_sawnoffshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE")}
		}
	},
	-- SMG & LMG
	{
		name = 'WEAPON_ASSAULTSMG',
		label = _U('weapon_assaultsmg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_ASSAULTSMG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_ASSAULTSMG_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_COMBATMG',
		label = _U('weapon_combatmg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_COMBATMG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_COMBATMG_CLIP_02")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_COMBATMG_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_COMBATMG_MK2',
		label = _U('weapon_combatmg_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_FMJ")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2")},
			{name = 'scope_large', label = _U('component_scope_large'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_MG_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_MG_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_COMBATPDW',
		label = _U('weapon_combatpdw'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_COMBATPDW_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_COMBATPDW_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_COMBATPDW_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")}
		}
	},
	{
		name = 'WEAPON_GUSENBERG',
		label = _U('weapon_gusenberg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_GUSENBERG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_GUSENBERG_CLIP_02")}
		}
	},
	{
		name = 'WEAPON_MACHINEPISTOL',
		label = _U('weapon_machinepistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_03")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")}
		}
	},
	{
		name = 'WEAPON_MG',
		label = _U('weapon_mg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MG_CLIP_02")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_MG_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_MICROSMG',
		label = _U('weapon_microsmg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MICROSMG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MICROSMG_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_MINISMG',
		label = _U('weapon_minismg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MINISMG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MINISMG_CLIP_02")}
		}
	},
	{
		name = 'WEAPON_SMG',
		label = _U('weapon_smg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SMG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SMG_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_SMG_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_02")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_SMG_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_SMG_MK2',
		label = _U('weapon_smg_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_FMJ")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS_SMG")},
			{name = 'scope_small', label = _U('component_scope_small'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2")},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_SMG_MK2")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_SB_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_SB_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = ("COMPONENT_SMG_MK2_CAMO_IND_01")}
		}
	},
	{name = 'WEAPON_RAYCARBINE', label = _U('weapon_raycarbine'), ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")}, tints = Config.DefaultWeaponTints, components = {}},
	-- Rifles
	{
		name = 'WEAPON_ADVANCEDRIFLE',
		label = _U('weapon_advancedrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_ASSAULTRIFLE',
		label = _U('weapon_assaultrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_ASSAULTRIFLE_MK2',
		label = _U('weapon_assaultrifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_small', label = _U('component_scope_small'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{name = 'scope_large', label = _U('component_scope_large'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_AR_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_AR_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_BULLPUPRIFLE',
		label = _U('weapon_bullpuprifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_VARMOD_LOW")}
		}
	},
	{
		name = 'WEAPON_BULLPUPRIFLE_MK2',
		label = _U('weapon_bullpuprifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_small', label = _U('component_scope_small'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_MK2")},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_BP_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_BP_BARREL_02")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_CARBINERIFLE',
		label = _U('weapon_carbinerifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_CARBINERIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02")},
			{name = 'clip_box', label = _U('component_clip_box'), hash = GetHashKey("COMPONENT_CARBINERIFLE_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_CARBINERIFLE_MK2',
		label = _U('weapon_carbinerifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{name = 'scope_large', label = _U('component_scope_large'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_CR_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_CR_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_COMPACTRIFLE',
		label = _U('weapon_compactrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_03")}
		}
	},
	{
		name = 'WEAPON_MILITARYRIFLE',
		label = _U('weapon_militaryrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MILITARYRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MILITARYRIFLE_CLIP_02")},
			{name = 'ironsights', label = _U('component_ironsights'), hash = GetHashKey("COMPONENT_MILITARYRIFLE_SIGHT_01")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")}
		}
	},
	{
		name = 'WEAPON_SPECIALCARBINE',
		label = _U('weapon_specialcarbine'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_SPECIALCARBINE_MK2',
		label = _U('weapon_specialcarbine_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_small', label = _U('component_scope_small'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{name = 'scope_large', label = _U('component_scope_large'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_SC_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_SC_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01")}
		}
	},
	-- Sniper
	{
		name = 'WEAPON_HEAVYSNIPER',
		label = _U('weapon_heavysniper'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SNIPER")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE")},
			{name = 'scope_advanced', label = _U('component_scope_advanced'), hash = GetHashKey("COMPONENT_AT_SCOPE_MAX")}
		}
	},
	{
		name = 'WEAPON_HEAVYSNIPER_MK2',
		label = _U('weapon_heavysniper_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SNIPER")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_02")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ")},
			{name = 'ammo_explosive', label = _U('component_ammo_explosive'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE")},
			{name = 'scope_zoom', label = _U('component_scope_zoom'), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE_MK2")},
			{name = 'scope_advanced', label = _U('component_scope_advanced'), hash = GetHashKey("COMPONENT_AT_SCOPE_MAX")},
			{name = 'scope_nightvision', label = _U('component_scope_nightvision'), hash = GetHashKey("COMPONENT_AT_SCOPE_NV")},
			{name = 'scope_thermal', label = _U('component_scope_thermal'), hash = GetHashKey("COMPONENT_AT_SCOPE_THERMAL")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_SR_SUPP_03")},
			{name = 'muzzle_squared', label = _U('component_muzzle_squared'), hash = GetHashKey("COMPONENT_AT_MUZZLE_08")},
			{name = 'muzzle_bell', label = _U('component_muzzle_bell'), hash = GetHashKey("COMPONENT_AT_MUZZLE_09")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_SR_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_SR_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_MARKSMANRIFLE',
		label = _U('weapon_marksmanrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SNIPER")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_MARKSMANRIFLE_MK2',
		label = _U('weapon_marksmanrifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SNIPER")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_large', label = _U('component_scope_large'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{name = 'scope_zoom', label = _U('component_scope_zoom'), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_MRFL_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_MRFL_BARREL_02")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_SNIPERRIFLE',
		label = _U('weapon_sniperrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SNIPER")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE")},
			{name = 'scope_advanced', label = _U('component_scope_advanced'), hash = GetHashKey("COMPONENT_AT_SCOPE_MAX")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_SNIPERRIFLE_VARMOD_LUXE")}
		}
	},
	-- Heavy / Launchers
	{name = 'WEAPON_COMPACTLAUNCHER', label = _U('weapon_compactlauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_grenadelauncher'), hash = GetHashKey("AMMO_GRENADELAUNCHER")}},
	{name = 'WEAPON_FIREWORK', label = _U('weapon_firework'), components = {}, ammo = {label = _U('ammo_firework'), hash = GetHashKey("AMMO_FIREWORK")}},
	{name = 'WEAPON_GRENADELAUNCHER', label = _U('weapon_grenadelauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_grenadelauncher'), hash = GetHashKey("AMMO_GRENADELAUNCHER")}},
	{name = 'WEAPON_HOMINGLAUNCHER', label = _U('weapon_hominglauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rockets'), hash = GetHashKey("AMMO_HOMINGLAUNCHER")}},
	{name = 'WEAPON_MINIGUN', label = _U('weapon_minigun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MINIGUN")}},
	{name = 'WEAPON_RAILGUN', label = _U('weapon_railgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RAILGUN")}},
	{name = 'WEAPON_RPG', label = _U('weapon_rpg'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rockets'), hash = GetHashKey("AMMO_RPG")}},
	{name = 'WEAPON_RAYMINIGUN', label = _U('weapon_rayminigun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MINIGUN")}},
	-- Thrown
	{name = 'WEAPON_BALL', label = _U('weapon_ball'), components = {}, ammo = {label = _U('ammo_ball'), hash = GetHashKey("AMMO_BALL")}},
	{name = 'WEAPON_BZGAS', label = _U('weapon_bzgas'), components = {}, ammo = {label = _U('ammo_bzgas'), hash = GetHashKey("AMMO_BZGAS")}},
	{name = 'WEAPON_FLARE', label = _U('weapon_flare'), components = {}, ammo = {label = _U('ammo_flare'), hash = GetHashKey("AMMO_FLARE")}},
	{name = 'WEAPON_GRENADE', label = _U('weapon_grenade'), components = {}, ammo = {label = _U('ammo_grenade'), hash = GetHashKey("AMMO_GRENADE")}},
	{name = 'WEAPON_PETROLCAN', label = _U('weapon_petrolcan'), components = {}, ammo = {label = _U('ammo_petrol'), hash = GetHashKey("AMMO_PETROLCAN")}},
	{name = 'WEAPON_HAZARDCAN', label = _U('weapon_hazardcan'), components = {}, ammo = {label = _U('ammo_petrol'), hash = GetHashKey("AMMO_PETROLCAN")}},
	{name = 'WEAPON_MOLOTOV', label = _U('weapon_molotov'), components = {}, ammo = {label = _U('ammo_molotov'), hash = GetHashKey("AMMO_MOLOTOV")}},
	{name = 'WEAPON_PROXMINE', label = _U('weapon_proxmine'), components = {}, ammo = {label = _U('ammo_proxmine'), hash = GetHashKey("AMMO_PROXMINE")}},
	{name = 'WEAPON_PIPEBOMB', label = _U('weapon_pipebomb'), components = {}, ammo = {label = _U('ammo_pipebomb'), hash = GetHashKey("AMMO_PIPEBOMB")}},
	{name = 'WEAPON_SNOWBALL', label = _U('weapon_snowball'), components = {}, ammo = {label = _U('ammo_snowball'), hash = GetHashKey("AMMO_SNOWBALL")}},
	{name = 'WEAPON_STICKYBOMB', label = _U('weapon_stickybomb'), components = {}, ammo = {label = _U('ammo_stickybomb'), hash = GetHashKey("AMMO_STICKYBOMB")}},
	{name = 'WEAPON_SMOKEGRENADE', label = _U('weapon_smokegrenade'), components = {}, ammo = {label = _U('ammo_smokebomb'), hash = GetHashKey("AMMO_SMOKEGRENADE")}},
	-- Tools
	{name = 'WEAPON_FIREEXTINGUISHER', label = _U('weapon_fireextinguisher'), components = {}, ammo = {label = _U('ammo_charge'), hash = GetHashKey("AMMO_FIREEXTINGUISHER")}},
	{name = 'WEAPON_DIGISCANNER', label = _U('weapon_digiscanner'), components = {}},
	{name = 'GADGET_PARACHUTE', label = _U('gadget_parachute'), components = {}},
	{name = 'WEAPON_TACTICALRIFLE',label = _U('weapon_tacticalrifle'),ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},tints = Config.DefaultWeaponTints,
		components = {
						{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_TACTICALRIFLE_CLIP_01")},
						{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_TACTICALRIFLE_CLIP_02")},
						{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH_REH")},
						{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
						{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")}
				}
	},
	{name = 'WEAPON_PRECISIONRIFLE', label = _U('weapon_precisionrifle'), ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SNIPER")}, tints = Config.DefaultWeaponTints,
				components = {
						{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_PRECISIONRIFLE_CLIP_01")},
				}
	},

}

Config.WeaponsType = {
	melee = {
		weapon_dagger = "0x92A27487",
		weapon_bat = "0x958A4A8F",
		weapon_bottle = "0xF9E6AA4B",
		weapon_crowbar = "0x84BD7BFD",
		weapon_unarmed = "0xA2719263",
		weapon_flashlight = "0x8BB05FD7",
		weapon_golfclub = "0x440E4788",
		weapon_hammer = "0x4E875F73",
		weapon_hatchet = "0xF9DCBF2D",
		weapon_knuckle = "0xD8DF3C3C",
		weapon_knife = "0x99B507EA",
		weapon_machete = "0xDD5DF8D9",
		weapon_switchblade = "0xDFE37640",
		weapon_nightstick = "0x678B81B1",
		weapon_wrench = "0x19044EE0",
		weapon_battleaxe = "0xCD274149",
		weapon_poolcue = "0x94117305",
		weapon_stone_hatchet = "0x3813FC08",
		weapon_katana4 = GetHashKey("WEAPON_KATANA4"),
		weapon_katana3 = GetHashKey("WEAPON_KATANA3"),
		weapon_katana2 = GetHashKey("WEAPON_KATANA2"),
		weapon_katana = GetHashKey("WEAPON_KATANA"),
		weapon_penetrator = GetHashKey("WEAPON_PENETRATOR"),
		weapon_bighammer = GetHashKey("WEAPON_BIGHAMMER"),
		weapon_candycane = "0x6589186A"
	},
	handguns = {
		weapon_pistol = "0x1B06D571",
		weapon_pistol_mk2 = "0xBFE256D4",
		weapon_combatpistol = "0x5EF9FEC4",
		weapon_appistol = "0x22D8FE39",
		weapon_stungun = "0x3656C8C1",
		weapon_pistol50 = "0x99AEEB3B",
		weapon_snspistol = "0xBFD21232",
		weapon_snspistol_mk2 = "0x88374054",
		weapon_heavypistol = "0xD205520E",
		weapon_vintagepistol = "0x83839C4",
		weapon_flaregun = "0x47757124",
		weapon_marksmanpistol = "0xDC4DB296",
		weapon_revolver = "0xC1B3C3D1",
		weapon_revolver_mk2 = "0xCB96392F",
		weapon_doubleaction = "0x97EA20B8",
		weapon_raypistol = "0xAF3696A1",
		weapon_ceramicpistol = "0x2B5EF5EC",
		weapon_navyrevolver = "0x917F6C8C",
		weapon_gadgetpistol = GetHashKey("WEAPON_GADGETPISTOL"),
		weapon_stungun_mp = GetHashKey("WEAPON_STUNGUN_MP"),
		weapon_smith = GetHashKey("WEAPON_SMITH"),
		weapon_pistolxm3 = "0x1BC4FDB9"
	},
	smg = {
		weapon_microsmg = "0x13532244",
		weapon_smg = "0x2BE6766B",
		weapon_smg_mk2 = "0x78A97CD0",
		weapon_assaultsmg = "0xEFE7E2DF",
		weapon_combatpdw = "0xA3D4D34",
		weapon_machinepistol = "0xDB1AA450",
		weapon_minismg = "0xBD248B55",
		weapon_raycarbine = "0x476BF155",
		weapon_tecpistol = "0x14E5AFD5"
	},
	shotguns = {
		weapon_pumpshotgun = "0x1D073A89",
		weapon_pumpshotgun_mk2 = "0x555AF99A",
		weapon_sawnoffshotgun = "0x7846A318",
		weapon_assaultshotgun = "0xE284C527",
		weapon_bullpupshotgun = "0x9D61E50F",
		weapon_musket = "0xA89CB99E",
		weapon_heavyshotgun = "0x3AABBBAA",
		weapon_dbshotgun = "0xEF951FBB",
		weapon_autoshotgun = "0x12E82D3D",
		weapon_combatshotgun = GetHashKey("WEAPON_COMBATSHOTGUN")
	},
	assault_rifles = {
		weapon_assaultrifle = "0xBFEFFF6D",
		weapon_assaultrifle_mk2 = "0x394F415C",
		weapon_carbinerifle = "0x83BF0278",
		weapon_carbinerifle_mk2 = "0xFAD1F1C9",
		weapon_advancedrifle = "0xAF113F99",
		weapon_specialcarbine = "0xC0A3098D",
		weapon_specialcarbine_mk2 = "0x969C3D67",
		weapon_bullpuprifle = "0x7F229F94",
		weapon_bullpuprifle_mk2 = "0x84D6FAFD",
		weapon_compactrifle = "0x624FE830",
		weapon_militaryrifle = GetHashKey("WEAPON_MILITARYRIFLE"),
		weapon_heavyrifle = GetHashKey("WEAPON_HEAVYRIFLE"),
        
        -- ARME PERM
		WEAPON_A15RC = GetHashKey("WEAPON_A15RC"),
        WEAPON_NEVA = GetHashKey("WEAPON_NEVA"),
        WEAPON_GYS = GetHashKey("WEAPON_GYS"),
        WEAPON_GLOCK17 = GetHashKey("WEAPON_GLOCK17"),
        WEAPON_IAR = GetHashKey("WEAPON_IAR"),
        WEAPON_M133 = GetHashKey("WEAPON_M133"),
        WEAPON_JRBAK = GetHashKey("WEAPON_JRBAK"),
        WEAPON_FAMASU1 = GetHashKey("WEAPON_FAMASU1"),
        WEAPON_UMP45 = GetHashKey("WEAPON_UMP45"),
        WEAPON_UZI = GetHashKey("WEAPON_UZI"),
        WEAPON_ENERGYKNIFE = GetHashKey("WEAPON_ENERGYKNIFE"),
        WEAPON_KARAMBIT = GetHashKey("WEAPON_KARAMBIT"),
        WEAPON_M416P = GetHashKey("WEAPON_M416P"),
		WEAPON_G36 = GetHashKey("WEAPON_G36"),

                -- ARME NON PERM
                WEAPON_OWSHOTGUN = GetHashKey("WEAPON_OWSHOTGUN"),
                WEAPON_ACWR = GetHashKey("WEAPON_ACWR"),
                WEAPON_AK47 = GetHashKey("WEAPON_AK47"),
                WEAPON_ANARCHY = GetHashKey("WEAPON_ANARCHY"),
                WEAPON_G3_2 = GetHashKey("WEAPON_G3_2"),
                WEAPON_HOWA_2 = GetHashKey("WEAPON_HOWA_2"),
                WEAPON_LR300 = GetHashKey("WEAPON_LR300"),
                WEAPON_SCARSC = GetHashKey("WEAPON_SCARSC"),
                WEAPON_H2SMG = GetHashKey("WEAPON_H2SMG"),
                WEAPON_CZ75 = GetHashKey("WEAPON_CZ75"),
                WEAPON_PL14 = GetHashKey("WEAPON_PL14"),
                WEAPON_FN502 = GetHashKey("WEAPON_FN502"),
                WEAPON_KNR = GetHashKey("WEAPON_KNR"),

                WEAPON_BRICK = GetHashKey("WEAPON_BRICK"),


        -- FIN LISTE
		weapon_tacticalrifle = GetHashKey("WEAPON_TACTICALRIFLE")
	},
	machine_guns = {
		weapon_mg = "0x9D07F764",
		weapon_combatmg = "0x7FD62962",
		weapon_combatmg_mk2 = "0xDBBD7280",
		weapon_gusenberg = "0x61012683"
	},
	sniper_rifles = {
		weapon_sniperrifle = "0x5FC3C11",
		weapon_heavysniper = "0xC472FE2",
		weapon_heavysniper_mk2 = "0xA914799",
		weapon_marksmanrifle = "0xC734385A",
		weapon_marksmanrifle_mk2 = "0x6A6C02E0",
		weapon_precisionrifle = GetHashKey("WEAPON_PRECISIONRIFLE")
	},
	heavy_weapons = {
		weapon_rpg = "0xB1CA77B1",
		weapon_grenadelauncher = "0xA284510B",
		weapon_grenadelauncher_smoke = "0x4DD2DC56",
		weapon_minigun = "0x42BF8A85",
		weapon_firework = "0x7F7497E5",
		weapon_railgun = "0x6D544C99",
		weapon_hominglauncher = "0x63AB0442",
		weapon_compactlauncher = "0x781FE4A",
		weapon_rayminigun = "0xB62D1F67",
		weapon_emplauncher = GetHashKey("WEAPON_EMPLAUNCHER"),
		weapon_railgunxm3 = "0xFEA23564"
	},
	throwables = {
		weapon_grenade = "0x93E220BD",
		weapon_bzgas = "0xA0973D5E",
		weapon_smokegrenade = "0xFDBC8A50",
		weapon_flare = "0x497FACC3",
		weapon_molotov = "0x24B17070",
		weapon_stickybomb = "0x2C3731D9",
		weapon_proxmine = "0xAB564B93",
		weapon_snowball = "0x787F0BB",
		weapon_pipebomb = "0xBA45E8B8",
		weapon_ball = "0x23C9F95C",
		weapon_acidpackage = "0xF7F1E25E"
	},
	misc = {
		weapon_petrolcan = "0x34A67B97",
		weapon_fireextinguisher = "0x60EC506",
		weapon_parachute = "0xFBAB5776",
		weapon_hazardcan = "0xBA536372",
		gadget_parachute = GetHashKey("GADGET_PARACHUTE"),
		weapon_fertilizercan = GetHashKey("WEAPON_FERTILIZERCAN"),
		weapon_fireextinguisher = GetHashKey("WEAPON_FIREEXTINGUISHER")
	}
}    
