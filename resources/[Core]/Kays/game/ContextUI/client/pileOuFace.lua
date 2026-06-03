local PlayerGender = nil
local IsPlaying = false

RegisterCommand("pileouface", function(source, args)
    if IsPlaying then
        return
    end
    IsPlaying = true

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    TriggerEvent('skinchanger:getSkin', function(skin)
        PlayerGender = skin.sex == 0 and 'male' or 'female'
    end)

    local animDict2 = PlayerGender == 'male' and 'anim@mp_player_intcelebrationmale@coin_roll_and_toss' or 'anim@mp_player_intcelebrationfemale@coin_roll_and_toss'
    local animDict1 = 'anim@mp_player_intuppercoin_roll_and_toss'
    local coinModel = `vw_prop_vw_coin_01a`

    ESX.Streaming.RequestAnimDict(animDict1)
    ESX.Streaming.RequestAnimDict(animDict2)
    ESX.Streaming.RequestModel(coinModel)

    local coin = CreateObject(coinModel, playerCoords.x, playerCoords.y, playerCoords.z, true, false, false)
    SetEntityAsNoLongerNeeded(coin)

    AttachEntityToEntity(coin, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 1, 2, 1)
    TaskPlayAnim(playerPed, animDict1, 'enter', 8.0, 8.0, -1, 0, 0, false, false, false)
    Wait(4100)

    TaskPlayAnim(playerPed, animDict1, 'idle_a', 8.0, 0.5, -1, 0, 0, false, false, false)
    Wait(2000)

    TaskPlayAnim(playerPed, animDict2, 'coin_roll_and_toss', 20.0, 4.0, -1, 0, 0, false, false, false)
    Wait(2500)

    local boneCoords = GetPedBoneCoords(playerPed, 28422, 0.0, 0.0, 0.0)

    local closestPlayer, closestDistance = GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance < 2.5 then
        TriggerServerEvent('tossCoinServer', GetPlayerServerId(PlayerId()), boneCoords)
    end

    Wait(500)
    TaskPlayAnim(playerPed, animDict1, 'exit', 4.0, 8.0, -1, 0, 0, false, false, false)
    Wait((GetAnimDuration(animDict1, 'exit') * 1000))
    SetModelAsNoLongerNeeded(coinModel)
    RemoveAnimDict(animDict1)
    RemoveAnimDict(animDict2)
    ESX.Game.DeleteEntity(coin)
    IsPlaying = false
end, false)

RegisterNetEvent('tossCoinClient')
AddEventHandler('tossCoinClient', function(result, boneCoords)
    local text = result == 1 and "~g~Pile~s~" or "~b~Face~s~"
    ExecuteCommand('me est tombé sur ' .. text)
end)

function GetPlayers()
    return GetActivePlayers()
end

function GetClosestPlayer()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local closestPlayer = -1
    local closestDistance = -1
    local players = GetActivePlayers()
    for _, playerId in ipairs(players) do
        if playerId ~= PlayerId() then
            local ped = GetPlayerPed(playerId)
            local pedCoords = GetEntityCoords(ped)
            local distance = #(playerCoords - pedCoords)

            if closestDistance == -1 or distance < closestDistance then
                closestPlayer = playerId
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end