local textPosition = vector3(-1252.388306, -1476.088867, 4.358631)
local textScale = 0.35
local maxDistance = 25.0
local textSpacing = 0.17

local textMessages = {
    "~y~Bienvenue sur le serveur !",
    "Vous avez raté la création de votre personnage ?",
    "Faites un /report besoin d'aide en jeu",
    "~g~Vous avez un problème en jeu ?",
    "Contactez un staff en utilisant la commande /report (Raison)",
    "Un membre du staff interviendra dans les secondes qui suivent",
    "~s~Informations RP :",
    "Envie de rejoindre une entreprise / gang ?",
    "Direction notre serveur Discord ci-dessous !",
    "~b~discord.gg/wisefa",
    "~s~IMPORTANT",
    "Modifiez vos touches dans les options",
    "ECHAP/Configuration/Configurer vos touches/FiveM",
    "Chaque freekill/troll sera lourdement sanctionné par l'administration",
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - textPosition)

        if distance < maxDistance then
            for i = 1, #textMessages do
                DrawText3D(textPosition.x, textPosition.y, textPosition.z - ((i - 1) * textSpacing), textMessages[i])
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    if onScreen then
        SetTextScale(textScale, textScale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextCentre(true)
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
