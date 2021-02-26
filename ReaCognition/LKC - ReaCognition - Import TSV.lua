--[[
 Noindex: true
]]

local info = debug.getinfo(1,'S');
script_path = info.source:match[[^@?(.*[\/])[^\/]-$]]

program = [["]] .. script_path..[[lkc_reacognition\lkc_reacognition.exe" --import_tsv]]
os.execute(program)
-- reaper.ShowMessageBox("Dialogue database created!","ReaCognition",0)