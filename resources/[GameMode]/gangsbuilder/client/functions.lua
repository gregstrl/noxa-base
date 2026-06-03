GangsList = {}

function GetCurrentPosition()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    return coords
end

function SavePosition(type, gangname)
    local position = GetCurrentPosition()
    
    ESX.TriggerServerCallback('gangsbuilder:savePosition', function(success)
        if success then
            ESX.ShowNotification(Config.Messages.PositionSaved)
            
            if gangname == PlayerData.job2.name then
                ESX.TriggerServerCallback('gangsbuilder:getGangByJob', function(gang)
                    if gang and gang.positions then
                        gangPositions = gang.positions
                        cachedGang = gang
                        RemoveGangBlips()
                        CreateGangBlips(gang)
                    end
                end, gangname)
            end
            
            for i = 1, #GangsList do
                if GangsList[i].name == gangname then
                    ESX.TriggerServerCallback('gangsbuilder:getGangs', function(gangs)
                        GangsList = gangs
                        for j = 1, #GangsList do
                            if GangsList[j].name == gangname then
                                SelectedGang = GangsList[j]
                                break
                            end
                        end
                    end)
                    break
                end
            end
        end
    end, type, gangname, position)
end

function SetJob2(job2name, grade)
    TriggerServerEvent('gangsbuilder:setJob2', job2name, grade)
end

function SendNotification(message)
    ESX.ShowNotification(message)
end

function FormatLabel(text)
    if text == nil then return "Indéfini" end
    return text
end

function KeyboardInput(title, defaultText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', title)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", defaultText or "", "", "", "", maxLength or 20)
    
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

function NumberInput(title, defaultNumber, maxLength)
    local result = KeyboardInput(title, defaultNumber and tostring(defaultNumber) or "", maxLength or 10)
    if result then
        return tonumber(result)
    end
    return nil
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end 