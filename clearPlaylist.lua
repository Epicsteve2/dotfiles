-- EXTENSIONS_IMAGES = Set {
--     'jpg', 'jpeg', 'png', 'tif', 'tiff', 'gif', 'webp', 'svg', 'bmp'
-- }

-- EXTENSIONS_VIDEO = Set {
--     'mkv', 'avi', 'mp4', 'ogv', 'webm', 'rmvb', 'flv', 'wmv', 'mpeg', 'mpg', 'm4v', '3gp'
-- }

-- EXTENSIONS_AUDIO = Set {
--     'mp3', 'wav', 'ogm', 'flac', 'm4a', 'wma', 'ogg', 'opus'
-- }

--local msg = require 'mp.msg'
--local options = require 'mp.options'

local playlist_loc = "/home/stephen/Documents/clearPlaylist.sh"
local utils = require 'mp.utils'
require 'mp'

-- local playlist_visible = false
local playlist_len = mp.get_property_number('playlist-count', 0)

--mp.osd_message(playlist_len)

local function remove(event)
	playlist_len = mp.get_property_number('playlist-count', 0)

	inputFile = utils.getcwd()

	-- local path = mp.get_property("path", "")
	-- local dir, filename = utils.split_path(path)
	--mp.osd_message(dir)
	--mp.osd_message(filename)
		--mp.unregister_event(rm_hashfile(hashfile))
		--if event["reason"] == "eof" or event["reason"] == "stop" then
	--mp.osd_message("end of file")
	if event["reason"] ~= "quit" and playlist_len > 1 then
		--mp.osd_message("rm from playlist")
		--mp.commandv("run","sed", "-i", "1d", inputFile .. "/playlist.txt");
		--mp.osd_message("${HOME}/.config/mpv/scripts/clearPlaylist.sh")
		mp.commandv("run", playlist_loc, inputFile);
	end

	
    -- local file = io.open(inputFile, 'r')
    -- mp.osd_message(utils.getcwd())
    --mp.commandv("run", "/home/stephen/.config/mpv/scripts/test.sh", inputFile);
    -- msg.verbose("stopping: autoload disabled")
end

mp.register_event("end-file", remove)