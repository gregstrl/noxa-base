Config = {};
Config["Accounts"] = {};
Config["Menu"] = {};
Config["DeathLogs"] = {};
Config["Notification"] = {};
Config["MarkerRGB"] = {};
Config["AdvancedNotification"] = {};
Config["Debug"] = false;
Config["ServerName"] = "Wise";
Config["ServerColor"] = "purple";
Config["ServerImage"] = "https://media.discordapp.net/attachments/1398475603161645087/1421354349879361548/Logo_Kays.png?ex=68d8bae4&is=68d76964&hm=42097629b1b07b60adcdc54a341f2f19b76469144144cadf6054c9bdfdd4b854&=&format=webp&quality=lossless&width=900&height=900"; -- red, green, blue, yellow, purple, pink, orange, grey, black, white
Config["Language"] = "fr";
Config["Accounts"]["money"] = "cash";
Config["Accounts"]["bank"] = "bank";
Config["Accounts"]["dirty_money"] = "dirtycash";
Config["MarkerRGB"]["R"] = 255; 
Config["MarkerRGB"]["G"] = 255;
Config["MarkerRGB"]["B"] = 255;
Config["MarkerRGB"]["A1"] = 255;
Config["MarkerRGB"]["A2"] = 0;
Config["DeathLogs"]["onDeath"] = true;
Config["DeathLogs"]["onRevive"] = true;
Config["Job2Enabled"] = true; 
Config["Notification"]["Enabled"] = true; 
Config["AdvancedNotification"]["Enabled"] = true;

---@param message string
---@param hudColorIndex? number
Config["Notification"]["Custom"] = function(message, hudColorIndex) 
    ESX.ShowNotification(message, hudColorIndex);
end

---@param sender string
---@param subject string
---@param message string
---@param textureDict string
---@param iconType number
---@param flash boolean
---@param saveToBrief boolean
---@param hudColorIndex? number
Config["AdvancedNotification"]["Custom"] = function(sender, subject, message, textureDict, iconType, flash, saveToBrief, hudColorIndex) -- Custom notification function
    ESX.ShowNotification(message, hudColorIndex);
end

Config["Menu"]["CloseOnDeath"] = true;
Config["Menu"]["ShowHeader"] = true;
Config["Menu"]["DisplayGlare"] = false;
Config["Menu"]["DisplaySubtitle"] = true;
Config["Menu"]["DisplayBackground"] = true;
Config["Menu"]["DisplayNavigationBar"] = true;
Config["Menu"]["DisplayInstructionalButton"] = true;
Config["Menu"]["DisplayPageCounter"] = true;
Config["Menu"]["Titles"] = "";
Config["Menu"]["TitleFont"] = 6;
Config["Menu"]["TextureDictionary"] = "commonmenu";
Config["Menu"]["TextureName"] = "interaction_bgd";
Config["Menu"]["Color"] = {
    R = 0,
    G = 0,
    B = 0,
    A = 255
};