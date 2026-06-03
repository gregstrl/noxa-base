---
--- @author
--- Create at
--- Current project
--- File name [reportSounds]
---

local AdminStorage = Shared.Storage:Get("Administration");

---@type UIMenu
local report_sounds_menu = AdminStorage:Get("admin_report_sounds");

local availableSounds = {
    { name = "Alerte policière", sound = "TIMER_STOP", soundBank = "HUD_MINI_GAME_SOUNDSET" },
    { name = "Notification mission", sound = "Mission_Pass_Notify", soundBank = "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS" },
    { name = "Hack réussi", sound = "Hack_Success", soundBank = "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS" },
    { name = "Notification importante", sound = "FocusIn", soundBank = "HintCamSounds" },
    { name = "Alarme", sound = "Arming_Countdown_Sound", soundBank = "GTAO_Speed_CONVOY_SOUNDSET" },
    { name = "Bip d'alerte", sound = "Beep_Red", soundBank = "DLC_HEIST_HACKING_SNAKE_SOUNDS" },
    { name = "Succès", sound = "Out_Of_Bounds_Timer", soundBank = "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS" },
    { name = "Alarme braquage", sound = "Oneshot_Final", soundBank = "MP_MISSION_COUNTDOWN_SOUNDSET" },
    { name = "Objectif terminé", sound = "BASE_JUMP_PASSED", soundBank = "HUD_AWARDS" },
    { name = "Décollage", sound = "FLIGHT_SCHOOL_LESSON_PASSED", soundBank = "HUD_AWARDS" },
    { name = "Buzz électrique", sound = "Power_Down", soundBank = "DLC_HEIST_HACKING_SNAKE_SOUNDS" },
    { name = "Klaxon", sound = "Horn", soundBank = "DLC_HEIST_HACKING_SNAKE_SOUNDS" },
    { name = "Caisse", sound = "PURCHASE", soundBank = "HUD_LIQUOR_STORE_SOUNDSET" },
    { name = "Médaille", sound = "MEDAL_UP", soundBank = "HUD_MINI_GAME_SOUNDSET" },
    { name = "Checkpoint", sound = "CHECKPOINT_PERFECT", soundBank = "HUD_MINI_GAME_SOUNDSET" },
    { name = "Alerte jaune", sound = "3_2_1", soundBank = "HUD_MINI_GAME_SOUNDSET" },
    { name = "Alerte rouge", sound = "CHECKPOINT_MISSED", soundBank = "HUD_MINI_GAME_SOUNDSET" }
}

report_sounds_menu:IsVisible(function(Items)
    
    Items:Separator("Sons de notification")
    
    local currentSound, currentSoundBank = Client.Admin:GetReportSound()
    
    for _, soundData in ipairs(availableSounds) do
        local isSelected = (currentSound == soundData.sound and currentSoundBank == soundData.soundBank)
        
        Items:Checkbox(soundData.name, nil, isSelected, {}, {
            onSelected = function(Checked)
                if Checked then
                    Client.Admin:SetReportSound(soundData.sound, soundData.soundBank)
                    
                    PlaySoundFrontend(-1, soundData.sound, soundData.soundBank, 1)
                end
            end
        });
    end
    
end) 