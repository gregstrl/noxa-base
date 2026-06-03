---@param xPlayer xPlayer
exports("PlayerIsStaff", function(xPlayer)
    return JG.AdminManager:PlayerIsStaff(xPlayer)
end)

---@param xPlayer xPlayer
exports("GetPlayerGroup", function(xPlayer)
    return JG.AdminManager:GetPlayerGroup(xPlayer)
end)

---@param name string
exports("GetGroup", function(name)
    return JG.AdminManager:GetGroup(name)
end)

---@param xPlayer xPlayer
---@param groupName string
exports("AddPlayerToGroup", function(xPlayer, groupName)
    return JG.AdminManager:AddPlayerToGroup(xPlayer, groupName)
end)

---@param group string
---@param groupToCheck string
---@param equal boolean
exports("GroupIsHigher", function(group, groupToCheck, equal)
    return JG.AdminManager:GroupIsHigher(group, groupToCheck, equal)
end)

---@param group string
---@param permission string
---@return boolean | nil
exports("GroupHasPermission", function(group, permission)
    return JG.AdminManager:GroupHasPermission(group, permission)
end)