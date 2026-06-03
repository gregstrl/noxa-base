ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local pass = false
RegisterServerEvent("Blanchiment")
AddEventHandler("Blanchiment", function(taux,minimal)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local sblackmoney = xPlayer.getAccount("dirtycash").money
    local transfere = sblackmoney - sblackmoney*taux/100
    local gang = xPlayer.job2.name
    local name1 = xPlayer.getFirstName()
    local name2 = xPlayer.getLastName()
    local ppos = GetEntityCoords(GetPlayerPed(src))
    for k,v in pairs (ConfigWashMoney.ConfigBlanchiment) do
        if #(v.pos - ppos) > 10 then
            return
        else
            pass = true
        end
    end
    if pass then
        if xPlayer ~= nil then 
            if sblackmoney >= minimal then 
                xPlayer.removeAccountMoney("dirtycash",sblackmoney)
                xPlayer.addAccountMoney("cash",transfere)
                xPlayer.showNotification("Vous avez blanchis ~s~ "..sblackmoney.."$ ~s~ pour ~g~"..transfere.."$")
                SendLogs("Blanchiment","Blanchiment","Minimal requis : **"..minimal.."$** \nTaux de blanchiment : **"..taux.."%**\n Nom RP du joueur : **".. name1.." "..name2.."**\n Groupe / gang du Joueur : **"..gang.."**\nLicense du joueur : **"..xPlayer.identifier.."**\nArgent Sale avant blanchiment : **"..sblackmoney.."$**\nArgent propre gagne : **"..transfere.."$**","https://discord.com/api/webhooks/1299534409850163265/mfNcJ6OuXAuQ_N5P0gucPyMlynM44MvckIB_4g5AcFKZmhsgoRM6T-hAPO9Da5k_0cOC")
                pass = false
            else
                xPlayer.showNotification("Vous ne pouvez pas blanchir en dessous de ~s~"..minimal.."$")
                pass = false
            end
        end
    else
        xPlayer.ban(0,"(Blanchiment)")
        pass = false
    end
end)

ESX.RegisterServerCallback("GetBlacKMoney",function(source,cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    cb(xPlayer.getAccount('dirtycash').money)
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