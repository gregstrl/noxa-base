ESX = nil
local jail = 0
CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)
local open = false

ConfigJailMenu = {
    {JailLabel = "No Fear", JailTache = 70},
    {JailLabel = "Carkill", JailTache = 100},
    {JailLabel = "Freekill", JailTache = 200},
    {JailLabel = "ForceRP", JailTache = 60},
    {JailLabel = "No Pain", JailTache = 80},
    {JailLabel = "Bunny Hop", JailTache = 40},
    {JailLabel = "Metagaming", JailTache = 110},
    {JailLabel = "Powergaming", JailTache = 130},
    {JailLabel = "RaccourciRP", JailTache = 80},
    {JailLabel = "RevengeKill", JailTache = 150},
    {JailLabel = "WinRP", JailTache = 120},
    {JailLabel = "Conduite HRP", JailTache = 100},
    {JailLabel = "Parle coma ou /me inutile", JailTache = 90},
    {JailLabel = "Déconnexion/reconnexion en coma", JailTache = 150},
    {JailLabel = "MassRP", JailTache = 140},
    {JailLabel = "Freepunch", JailTache = 100},
    {JailLabel = "Refus de Scène", JailTache = 100},
    {JailLabel = "Insulte Joueur", JailTache = 80},
}

RegisterNetEvent("JailMenu:OpenMenu")
AddEventHandler("JailMenu:OpenMenu", function(id)
    OpenJailMenu(id)
end)

RegisterNetEvent("JailMenu:AddJailCounter")
AddEventHandler("JailMenu:AddJailCounter", function()
    if jail == 0 then
        jail = jail + 1
        inTimeJail()
    else
        jail = jail + 1
    end
end)
local JailMenu = RageUI.CreateMenu("", "Jail Menu")

function OpenJailMenu(id)
	if open then
		open = false
		RageUI.Visible(JailMenu,false)
		return
	else
		open = true
		RageUI.Visible(JailMenu,true)
		CreateThread(function()
			while open do

				RageUI.IsVisible(JailMenu,function() 
                    -- RageUI.Separator("ID Temporaire : ~s~"..id.."~s~")

                    RageUI.Separator("ID Unique : ~s~" .. exports['uid']:UIDClient1(id) .. "~s~")

                    RageUI.Line()

                    RageUI.Button("Taches Personalisé", nil, {RightLabel = "→→→"}, true, {
                        onSelected = function()
                            local TacheRaison = exports.input:ShowSync("Entre la raison du jail", false, 150, "small_text")
                            local tacheNumber = exports.input:ShowSync("Entre le nombre de taches", false, 150, "small_text")
                            if TacheRaison ~= nil then
                                if tonumber(tacheNumber) ~= nil then
                                    local uniqueID = exports['uid']:UIDClient1(id)
                                    TriggerServerEvent("JailMenu:JailPlayer", id, tacheNumber, TacheRaison)
                                    ESX.ShowNotification("~g~Vous avez jail l'ID unique "..uniqueID.." pour "..tacheNumber.." taches ~s~")
                                    open = false
                                else
                                    ESX.ShowNotification("~s~Veuillez entrer un nombre de tache valide")
                                end
                            else
                                ESX.ShowNotification("~s~Veuillez entrer une raison valide")
                            end
                        end
                    })

					for k,v in pairs(ConfigJailMenu) do
                        RageUI.Button(v.JailLabel.." | ~s~"..v.JailTache.."~s~ Tache", nil, {RightLabel = "→→→"}, true, {
                            onSelected = function()
                                local uniqueID = exports['uid']:UIDClient1(id)
                                TriggerServerEvent("JailMenu:JailPlayer", id, v.JailTache, v.JailLabel)
                                ESX.ShowNotification("~g~Vous avez jail l'ID unique "..uniqueID.." pour "..v.JailTache.." taches ~s~")
                                open = false
                            end
                        })
                    end
				end)
				Wait(1)
			end
		end)
	end
end

function inTimeJail()
    local timer = 180000
    while timer > 0 do
        if jail >= 10 then
            TriggerServerEvent("JailMenu:AntiMassJail")
        end
        if timer <= 1000 then
            jail = 0
        end
        timer = timer - 1000
        Wait(1000)
    end
end