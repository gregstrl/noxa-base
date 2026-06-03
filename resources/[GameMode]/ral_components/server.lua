ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('silencer', function(source)
    TriggerClientEvent('components:useSilencer', source)
end)

ESX.RegisterUsableItem('grip', function(source)
    TriggerClientEvent('components:useGrip', source)
end)

ESX.RegisterUsableItem('flashlight', function(source)
    TriggerClientEvent('components:useFlashlight', source)
end)

ESX.RegisterUsableItem('scope', function(source)
    TriggerClientEvent('components:useScope', source)
end)

ESX.RegisterUsableItem('extended_clip', function(source)
    TriggerClientEvent('components:useExtendedClip', source)
end)
