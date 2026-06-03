local enterprisePermissions = {}
local organisationPermissions = {}

local enterpriseData = {
    recruit = {
        job = nil,
        created = {}
    },
    promote = {
        job = nil,
        created = {}
    }
}

local organisationData = {
    recruit = {
        job = nil,
        created = {}
    },
    promote = {
        job = nil,
        created = {}
    }
}

RegisterNetEvent('serax:freeze')
AddEventHandler('serax:freeze', function(target, active)
    FreezeEntityPosition(target, active)
end)

Citizen.CreateThread(function ()
    while GetResourceState("ox_target") ~= "started" do Wait(0) end

    exports.ox_target:addGlobalPlayer({
        {
            label = "Montrer un document",
            icon = "fa-solid fa-angles-right",
            distance = 2.0,
            canInteract = function ()
                return true
            end,                               
            openMenu = "menu-document"
        },{
            menuName = "menu-document",
            label = "Montrer carte d'identité",
            icon = "fa-solid fa-id-card",
            distance = 50.0,
            canInteract = function ()
                return true
            end,
            onSelect = function (data)
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "menu-document",
            label = "Montrer permis de conduire",
            icon = "fa-solid fa-car",
            distance = 50.0,
            canInteract = function ()
                return true
            end,
            onSelect = function (data)
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)), 'driver')
            end
        },
        {
            menuName = "menu-document",
            label = "Montrer PPA",
            icon = "fa-solid fa-gun",
            distance = 50.0,
            canInteract = function ()
                return true
            end,
            onSelect = function (data)
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)), 'weapon')
            end
        },
        {
            label = "Voir l'id du joueur",
            icon = "fa-solid fa-fingerprint",
            distance = 15,
            canInteract = function ()
                return true
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("obi:getTargetId", function (ID)
                    ESX.ShowNotification('Id: ~b~'..GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))..'~s~\nId unique: ~b~'..(ID or "Non disponible"))
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        }, 
        {
            label = "Report le joueur",
            icon = "fa-solid fa-circle-exclamation",
            distance = 15,
            canInteract = function ()
                return true
            end,
            onSelect = function (data)
                accpet = exports.input:ShowSync("Voulez-vous envoyez le signalement ? Y/N", false, 150, "small_text")

                if accpet == "yes" or accpet == "y" or accpet == "Y" then
                    ESX.TriggerServerCallback("obi:getTargetId", function (ID)
                        ExecuteCommand('report Je signale ce joueur Id Unique: '..(ID or "Non disponible"))
                    end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
                else
                    ESX.ShowNotification("Vous avez annulé l'action")
                end
            end
        },
        {
            label = "Pile ou face",
            icon = "fa-solid fa-coins",
            distance = 3,
            canInteract = function ()
                return true
            end,
            onSelect = function (data)
                accpet = exports.input:ShowSync("Voulez-vous envoyez le signalement ? Y/N", false, 150, "small_text")
                if accpet == "yes" or accpet == "y" or accpet == "Y" then
                    ExecuteCommand("pileouface")
                else
                    ESX.ShowNotification("Vous avez annulé l'action")
                end
            end
        },
        {
            label = "Saluer",
            icon = "fa-solid fa-handshake",
            distance = 3.0,
            canInteract = function ()
                return true
            end,
            onSelect = function (data)
                ExecuteCommand('e handshake')
            end
        },
         -- {
        --     label = "Fouiller",
        --     icon = "fa-solid fa-people-carry-box",
        --     distance = 3.0,
        --     canInteract = function()
        --         if ESX.PlayerData.job == nil then
        --             return false
        --         end
        --         if ESX.PlayerData.job.name == "unemployed" then
        --             return false
        --         end
        --         if ESX.PlayerData.job.name == "police" then
        --             return true
        --         end
        --         return false
        --     end,
        --     onSelect = function(data)
        --         local targetPed = data.entity 
        --         if not IsEntityPlayingAnim(targetPed, 'random@mugging3', 'handsup_standing_base', 3) then
        --         if isHandsUp(targetPed) then
        --             getPlayerInvPolice(GetPlayerServerId(NetworkGetPlayerIndexFromPed(targetPed)))
        --         else
        --             ESX.ShowNotification('🤚✋La personne doit ~b~lever les mains~s~ pour être fouillée')
        --         end
        --     end
        -- },
        {
            label = "Menotter/Démenotter",
            icon = "fa-solid fa-people-carry-box",
            distance = 3.0,
            canInteract = function ()
                if ESX.PlayerData.job == nil then
                    return false
                end
                if ESX.PlayerData.job.name == "unemployed" then
                    return false
                end
                if ESX.PlayerData.job.name == "police" then
                    return true
                end
                if ESX.PlayerData.job.name == "sasp" then
                    return true
                end
            end,
            onSelect = function (data)
                TriggerServerEvent('menotterForPolice', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            label = "Porter",
            icon = "fa-solid fa-people-carry-box",
            distance = 3.0,

            canInteract = function ()
                return true
            end,
            onSelect = function (data)
                ExecuteCommand('porter')
            end
        },
        {
            label = "Prendre en otage",
            icon = "fa-solid fa-gun",
            canInteract = function ()
                local playerPed = PlayerPedId()
                local weapon = GetSelectedPedWeapon(playerPed)
                return weapon ~= GetHashKey("WEAPON_UNARMED")
            end,
            onSelect = function (data)
                ExecuteCommand('otage')
            end
        },
        {
            label = 'Facturer le joueur',
            icon = "fas fa-file-invoice-dollar",
            distance = 2.0,
            canInteract = function ()
                if ESX.PlayerData.job == nil then
                    return false
                end

                if ESX.PlayerData.job.name == "unemployed" then
                    return false
                end

                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end

                return false
            end,

            onSelect = function (data)
                AmountBill = exports.input:ShowSync("Montant", false, 150, "small_text")
                AmountBill = tonumber(AmountBill)
                if AmountBill ~= nil and type(AmountBill) == 'number' then
                    TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
                        Wait(4000)
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)), 'society_'..ESX.PlayerData.job.name, ESX.PlayerData.job.label, AmountBill)
                        ESX.ShowNotification("~b~Vous avez envoyée une facture au montant de "..AmountBill.."$")
                else
                    ESX.ShowNotification("~b~Montant invalide")
                end
            end
        },
        {
            label = "Gestion entreprise",
            icon = "fas fa-briefcase",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job == nil then
                    return false
                end

                if ESX.PlayerData.job.name == "unemployed" then
                    return false
                end

                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end
                return false
            end,
            openMenu = "gestion-enterprise"
        }, {
            menuName = "gestion-enterprise",
            label = "Recruter",
            icon = "fas fa-user-check",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                exports["Koy"]:RecruitPlayer("job", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)));
            end
        },  {
            menuName = "gestion-organisation",
            label = "Recruter",
            icon = "fas fa-user-check",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job2.grade_name == "boss" then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                exports["Koy"]:RecruitPlayer("job2", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)));
            end
        }, 
    {
            label = "Administration",
            icon = "fa-solid fa-angles-right",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            openMenu = "admin-option"
        }, 
        
         {
             menuName = "admin-option",
             label = "Menu détail joueur",
             icon = "fa-solid fa-magnifying-glass",
             distance = 80,
             canInteract = function ()
                 local playerData = ESX.GetPlayerData()
                 local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                 if isByPass then
                     return true
                 end
                 if exports['Koy']:IsInStaffMode() then
                     return true
                 end
                 return false
             end,
             onSelect = function (data)
                 ExecuteCommand('openPlayers '..GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
             end
         },
        
        {
            menuName = "admin-option",
            label = "Copier son id",
            icon = "fa-solid fa-copy",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("obiSecond:getTargetId", function (ID)
                    SendNUIMessage({
                        tool = ID
                    })
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },{
            menuName = "admin-option",
            label = "Jail",
            icon = "fa-solid fa-skull-crossbones",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                time = exports.input:ShowSync("Nombre de tache", false, 150, "small_text")
                reason = exports.input:ShowSync("Raison du Jail", false, 150, "small_text")
               ExecuteCommand('jail '..GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))..' '..time..' '..reason)
            end
        },{
            menuName = "admin-option",
            label = "Kick",
            icon = "fa-solid fa-arrow-right-from-bracket",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                reason = exports.input:ShowSync("Temps du kick", false, 150, "small_text")
                ExecuteCommand('kick '..GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))..' '..reason)
            end
        },
        {
            menuName = "admin-option",
            label = "Ban",
            icon = "fa-solid fa-ban",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                time = exports.input:ShowSync("Temps du ban", false, 150, "small_text")
                reason = exports.input:ShowSync("Raison du ban", false, 150, "small_text")
                ExecuteCommand('ban '..GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))..' '..time..' '..reason)
            end
        },
        {
             menuName = "admin-option",
             label = "Bring back",
             icon = "fa-solid fa-person",
             distance = 80,
             canInteract = function ()
                 local playerData = ESX.GetPlayerData()
                 local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                 if isByPass then
                     return true
                 end
                 if exports['Koy']:IsInStaffMode() then
                     return true
                 end
                 return false
             end,
             onSelect = function (data)
                 if adminManagement.LastPlayerPos[GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))] == nil then return end
                 TriggerServerEvent('serax:admin:player:return', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)), adminManagement.LastPlayerPos[GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))].pos)
             end
        },
        {
            menuName = "admin-option",
            label = "Give un item",
            icon = "fas fa-hand-holding",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local staff = playerData.group == "admin" or playerData.group == "modo"  or playerData.group == "modotest"
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if staff and adminManagement.Service then
                    return false
                end
                return false
            end,
            onSelect = function (data)
                name = exports.input:ShowSync("Nom de l'item", false, 150, "small_text")
                count = exports.input:ShowSync("Nombre de "..name.." à lui donner", false, 150, "small_text")
                ExecuteCommand('giveitem '..GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))..' '..name..' '..count)
            end
        },
        {
            menuName = "admin-option",
            label = "Message privé",
            icon = "fa-solid fa-comment",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local staff = playerData.group == "admin" or playerData.group == "modo" or playerData.group == "modotest"
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                reason = exports.input:ShowSync("Message à envoyez", false, 150, "small_text")
                ExecuteCommand('sendmessage '..GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))..' '..reason)
            end
        },
        {
            menuName = "admin-option",
            label = "Heal",
            icon = "fa-solid fa-briefcase-medical",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local staff = playerData.group == "admin" or playerData.group == "modo" or playerData.group == "modotest"
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                ExecuteCommand('heal '.. GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Revive",
            icon = "fa-solid fa-heart",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local staff = playerData.group == "admin" or playerData.group == "modo" or playerData.group == "modotest"
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                ExecuteCommand('revive '.. GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Donner Panto",
            icon = "fa-solid fa-car-side",
            distance = 80,
            canInteract = function ()
                local playerData = ESX.GetPlayerData()
                local isByPass = playerData.group == "founder" or playerData.group == "gérant"
                if isByPass then
                    return true
                end
                if exports['Koy']:IsInStaffMode() then
                    return true
                end
                return false
            end,
            onSelect = function (data)
                ExecuteCommand('car panto '..GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        
    })
end)