local function getSharedObject()
	return ESX
end

AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

exports('getSharedObject', getSharedObject)