--[[
  This file is part of Koy RolePlay.
  Copyright (c) Koy RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil 
local SharedGangs = {}

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)



local SocietyState = {
    ["burgershot"] = { label = "Burgershot", state = false },
    ["unicorn"] = { label = "Unicorn", state = false },
	["bahamas"] = { label = "Bahamas", state = false },
	["taxi"] = { label = "Taxi", state = false },
	["club77"] = { label = "Club 77", state = false },
	["avocat"] = { label = "Avocat", state = false },
	["mecano"] = { label = "Benny's", state = false },
	["mecano2"] = { label = "LS Custom", state = false },
	["larrys"] = { label = "Larrys Repair", state = false },
	["autoexotic"] = { label = "Auto Exotic", state = false }
}


ESX.RegisterServerCallback('entreprise:getStatus', function(source, cb)
    cb(SocietyState)
end)

RegisterServerEvent('entreprise:setStatus')
AddEventHandler('entreprise:setStatus', function(jobName, state)
    if SocietyState[jobName] then
        SocietyState[jobName].state = state
        TriggerClientEvent('entreprise:updateStatus', -1, jobName, state)
    end
end)







ESX.RegisterServerCallback('GetBills', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local bills = {}

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		for i = 1, #result, 1 do
			table.insert(bills, {
				id = result[i].id,
				label = result[i].label,
				amount = result[i].amount
			})
		end

		cb(bills)
	end)
end)

ESX.RegisterServerCallback('getGangsAccount', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM gangs', {}, function(data)
        for k,v in pairs(data) do
            if not SharedGangs[v.name] then 
                SharedGangs[v.name] = {}
                SharedGangs[v.name].name = v.name 
                SharedGangs[v.name].label = v.label 
                SharedGangs[v.name].coords = json.decode(v.coords )
                SharedGangs[v.name].data = json.decode(v.data)
                SharedGangs[v.name].vehicle = json.decode(v.vehicle)
                TriggerEvent('esx_society:registerSociety', v.name, v.label, 'society_'..v.name, 'society_'..v.name, 'society_'..v.name, {type = 'public'})
            end
        end
		cb(SharedGangs)
        GangsLoaded = true
    end)
end)

RegisterServerEvent('interact:sendLogsGive')
AddEventHandler('interact:sendLogsGive', function(item, quantity, closest)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local tPlayer = ESX.GetPlayerFromId(closest)
	SendLogs("Objet", "Koy | Objet", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a donner "..quantity.." "..item.." à **"..tPlayer.name.."** (***"..tPlayer.identifier.."***)", "https://discord.com/api/webhooks/1258840571967963317/ke3xGw-r9h6eX-r7hI1BYviPTt8je31VUTL9BTLxKjR5qH1bTgICYaaS0BY3B0_IeESM")
end)

RegisterServerEvent('interact:sendLogsGiveWeapon')
AddEventHandler('interact:sendLogsGiveWeapon', function(item, closest)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local tPlayer = ESX.GetPlayerFromId(closest)
	SendLogs("Arme", "Koy | Arme", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a donner "..item.." à **"..tPlayer.name.."** (***"..tPlayer.identifier.."***)", "https://discord.com/api/webhooks/1258840641253675139/rV-MyhOdI-E_cNkc2v3GeDsSneimv6CKQ52A61Da41DNuzV3QQ68DXCKWuHhvu75oiWq")
end)

RegisterServerEvent('interact:sendLogsGiveMoney')
AddEventHandler('interact:sendLogsGiveMoney', function(item, quantity, closest)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local tPlayer = ESX.GetPlayerFromId(closest)
	SendLogs("Argent", "Koy | Argent", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a donner "..quantity.." "..item.." à **"..tPlayer.name.."** (***"..tPlayer.identifier.."***)", "https://discord.com/api/webhooks/1258840744484012062/2AL2H_vGMUi1nwFZsv4NIeYkC910SXzPcCsCyPS-ikkwK9tbjMoQrK9BZKzfR9SVlqJl")
end)

RegisterServerEvent('recrutejoueur')
AddEventHandler('recrutejoueur', function(target, job, grade)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job.grade_name == 'boss' then
		targetXPlayer.setJob(job, grade)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~recruté ' .. targetXPlayer.name .. '.')
		TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~embauché par ' .. sourceXPlayer.name .. '.')
	end
end)

RegisterServerEvent('virerjoueur')
AddEventHandler('virerjoueur', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
		targetXPlayer.setJob('unemployed', 0)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~s~viré ' .. targetXPlayer.name .. '.')
		TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~s~viré par ' .. sourceXPlayer.name .. '.')
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~s~l\'autorisation.')
	end
end)

RegisterServerEvent('promouvoirjoueur2')
AddEventHandler('promouvoirjoueur2', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job2.grade == tonumber(getMaximumGrade(sourceXPlayer.job2.name)) - 1) then
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du ~s~Gouvernement.')
	else
		if sourceXPlayer.job2.grade_name == 'boss' and sourceXPlayer.job2.name == targetXPlayer.job2.name then
			targetXPlayer.setJob2(targetXPlayer.job2.name, tonumber(targetXPlayer.job2.grade) + 1)

			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~promu ' .. targetXPlayer.name .. '.')
			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~promu par ' .. sourceXPlayer.name .. '.')
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~s~l\'autorisation.')
		end
	end
end)

