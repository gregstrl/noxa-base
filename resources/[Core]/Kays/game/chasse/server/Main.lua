ESX = nil
TriggerEvent("esx:getSharedObject", function(KoyESX) ESX = KoyESX end)

local playerChasse = {}

ESX.RegisterServerCallback("Chasse:check", function(source, cb, lastPos)
    if #(GetEntityCoords(GetPlayerPed(source))-lastPos) > 1.5 then  
        xPlayer.ban(0, '(Chasse:check)');
        return
    end
    if playerChasse[source] then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent("Chasse:start", function(lastPos, chasse)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if #(GetEntityCoords(GetPlayerPed(source))-lastPos) > 15 then
            xPlayer.ban(0, '(Chasse:start)');
            return
        end
        playerChasse[source] = true
        itemName = string.upper("WEAPON_MUSKET")

        if xPlayer.hasWeapon(itemName) then
            TriggerClientEvent("esx:showNotification",source,"Vous ne pouvez pas prendre deux fois la même ~b~arme~s~.")
        else
            xPlayer.addWeapon("WEAPON_MUSKET", 255)
        end
        SendLogs(1752220,"Chasse - Start","**"..GetPlayerName(source).."** vient de commencer à chasser \n **License** : "..xPlayer.identifier,"https://discord.com/api/webhooks/1260734784028545185/GmSt6419mdv4w940_R7qMAfaHg9ojOMyPiGG2b1bwziwPv6lT66kvbtfE1L7jwfhB-Hu")
        TriggerClientEvent("Chasse:returnStart", source, chasse)
    end
end)

RegisterServerEvent("Chasse:stop")
AddEventHandler("Chasse:stop", function(message, lastPos, chasse)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if playerChasse[source] then
            xPlayer.removeWeapon("WEAPON_MUSKET", 0)
            playerChasse[source] = false
            TriggerClientEvent("Chasse:returnStop", source, chasse, message)
            SendLogs(1752220,"Chasse - Stop","**"..GetPlayerName(source).."** vient d'arrêter la chasse \n **License** : "..xPlayer.identifier,"https://discord.com/api/webhooks/1260734784028545185/GmSt6419mdv4w940_R7qMAfaHg9ojOMyPiGG2b1bwziwPv6lT66kvbtfE1L7jwfhB-Hu")
        end
    end
end)


RegisterNetEvent("Chasse:addItem", function(itemName, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    for i = 1, #Chasse.Position[1].animal.model do

        if (Chasse.Position[1].animal.model[i].item == itemName) then
            if xPlayer then
                if playerChasse[source] then
                    if xPlayer.canCarryItem(itemName, tonumber(count)) then
                        TriggerClientEvent("esx:showNotification", source, "Bien, Vous avez ramassé ~g~x"..count.." viande~s~ !")
                        SendLogs(1752220,"Chasse - Ajout","**"..GetPlayerName(source).."** vient de gagner "..count.."x "..ESX.GetItemLabel(itemName).." \n **License** : "..xPlayer.identifier,"https://discord.com/api/webhooks/1260734784028545185/GmSt6419mdv4w940_R7qMAfaHg9ojOMyPiGG2b1bwziwPv6lT66kvbtfE1L7jwfhB-Hu")
                        xPlayer.addInventoryItem(itemName, tonumber(count))
                    else
                        TriggerClientEvent("esx:showNotification", source, "[~r~Impossible~h~] Vous n'avez pas assez de place sur vous pour récupérer la viande")
                    end
                else
                    xPlayer.ban(0, '(Chasse:addItem)');
                    return
                end
            end
            break;
        end

    end

end)

function SendLogs(name, title, message, web)
    local local_date = os.date('%H:%M:%S', os.time())
  
	local embeds = {
		{
			["title"]= title,
			["description"]= message,
			["type"]= "rich",
			["color"] = 652101,
			["footer"]=  {
				["text"]= "Powered by wise ©   |  "..local_date.."",
				["icon_url"] = "https://i.imgur.com/.png"
			},
		}
	}
  
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(web, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end