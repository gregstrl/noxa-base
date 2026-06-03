_BLIPS = {}
_BLIPS.SIMPLE = {}
_BLIPS.ZONE = {}

function _BLIPS.SIMPLE.CREATE(data, cb)
    local blip = AddBlipForCoord(data.position.x, data.position.y, data.position.z)
    SetBlipSprite(blip, data.sprite)
    SetBlipColour(blip, data.colour)
    SetBlipScale(blip, data.scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(data.name)
    EndTextCommandSetBlipName(blip)

    _BLIPS.SIMPLE[blip] = blip

    if cb then
        cb()
    end

    return _BLIPS.SIMPLE[blip]
end

function _BLIPS.SIMPLE.REMOVE(blip)
    if _BLIPS.SIMPLE[blip] then
        _BLIPS.SIMPLE[blip] = nil
    end
end

function _BLIPS.ZONE.CREATE(data)
    local blip = AddBlipForRadius(data.position, data.scale)
    SetBlipSprite(blip,1)
    SetBlipColour(blip, data.colour)
    SetBlipAlpha(blip,100)

    _BLIPS.ZONE[blip] = blip

    return _BLIPS.ZONE[blip]
end

function _BLIPS.ZONE.REMOVE(blip)
    if _BLIPS.ZONE[blip] then
        _BLIPS.ZONE[blip] = nil
    end
end

-- CreateThread(function()
--     _BLIPS.ZONE.CREATE({
--         position = vector3(229.288712, -806.998352, 30.507296),
--         scale = 3000.0,
--         colour = 1
--     })
-- end)

-- CreateThread(function()
--     while not ESXLoaded do Wait(1) end

--     BlipsList = {
--         List = {
--             ['exemple'] = {

--             }
--         },

--         addBlip = function(blipName, data)
--             if not blipName then return end
--             if type(data) ~= "table" then return end

--             if BlipsList.List[blipName] then return end

--             BlipsList.List[blipName] = data
--         end,

--         LoadBlips = function(list)
--             for k,v in pairs(list) do

--             end
--         end
--     }

--     BlipsList.LoadBlips(BlipsList.List)
-- end)

