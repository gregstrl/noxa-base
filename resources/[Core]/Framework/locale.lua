local find = string.find;
local gsub = string.gsub;

Locales = {}

function _(str, ...)  -- Translate string

	if Locales['fr'] ~= nil then

		if Locales['fr'][str] ~= nil then
			return string.format(Locales['fr'][str], ...)
		else
			return '[' .. str .. ']'
		end

	else
		return 'not exist'
	end

end

function _U(str, ...) -- Translate string first char uppercase

	if (find(str, "~g~")) then str = gsub(str, "~g~", "~g~"); end

	return tostring(_(str, ...):gsub("^%l", string.upper))
end