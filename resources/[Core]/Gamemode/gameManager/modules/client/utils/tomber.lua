local isFalling = false
local messageDisplayed = false  -- Pour éviter de montrer le message à chaque image

Keys.Register("J", "Tomber", "Tomber au sol", function()
    CreateThread(function()
        FallAnimation()
    end)
end)

function FallAnimation()
    local ped = PlayerPedId()
    if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) then 
        Citizen.CreateThread(function()
            if isFalling then
                isFalling = false
            else
                isFalling = true
                SetPedToRagdoll(ped, 100, 100, 0, 0, 0, 0)
                while isFalling do
                    Wait(10)
                    ResetPedRagdollTimer(ped)

                    -- Afficher une notification améliorée lorsque le joueur tombe
                    if not messageDisplayed then
                        ESX.ShowNotification("Appuyez sur [~s~J~s~] pour vous relever.")
                        messageDisplayed = true
                    end
                end
            end
        end)
    end 
end