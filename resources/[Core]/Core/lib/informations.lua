KeyboardUtils = {isActive = false}

AddEventHandler("kbi:cancel",function() 
    KeyboardUtils.isActive = false
end)
exports('ShowClause', function()
    TriggerEvent('Koy:showClause')
end)
RegisterCommand('show-clause', function()
    SendNUIMessage({
        type = "showClause"
    })
end)
AddEventHandler('Koy:showClause', function()
    SendNUIMessage({
        type = "showClause"
    })
end)
function KeyboardUtils.use(title,cb)
    if tostring(title) == 'Taper Y pour confirmer' or tostring(title) == 'Taper Y pour valider' then
        local alert = lib.alertDialog({
            header = 'Informations',
            content = 'Voulez vous vraiment confirmer votre action ?',
            centered = true,
            cancel = true
        })

        if alert == "confirm" then
            cb("y")
        else
            
        end
    else
        local input = lib.inputDialog(title, {''})
        if input then
            cb(input[1])
        else
    
        end
    end
end