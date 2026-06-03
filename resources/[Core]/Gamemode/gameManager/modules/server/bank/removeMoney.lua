---
--- @author Azagal
--- Create at [23/10/2022] 20:25:36
--- Current project [Rezurrection-V1]
--- File name [removeMoney]
---

RegisterNetEvent("Bank:removeMoney", function(money)
    local playerSrc = source

    local xPlayer = ESX.GetPlayerFromId(playerSrc)
    if (not xPlayer) then
        return
    end

    -- Securite : le montant vient du client. On exige un entier strictement positif
    -- sinon un montant negatif/decimal/non-numerique permet de dupliquer de l'argent.
    money = tonumber(money)
    if (not money) or money <= 0 or money ~= math.floor(money) then
        return
    end

    if (xPlayer.getAccount("bank").money >= money) then
        xPlayer.removeAccountMoney("bank", money)
        xPlayer.addAccountMoney("cash", money)
        xPlayer.showNotification("Vous avez retiré "..money.."~g~$~s~.")
    else
        xPlayer.showNotification("~r~Vous n'avez pas cette somme dans votre compte bancaire.")
    end
end)