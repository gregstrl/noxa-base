local function RequestAsset(checkLoaded, request, hasLoaded, cb)
	if not checkLoaded() and request then
		request()
		while not hasLoaded() do
			Wait(1)
		end
	end
	if cb then cb() end
end

ESX.Streaming = {
	RequestModel = function(modelHash, cb)
		modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))
		RequestAsset(
			function() return HasModelLoaded(modelHash) end,
			function() 
				if IsModelInCdimage(modelHash) then
					RequestModel(modelHash)
					return true
				end
				return false
			end,
			function() return HasModelLoaded(modelHash) end,
			cb
		)
	end,

	RequestStreamedTextureDict = function(textureDict, cb)
		RequestAsset(
			function() return HasStreamedTextureDictLoaded(textureDict) end,
			function() RequestStreamedTextureDict(textureDict) return true end,
			function() return HasStreamedTextureDictLoaded(textureDict) end,
			cb
		)
	end,

	RequestNamedPtfxAsset = function(assetName, cb)
		RequestAsset(
			function() return HasNamedPtfxAssetLoaded(assetName) end,
			function() RequestNamedPtfxAsset(assetName) return true end,
			function() return HasNamedPtfxAssetLoaded(assetName) end,
			cb
		)
	end,

	RequestAnimSet = function(animSet, cb)
		RequestAsset(
			function() return HasAnimSetLoaded(animSet) end,
			function() RequestAnimSet(animSet) return true end,
			function() return HasAnimSetLoaded(animSet) end,
			cb
		)
	end,

	RequestAnimDict = function(animDict, cb)
		RequestAsset(
			function() return HasAnimDictLoaded(animDict) end,
			function() RequestAnimDict(animDict) return true end,
			function() return HasAnimDictLoaded(animDict) end,
			cb
		)
	end,

	RequestWeaponAsset = function(weaponHash, cb)
		RequestAsset(
			function() return HasWeaponAssetLoaded(weaponHash) end,
			function() RequestWeaponAsset(weaponHash) return true end,
			function() return HasWeaponAssetLoaded(weaponHash) end,
			cb
		)
	end
}