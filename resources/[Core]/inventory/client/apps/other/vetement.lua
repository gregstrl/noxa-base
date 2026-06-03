local duration = 4000

local function playAnimationWithProgress(clothingType, duration, callback)
    local anim = Config.ClothingAnimations[clothingType]
    if anim then
        RequestAnimDict(anim.dict)
        while not HasAnimDictLoaded(anim.dict) do
            Wait(100)
        end

        TaskPlayAnim(PlayerPedId(), anim.dict, anim.anim, 8.0, 8.0, duration, 49, 0, false, false, false)
        exports["rprogress"]:Start('', duration)

        Wait(duration) -- Ensures animation completes before clearing
        ClearPedTasks(PlayerPedId())

        if callback then
            callback()
        end
    end
end

function Inventaire:ApplyClothes(tenue)
    local clothes = tenue 
    Inventaire:startAnimAction('clothingtie', 'try_tie_neutral_a')
    exports["rprogress"]:Start('', 4000)
    ClearPedTasks(PlayerPedId())  

    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerEvent('skinchanger:loadClothes', skin, json.decode(clothes))
    end)
    -- -- save la tenue 
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent(Config.Trigger['saveSkin'], skin)
    end)
end

RegisterNUICallback("removeClothes", function(data)
    local index = data.component
    closeInventory()
    TriggerServerCallback("esx_skin:getPlayerSkin", function(skin)
        TriggerEvent("skinchanger:getSkin", function(skina)
            if Config.Clothes[index] then
                local animationDuration = 1500
                playAnimationWithProgress(index, animationDuration, function()
                    if skin[index .. '_1'] ~= skina[index .. '_1'] then
                        if index == 'torso' then
                            TriggerEvent("skinchanger:loadClothes", skina, { 
                                ["torso_1"] = skin.torso_1, ["torso_2"] = skin.torso_2, 
                                ["tshirt_1"] = skin.tshirt_1, ["tshirt_2"] = skin.tshirt_2, 
                                ["arms"] = skin.arms 
                            })
                        else
                            TriggerEvent("skinchanger:loadClothes", skina, { 
                                [index .. '_1'] = skin[index .. '_1'], 
                                [index .. '_2'] = skin[index .. '_2'] 
                            })
                        end
                    else
                        local newClothes = {
                            [index .. '_1'] = Config.Clothes[index][skin.sex][index .. '_1'], 
                            [index .. '_2'] = Config.Clothes[index][skin.sex][index .. '_2']
                        }
                        if index == 'torso' then
                            newClothes['tshirt_1'] = Config.Clothes['tshirt'][skin.sex]['tshirt_1']
                            newClothes['tshirt_2'] = Config.Clothes['tshirt'][skin.sex]['tshirt_2']
                            newClothes['arms'] = Config.Clothes['arms'][skin.sex]['arms_1']
                            newClothes['arms_2'] = Config.Clothes['arms'][skin.sex]['arms_2']
                        end
                        TriggerEvent("skinchanger:loadClothes", skina, newClothes)
                    end
                    RefreshPedScreen()
                    print('removeClothes', index)
                end)
            end
        end)
    end)
end)

exports('addClothes', function(type, name, data)
    TriggerServerEvent('MKG_inv:addCloth', type, name, data)
end)
