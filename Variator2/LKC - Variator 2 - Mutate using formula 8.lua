--[[
 Noindex: true
]]
function Msg(param)
    reaper.ShowConsoleMsg(tostring(param).."\n")
end

platform = reaper.GetOS()
if platform == "OSX64" or platform == "OSX32" or platform == "OSX" or platform  == "Other" or platform == "macOS-arm64" then
    separator = [[/]]
else
    separator = [[\]]
end

local info = debug.getinfo(1,'S');
script_path = info.source:match[[^@?(.*[\/])[^\/]-$]]

local bin="x64"
if platform == "Win32" or platform == "OSX32" then bin="x86" end

luac = "53"
if string.sub(reaper.GetAppVersion(),1,1) == "7" then luac = "54" end

function LKC_VariatorModulePath(name)
    local dll = script_path .. "Data" .. separator .. luac .. separator .. bin ..
                separator .. name .. ".dll"
    local f = io.open(dll, "rb")
    if f then f:close() return dll end
    return script_path .. "_source" .. separator .. name .. ".lua"
end

local GATE = loadfile(LKC_VariatorModulePath("lkc_variator_gate"))()
GATE.Init(script_path .. "Data" .. separator .. luac .. separator .. bin .. separator,
          script_path, script_path .. "Data" .. separator .. "save_table.dat",
          separator)
if not GATE.CheckOrExplain() then return end

loadfile(LKC_VariatorModulePath("variator_mutations"))()

function DoMutate()
	reaper.PreventUIRefresh(1)
    reaper.Undo_BeginBlock()

    MUTA.Mutate(MUTA.LoadMutationParams(8))

    reaper.Undo_EndBlock("LKC - Variator 2 - Mutate using formula 8", -1)
    reaper.UpdateArrange()
    reaper.PreventUIRefresh(-1)
end

DoMutate()
