--[[
----
----Created Date: 4:42 Sunday October 16th 2022
----Author: Koy
----Made with ❤
----
----File: [Events]
----
----Copyright (c) 2022 KoyWork, All Rights Reserved.
----This file is part of KoyWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

Pound = {};

function Pound.GetVehicles()
    Pound.vehicles = nil;
    Shared.Events:ToServer(Enums.Pound.Events.RequestVehicles);
end

Shared.Events:OnNet(Enums.Pound.Events.RefreshVehicles, function()
    Pound.GetVehicles();

    if (Pound.subMenu:IsShowing()) then

        RageUI.GoBack();

    end
    
end);

Shared.Events:OnNet(Enums.Pound.Events.ReceiveVehicles, function(vehicles)
    Pound.vehicles = vehicles;
end);