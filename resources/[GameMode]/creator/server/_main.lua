ESX = exports['Framework']:getSharedObject()

local maxBuckets = 300
local availableBuckets = {}
local playerBuckets = {}

for i = 1000, 1000 + maxBuckets - 1 do
    table.insert(availableBuckets, i)
end

local function formatDate(date)
    local year, month, day = date:match("(%d+)-(%d+)-(%d+)")
    if year and month and day then
        return month .. "/" .. day .. "/" .. year
    else
        return date
    end
end

RegisterNetEvent("Creator:setBucket", function()
    local playerSrc = source
    if not playerSrc or playerBuckets[playerSrc] then return end

    local bucket = table.remove(availableBuckets, 1) or math.random(1000, 1000 + maxBuckets - 1)
    SetPlayerRoutingBucket(playerSrc, bucket)
    playerBuckets[playerSrc] = bucket
end)

RegisterNetEvent("Creator:removeBucket", function()
    local playerSrc = source
    if not playerSrc or not playerBuckets[playerSrc] then return end

    local bucket = playerBuckets[playerSrc]
    SetPlayerRoutingBucket(playerSrc, 0)
    playerBuckets[playerSrc] = nil
    table.insert(availableBuckets, bucket)
end)

AddEventHandler('playerDropped', function()
    local playerSrc = source
    if not playerBuckets[playerSrc] then return end

    local bucket = playerBuckets[playerSrc]
    playerBuckets[playerSrc] = nil
    table.insert(availableBuckets, bucket)
end)

function CalculateAge(dateofbirth)
    if not dateofbirth or dateofbirth == '' then
        return ''
    end
    
    local day, month, year = string.match(dateofbirth, "(%d+)/(%d+)/(%d+)")
    if not day or not month or not year then
        return ''
    end
    
    day, month, year = tonumber(day), tonumber(month), tonumber(year)
    local dobDate = os.time({year = year, month = month, day = day})
    local currentDate = os.time()
    local age = os.date("%Y", currentDate) - os.date("%Y", dobDate)
    
    if os.date("%m%d", currentDate) < os.date("%m%d", dobDate) then
        age = age - 1
    end
    
    return tostring(math.floor(age))
end


RegisterServerEvent("Creator:save", function(firstName, lastName, dateOfBirth, sexe, height)
    local playerSrc = source
    if not playerSrc then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if not playerSelected then return end

    local formattedDate = formatDate(dateOfBirth)

    MySQL.update('UPDATE users SET firstname = ?, lastname = ?, dateofbirth = ?, sex = ?, height = ? WHERE identifier = ?', {
        firstName,
        lastName,
        formattedDate,
        sexe,
        height,
        playerSelected.getIdentifier()
    }, function()
        playerSelected.set("firstname", firstName)
        playerSelected.set("lastname", lastName)
        playerSelected.set("dateofbirth", formattedDate)
        playerSelected.set("sex", sexe)
        playerSelected.set("height", height)

        playerSelected.addInventoryItem('bread', 5) 
        playerSelected.addInventoryItem('water', 5)
        playerSelected.addInventoryItem('bmx', 1)
        playerSelected.addAccountMoney('cash', 25000)
        playerSelected.addAccountMoney('bank', 25000)
        TriggerClientEvent("esx_ui_hud:refreshPlayerInfo", playerSrc, {
            firstname = firstName,
            lastname = lastName,
            age = CalculateAge(formattedDate)
        }) 
        local spawnLocation = {x = -1259.554199, y =  -1481.234009, z =  4.335977}
        TriggerClientEvent("Creator:teleportPlayer", playerSrc, spawnLocation)
        TriggerClientEvent('esx:showNotification', playerSrc, "Bienvenue sur ~b~Modern~s~, n'hésitez pas à rejoindre notre ~b~discord.gg/wisefa") 
        print(("[^1SERVER^0] Nouveau joueur enregistré : %s %s (LICENCE: %s)"):format(firstName, lastName, playerSelected.getIdentifier()))

    end)
end)


RegisterCommand('register', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    -- Vérifie si le joueur est un staff (ajuster la condition selon tes permissions)
    if xPlayer.getGroup() == 'founder' or xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'supermoderateur' or xPlayer.getGroup() == 'remboursement' then
        -- Vérifie que l'argument est bien passé
        if #args ~= 1 then
            TriggerClientEvent('esx:showNotification', source, '~s~Utilisation incorrecte. Syntaxe : /register [id]')
            return
        end

        -- Récupère l'ID du joueur cible
        local targetId = tonumber(args[1])

        -- Vérifie si l'ID est valide
        if targetId == nil then
            TriggerClientEvent('esx:showNotification', source, '~s~ID du joueur invalide.')
            return
        end

        -- Recherche le joueur cible
        local targetPlayer = ESX.GetPlayerFromId(targetId)

        if targetPlayer then
            -- Ouvre le menu de création pour le joueur cible
            TriggerClientEvent("Creator:openMenu", targetId)
            TriggerClientEvent('esx:showNotification', source, ('~g~Menu de création ouvert pour le joueur ID %d.'):format(targetId))
            -- Ajout d'une notification pour le joueur cible (facultatif)
            TriggerClientEvent('esx:showNotification', targetId, '~b~Un membre du staff a ouvert le menu de création pour vous.')

            -- Envoi d'un message au webhook avec les informations
            local playerName = xPlayer.getName()
            local playerIdentifier = xPlayer.getIdentifier()
            local targetName = targetPlayer.getName()
            local targetIdentifier = targetPlayer.getIdentifier()

            -- Logs via webhook
            local webhookURL = "https://discord.com/api/webhooks/1258834793353842798/RjxGvxhYTjlxJbXDm_1sayaY2-L86W6_cu4uRT_xBgG2rLFg-9A9CsSYTEGp_cOmNJOZ"
            local message = {
                ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "Player Register",
                    ["description"] = "Le joueur **" .. playerName .. "** (**" .. playerIdentifier .. "**) a ouvert le menu de création pour le joueur **" .. targetName .. "** (**" .. targetIdentifier .. "**) !",
                    ["color"] = 5814783, -- couleur de l'embed
                    ["footer"] = {
                        ["text"] = "Koy",
                    }
                }}
            }

            PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode(message), {['Content-Type'] = 'application/json'})

        else
            -- Si le joueur cible n'existe pas
            TriggerClientEvent('esx:showNotification', source, '~s~Joueur non trouvé.')
        end
    else
        -- Si le joueur n'est pas du staff
        TriggerClientEvent('esx:showNotification', source, '~s~Vous n\'avez pas les permissions pour cela.')
    end
end, false)