RegisterServerEvent('destituerjoueur2')
AddEventHandler('destituerjoueur2', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job2.grade == 0) then
		TriggerClientEvent('esx:showNotification', _source, 'Vous ne pouvez pas ~s~rétrograder davantage.')
	else
		if sourceXPlayer.job2.grade_name == 'boss' and sourceXPlayer.job2.name == targetXPlayer.job2.name then
			targetXPlayer.setJob2(targetXPlayer.job2.name, tonumber(targetXPlayer.job2.grade) - 1)

			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~s~rétrogradé ' .. targetXPlayer.name .. '.')
			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~s~rétrogradé par ' .. sourceXPlayer.name .. '.')
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~s~l\'autorisation.')
		end
	end
end)

RegisterServerEvent('recrutejoueur2')
AddEventHandler('recrutejoueur2', function(target, job2, grade2)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job2.grade_name == 'boss' then
		targetXPlayer.setJob2(job2, grade2)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~recruté ' .. targetXPlayer.name .. '.')
		TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~embauché par ' .. sourceXPlayer.name .. '.')
	end
end)

RegisterServerEvent('virerjoueur2')
AddEventHandler('virerjoueur2', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job2.grade_name == 'boss' and sourceXPlayer.job2.name == targetXPlayer.job2.name then
		targetXPlayer.setJob2('unemployed2', 0)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~s~viré ' .. targetXPlayer.name .. '.')
		TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~s~viré par ' .. sourceXPlayer.name .. '.')
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~s~l\'autorisation.')
	end
end)

RegisterServerEvent('c26bgdtoklmtbr:{-pp}')
AddEventHandler('c26bgdtoklmtbr:{-pp}', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job.grade == tonumber(getMaximumGrade(sourceXPlayer.job.name)) - 1) then
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du ~s~Gouvernement.')
	else
		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) + 1)

			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~promu ' .. targetXPlayer.name .. '.')
			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~promu par ' .. sourceXPlayer.name .. '.')
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~s~l\'autorisation.')
		end
	end
end)

RegisterServerEvent('f45bgdtj78ql:[tl-yu]')
AddEventHandler('f45bgdtj78ql:[tl-yu]', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job.grade == 0) then
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous ne pouvez pas ~s~rétrograder davantage.')
	else
		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) - 1)

			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~s~rétrogradé ' .. targetXPlayer.name .. '.')
			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~s~rétrogradé par ' .. sourceXPlayer.name .. '.')
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~s~l\'autorisation.')
		end
	end
end)

function getMaximumGrade(jobname)
    local result = MySQL.Sync.fetchAll("SELECT * FROM job_grades WHERE job_name=@jobname  ORDER BY `grade` DESC ;", {
        ['@jobname'] = jobname
    })
    if result[1] ~= nil then
        return result[1].grade
    end
    return nil
end

ESX.RegisterServerCallback('quitJob', function(source, cb, jobType)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        cb(false) -- Si le joueur n'existe pas
        return
    end

    if jobType == 'job' then
        -- Quitter le job principal
        xPlayer.setJob('unemployed', 0) -- Réinitialiser le job principal
        xPlayer.showNotification("Vous avez quitté votre job principal.")
        cb(true)
    elseif jobType == 'job2' then
        -- Quitter le job secondaire
        if xPlayer.setJob2 then
            xPlayer.setJob2('unemployed', 0) -- Réinitialiser le job secondaire
            xPlayer.showNotification("Vous avez quitté votre job secondaire.")
            cb(true)
        else
            print("[ERROR] Fonction setJob2 introuvable pour le joueur : " .. xPlayer.identifier)
            cb(false)
        end
    else
        cb(false) -- Si le type de job est invalide
    end
end)


RegisterNetEvent("sAdmin:StartPurgeSound")
AddEventHandler("sAdmin:StartPurgeSound", function()
    TriggerClientEvent("PlayPurgeSound", -1)
end)