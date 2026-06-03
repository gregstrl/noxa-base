
local History = {}
function OpenHistoryMenu()
    local BoutiqueSub = RageUI.CreateMenu("Boutique Modern", "Actions Boutique")

    ESX.TriggerServerCallback('ewen:getHistory', function(result)
        History = result;
    end)
    
    RageUI.Visible(BoutiqueSub, not RageUI.Visible(BoutiqueSub))
    while BoutiqueSub do
        Wait(0)
        RageUI.IsVisible(BoutiqueSub, function()
            for _, v in pairs(History) do
                -- Vérifie que v.points n'est pas nil
                local points = v.points or 0  -- Si v.points est nil, utilise 0
                
                if tonumber(v.price) ~= 0 then
                    RageUI.Button(v.transaction .. ' ['.. points .. ']', nil, {RightLabel = v.price .. '€'}, true, {
                        onSelected = function() end
                    })
                else
                    RageUI.Button(v.transaction, nil, {RightLabel = points .. ''}, true, {
                        onSelected = function() end
                    })
                end
            end
        end)

        if not RageUI.Visible(BoutiqueSub) then
            BoutiqueSub = RMenu:DeleteType('BoutiqueSub', true)
            Wait(100)
            OpenMenuMain()
        end
    end
end