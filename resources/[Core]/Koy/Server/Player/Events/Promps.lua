Shared.Events:OnNet(Enums.Prompt.RequestCanceled, function(_, targetId)

    local xPlayer = Server:ConvertToPlayer(targetId);

    if (xPlayer) then

        xPlayer.showNotification(Shared.Lang:Translate("prompt_canceled"));

    end

end);