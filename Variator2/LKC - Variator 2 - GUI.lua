--[[
 ReaScript Name:Variator 2
 Author: LKC
 REAPER: 6+
 Extensions: SWS, ReaImGui
 Version: 2.0.0beta1
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
  + First closed beta version of Variator 2
 About:
  # LKC Variator 2

  Item mutation and variation generator for REAPER: randomize volume, pan,
  pitch, position, length, fades, content and source files across a selection,
  or spawn any number of mutated variations from it.

  CLOSED BETA -- requires a beta key, and expires November 2026.
]]

--OS INFO
platform = reaper.GetOS()
if platform == "OSX64" or platform == "OSX32" or platform == "OSX" or platform == "Other" or platform == "macOS-arm64" then
    separator = [[/]]
else
    separator = [[\]]     --win
end

local info = debug.getinfo(1,'S');
script_path = info.source:match[[^@?(.*[\/])[^\/]-$]]

local bin = "x64"
if platform == "Win32" or platform == "OSX32" then bin = "x86" end

luac = "53"
if string.sub(reaper.GetAppVersion(),1,1) == "7" then luac = "54" end

-- Release builds ship Lua bytecode under Data/<luac>/<bin>/; a dev tree has
-- plain source under _source/. Prefer the binary, fall back to source, so an
-- unbuilt working tree behaves exactly like a release one.
function LKC_VariatorModulePath(name)
    local dll = script_path .. "Data" .. separator .. luac .. separator .. bin ..
                separator .. name .. ".dll"
    local f = io.open(dll, "rb")
    if f then f:close() return dll end
    return script_path .. "_source" .. separator .. name .. ".lua"
end

-- Closed-beta gate. An EXPIRED build stops here -- there is nothing the user can
-- do about it, so we do not open a window. A missing/invalid key does NOT stop
-- here: the GUI opens in a locked state offering key entry (see GATE_STATE in
-- variator_gui_imgui.lua), which is the only place a key can be entered.
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
