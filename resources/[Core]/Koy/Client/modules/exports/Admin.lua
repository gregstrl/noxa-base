---@param permission string
---@return boolean
exports("PlayerHasPermission", function(permission)
    local client_server_id = Client.Player:GetServerId()
    local client_player = Client.PlayersManager:GetFromId(client_server_id)
    return client_player ~= nil and ((Client.Admin ~= nil and Client.Admin:GroupHasPermission(client_player.group, permission) == true) or false)
end)

---@return boolean
exports("IsInStaffMode", function()
    return Client.Player ~= nil and ((Client.Admin ~= nil and Client.Admin:IsInStaffMode()) or false)
end)