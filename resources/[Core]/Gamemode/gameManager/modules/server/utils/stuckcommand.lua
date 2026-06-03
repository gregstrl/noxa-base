-- Configuration

-- Rayon de recharge en mètres (100.0 par défaut)
local reloadRadius = 100.0  

-- Définir le temps de téléportation en secondes (0.05 par défaut)
local teleportTime = 0.05

-- Définir la commande "/stuck"
RegisterCommand("stuck", function(source, args, rawCommand)
    local playerId = source

    local playerPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)

    local originalCoords = playerCoords

    SetEntityCoords(playerPed, 0.0, 0.0, 0.0)
    Wait(teleportTime * 1000)  

    -- Afficher un message dans la console avec le nom du joueur et son ID
     local playerName = GetPlayerName(playerId)
     print("Rechargement des objets dans un rayon de " .. reloadRadius .. " mètres pour le joueur " .. playerName .. " (ID: " .. playerId .. ")")


    local objectsLoaded = LoadAllObjectsFromArea(playerCoords.x, playerCoords.y, playerCoords.z, reloadRadius)

    SetEntityCoords(playerPed, originalCoords)

    if objectsLoaded then
        TriggerClientEvent("esx:showNotification", playerId, "La zone autour de vous a été rechargée.")
    else
        TriggerClientEvent("esx:showNotification", playerId, "Une erreur s'est produite lors du rechargement.")
    end
end, false)

function LoadAllObjectsFromArea(x, y, z, radius)
    local handle = StartFindKvp("spawn_manager:numDynamicObjects")
    local key, value = FindKvp(handle)
    while key ~= nil do
        local objectKey = key
        local objectCount = tonumber(value)
        EndFindKvp(handle)

        for i = 1, objectCount do
            local objectCoords = GetCoordsForKey(objectKey, i)
            local distance = #(vector3(objectCoords.x, objectCoords.y, objectCoords.z) - vector3(x, y, z))
            if distance <= radius then
                RequestModel(objectCoords.model)
                while not HasModelLoaded(objectCoords.model) do
                    Wait(500)
                end
                local obj = CreateObject(objectCoords.model, objectCoords.x, objectCoords.y, objectCoords.z, true, false, true)
                SetModelAsNoLongerNeeded(objectCoords.model)
                PlaceObjectOnGroundProperly(obj)
            end
        end

        handle = StartFindKvp("spawn_manager:numDynamicObjects")
        key, value = FindKvp(handle)
    end
    EndFindKvp(handle)

    return true
end

function GetCoordsForKey(key, index)
    local objectKey = key .. "_" .. tostring(index)
    local coords = GetResourceKvpString(objectKey .. ":coords")
    local model = GetResourceKvpString(objectKey .. ":model")
    local x, y, z = table.unpack(json.decode(coords))
    return { x = x, y = y, z = z, model = GetHashKey(model) }
end