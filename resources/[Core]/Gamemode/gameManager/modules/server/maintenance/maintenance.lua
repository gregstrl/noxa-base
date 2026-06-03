--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local Licensestaff = {
    Staff = {
        ["license:1f276e2e5e93ecb5196fddfbb23fbb503c6f703a"] = true, -- Neel
        ["license:60d9d5d40ec2605a1b7623a6b8ac33da4542850b"] = true, -- Chadoxi
        ["license:c2c3c966e0e5c38e113c68b780460b0fb1d62b70"] = true, -- Kays
        ["license:242a9446c5b6dd8050bd50d5af4234fbb5a4d505"] = true, -- k2r

    },
}

local maintenance = false

local function getLicense(src)
     for k,v in pairs(GetPlayerIdentifiers(src))do
          if string.sub(v, 1, string.len("license:")) == "license:" then
               return v
          end
     end
end

local function devStart(state)
     if state then
        maintenance = true
          local xPlayers = ESX.GetPlayers()
          for i = 1, #xPlayers, 1 do
               if not Licensestaff.Staff[getLicense(xPlayers[i])] then
                    print("Le joueur ^6"..GetPlayerName(xPlayers[i]).."^0 connexion ^1reffusé^0 (^5PasDEV^0)")
                    DropPlayer(xPlayers[i], "\n\nLe Serveur wise est en cours de maintenance, plus d'informations sur discord.gg/wisefa !")
               else
                    print("Le joueur ^6"..GetPlayerName(xPlayers[i]).."^0 connexion ^2accepté^0 (^5Dev^0)")
               end
          end
     else
        maintenance = false
     end
end

Citizen.CreateThread(function()
    devStart(maintenance)
end)

AddEventHandler('playerConnecting', function(name, setReason)
    if maintenance then
         if not Licensestaff.Staff[getLicense(source)] then
            print("Le joueur ^6"..name.."^0 connexion ^1reffusé^0 (^5Maintenance^0)")
            setReason("\n\nLe Serveur wise est en cours de maintenance, plus d'informations sur discord.gg/wisefa !")
            CancelEvent()
            return
         end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(60*1000*4)
        if maintenance then
            print("Maintenance ^2détecté^0 !")
            local xPlayers = ESX.GetPlayers()
            for i = 1, #xPlayers, 1 do
                 if not Licensestaff.Staff[getLicense(xPlayers[i])] then
                      print("Le joueur ^6"..GetPlayerName(xPlayers[i]).."^0 est ^1reffusé^0 dans la maintenance et je le kick .")
                      DropPlayer(xPlayers[i], "\n\nLe Serveur wise est en cours de maintenance, plus d'informations sur Discord.gg/wise !")
                 else
                      print("Le joueur ^6"..GetPlayerName(xPlayers[i]).."^0 est ^2accepté^0 dans la maintenance .")
                 end
            end
        else
        end
    end
end)

RegisterCommand("maintenance", function(source)
    if source == 0 then
         if not maintenance then
              print("Maintenance ^2actif^0 !")
              devStart(true)
         else
              print("Maintenance non ^1actif^0 !")
              devStart(false)
         end
    end
end)