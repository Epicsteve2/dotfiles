#!/usr/bin/env lua
require 'mp'
local utils = require 'mp.utils'

local function remove(event)
	local playlist_len = mp.get_property_number('playlist-count', 0)
	if event["reason"] ~= "quit" and playlist_len > 1 then
		local fileLocation = utils.getcwd() .. "/playlist.txt"

		-- local debugFile = io.open("/home/stephen/lua-testing.txt", "w")
		-- debugFile:write(fileLocation)
		-- debugFile:write("test")
		-- debugFile:close()

		local inputFile = assert(io.open(fileLocation, "r+"), fileLocation .. " doesn't exist") 
		inputFile:read("*line")
		local lines = ""

		while(true) do
			local line = inputFile:read("*line")
			if not line then
				break
			end
			lines = lines .. line .. "\n"
		end
		inputFile:close()

		local outputFile = io.open(fileLocation, "w")
		outputFile:write(lines)
		outputFile:close()
	end
end

mp.register_event("end-file", remove)
