local InArmour = false

    RegisterNetEvent('obi:SetArmour')
    AddEventHandler('obi:SetArmour', function(type)
        FreezeEntityPosition(PlayerPedId(), true)
        SetPlayerControl(PlayerId(), false, 12)
        InArmour = type
        ExecuteCommand(("%s"):format("e kneel3"))
        ExecuteCommand('me utilise un gilet pare-balle')
        exports["rprogress"]:Start('', 10000)
        ClearPedTasks(PlayerPedId())
        FreezeEntityPosition(PlayerPedId(), false)
        SetPlayerControl(PlayerId(), true, 12)
    end)

    AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
        if InArmour then 
            local args = {}
            if eventName == "CEventNetworkEntityDamage" then
                local victimEntity, attackEntity, damage, _, _, fatalBool, weaponUsed, _, _, _, entityType = table.unpack(eventArguments)
                args = { victimEntity, attackEntity, fatalBool == 1, weaponUsed, entityType,
                    math.floor(string.unpack("f", string.pack("i4", damage)))
                }
                if GetEntityType(victimEntity) == 1 then 
                    if victimEntity == PlayerPedId() then 
                        if InArmour then 
                            if GetPedArmour(PlayerPedId()) == 0 then
                                TriggerServerEvent('obi:BreakKevlar')
                                ESX.ShowNotification("[~s~BREAK~s~] Votre protection pare-balle vient de se détruire, mettez vous à l'abrit !")
                                PlaySoundFrontend(-1, "Object_Collect_Player", "GTAO_FM_Events_Soundset", 0)
                                --ShakeGameplayCam("HAND_SHAKE", 5.0)
                                --ExecuteCommand('+ragdoll')
                                InArmour = false
                                SetTimecycleModifier("rply_saturation_neg")
                                ClearTimecycleModifier()
                                --StopGameplayCamShaking()
                            end
                        end
                    end
                end
            end
        end
    end)

    function HasKevlar()

        return InArmour
    end