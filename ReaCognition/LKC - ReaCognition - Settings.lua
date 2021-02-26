--[[
 Noindex: true
]]

--OS INFO
platform = reaper.GetOS()
if platform == "OSX64" or platform == "OSX32" or platform == "OSX" or platform  == "Other" then
	separator = [[/]]
else
	separator = [[\]]	--win
end

local bin="x64"
if platform == "Win32" or platform == "OSX32" then bin="x86" end

local info = debug.getinfo(1,'S');
script_path = info.source:match[[^@?(.*[\/])[^\/]-$]]

loadfile(script_path .. "Lokasenna_GUI" .. separator .. "Core.dat")()
loadfile(script_path .. "Lokasenna_GUI" .. separator .. "Class - Options.dat")()
loadfile(script_path .. "Lokasenna_GUI" .. separator .. "Class - Button.dat")()




GUI.name = "ReaCognition Settings"
GUI.x, GUI.y, GUI.w, GUI.h = 0, 0, 300, 150
GUI.anchor, GUI.corner = "screen", "C"


function apply_settings()
	MODE_VALUE = GUI.Val("ReaCognitionMode")
	--1 = items
	--2 = regions
	-- reaper.ShowConsoleMsg(MODE_VALUE.."\n")
	reaper.SetExtState("LKC_REACOGNITION","mode",MODE_VALUE,true)
	GUI.quit = true
end


GUI.New("ReaCognitionMode", "Radio", {
    z = 11,
    x = 80.0,
    y = 32.0,
    w = 150,
    h = 70,
    caption = "Default Mode",
    optarray = {"Items", "Regions"},
    dir = "v",
    font_a = 2,
    font_b = 3,
    col_txt = "txt",
    col_fill = "elm_fill",
    bg = "wnd_bg",
    frame = true,
    shadow = true,
    swap = nil,
    opt_size = 20
})

GUI.New("Apply", "Button", {
    z = 11,
    x = 112.0,
    y = 112.0,
    w = 80,
    h = 24,
    caption = "Apply",
    font = 3,
    col_txt = "txt",
    col_fill = "elm_frame",
	func = apply_settings
})


--separator INIT handling
rea_mode = reaper.HasExtState( "LKC_REACOGNITION","mode")
if rea_mode == false then
	rea_mode = 1 --default value
else
	rea_mode = reaper.GetExtState("LKC_REACOGNITION","mode")
end
-- reaper.ShowConsoleMsg(rea_mode)
GUI.Val("ReaCognitionMode", tonumber(rea_mode))

GUI.Init()
GUI.Main()
