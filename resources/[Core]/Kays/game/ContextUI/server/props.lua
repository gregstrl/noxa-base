RegisterNetEvent('removePropFromNetwork')
AddEventHandler('removePropFromNetwork', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)

    if entity and DoesEntityExist(entity) then
        if NetworkHasControlOfEntity(entity) then
            DeleteEntity(entity)
        else
            NetworkRequestControlOfEntity(entity)
            Wait(500)
            if NetworkHasControlOfEntity(entity) then
                DeleteEntity(entity)
            end
        end
    end
end)
