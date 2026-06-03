ESX = nil

ESX = exports["Framework"]:getSharedObject()

RegisterServerEvent('__cfx_internal:commandFallback')
AddEventHandler('__cfx_internal:commandFallback', function(command)
	local _source = source
	local name = GetPlayerName(_source)
	TriggerEvent('chatMessage', _source, name, '/' .. command)

	if not WasEventCanceled() then
		TriggerClientEvent('chatMessage', -1, name, {255, 255, 255}, '/' .. command)
	end

	CancelEvent()
end)
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterCommand("clearall", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
   local playerGroup = xPlayer.getGroup()
        if playerGroup == 'fondateur' then
			TriggerClientEvent("chat:clear", -1)
			TriggerClientEvent('chat:addMessage', -1, {args = {"\n^1🚩 ^1NETTOYAGE - ^2Le chat à été clear !"}
		})
end
end, false)

RegisterServerEvent('_chat:messageEntered')
AddEventHandler('_chat:messageEntered', function(author, color, message)
	local _source = source

	if not message or not author then
		return
	end

	TriggerEvent('chatMessage', _source, author, message)

	if not WasEventCanceled() then
		TriggerClientEvent('chatMessage', -1, author, {255, 255, 255}, message)
	end

	print(author .. '^7: ' .. message .. '^7')
end)

AddEventHandler('onServerResourceStart', function(resName)
	Citizen.Wait(500)
	local players = GetPlayers()

	for i = 1, #players, 1 do
		refreshCommands(players[i])
	end
end)

function refreshCommands(playerId)
	local registeredCommands = GetRegisteredCommands()
	local suggestions = {}

	for i = 1, #registeredCommands do
		if IsPlayerAceAllowed(playerId, ('command.%s'):format(registeredCommands[i].name)) then
			table.insert(suggestions, {
				name = '/' .. registeredCommands[i].name,
				help = ''
			})
		end
	end

	TriggerClientEvent('chat:addSuggestions', playerId, suggestions)
end

RegisterCommand('say', function(source, args, rawCommand)
	if source == 0 then
		TriggerClientEvent('chatMessage', -1, 'CONSOLE', {255, 0, 0}, rawCommand:sub(5))
	end
end, true)

AddEventHandler('chatMessage', function(source, name, message)
    CancelEvent()
    TriggerClientEvent('chat:addMessage', source, { args = { '' } })
end)

local reportCounter = 0
local webhookURL = "TON WEBHOOK HERMANO"

local function getNextReportNumber()
    reportCounter = reportCounter + 1
    return reportCounter
end

local function sendDiscordWebhook(reportNumber, playerName, playerId, reportMessage)
    local data = {
        username = "Report IG",
        embeds = {
            {
                title = "Nouveau Report",
                color = 16711680,
                fields = {
                    { name = "Report Numéro", value = tostring(reportNumber), inline = true },
                    { name = "Joueur", value = playerName .. " (ID: " .. playerId .. ")", inline = true },
                    { name = "Message", value = reportMessage, inline = false }
                },
                footer = {
                    text = "Système de Report"
                },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        }
    }

PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode(data), { ['Content-Type'] = 'application/json' })
end

RegisterCommand('report', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerName = GetPlayerName(source)
    local playerId = source 
    if #args == 0 then
        TriggerClientEvent('esx:showNotification', xPlayer.source, "~r~Erreur:~s~ Vous devez fournir un message pour votre report.")
        return
    end
    local reportMessage = table.concat(args, " ")
    local reportNumber = getNextReportNumber()
    for _, modId in ipairs(GetPlayers()) do
        local xTarget = ESX.GetPlayerFromId(modId)
        local playerGroup = xTarget.getGroup()
        if playerGroup == 'mod' or playerGroup == 'admin' or playerGroup == 'fondateur' then
            TriggerClientEvent('chat:addMessage', modId, {
                template = [[
                    <div class="report">
                        <i class="fas fa-bell"></i>
                        Report N'{0} de {1} (ID: {2}):<br> {3}<br>
                    </div>
                ]],
                args = { reportNumber, playerName, playerId, reportMessage }
            })
        end
    end
    sendDiscordWebhook(reportNumber, playerName, playerId, reportMessage)
end, false)

local webhookURL = ""

PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode(data), { ['Content-Type'] = 'application/json' })
end

local staffGroups = {
    ["founder"] = true,
    ["admin"] = true,
    ["supermoderateur"] = true,
    ["moderateur"] = true,
    
}

RegisterCommand('staffo', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer == nil then
        print('Erreur : Impossible de récupérer le joueur avec l\'ID source.')
        return
    end

    local message = table.concat(args, " ")
    if message == nil or message:gsub("%s+", "") == "" then
        TriggerClientEvent('esx:showNotification', source, "~r~Vous devez entrer un message !")
        return
    end

    local playerGroup = xPlayer.getGroup()
    if staffGroups[playerGroup] then
        for _, playerId in ipairs(ESX.GetPlayers()) do
            local targetPlayer = ESX.GetPlayerFromId(playerId)
            if targetPlayer and staffGroups[targetPlayer.getGroup()] then
                TriggerClientEvent('chat:addMessage', playerId, {
                    color = { 255, 255, 255 },
                    multiline = true,
                    args = {
                        "^7( ^1" .. GetPlayerName(source) .. " | Staff ^7)^7 : " .. message
                    }
                })
            end
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas la permission d'utiliser cette commande.")
    end
end, false)