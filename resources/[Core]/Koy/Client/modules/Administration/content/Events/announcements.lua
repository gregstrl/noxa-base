RegisterNetEvent('admin:receiveAnnouncement', function(message, staffName)
    PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
    ESX.ShowNotification(('~s~Annonce wise~s~\n%s'):format(message))
end) 