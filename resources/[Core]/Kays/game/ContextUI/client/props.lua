local garbageProps = { 1437508529, 666561306, -58485588, 218085040, -1426008804, -206690185, 1143474856, -130812911, 1614656839, 1511880420, 1329570871, -1096777189, -2096124444 }
local distributorProps = { -870868698, -1126237515, -1364697528, 506770882 }
local fridgeProps = {
    GetHashKey("v_res_fridgemoda"),
    GetHashKey("v_res_fridgemodsml"),
    GetHashKey("prop_fridge_01"),
    GetHashKey("prop_fridge_03"),
    GetHashKey("prop_vend_fridge01"),
}

Citizen.CreateThread(function ()
    while GetResourceState("ox_target") ~= "started" do Wait(0) end
    exports.ox_target:addModel(distributorProps, {
        {
            label = "Retirer",
            icon = "fa-solid fa-wallet",
            distance = 5.0,
            canInteract = function ()
               -- if exports["ZgegFramework"]:getInPersoMenu() then
                --    return false
                --end

                return true
            end,
            onSelect = function (data)
                input = exports.input:ShowSync("Montant", false, 150, "small_text")
                if tonumber(input) == nil then
                    return ESX.ShowNotification("~b~Le montant ne peut pas être nul")
                end

                if tonumber(input) <= 0 then
                    return ESX.ShowNotification("~b~Erreur lors de la transaction")
                end

                TriggerServerEvent('Bank:removeMoney', tonumber(input))
            end
        }, {
            label = "Déposer",
            icon = "fa-solid fa-wallet",
            distance = 5.0,
            canInteract = function ()
               -- if exports["ZgegFramework"]:getInPersoMenu() then
                --    return false
               -- end

                return true
            end,
            onSelect = function (data)
                input = exports.input:ShowSync("Montant", false, 150, "small_text")
                if tonumber(input) == nil then
                    return ESX.ShowNotification("~b~Le montant ne peut pas être nul")
                end

                if tonumber(input) <= 0 then
                    return ESX.ShowNotification("~b~Erreur lors de la transaction")
                end

                TriggerServerEvent('Bank:addMoney', tonumber(input))
            end
        }
    })
    exports.ox_target:addGlobalObject({
        {
            label = "Copier le model de l'objet",
            icon = "fa-solid fa-asterisk",
            canInteract = function ()
                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                SendNUIMessage({
                    tool = GetEntityModel(data.entity)
                })
            end
        }, {
            label = "Copier les coordonées de l'objet",
            icon = "fa-solid fa-asterisk",
            canInteract = function ()
                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                local coords = GetEntityCoords(data.entity)
                local heading = GetEntityHeading(data.entity)

                SendNUIMessage({
                    tool = ('vector4(%s, %s, %s, %s)'):format(coords.x, coords.y, coords.z, heading)
                })

            end
        }
    })
end)