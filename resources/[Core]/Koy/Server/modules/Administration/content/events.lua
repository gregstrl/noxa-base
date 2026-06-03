ESX.RegisterServerCallback('admin:getPlayerData', function(source, cb, targetId)
    local xPlayer = ESX.GetPlayerFromId(targetId)
    
    if xPlayer then
        local identity = nil
        
        if xPlayer.variables and xPlayer.variables.firstName and xPlayer.variables.lastName then
            identity = xPlayer.variables.firstName .. " " .. xPlayer.variables.lastName
        end
        
        local playerData = {
            name = xPlayer.getName(),
            job = {
                name = xPlayer.job.name,
                label = xPlayer.job.label,
                grade = xPlayer.job.grade,
                grade_label = xPlayer.job.grade_label
            },
            job2 = {
                name = xPlayer.job2.name,
                label = xPlayer.job2.label, 
                grade = xPlayer.job2.grade,
                grade_label = xPlayer.job2.grade_label
            },
            group = xPlayer.getGroup(),
            identity = identity
        }
        cb(playerData)
    else
        cb(nil)
    end
end) 