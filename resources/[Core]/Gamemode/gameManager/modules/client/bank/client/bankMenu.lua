---
--- @author Azagal
--- Create at [23/10/2022] 19:36:21
--- Current project [Wise-V1]
--- File name [bankMenu]
---

Bank = {}

function Bank:openMenu(type)
    local accountMoney = 0
    local playerHasCard = nil
    local mainMenu = RageUI.CreateMenu("", "Banque")
    local Description = nil
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    if (RageUI.Visible(mainMenu) == true) then
        FreezeEntityPosition(PlayerPedId(), true, true);
    end

    while mainMenu do
        local playerData = ESX.GetPlayerData()

        RageUI.IsVisible(mainMenu, function()
            for i = 1, #playerData.accounts do
                local selectedAccount = playerData.accounts[i]
                if (selectedAccount ~= nil) then
                    if (selectedAccount.name == "bank") then
                        accountMoney = selectedAccount.money
                    end
                end
            end

            for i = 1, #playerData.inventory do
                local selectedItem = playerData.inventory[i]
                if (selectedItem ~= nil) then
                    if (selectedItem.name == "cb") then
                        playerHasCard = true
                    end
                end
            end

            RageUI.Separator("Solde de votre compte : "..ESX.Math.GroupDigits(accountMoney).."~g~$~s~")

            if (type == "bank") then
                RageUI.Button("Récupérer ma carte (1 450~g~$~s~)", nil, {
                    RightLabel = "→"
                }, type == "bank" and not playerHasCard, {
                    onSelected = function()
                        TriggerServerEvent("Bank:buyCard")
                    end
                })
            elseif (type == "atm" and not playerHasCard) then
                Description = "~r~Vous n'avez pas de carte bancaire"
            end

            RageUI.Button("Déposer du solde", Description, {
                RightLabel = "→"
            }, type == "bank" or type == "atm" and playerHasCard == true, {
                onSelected = function()
                    local selectedCount = tonumber(KeyboardInput("Veuillez saisir une somme", "", 7))
                    if (selectedCount ~= nil and selectedCount > 0) then
                        TriggerServerEvent("Bank:addMoney", selectedCount)
                    end
                end
            })

            RageUI.Button("Retirer du solde", Description, {
                RightLabel = "→"
            }, type == "bank" or type == "atm" and playerHasCard == true, {
                onSelected = function()
                    local selectedCount = tonumber(KeyboardInput("Veuillez saisir une somme", "", 7))
                    if (selectedCount ~= nil and selectedCount > 0) then
                        TriggerServerEvent("Bank:removeMoney", selectedCount)
                    end
                end
            })
        end)

        if (not RageUI.Visible(mainMenu)) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            FreezeEntityPosition(PlayerPedId(), false, false);
        end

        Wait(0)
    end
end