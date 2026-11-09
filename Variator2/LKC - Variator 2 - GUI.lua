--[[
 ReaScript Name:Variator 2
 Author: LKC
 REAPER: 6+
 Extensions: SWS, ReaImGui
 Version: 2.0.0beta24
 Provides:
  [Main] LKC - Variator 2 - Mutate.lua
  [Main] LKC - Variator 2 - Decontaminate.lua
  [Main] LKC - Variator 2 - Mutate using formula 1.lua
  [Main] LKC - Variator 2 - Mutate using formula 2.lua
  [Main] LKC - Variator 2 - Mutate using formula 3.lua
  [Main] LKC - Variator 2 - Mutate using formula 4.lua
  [Main] LKC - Variator 2 - Mutate using formula 5.lua
  [Main] LKC - Variator 2 - Mutate using formula 6.lua
  [Main] LKC - Variator 2 - Mutate using formula 7.lua
  [Main] LKC - Variator 2 - Mutate using formula 8.lua
  [Main] LKC - Variator 2 - Mutate using formula 9.lua
  [Main] LKC - Variator 2 - Mutate using formula 10.lua
  Data/save_table.dat
  Data/53/x64/variator_mutations.dll
  Data/53/x64/variator_gui_imgui.dll
  Data/53/x64/lkc_classify_core.dll
  Data/53/x64/lkc_variator_classify_sound_v2.dll
  Data/53/x64/lkc_theme_colors.dll
  Data/53/x64/lkc_variator_gate.dll
  Data/53/x64/lkc_variator_keys.dat
  Data/53/x86/variator_mutations.dll
  Data/53/x86/variator_gui_imgui.dll
  Data/53/x86/lkc_classify_core.dll
  Data/53/x86/lkc_variator_classify_sound_v2.dll
  Data/53/x86/lkc_theme_colors.dll
  Data/53/x86/lkc_variator_gate.dll
  Data/53/x86/lkc_variator_keys.dat
  Data/54/x64/variator_mutations.dll
  Data/54/x64/variator_gui_imgui.dll
  Data/54/x64/lkc_classify_core.dll
  Data/54/x64/lkc_variator_classify_sound_v2.dll
  Data/54/x64/lkc_theme_colors.dll
  Data/54/x64/lkc_variator_gate.dll
  Data/54/x64/lkc_variator_keys.dat
  Data/54/x86/variator_mutations.dll
  Data/54/x86/variator_gui_imgui.dll
  Data/54/x86/lkc_classify_core.dll
  Data/54/x86/lkc_variator_classify_sound_v2.dll
  Data/54/x86/lkc_theme_colors.dll
  Data/54/x86/lkc_variator_gate.dll
  Data/54/x86/lkc_variator_keys.dat
 Changelog:
  - Beta extended until the end of 2026
 About:
  # LKC Variator 2

  Item mutation and variation generator for REAPER: randomize volume, pan,
  pitch, position, length, fades, content and source files across a selection,
  or spawn any number of mutated variations from it.

  CLOSED BETA -- requires a beta key, and expires at the end of 2026.
]]
platform = reaper.GetOS()
if platform == "OSX64" or platform == "OSX32" or platform == "OSX" or platform == "Other" or platform == "macOS-arm64" then
    separator = [[/]]
else
    separator = [[\]]
end

local info = debug.getinfo(1,'S');
script_path = info.source:match[[^@?(.*[\/])[^\/]-$]]

local bin = "x64"
if platform == "Win32" or platform == "OSX32" then bin = "x86" end

luac = "53"
if string.sub(reaper.GetAppVersion(),1,1) == "7" then luac = "54" end

function LKC_VariatorModulePath(name)
    local dll = script_path .. "Data" .. separator .. luac .. separator .. bin ..
                separator .. name .. ".dll"
    local f = io.open(dll, "rb")
    if f then f:close() return dll end
    return script_path .. "_source" .. separator .. name .. ".lua"
end

-- ReaImGui is a hard requirement for the GUI (the headless Mutate/Decontaminate
-- /formula actions run fine without it, so this check lives here and not in the
-- shared modules). Two separate failure modes, both of which used to surface as
-- a raw Lua error rather than something a user can act on:
--   1. Not installed at all -- reaper.ImGui_GetBuiltinPath() is nil, so
--      variator_gui_imgui.lua died with "attempt to call a nil value".
--   2. Installed but older than 0.9 -- GetBuiltinPath itself only exists from
--      0.9 on, and `require 'imgui' '0.9'` raises a version error on a build
--      that predates the shim. APIExists alone can't tell these apart, so the
--      version is probed through the same require the GUI module uses.
-- Checked before GATE so a missing extension is reported ahead of beta-key
-- state -- it blocks the GUI regardless of whether the key is valid.
local IMGUI_TITLE = "LKC VARIATOR 2 -- ReaImGui REQUIRED"
if not reaper.APIExists("ImGui_GetBuiltinPath") then
    reaper.ShowMessageBox(
        "Variator 2's GUI needs the ReaImGui extension (v0.9 or newer).\n\n" ..
        "Install it with ReaPack:\n" ..
        "\tExtensions > ReaPack > Browse packages... > search \"ReaImGui\"\n\n" ..
        "Then restart REAPER and run this script again.",
        IMGUI_TITLE, 0)
    return
end

-- Probe the version shim in a protected call: `require 'imgui' '<ver>'` errors
-- out when the installed ReaImGui is older than the requested version, and that
-- error is what would otherwise escape as an unreadable crash.
-- Forward slash deliberately, matching variator_gui_imgui.lua and every other
-- ReaImGui script in this repo: package.path accepts '/' on Windows too, and
-- the GUI module re-assigns this exact string moments later.
package.path = reaper.ImGui_GetBuiltinPath() .. '/?.lua'
local imgui_ok, imgui_err = pcall(function() return require 'imgui' '0.9' end)
if not imgui_ok then
    reaper.ShowMessageBox(
        "Variator 2's GUI needs ReaImGui v0.9 or newer, but loading it failed:\n\n" ..
        "\t" .. tostring(imgui_err) .. "\n\n" ..
        "Update ReaImGui with ReaPack:\n" ..
        "\tExtensions > ReaPack > Synchronize packages\n\n" ..
        "Then restart REAPER and run this script again.",
        IMGUI_TITLE, 0)
    return
end

GATE = loadfile(LKC_VariatorModulePath("lkc_variator_gate"))()
GATE.Init(script_path .. "Data" .. separator .. luac .. separator .. bin .. separator,
          script_path, script_path .. "Data" .. separator .. "save_table.dat",
          separator)
local gate_ok, gate_reason = GATE.Check()
if not gate_ok and gate_reason == "expired" then
    reaper.ShowMessageBox(GATE.EXPIRY_MESSAGE, "LKC VARIATOR 2 -- BETA EXPIRED", 0)
    return
end
GATE_STATE = { ok = gate_ok, reason = gate_reason }

dofile(LKC_VariatorModulePath("variator_gui_imgui"))
