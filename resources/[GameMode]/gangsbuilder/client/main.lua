ESX = nil
PlayerData = {}
local hasFounderPermission = false

mainMenu = nil
creationMenu = nil 
listeMenu = nil
modifyMenu = nil
positionsMenu = nil
settingsMenu = nil
infoMenu = nil
f7Menu = nil
kidnappedMenu = nil
vehiclesMenu = nil
gradesMenu = nil
gradeMenu = nil
creationGradesMenu = nil
vehicleManagementMenu = nil
vehicleAddMenu = nil

GangsList = {}
GangGradesList = {}
GangVehiclesList = {}
SelectedGang = nil
SelectedGrade = nil
SelectedVehicle = nil
CreationGradesList = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end

    while ESX.GetPlayerData().job2 == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
    CheckFounderPermission()
    
    mainMenu = RageUI.CreateMenu("STORY", "Voici les actions disponibles")
    creationMenu = RageUI.CreateSubMenu(mainMenu, "STORY", "Création de gang")
    listeMenu = RageUI.CreateSubMenu(mainMenu, "STORY", "Liste des Groupes actifs")
    modifyMenu = RageUI.CreateSubMenu(listeMenu, "STORY", "Voici les actions disponible")
    positionsMenu = RageUI.CreateSubMenu(modifyMenu, "STORY", "Modifié les positions")
    settingsMenu = RageUI.CreateSubMenu(modifyMenu, "STORY", "Voici les actions disponibles")
    infoMenu = RageUI.CreateSubMenu(listeMenu, "STORY", "Voici les actions disponible")
    gradesMenu = RageUI.CreateSubMenu(modifyMenu, "STORY", "Gestion des grades")
    gradeMenu = RageUI.CreateSubMenu(gradesMenu, "STORY", "Modification du grade")
    creationGradesMenu = RageUI.CreateSubMenu(creationMenu, "STORY", "Création des grades")
    
    vehicleManagementMenu = RageUI.CreateSubMenu(modifyMenu, "STORY", "Gestion des véhicules")
    vehicleAddMenu = RageUI.CreateSubMenu(vehicleManagementMenu, "STORY", "Ajouter un véhicule")
    
    f7Menu = RageUI.CreateMenu("STORY", "Faites vos actions")
    kidnappedMenu = RageUI.CreateSubMenu(f7Menu, "STORY", "Interactions avec le kidnappé")
    vehiclesMenu = RageUI.CreateSubMenu(f7Menu, "STORY", "Interactions avec un véhicule")
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    CheckFounderPermission()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    PlayerData.job2 = job2
end)

function CheckFounderPermission()
    ESX.TriggerServerCallback('gangsbuilder:checkFounderPermission', function(hasPermission)
        hasFounderPermission = hasPermission
    end)
end

RegisterCommand(Config.CommandName, function()
    ESX.TriggerServerCallback('gangsbuilder:checkFounderPermission', function(hasPermission)
        if hasPermission then
            OpenGangBuilderMenu()
        else
            ESX.ShowNotification(Config.Messages.NoPermission)
        end
    end)
end, false)

RegisterKeyMapping('opengang', 'Ouvrir le menu Gang (F7)', 'keyboard', 'F7')
RegisterCommand('opengang', function()
    PlayerData = ESX.GetPlayerData()
    if PlayerData.job2 and PlayerData.job2.name ~= 'unemployed2' then
        OpenGangF7Menu()
    end
end, false)

RegisterNetEvent('gangsbuilder:refreshGangs')
AddEventHandler('gangsbuilder:refreshGangs', function()
    ESX.TriggerServerCallback('gangsbuilder:getGangs', function(gangs)
        GangsList = gangs
    end)
end)

RegisterNetEvent('gangsbuilder:notify')
AddEventHandler('gangsbuilder:notify', function(message)
    ESX.ShowNotification(message)
end)

RegisterNetEvent('gangsbuilder:refreshPlayerData')
AddEventHandler('gangsbuilder:refreshPlayerData', function()
    PlayerData = ESX.GetPlayerData()
    
    if PlayerData.job2 and PlayerData.job2.name ~= 'unemployed2' then
        ESX.TriggerServerCallback('gangsbuilder:getGangByJob', function(gang)
            if gang and gang.positions then
                gangPositions = gang.positions
                cachedGang = gang
                RemoveGangBlips()
                CreateGangBlips(gang)
            else
                gangPositions = nil
                cachedGang = nil
                RemoveGangBlips()
            end
        end, PlayerData.job2.name)
    end
end)

Citizen.CreateThread(function()
    TriggerEvent('gangsbuilder:refreshGangs')
end) 