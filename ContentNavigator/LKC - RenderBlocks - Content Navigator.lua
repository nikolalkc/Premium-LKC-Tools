--[[
 ReaScript Name:Render Blocks - Content Navigator
 Author: LKC
 REAPER: 6
 Extensions: SWS
 Version: 0.6
 Provides:
  Data/Lokasenna_GUI/Class - Button.dat
  Data/Lokasenna_GUI/Class - Listbox2.dat
  Data/Lokasenna_GUI/Class - Options.dat
  Data/Lokasenna_GUI/Class - Tabs.dat
  Data/Lokasenna_GUI/Core.dat
  Data/x64/lkc_renderblocks_content_navigator.dll
  Data/x64/lkc_renderblocks_controller.dll
  Data/x64/lkc_renderblocks_render.dat
  Data/x86/lkc_renderblocks_content_navigator.dll
  Data/x86/lkc_renderblocks_controller.dll
  Data/x86/lkc_renderblocks_render.dat
  Data/save_table.dat
 About:
  # LKC CONTENT NAVIGATOR
  
  ## Part of LKC Render Blocks package

--[[
 * Changelog:
* v0.6 (2020-07-09)
	+ Small changes and fixes
* v0.5 (2020-06-27)
	+ Added support for vertical zoom
* v0.4 (2020-06-25)
	+ Selection options
    + Renamed some option labels for more clarity
* v0.3 (2020-06-21)
	+ (Un)Docking buton
* v0.2 (2020-05-24)
	+ A lot of improvements
* v0.1 (2020-05-24)
	+ Package created
]]


local sws = reaper.APIExists("CF_GetClipboardBig")
if sws then
    --OS INFO
    platform = reaper.GetOS()
    if platform == "OSX64" or platform == "OSX32" or platform == "OSX" or platform  == "Other" or platform == "macOS-arm64" then
        separator = [[/]]
    else
        separator = [[\]]	--win
    end

    bin="x64"
    if platform == "Win32" or platform == "OSX32" then bin="x86" end

    local info = debug.getinfo(1,'S');
    script_path = info.source:match[[^@?(.*[\/])[^\/]-$]]
    dofile(script_path..[[Data]]..separator..bin..separator..[[lkc_renderblocks_content_navigator.dll]])
else
    reaper.ShowMessageBox("Please install SWS Extension version 2.9.7 or higher from:\nhttps://sws-extension.org/", "NO SWS FOUND", 0)
end

