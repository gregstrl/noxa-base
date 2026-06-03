---
--- @author Azagal
--- Create at [03/11/2022] 11:20:15
--- Current project [Koy-V1]
--- File name [sirenControl]
---
local sirenControl = {}
sirenControl.config = {
    vehicle = {
        "fibp2",
        "polbikeb",
        "polbikeb2",
        "ambulance",
        "torrumk",
        "cst17ram",
        "cst20fpiu",
        "bcpd10",
        "polbuffalop",
        "polfugitivep",
        "polgauntletp",
        "polscoutp",
        "polstalkerp",
        "polstanierp",
        "poltorencep",
        "coach2",
        "ambulance2",
        "emscomet",
        "halfback2",
        "polmav",
        "polmav2",
        "emsalamo",
        "emsamb3",
        "emsamb2",
        "emsscout",
        "r1200emsls",
        "emsswift",
        "fibfrogger",
        "poltaxi",
        "lspdumkscoutgnd",
        "riot",
        "lspdumktorrence",
        "inaugural2",
        "nscouttrafpol",
        "lspdraiden",
        "pinnaclep",
        "lspdverus",
        "roadrunner3",
        "police2b",
        "policeb",
        "lspdtorrence",
        "police6h",
        "lspdscorcher",
        "police6f",
        "lspdbuffalostxum",
        "LSPDumkscoutgnd",
        "trualamo3",
        "bear01",
        "trualamo4",
        "umkalamo",
        "POLCOQUETTER",
        "POLSPEEDOR",
        "bufsxtrafpol",
        "usssflag",
        "POLFUGITIVER",
        "polstalkerr",
        "hazard2",
        "swatstoc",
        "command",
        "swatinsur",
        "swatvanr2",
        "polspeedop",
        "amb_rox_sheriff",
        "amb_rox_sheriff2",
        "amb_rox_sheriffb",
        "amb_rox_swat",
    },
    playerLoad = {}
}

RegisterNetEvent("SirenControl:Request:LoadConfig", function()
    local _src = source

    local xPlayer = ESX.GetPlayerFromId(_src)
    if (xPlayer ~= nil) then
        if (sirenControl.config.playerLoad[_src] == nil) then
            sirenControl.config.playerLoad[_src] = true
        else
            return
        end

        xPlayer.triggerEvent("SirenControl:LoadConfig", {
            vehicle = sirenControl.config.vehicle
        })
    end
end)

RegisterNetEvent("SirenControl:Active", function(selectedState)
    local playerSrc = source
    local playerPed = GetPlayerPed(playerSrc)

    local selectedSiren = 0
    if (selectedState == true) then
        selectedSiren = 0
    elseif (selectedState == false) then
        selectedSiren = 1
    end

    if (playerPed == 0 or not DoesEntityExist(playerPed) or tonumber(selectedSiren) == nil) then
        return
    end

    local playerVehicle = GetVehiclePedIsIn(playerPed, false)
    if (playerVehicle == 0) then
        return
    end

    local vehicleModel = GetEntityModel(playerVehicle)
    local findModel = false
    for i = 1, #sirenControl.config.vehicle do
        local currentModel = GetHashKey(sirenControl.config.vehicle[i])
        if (currentModel == vehicleModel) then
            findModel = true
        end
    end

    if (not findModel) then
        return
    end

    local vehicleSirensState = IsVehicleSirenOn(playerVehicle)
    if (vehicleSirensState == 1) then
        TriggerClientEvent("SirenControl:ManageState", -1, NetworkGetNetworkIdFromEntity(playerVehicle), selectedSiren)
    end
end)