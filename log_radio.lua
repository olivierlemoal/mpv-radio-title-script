--[[
  Log radio title to file
]]--

local settings = {
    log_playlist = "/home/user/radio.log", -- log songs to file
}

require 'mp.options'
read_options(settings, "logradio")

function log_to_file(name, value)
  file = io.open(settings.log_playlist, "a+")
  io.output(file)
  log_line = string.format("%s - %s\n", os.date('%Y-%m-%d %H:%M:%S'), value)
  io.write(log_line)
  io.close(file)
end

function enable_script()
  mp.observe_property("media-title", "string", log_to_file)
end

-- Wait 5s for mpv to open stream
mp.add_timeout(5, enable_script)
