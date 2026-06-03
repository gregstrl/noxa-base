--
--Created Date: 19:02 13/12/2022
--Author: Koy
--Made with ❤
--
--File: [Logs]
--
--Copyright (c) 2022 KoyWork, All Rights Reserved.
--This file is part of KoyWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
--

ESX.Logs = {
    ---@param message string
    ["Info"] = function (message, ...)
    exports["Koy"]:Info(message, ...);
    end,

    ---@param message string
    ["Warn"] = function (message, ...)
    exports["Koy"]:Warn(message, ...);
    end,

    ---@param message string
    ["Error"] = function (message, ...)
    exports["Koy"]:Error(message, ...);
    end,

    ---@param message string
    ["Success"] = function (message, ...)
    exports["Koy"]:Success(message, ...);
    end
};