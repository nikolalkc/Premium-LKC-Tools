--[[
 Noindex: true
]]

--OS INFO
platform = reaper.GetOS()
if platform == "OSX64" or platform == "OSX32" or platform == "OSX" or platform  == "Other" or platform == "macOS-arm64" then
    separator = [[/]]
else
    separator = [[\]]	--win
end

local info = debug.getinfo(1,'S');
script_path = info.source:match[[^@?(.*[\/])[^\/]-$]]


reaper.Undo_BeginBlock()

loadfile(script_path.."_reacognition.lua")() --LOAD LIBRARY
reacognition.manual_input()

reaper.Undo_EndBlock( "LKC - ReaCognition - Match with user input",-1)