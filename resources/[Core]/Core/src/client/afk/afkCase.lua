local picture;
local CurrentAnimation= false;

local function selectedRandomReward(rewards)
    local totalChance = 0

    for k,v in pairs(rewards) do
        totalChance += v.chance
    end

    local randomReward = math.random(1, totalChance)

    local chanceCumuler = 0

    CurrentAnimation = true

    local mysterybox = RageUI.CreateMenu('', 'Bonne Chance ! ');

    mysterybox.Closable = false

    RageUI.Visible(mysterybox, not RageUI.Visible(mysterybox))

    CreateThread(function()   
        while CurrentAnimation do
            Wait(50)
        
            RageUI.IsVisible(mysterybox, function()
                    RageUI.Separator('~y~En attente de votre récompense...~s~')
                    RageUI.Separator()
                    if picture then
                        RageUI.Separator(picture)
                        RageUI.RenderWeapons("afk", picture)
                    end
            end)
    
           if not RageUI.Visible(mysterybox) then
                mysterybox = RMenu:DeleteType('mysterybox')
            end 
        end
    end)

    for k,v in pairs(rewards) do
        picture = v.label
        Wait(100)
        chanceCumuler += v.chance

        RageUI.PlaySound("HUD_FREEMODE_SOUNDSET", "NAV_UP_DOWN")

        if randomReward <= chanceCumuler then
            CurrentAnimation = false
            return v
        end
    end
end

RegisterNetEvent('Koy:afk:case:open', function(caseId)
    local case = Afk.Case[caseId]

    local reward = selectedRandomReward(case.rewards)

    if reward.type == 'vehicle' then
        ESX.Game.SpawnLocalVehicle(GetHashKey(reward.name), vector3(748.97686767578, -4407.44140625, -0.65416955947876), 90.0, function(vehicle)
            vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

            reward.vehicleProps = vehicleProps

            ESX.ShowNotification(('Vous avez gagnez x%s %s'):format(reward.count, reward.label))
            TriggerServerEvent('Koy:afk:case:reward', reward, reward.vehicleProps)

            RageUI.CloseAll()
        end)
    else
        ESX.ShowNotification(('Vous avez gagnez x%s %s'):format(reward.count, reward.label))
        TriggerServerEvent('Koy:afk:case:reward', reward)

        RageUI.CloseAll()
    end
end)