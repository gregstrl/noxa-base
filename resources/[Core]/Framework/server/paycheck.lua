
ESX.StartPayCheck = function()
    function payCheck()
        local xPlayers = ESX.GetPlayers()

        for i = 1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

            if xPlayer then
                local salary = xPlayer.job.grade_salary

                if salary > 0 then
                    if xPlayer.job.grade_name == 'unemployed' then
                        xPlayer.addAccountMoney('bank', salary)
                        TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_help', salary), '#5fa05d', 'CHAR_BANK_FLEECA')
                    elseif Config.EnableSocietyPayouts then
                        local society = ESX.DoesSocietyExist(xPlayer.job.name)
                        if society ~= nil then
                            if ESX.GetSocietyMoney(xPlayer.job.name) >= salary then
                                ESX.RemoveSocietyMoney(xPlayer.job.name, tonumber(salary))
                                local finalSalary = salary
                                
                                -- Vérification du niveau VIP pour multiplier le salaire
                                if xPlayer.getVIP() == 3 then
                                    finalSalary = salary * 2
                                    xPlayer.showNotification("Vous avez reçu votre salaire: ~g~" .. finalSalary .. "$ \nx2 VIP Diamond~s~")
                                elseif xPlayer.getVIP() == 2 then
                                    finalSalary = salary * 1.5
                                    xPlayer.showNotification("Vous avez reçu votre salaire: ~g~" .. finalSalary .. "$ \nx1.5 VIP Gold~s~")
                                else
                                    xPlayer.showNotification("Vous avez reçu votre salaire: ~g~" .. salary .. "$~s~")
                                end

                                xPlayer.addAccountMoney('bank', finalSalary)
                            else
                                TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, xPlayer.job.name, _U('bank'), _U('company_nomoney'), '#5fa05d', 'CHAR_BANK_FLEECA')
                            end
                        else
                            TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, xPlayer.job.name, '', "Une erreur est survenue, Code erreur ~s~'society_not_exist_error'~s~. Veuillez contacter un ~b~administrateur~s~.", '#5fa05d', 'CHAR_BANK_FLEECA')
                        end
                    end
                end
            end
        end
        SetTimeout(Config.PaycheckInterval, payCheck)
    end
    SetTimeout(Config.PaycheckInterval, payCheck)
end
