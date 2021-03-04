local http = require "socket.http"
local uint16 = {}
local uint8 = {}
local normal = {}
local hex16 = {}

-- local function getNumber()
-- 	return normalType()
-- end

local function uint8Type()
	if (#uint8 <= 0) then
		local value = http.request("https://qrng.anu.edu.au/API/jsonI.php?length=1024&type=uint8")
		value = string.match(value, '%[.*%]')
		if (value == nil) then
			for i=1, 1023 do
				table.insert(uint8, math.ceil(math.random()*255))
			end
			return math.ceil(math.random()*255)
		end

		local length = string.len(value)
		local currentIndex = 1
		while(currentIndex < length) do
			local currentValue = string.match(value,'%p[0-9A-F]+', currentIndex)
			currentIndex = currentIndex + #currentValue
			table.insert(uint8, string.sub(currentValue, 2))
		end
	end
	local tempValue  = uint8[1]
	table.remove(uint8, 1)
	return tempValue
end

local function uint16Type()
	if (#uint16 <= 0) then
		local value = http.request("https://qrng.anu.edu.au/API/jsonI.php?length=1024&type=uint16")
		value = string.match(value, '%[.*%]')

		if (value == nil) then
			for i=1, 1023 do
				table.insert(uint16, math.ceil(math.random()*65535))
			end
			return math.ceil(math.random()*65535)
		end

		local length = string.len(value)
		local currentIndex = 1
		while(currentIndex < length) do
			local currentValue = string.match(value,'%p[0-9A-F]+', currentIndex)
			currentIndex = currentIndex + #currentValue
			table.insert(uint16, string.sub(currentValue, 2))
		end
	end
	local tempValue  = uint16[1]
	table.remove(uint16, 1)
	return tempValue
end

local function hex16Type(length)
	if (#hex16 <= 0) then
		local value = http.request("https://qrng.anu.edu.au/API/jsonI.php?length=1024&type=hex16&size="..length)
		value = string.match(value, '%[.*%]')
		if (value == nil) then
			for i=1, 1023 do
				table.insert(hex16, math.ceil(math.random()*length))
			end
			return math.ceil(math.random()*length) -- need to convert to hex
		end

		local length = string.len(value)
		local currentIndex = 1
		while(currentIndex < length) do
			local currentValue = string.match(value,'%p%p[0-9a-f]+%"', currentIndex)
			currentIndex = currentIndex + #currentValue
			table.insert(hex16, string.sub(currentValue, 3,-2))
		end
	end
	local tempValue  = hex16[1]
	table.remove(hex16, 1)
	return tempValue
end

local function normalType()
	if (#normal <= 0) then
		local value = http.request("https://qrng.anu.edu.au/API/jsonI.php?length=1024&type=hex16&size=4")
		value = string.match(value, '%[.*%]')
		if (value == nil) then
			for i=1, 1023 do
				table.insert(normal, math.random())
			end
			return math.random()
		end

		local length = string.len(value)
		local currentIndex = 1
		while(currentIndex < length) do
			local currentValue = string.match(value,'%p%p[0-9a-f]+%"', currentIndex)
			currentIndex = currentIndex + #currentValue
			local float =  tonumber(string.sub(currentValue, 3,-2), 16)/(4^16)
			table.insert(normal, float)
		end
	end
	local tempValue  = normal[1]
	table.remove(normal, 1)
	return tempValue
end

local qRNG = {
	getNumber = function()
		return normalType()
	end, getUint8Number = function()
		return uint8Type()
	end, getUint16Number = function()
		return uint16Type()
	end, getHex16Number = function(length)
		return hex16Type(length or 0)
	end
}

return qRNG 