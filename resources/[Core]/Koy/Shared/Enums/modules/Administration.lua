Enums.Administration = {

    Server = {
        RequestOpenMenu = "Koy:gamemode:administration:request:open:menu",
        StaffChangeState = "Koy:gamemode:administration:staff:change:state",
        ReportTake = "Koy:gamemode:administration:staff:report:take",
        ReportRemove = "Koy:gamemode:administration:staff:report:remove",

        Actions = {
            CreateGroup = "Koy:gamemode:administration:staff:actions:create:group",
            DeleteGroup = "Koy:gamemode:administration:staff:actions:delete:group",
            UpdateGroupPermission = "Koy:gamemode:administration:staff:actions:update:group:permission",
            SendMessage = "Koy:gamemode:administration:staff:actions:send:message",

            Player = {
                GetInventory = "Koy:gamemode:administration:staff:get:inventory",
                GiveItem = "Koy:gamemode:administration:staff:give:item",
                RemoveItem = "Koy:gamemode:administration:staff:remove:item",
                GetAccounts = "Koy:gamemode:administration:staff:get:accounts",
                TeleportCoords = "Koy:gamemode:administration:staff:actions:teleport:coords",
                Freeze = "Koy:gamemode:administration:staff:actions:freeze:coords",
            },

            Goto = "Koy:gamemode:administration:staff:actions:goto",
            Bring = "Koy:gamemode:administration:staff:actions:bring",
            BringBack = "Koy:gamemode:administration:staff:actions:bring_back",
            SetPed = "Koy:gamemode:administration:staff:actions:set:ped",
            Entity = "Koy:gamemode:administration:entity:execute"
        }
    },

    Client = {

        Init = "Koy:gamemode:administration:init",
        StaffSetValue = "Koy:gamemode:administration:staff:set:value",
        StaffAdd = "Koy:gamemode:administration:staff:add",
        StaffRemove = "Koy:gamemode:administration:staff:remove",
        PlayerDropped = "Koy:gamemode:administration:player:dropped",
        GroupSetValue = "Koy:gamemode:administration:group:set:value",
        GroupAdd = "Koy:gamemode:administration:group:add",
        GroupDelete = "Koy:gamemode:administration:group:delete",
        ReportSetValue = "Koy:gamemode:administration:report:set:value",
        ReportAdd = "Koy:gamemode:administration:report:add",
        ReportRemove = "Koy:gamemode:administration:report:remove",

        Actions = {
            Entity = "Koy:gamemode:administration:entity:execute",
            ReceiveInventory = "Koy:gamemode:administration:receive:inventory",
            ReceiveAccounts = "Koy:gamemode:administration:receive:accounts"
        }
    }
};