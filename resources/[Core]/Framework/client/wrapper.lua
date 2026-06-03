local Chunks = {}

RegisterNUICallback('__chunk', function(data, cb)
	if not data.id then return cb('') end
	
	Chunks[data.id] = Chunks[data.id] or ''
	Chunks[data.id] = Chunks[data.id] .. data.chunk

	if data['end'] then
		local success, msg = pcall(json.decode, Chunks[data.id])
		if success then
			TriggerEvent(GetCurrentResourceName() .. ':message:' .. data.__type, msg)
		end
		Chunks[data.id] = nil
	end

	cb('')
end)