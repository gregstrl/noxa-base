ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.ESX, function(obj) ESX = obj end)
        Wait(500)
    end
end)

openUi = function()
    local mainMenu = RageUI.CreateMenu("", "Rockstar Editor")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Rockstar Editor | Start Record", nil, {}, true, {
                onSelected = function()
                    if IsRecording() then
                        ESX.ShowNotification("Vous enregistrez déjà")
                    else
                        StartRecording(1)
                    end
                end
            })
            RageUI.Button("Rockstar Editor | Stop Record", nil, {}, true, {
                onSelected = function()
                    if not IsRecording() then
                        ESX.ShowNotification("Vous devez d'abord démarrer le record")
                    else
                        StopRecordingAndSaveClip()
                    end
                end
            })
        end)
        Wait(0)
    end
end

Keys.Register('F4','Editor', 'Rockstar Editor', function()
    
    openUi()
end)