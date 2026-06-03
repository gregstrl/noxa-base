local PoliceConnected = 0

-- Fonction pour vérifier si un métier est un métier de police
local function IsPoliceJob(job)
    return job == 'sahp' or job == 'lsco' or job == 'sasp' or job == 'usms'
end

-- Met à jour le nombre de policiers connectés
local function UpdatePoliceCount()
    PoliceConnected = 0
    for _, playerId in ipairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(tonumber(playerId))
        if xPlayer and IsPoliceJob(xPlayer.job.name) then
            PoliceConnected = PoliceConnected + 1
        end
    end
end

-- Événement pour le chargement d'un joueur
AddEventHandler('esx:playerLoaded', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer and IsPoliceJob(xPlayer.job.name) then
        PoliceConnected = PoliceConnected + 1
    end
end)

-- Événement pour la déconnexion d'un joueur
AddEventHandler('esx:playerDropped', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer and IsPoliceJob(xPlayer.job.name) then
        PoliceConnected = PoliceConnected - 1
    end
end)

-- Événement pour le changement de métier
AddEventHandler('esx:setJob', function(playerId, job, lastJob)
    if IsPoliceJob(lastJob.name) then
        PoliceConnected = PoliceConnected - 1
    end
    if IsPoliceJob(job.name) then
        PoliceConnected = PoliceConnected + 1
    end
end)

-- Initialisation au démarrage
Citizen.CreateThread(function()
    UpdatePoliceCount() -- Initialise le compteur au démarrage
    while true do
        print('Nombre de policiers connectés: ' .. PoliceConnected)
        Wait(600000) -- Affiche périodiquement le nombre de policiers
    end
end)
local DeadPedsRobbery = {}

RegisterNetEvent("eSup:callThePolice")
AddEventHandler("eSup:callThePolice", function(ApuIndex)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        if xPlayer.job.name == 'police' or xPlayer.job.name == 'sasp' then
            TriggerClientEvent("initializePoliceBlip2",xPlayers[i], ApuIndex)
        end
    end
end)

RegisterNetEvent('eSup:PickupRobbery', function(store, numbers)
    local source = source 
	if store == nil or store.coords == nil then 
		DropPlayer(source, 'Desynchronisation avec le serveur.')
	else
		if #(GetEntityCoords(GetPlayerPed(source))-store.coords) > 10.0 then
			DropPlayer(source, 'Desynchronisation avec le serveur.')
		else
			local xPlayer = ESX.GetPlayerFromId(source)
			local randomAmount = math.random(eSup.BraquageWin.Minimum, eSup.BraquageWin.Maximum)
			xPlayer.addAccountMoney('dirtycash', randomAmount)
			xPlayer.showNotification("Vous avez récupéré ~g~".. randomAmount .."$~s~.")
            TriggerClientEvent('eSup:RemovePickupRobbery', -1, numbers) 
		end
	end
end)

RegisterServerEvent("sCall:SendCallMsg")
AddEventHandler("sCall:SendCallMsg", function(msg, coords, job, tel)
    local xPlayers = ESX.GetPlayers()
    local xSource = ESX.GetPlayerFromId(source)
    for k, v in pairs(xPlayers) do 
        local xPlayer = ESX.GetPlayerFromId(v)

        if xPlayer.job.name == job or xPlayer.job.name == 'sasp' then
            xPlayer.triggerEvent("sCall:SendMessageCall", msg, coords, job, source, tel)
        end
    end
end)

ESX.RegisterServerCallback('eSup:CanRobbery', function(source, cb, store)
    if PoliceConnected >= eSup.Braquage[store].cops then
        if not eSup.Braquage[store].robbed and not DeadPedsRobbery[store] then
            cb(true)
        else
            cb(false)
        end
    else
        cb('no_cops')
    end
end)

RegisterServerEvent('eSup:RobberyStart')
AddEventHandler('eSup:RobberyStart', function(store)
    local src = source
    eSup.Braquage[store].robbed = true
    local xPlayers = ESX.GetPlayers()

    TriggerClientEvent('eSup:RobberyStart', -1, store)
    Wait(30000)
    TriggerClientEvent('eSup:RobberyStartOver', src)

    local second = 1000
    local minute = 60 * second
    local hour = 60 * minute
    local cooldown = eSup.Braquage[store].cooldown
    local wait = cooldown.hour * hour + cooldown.minute * minute + cooldown.second * second
    Wait(wait)
    eSup.Braquage[store].robbed = false
    for k, v in pairs(DeadPedsRobbery) do 
        if k == store then 
            table.remove(DeadPedsRobbery, k) 
        end 
    end
    TriggerClientEvent('eSup:ResetPedDeath', -1, store)
end)

Citizen.CreateThread(function()
    while true do
        for i = 1, #DeadPedsRobbery do 
            TriggerClientEvent('eSup:PedDeadRobbery', -1, i) 
        end
        Wait(500)
    end
end)