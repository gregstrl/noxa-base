Garage = {};
function Garage.GetVehicles()
    Garage.vehicles = nil;
    Shared.Events:ToServer(Enums.Garage.Events.RequestVehicles);
end
Shared.Events:OnNet(Enums.Garage.Events.RefreshVehicles, function()
    Shared.Events:ToServer(Enums.Garage.Events.RequestVehicles);
    local menu = Garage.subMenu;
    if (menu:IsShowing()) then
        RageUI.GoBack();
    end
end);

Shared.Events:OnNet(Enums.Garage.Events.ReceiveVehicles, function(vehicles)
    Garage.vehicles = vehicles;
end);

Shared.Events:OnNet(Enums.Garage.Events.RequestAuthorisation, function(vehiclePlate, playerName, price, playerId)
    CreateThread(function()
        if (not Client.Player:IsBusy()) then
            Client.Player:SetBusy(true);
            Game.Notification:ShowAdvanced(
                Config["ServerName"] or "Koy Script",
                Shared.Lang:Translate("garage_menu_prompt_notification_header"), 
                Shared.Lang:Translate("garage_menu_authorisation_prompt", 
                    vehiclePlate, 
                    playerName, 
                    price
                ),
                Config["AdvancedNotification"]["GarageSellVehicle"]["TextureName"],
                Config["AdvancedNotification"]["GarageSellVehicle"]["IconType"],
                Config["AdvancedNotification"]["GarageSellVehicle"]["flash"],
                Config["AdvancedNotification"]["GarageSellVehicle"]["SaveToBrief"],
                Config["AdvancedNotification"]["GarageSellVehicle"]["HudColorIndex"]
            );

            local timer = Shared.Timer(15);
            timer:Start();
            while not timer:HasPassed() do
                if IsControlJustReleased(2, 246) then
                    Client.Player:SetBusy(false);
                    Shared.Events:ToServer(Enums.Garage.Events.RequestAccepted, playerId, price, vehiclePlate);
                    break;
                end
                if (timer:HasPassed()) then
                    Client.Player:SetBusy(false);
                    Shared.Events:ToServer(Enums.Garage.Events.RequestCanceled, playerId);
                    Game.Notification:ShowSimple(Shared.Lang:Translate("garage_prompt_canceled"));
                end
                Wait(0);
            end
        else
            Shared.Events:ToServer(Enums.Garage.Events.RequestCanceled, playerId);
        end
    end);
end);