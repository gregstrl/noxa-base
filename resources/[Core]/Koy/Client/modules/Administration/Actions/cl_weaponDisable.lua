local disabledWeapons = {}

-- Event pour recevoir la liste des armes désactivées
RegisterNetEvent("JG:updateDisabledWeapons")
AddEventHandler("JG:updateDisabledWeapons", function(weapons)
    disabledWeapons = weapons
end)

-- Event pour ajouter une arme désactivée
RegisterNetEvent("JG:addDisabledWeapon")
AddEventHandler("JG:addDisabledWeapon", function(weaponName)
    disabledWeapons[weaponName] = true
end)

-- Event pour retirer une arme désactivée
RegisterNetEvent("JG:removeDisabledWeapon")
AddEventHandler("JG:removeDisabledWeapon", function(weaponName)
    disabledWeapons[weaponName] = nil
end)

-- Boucle principale pour vérifier et empêcher l'utilisation des armes désactivées
CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        
        -- Si le joueur a une arme en main
        local currentWeapon = GetSelectedPedWeapon(ped)
        if currentWeapon ~= GetHashKey("WEAPON_UNARMED") then
            -- Convertir le hash en nom d'arme
            for weapon, _ in pairs(disabledWeapons) do
                if currentWeapon == GetHashKey(weapon) then
                    -- Désarmer le joueur
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                    ESX.ShowNotification("[~r~Impossible~s~] Cette arme est temporairement désactivée.")
                    break
                end
            end
        end
    end
end) 