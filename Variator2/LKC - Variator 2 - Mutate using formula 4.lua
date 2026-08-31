--[[
 Noindex: true
]]

function Msg(param)
    reaper.ShowConsoleMsg(tostring(param).."\n")
end


--OS INFO
platform = reaper.GetOS()
if platform == "OSX64" or platform == "OSX32" or platform == "OSX" or platform  == "Other" or platform == "macOS-arm64" then
    separator = [[/]]
else
    separator = [[\]]     --win
end

-- SAVE UTILITIES
local info = debug.getinfo(1,'S');
script_path = info.source:match[[^@?(.*[\/])[^\/]-$]]


local bin="x64"
if platform == "Win32" or platform == "OSX32" then bin="x86" end

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

-- Closed-beta gate: refuse before touching the project at all.
local GATE = loadfile(LKC_VariatorModulePath("lkc_variator_gate"))()
GATE.Init(script_path .. "Data" .. separator .. luac .. separator .. bin .. separator,
          script_path, script_path .. "Data" .. separator .. "save_table.dat",
          separator)
if not GATE.CheckOrExplain() then return end

loadfile(LKC_VariatorModulePath("variator_mutations"))() --UCITAVANJE MUTA table-a





-- Profile loading lives in MUTA.LoadMutationParams (variator_mutations.lua),
-- shared with the GUI so headless and GUI mutates behave identically.



function DoMutate()
	reaper.PreventUIRefresh(1)
    reaper.Undo_BeginBlock() -- Begining of the undo block. Leave it at the top of your main function.
    
    MUTA.Mutate(MUTA.LoadMutationParams(4))
    
    reaper.Undo_EndBlock("LKC - Variator 2 - Mutate using formula 4", -1) -- End of the undo block. Leave it at the bottom of your main function.
    reaper.UpdateArrange()
    reaper.PreventUIRefresh(-1)
end



--main
DoMutate()