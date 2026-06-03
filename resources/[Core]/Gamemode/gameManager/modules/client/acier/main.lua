--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

Citizen.CreateThread(function()
    -- Ped Vente
    local model = GetHashKey('a_m_m_eastsa_02')
    local posspawn = Config.Acier.Vente
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(1) end
    local ped = CreatePed(4, model, posspawn, 301.24, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_COP_IDLES", 0, true)

    -- Blip Recolte
    local blip = AddBlipForCoord(Config.Acier.Recolte)
    SetBlipSprite (blip, 253)
    SetBlipColour(blip, 36)
    SetBlipScale  (blip, 0.6)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("[Activité] Recolte d'Acier")
    EndTextCommandSetBlipName(blip)

    -- Blip Traitement
    local blip = AddBlipForCoord(Config.Acier.Traitement)
    SetBlipSprite (blip, 253)
    SetBlipColour(blip, 36)
    SetBlipScale  (blip, 0.6)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("[Activité] Traitement d'Acier")
    EndTextCommandSetBlipName(blip)

    -- Blip Vente
    local blip = AddBlipForCoord(Config.Acier.Vente)
    SetBlipSprite (blip, 253)
    SetBlipColour(blip, 36)
    SetBlipScale  (blip, 0.6)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("[Activité] Vente d'Acier")
    EndTextCommandSetBlipName(blip)
end)