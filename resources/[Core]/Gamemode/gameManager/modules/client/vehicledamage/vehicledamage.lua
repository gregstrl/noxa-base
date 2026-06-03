ESX = nil
local colorb = "~g~"
local colore = "~g~"
local coloreg = "~g~"
local fuelc = "~g~"
local rad = 0
local rag = 0
local rard = 0 
local rarg = 0
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

CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local veh = GetVehiclePedIsIn(playerPed, false)
            SetVehicleDamageModifier(veh,0.01)
            local engin = GetVehicleEngineHealth(veh)
            local body = GetVehicleBodyHealth(veh)
            local clasee = GetVehicleClass(veh)
            local egene = engin + body
            local Statut = math.round(egene/2 / 10)
            SetDisableVehicleEngineFires(true)
            if engin > 1 and engin < 500 then
                ESX.ShowNotification("~y~Le moteur du véhicule est hors-service")
                local soundId3 = GetSoundId()
                PlaySoundFrontend(soundId3,"Engine_fail", "DLC_PILOT_ENGINE_FAILURE_SOUNDS", true)
                SetVehicleEngineHealth(veh,47000.0554)
                Wait(5000)
                SetVehicleEngineHealth(veh,47000.0554)
            end 
            if clasee == 15 or clasee == 16 then
                if IsVehicleTyreBurst(veh, 4) then
                    SetEntityMaxSpeed(veh,29250.034)
                end
            elseif clasee == 8 then
               
                if IsVehicleTyreBurst(veh, 0) and IsVehicleTyreBurst(veh, 4) then
                    SetEntityMaxSpeed(veh,0)
                    ESX.ShowNotification("~y~Vos 2 roues sont crevées vous ne pouvez plus avancer",nil,nil,nil,"wise | Tableau de bord",nil,nil,5.0)
                elseif  IsVehicleTyreBurst(veh, 0)  or IsVehicleTyreBurst(veh, 4)   then
                    SetEntityMaxSpeed(veh,29250.034)
                end

            else
                if IsVehicleTyreBurst(veh, 0) then
                    rag = 251
                else
                    rag = 0
                end
                if IsVehicleTyreBurst(veh, 1) then
                    rad = 251 
                else
                    rad = 0
                end
                if IsVehicleTyreBurst(veh, 4) then
                    rarg = 251
                else
                    rarg = 0
                end
                if IsVehicleTyreBurst(veh, 5) then
                    rard = 251
                else
                    rard = 0
                end
                if  rag + rad + rard + rarg >= 550 then
                    SetVehicleEngineOn(veh,false,false,false)
                end
            end
        end
        Wait(300)
    end
end)

RegisterCommand("carinfo", function()
    dcartable()
end)

local dmcartable = RageUI.CreateMenu("", "Tableau de bord", 0, 0, 'k2r', 'interaction_bgd')
dmcartable.Closed = function()
    open = false
end
function dcartable()
	if open then
		open = false
		RageUI.Visible(dmcartable,false)
		return 
	else
		open = true
		RageUI.Visible(dmcartable,true)
		CreateThread(function()
			while open do 
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                local clasee = GetVehicleClass(veh)
                local engin = GetVehicleEngineHealth(veh)
                local body = GetVehicleBodyHealth(veh)
                local egene = engin + body
                local showengin = math.floor(engin/10)
                local showbody = math.floor(body/10)
                local Statut = math.round(egene/2 / 10)
                local fuel = math.round(GetVehicleFuelLevel(veh))
                local km = math.ceil(GetEntitySpeed(veh) * 100.0)
                if veh ~= 0 then 
                    if engin <= 1000 and engin > 1000 then 
                        colore = "~y~"
                    elseif engin <= 1000 then
                        colore = "~s~"
                    else
                        colore = "~g~"
                    end
                    
                    if body <= 1000 and  body > 1000 then 
                        colorb = "~y~"
                    elseif body <= 1000 then
                        colorb = "~s~"
                    else
                        colorb = "~g~"
                    end

                    if Statut < 100 and egene > 70 then
                        coloreg = "~y~"
                    elseif Statut <= 70 then
                        coloreg = "~s~"
                    end
                    if fuel <= 30 then
                        fuelc = "~y~"
                    elseif fuel <= 15 then 
                        fuelc ="~s~"
                    end
                    RageUI.IsVisible(dmcartable,function() 
                        RageUI.Separator("Vitesse actuel du véhicule : "..km.."KM/H")
                        RageUI.Separator("Etat du réservoir d'essence : "..fuelc..fuel.."L")
                        RageUI.Separator("Etat du moteur : "..colore..showengin.."%")
                        RageUI.Separator("Etat de la carrosserie : "..colorb..showbody.."%")
                        RageUI.Separator("État général du véhicule : "..colorb..Statut.."%") 
                        if clasee == 15 or clasee == 16 then
                            if IsVehicleTyreBurst(veh, 4) then
                                RageUI.Separator("~y~Roue Principale : Non Fonctionnel")
                            else
                                RageUI.Separator("~y~Roue Principale : Fonctionnel")
                            end
                        elseif clasee == 8 then
                            if IsVehicleTyreBurst(veh, 0) then
                                RageUI.Separator("~y~Roue avant : Non Fonctionnel")
                            else
                                RageUI.Separator("~y~Roue avant : Fonctionnel")
                            end
                            if IsVehicleTyreBurst(veh, 4) then
                                RageUI.Separator("~y~Roue arrière : Non Fonctionnel")
                            else
                                RageUI.Separator("~y~Roue arrière : Fonctionnel")
                            end
                        else
                            if IsVehicleTyreBurst(veh, 0) then
                                RageUI.Separator("~y~Roue avant gauche : Non Fonctionnel")
                            else
                                RageUI.Separator("~y~Roue avant gauche : Fonctionnel")
                            end
                            if IsVehicleTyreBurst(veh, 1) then
                                RageUI.Separator("~y~Roue avant droite : Non Fonctionnel")
                            else
                                RageUI.Separator("~y~Roue avant droite : Fonctionnel")
                            end
                            if IsVehicleTyreBurst(veh, 4) then
                                RageUI.Separator("~y~Roue arrière gauche : Non Fonctionnel")
                            else
                                RageUI.Separator("~y~Roue arrière gauche : Fonctionnel")
                            end
                            if IsVehicleTyreBurst(veh, 5) then
                                RageUI.Separator("~y~Roue arrière droite : Non Fonctionnel")
                            else
                                RageUI.Separator("~y~Roue arrière droite : Fonctionnel")
                            end
                        end

                    end)
                else
                    ESX.ShowNotification("~y~Vous êtes dans aucun véhicule")
                    return
                end
				Wait(1)
			end
		end)
	end
end