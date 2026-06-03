--[[
----
----Created Date: 2:52 Monday January 2nd 2023
----Author: Koy
----Made with ❤
----
----File: [main]
----
----Copyright (c) 2023 KoyWork, All Rights Reserved.
----This file is part of KoyWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

Koy = {};

exports("getSharedKoy", function()
    return Koy;
end);

exports("RegisterCommand", function(commandName, callback, suggestion, adminOnly)
    return Shared:RegisterCommand(commandName, callback, suggestion, adminOnly)
end);