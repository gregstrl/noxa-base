local voiceMode = 2 -- mode (normal)
local mode = 'normal' -- Par Defaut

-- Voice mode handler
AddEventHandler("pma-voice:setTalkingMode", function(newTalkingRange)
    voiceMode = newTalkingRange
    
    if voiceMode == 1 then
        mode = 'chuchoter'
    elseif voiceMode == 2 then
        mode = 'normal'
    elseif voiceMode == 3 then
        mode = 'crier'
    end

    SendNUIMessage({
        type = "voice",
        data = {
            voiceRange = mode,
            isSpeaking = false
        }
    })
end)

CreateThread(function()
    while true do
        local isTalking = NetworkIsPlayerTalking(PlayerId())
        
        SendNUIMessage({
            type = "voice",
            data = {
                voiceRange = mode,
                isSpeaking = isTalking
            }
        })
        
        Wait(0)
    end
end)
-- Rework By G7 Dev : https://discord.gg/yT7MuAuWUk