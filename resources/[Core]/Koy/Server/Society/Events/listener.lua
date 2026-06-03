Shared.Events:On(Enums.ESX.Player.Job.Server.setJob(), function(playerId, job, lastJob)

    local xPlayer = Server:ConvertToPlayer(playerId);
    local lastSociety = JG.SocietyManager:GetSociety(lastJob.name);
    local society = JG.SocietyManager:GetSociety(job.name);

    if (lastSociety and society) then

        Shared.Events:ToClient(xPlayer, Enums.Society.JobChanged);

        lastSociety:RemoveEmployee(xPlayer);
        society:AddEmployee(xPlayer, true);

        society:UpdateBossEvent(Enums.Society.ReceiveEmployees, society:GetEmployees());

    end

end);

Shared.Events:On(Enums.ESX.Player.Job.Server.setJob2(), function(playerId, job2, lastJob2)

    local xPlayer = Server:ConvertToPlayer(playerId)
    local lastGang = JG.SocietyManager:GetSociety(lastJob2.name)
    local gang = JG.SocietyManager:GetSociety(job2.name)

    if lastGang and gang then
        -- Notifier le client que le job a changé
        Shared.Events:ToClient(xPlayer, Enums.Society.JobChanged)

        -- Mettre à jour les employés entre les gangs
        lastGang:RemoveEmployee(xPlayer)
        gang:AddEmployee(xPlayer, true)

        -- Vérification pour éviter une erreur si JG ou JG.GangBuilder est nil
        if JG and JG.GangBuilder then
            local gangFromBuilder = JG.GangBuilder:GetGang(gang:GetName())

            if gangFromBuilder then
                Shared.Events:ToClient(xPlayer, Enums.GangBuilder.ReceiveGangData, gangFromBuilder)
            else
                Shared.Events:ToClient(xPlayer, Enums.GangBuilder.ReceiveGangData, {})
            end
        else
            -- Si JG.GangBuilder est absent, on envoie des données vides
            print("Erreur : JG.GangBuilder est nil. Vérifiez son initialisation.")
            Shared.Events:ToClient(xPlayer, Enums.GangBuilder.ReceiveGangData, {})
        end

        -- Mettre à jour les employés pour le boss
        gang:UpdateBossEvent(Enums.Society.ReceiveEmployees, gang:GetEmployees())
    end
end)


Shared.Events:OnNet(Enums.Player.Events.PlayerLoaded, function(xPlayer)

    local society = JG.SocietyManager:GetSociety(xPlayer.job.name);
    local gang = JG.SocietyManager:GetSociety(xPlayer.job2.name);

    if (society) then

        society:AddEmployee(xPlayer);

        society:UpdateBossEvent(Enums.Society.ReceiveEmployees, society:GetEmployees());

    end

    if (gang) then

        gang:AddEmployee(xPlayer);

        gang:UpdateBossEvent(Enums.Society.ReceiveEmployees, gang:GetEmployees());

    end

end);