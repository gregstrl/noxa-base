CreateThread(function()
    function DrawInstructionBarNotification(x, y, z, text)
        local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))
    
        local distance = GetDistanceBetweenCoords(x, y, z, px, py, pz, false)
    
        if distance <= 6 then
            SetTextScale(0.35, 0.35)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 215)
            SetTextEntry("STRING")
            SetTextCentre(true)
            AddTextComponentString(text)
            SetDrawOrigin(x,y,z, 0)
            DrawText(0.0, 0.0)
            local factor = (string.len(text)) / 370
            DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
            ClearDrawOrigin()
        end
    end


    --- NPC
    Afk.AfkNPC = {
        myPed = nil,
        tag = nil,

        myPed2 = nil,
        tag2 = nil
    }

    local interval = 2000

    while true do
        Wait(interval)

        interval = 2000

        local player = PlayerPedId()

        local dist = #(GetEntityCoords(player)-vector3(Afk.NPC.pos.x, Afk.NPC.pos.y, Afk.NPC.pos.z))

        if dist < 50 then
            if not DoesEntityExist(Afk.AfkNPC.myPed) then 
                if Afk.AfkNPC.myPed == nil then
            
                    ESX.Game.SpawnLocalPed(2, "a_m_m_hasjew_01", vector3(Afk.NPC.pos.x, Afk.NPC.pos.y, Afk.NPC.pos.z-0.98), Afk.NPC.heading, function(ped)
                        if Afk.AfkNPC.myPed then
                            DeleteEntity(Afk.AfkNPC.myPed)
                            Afk.AfkNPC.myPed = nil
                        end
                        Afk.AfkNPC.myPed = ped

                        FreezeEntityPosition(ped, true)
                        SetEntityInvincible(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)

                        TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD')
                    end)
                end
            else
                if dist < 15 and DoesEntityExist(Afk.AfkNPC.myPed) then 
                    interval = 1000
                    Afk.AfkNPC.tag = CreateFakeMpGamerTag(Afk.AfkNPC.myPed, Afk.NPC.name, true, false, 'NPC', 1)
                    SetMpGamerTagColour(Afk.AfkNPC.tag, 0, 40)
                    SetMpGamerTagVisibility(Afk.AfkNPC.tag, 14, true)
                    SetMpGamerTagColour(Afk.AfkNPC.tag, 14, 40)
                    SetMpGamerTagAlpha(Afk.AfkNPC.tag, 14, 255)
                    SetMpGamerTagHealthBarColor(Afk.AfkNPC.tag, 40)

                    if dist < 2 then
                        interval = 1
                        DrawInstructionBarNotification(Afk.NPC.pos.x, Afk.NPC.pos.y, Afk.NPC.pos.z, "[~r~E~s~] Pour intéragir")

                        if IsControlJustPressed(0, 54) then
                            Afk:openAfkMenu()
                        end
                    end
                else
                    if Afk.AfkNPC.tag then 
                        RemoveMpGamerTag(Afk.AfkNPC.tag)
                        Afk.AfkNPC.tag = nil
                    end
                end
            end
        else
            if Afk.AfkNPC.myPed then 
                if DoesEntityExist(Afk.AfkNPC.myPed) then 
                    DeleteEntity(Afk.AfkNPC.myPed)
                    Afk.AfkNPC.myPed = nil
                end
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(rName)
    if GetCurrentResourceName() == rName then
        if DoesEntityExist(Afk.AfkNPC.myPed) then 
            DeleteEntity(Afk.AfkNPC.myPed)
        end

        if DoesEntityExist(Afk.AfkNPC.myPed2) then 
            DeleteEntity(Afk.AfkNPC.myPed2)
        end

        if DoesEntityExist(Afk.LeaderPed1) then
            DeleteEntity(Afk.LeaderPed1)
        end
    end
end)

AddEventHandler('onResourceStart', function(rName)
    if GetCurrentResourceName() == rName then
        TriggerServerEvent('Koy:afk:restart')
    end
end)

Afk.myInformations = {
    time = 0,
    points = 0,
    inZone = false
}

RegisterNetEvent('Koy:afk:recievePlayerInformation', function(data)
    Afk.myInformations = data
end)

function Afk:openAfkMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Separator('~r~↓ AFK ↓~s~')
            RageUI.Separator('Recevez des Points en restant AFK,\nqui vous permetera d\'acheter des Caisses AFK.')
            RageUI.Separator()
            RageUI.Line()
            local mins = Afk.myInformations.time
            local hours = math.floor(mins / 60)
            local minutes = mins % 60
            
            local time_result = '0 minutes'
            if hours > 0 then
                time_result = math.floor(hours) .. 'h'
            end
            if minutes > 0 then
                if hours > 0 then
                    time_result = time_result .. math.floor(minutes)
                else
                    time_result = math.floor(minutes) .. ' minutes'
                end
            end
            
            RageUI.Separator(('Temps Passé: ~r~%s~s~'):format(time_result))
            RageUI.Separator(('Vos Points: ~r~%s~s~'):format(Afk.myInformations.points))
            RageUI.Line()
            RageUI.Button('Entrer en Zone AFK', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    TriggerServerEvent('Koy:afk:enter')

                    RageUI.CloseAll()
                end
            })
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

exports('getInAfkZone', function()
    return Afk.myInformations.inZone
end)