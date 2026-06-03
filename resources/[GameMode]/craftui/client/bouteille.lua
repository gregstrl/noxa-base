ESX = exports['Framework']:getSharedObject()

local function quantiterachat(itemLabel)
    if lib then
        local input = lib.inputDialog('Achat '..itemLabel, {
            {
                type = 'number',
                label = 'Quantité',
                description = 'Entrez la quantité souhaitée',
                required = true,
                min = 1,
                max = 999,
                default = 1
            }
        })
        return input and input[1] or nil
    end
    local keyboard = KeyboardInput("Quantité", "", 10)
    return tonumber(keyboard)
end

local ShopConfig = {
    pos = vector3(-697.845642, -1182.401123, 10.711118),
    heading = 131.93681335449,
    pedModel = "s_m_m_linecook",
    distance = 2.0,
    blip = {
        sprite = 52,
        color = 6,
        scale = 0.6,
        label = "[Grossiste] Bouteille"
    },
    allowedJobs = {
        ["unicorn"] = true,
        ["bahamas"] = true,
        ["club77"] = true
    },
    items = {
        {label = "Eau", name = "bouteilleeau", price = 100},
        {label = "Jus d'Orange", name = "jusorange", price = 150},
        {label = "Jus de Tomate", name = "justomate", price = 100},
        {label = "Vodka Pure", name = "vodkapure", price = 400},
        {label = "Rhum de 20 ans", name = "rhum20", price = 700},
        {label = "Lait", name = "milk", price = 100},
        {label = "Sirop de Grenadine", name = "grenadine", price = 120},
        {label = "Eau Gazeuse", name = "sparklingwater", price = 100},
        {label = "Vodka", name = "vodka", price = 200},
        {label = "Coca", name = "coca", price = 150},
        {label = "Gin", name = "gin", price = 150},
        {label = "Vin Blanc", name = "whitewine", price = 150},
        {label = "Champagne", name = "champagne", price = 150},
        {label = "Campari", name = "campari", price = 150},
        {label = "Liqueur d'Amour", name = "loveliquor", price = 350},
        {label = "Whisky à la Française", name = "frenchwhisky", price = 400}
    }
}

local isMenuOpen = false
local mainMenu = RageUI.CreateMenu("", "Articles disponibles")
local playerJob = nil
local ped = nil

local function afficheblips()
    local blip = AddBlipForCoord(ShopConfig.pos)
    SetBlipSprite(blip, ShopConfig.blip.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, ShopConfig.blip.scale)
    SetBlipColour(blip, ShopConfig.blip.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(ShopConfig.blip.label)
    EndTextCommandSetBlipName(blip)
end

local function paiement(item)
    local quantity = quantiterachat(item.label)
    if quantity and quantity > 0 and quantity <= 999 then
        local totalPrice = item.price * quantity
        ESX.ShowNotification("Total: "..totalPrice.."$")
        TriggerServerEvent('shop:buyItem', item.name, quantity, item.price)
    else
        ESX.ShowNotification("Quantité invalide")
    end
end

function ouvrirbouteille()
    if isMenuOpen then
        isMenuOpen = false
        RageUI.Visible(mainMenu, false)
        return
    end
    
    if not playerJob then
        playerJob = ESX.GetPlayerData().job.name
    end
    
    if playerJob and ShopConfig.allowedJobs[playerJob] then
        isMenuOpen = true
        RageUI.Visible(mainMenu, true)

        CreateThread(function()
            while isMenuOpen do
                RageUI.IsVisible(mainMenu, function()
                    for _, item in ipairs(ShopConfig.items) do
                        RageUI.Button(item.label, "Prix unitaire: "..item.price.."$", {RightLabel = "→→"}, true, {
                            onSelected = function()
                                paiement(item)
                            end
                        })
                    end
                end)
                Wait(0)
            end
        end)
    end
end


CreateThread(function()
    afficheblips()
    
    local pedHash = GetHashKey(ShopConfig.pedModel)
    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do Wait(1) end
    
    ped = CreatePed(4, pedHash, ShopConfig.pos.x, ShopConfig.pos.y, ShopConfig.pos.z - 1.0, ShopConfig.heading, false, true)
    SetEntityHeading(ped, ShopConfig.heading)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
    
    while not ESX.IsPlayerLoaded() do
        Wait(100)
    end
    
    local playerData = ESX.GetPlayerData()
    if playerData and playerData.job then
        playerJob = playerData.job.name
    end
end)

CreateThread(function()
    while true do
        local sleep = 1000
        if playerJob and ShopConfig.allowedJobs[playerJob] then
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - ShopConfig.pos)

            if distance <= ShopConfig.distance then
                sleep = 0
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour parler au vendeur")
                if IsControlJustPressed(0, 38) then
                    ouvrirbouteille()
                end
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    playerJob = job.name
end)

RegisterNetEvent('shop:notification')
AddEventHandler('shop:notification', function(message)
    ESX.ShowNotification(message)
end) 