ConfigWipe = {
    ESX = "",
    MessageWipe = "Vous avez été wipe, pattientez quelques minutes avant de relancer votre jeu !",
    Autorized = {
        ['founder'] = true,
        ['admin'] = true,
    },

    Logs = {
        WebHook = "https://discord.com/api/webhooks/1364568663180578898/cy3O_Bcq9ojTDyAYmZ3xlLTysQ5NfKyihgp0wiCCjW3mOqGSOvuRsgOjJZIB6pC-XpdY"
    },

    WeaponsPerm = {
        ['WEAPON_A15RC'] = true,
        ['WEAPON_UZI'] = true,
        ['WEAPON_GLOCK17'] = true,
        ['WEAPON_ENERGYKNIFE'] = true,
        ['WEAPON_KARMABIT'] = true,
    },

    ItemsPerm = {
        ["boombox"] = true,
        ["radio"] = true,
        ["phone"] = true,

    },

    -- Delete
    TableDelete = {
        {name = "user_licenses", id = "owner"},
        {name = "addon_inventory_items", id = "owner"},
        {name = "billing", id = "identifier"},
        {name = "datastore_data", id = "owner"},
        {name = "properties_build", id = "propertyOwner"},
        {name = "clothes_data", id = "identifier"},
        {name = "izey_clothes", id = "identifier"},
        {name = "playerstattoos", id = "identifier"},
        {name = "jail", id = "identifier"},
        {name = "phone_phones", id = "id"},
        {name = "phone_backups", id = "id"},
        {name = "Koy_afk_players", id = "UniqueID"},
        {name = "phone_crypto", id = "id"},
    },

    -- Update 
    TableUpdate = {
        {tablename = "users", var = "firstname", id = "identifier", finalvalue = ""},
        {tablename = "users", var = "lastname", id = "identifier", finalvalue = ""},
        {tablename = "users", var = "position", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "skin", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "accounts", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "inventory", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "job", id = "identifier", finalvalue = "unemployed"},
        {tablename = "users", var = "job2", id = "identifier", finalvalue = "unemployed2"},
        {tablename = "users", var = "job_grade", id = "identifier", finalvalue = 0},
        {tablename = "users", var = "job2_grade", id = "identifier", finalvalue = 0},
        {tablename = "users", var = "isDead", id = "identifier", finalvalue = 0},
        {tablename = "users", var = "apps", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "widget", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "bt", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "charinfo", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "metadata", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "cryptocurrency", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "cryptocurrencytransfers", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "phonePos", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "spotify", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "first_screen_showed", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "ammo", id = "identifier", finalvalue = "{}"},
    }

}