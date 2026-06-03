--[[
----
----Created Date: 3:36 Sunday October 23rd 2022
----Author: Koy
----Made with ❤
----
----File: [debug]
----
----Copyright (c) 2022 KoyWork, All Rights Reserved.
----This file is part of KoyWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

local FowlmasLaPute;

TriggerEvent("esx:getSharedObject", function(obj) FowlmasLaPute = obj end);

local DEVMODE = FowlmasLaPute.GetConfig().DEVMODE; ---#Koy WRAPPER (EPROTECT)

if (DEVMODE) then
    local JRegisterNetEvent = RegisterNetEvent
    local JTriggerServerEvent = TriggerServerEvent

    ---@param eventName string
    ---@param cb fun(source: number, ...: any): void
    function _RegisterNetEvent(eventName, cb)
        return JRegisterNetEvent(eventName, function(...)
            local src = source;
            if (IsDuplicityVersion()) then
                cb(src, ...);
            else
                cb(...);
            end
        end);
    end

    ---@param eventName string
    function _TriggerServerEvent(eventName, cb)
        JTriggerServerEvent(eventName, cb);
    end
end