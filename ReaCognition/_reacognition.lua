--[[
 Noindex: true
]]

--UTILITIES=======================================
function Msg(param)
	reaper.ShowConsoleMsg(tostring(param).."\n")
end
--INIT============================================

json = loadfile(script_path.."json_lua"..separator.."json.lua")() --LOAD LIBRARY FOR PARSING AND CREATEING JSON

reacognition = {}

reacognition.save_json = function(obj,name)
    local data = {}
    data["obj"] = obj
    local final_json_data = json.encode(data)
	local json_file, err = io.open(script_path..separator..[[obj]]..separator..name..[[.json]], "w+") or nil
	json_file:write(final_json_data)
    json_file:close()
end

reacognition.load_json = function (name)
    local json_file, err = io.open(script_path..separator..[[obj]]..separator..name..[[.json]], "r") or nil
    if json_file ~= nil then
        str = json_file:read("*all")
        -- Msg(str)
        return json.decode(str)
    else
        Msg("REACOGNITION: NO JSON FILE")
    end
end


--FUNCTIONS============================================
reacognition.delete_midi = function ()
    local midi_items = {}

    reaper.Main_OnCommand(41229, 0) --save selection set
    selected_count = reaper.CountSelectedMediaItems(0)
    -- Msg(selected_count)
    for i = 0, selected_count - 1 do
        local item = reaper.GetSelectedMediaItem(0,i)
        -- Msg(tostring(item))
        local take = reaper.GetActiveTake(item, 0)
        local source_type = nil
        if take ~= nil then
            local source = reaper.GetMediaItemTake_Source(take)
            local typebuf = reaper.GetMediaSourceType(source, "")
            -- Msg(typebuf)
            if typebuf ~= "MIDI" then
                -- Msg(tostring(take).. " is not midi")
                midi_items[i] = item -- place audio in table to unselect later
            end
        else
            -- Msg(tostring(item).." is empty")
        end
    end

    -- unselect audio items
    for k,v in pairs(midi_items) do
        reaper.SetMediaItemSelected(v, false)
    end
    reaper.Main_OnCommand(40697, 0) -- delete shit
end


reacognition.reacognize = function()
    reacognition.delete_json_files()
    reaper.PreventUIRefresh(1)

    local selected_count = reaper.CountSelectedMediaItems(0)
    if selected_count == 0 then
        reaper.ShowMessageBox("You must select an item which you want to ReaCognize.", "ReaCognition", 0)
    else
        --[[
            MAIN ITEM:This item will get the name. If it's single item then it will be named,
            if it's a render block, then this is probably empty item and it will be named in the end.
            This is not really checked anywhere, maybe improve this someday
        ]]
        main_item = reaper.GetSelectedMediaItem(0, 0) -- first item in selection
        

        --PREPARE AUDIO
        reaper.Main_OnCommand(41383, 0) -- copy items/tracks/envelope points
        reaper.Main_OnCommand(40001, 0) -- insert new track
        reaper.Main_OnCommand(40058, 0) -- paste items/tracks
        reaper.Main_OnCommand(40640, 0) -- remove fx for item take
        reaper.Main_OnCommand(40178, 0) -- item prop: set take channel mode mono mix l + r
        reacognition.delete_midi()
        reaper.Main_OnCommand(40108, 0) -- normalize items
        reaper.Main_OnCommand(40421, 0) -- select all items in track
        reaper.Main_OnCommand(41588, 0) -- glue items

        local item = reaper.GetSelectedMediaItem(0, 0)
        local take = reaper.GetActiveTake(item)
        local source = reaper.GetMediaItemTake_Source(take)
        local filenamebuf = reaper.GetMediaSourceFileName(source, "")
        
        --SAVE PATH TO AUDIO FILE
        reacognition.save_json(filenamebuf,"selected_voice_file")
        -- Msg(filenamebuf)

        -- RUN TRANSCRIPTION
        command = [["]] .. script_path .. [[lkc_reacognition]] .. separator .. [[lkc_reacognition.exe" --transcribe]]
        os.execute(command)

        -- DELETE 
        reaper.Main_OnCommand(reaper.NamedCommandLookup("_S&M_DELTAKEANDFILE2"), 0) --SWS/S&M: Delete selected items' takes and source files (no undo)
        reaper.Main_OnCommand(40005, 0) -- remove tracks

        reacognition.show_fuzzy_results(main_item)
        reacognition.delete_json_files()
    end

    reaper.PreventUIRefresh(-1)
    reaper.UpdateArrange()
end

reacognition.delete_json_files = function()
    os.remove(script_path .. [[obj]] .. separator .. "fuzzy_match_result.json")
    os.remove(script_path .. [[obj]] .. separator .. "fuzzy_text_to_compare.json")
    os.remove(script_path .. [[obj]] .. separator .. "selected_voice_file.json")
end



reacognition.show_fuzzy_results = function(item)
    -- Msg("Show fuzzy results")
    upit = reacognition.load_json("fuzzy_text_to_compare")
    if upit == nil then
        Msg("REACOGNITION: External script failed to generate fuzzy_text_to_compare.")
    else
        reacognized_text = upit["obj"]
        data = reacognition.load_json("fuzzy_match_result")
        if data ~= nil then
            data = data["obj"]
            final_string = ""
            local a = 1
            for k,v in pairs(data) do
                -- Msg(v[1]) -- LINE TEXT
                -- Msg(v[2]) -- MATCH PERCENTAGE
                -- Msg(v[3]) -- FILENAME
                -- Msg("---")
                msg = "RESULT: " .. tostring(a) .. "/".. tostring(#data) .. "\n\nREACOGNIZED TEXT:\n" .. reacognized_text .. "\n\nDLG NAME:\n" .. v[3] .. "\n\nDLG TEXT:\n" .. v[1] .. "\n\nDLG MATCH (%): " .. tostring(v[2]) .. "\n\n\nAre you satisfied with this match? Click No to see next best match."
                clicked_button = reaper.ShowMessageBox(msg, "LKC ReaCognition", 3)
                if clicked_button == 6 then -- YES
                    final_string = v[3]
                    line_details = v[1]
                    -- Msg(final_string)
                    break
                elseif clicked_button == 7 then -- NO
                    a = a + 1
                else -- CANCEL
                    break
                end
            end
        else
            Msg("REACOGNITION: No data has been retrieved.")
        end
    end

    if clicked_button == 6 then
        reacognition.name_the_item(main_item,final_string,line_details)
    end
end


reacognition.manual_input = function()
    local selected_count = reaper.CountSelectedMediaItems(0)
    if selected_count == 0 then
        reaper.ShowMessageBox("You must select an item which you want to manually ReaCognize.", "ReaCognition", 0)
    else
        main_item = reaper.GetSelectedMediaItem(0, 0)
        retval, retvals_csv = reaper.GetUserInputs("ReaCognition - Manual query", 1, "Enter text approximation:,extrawidth=300", "", 100)

        -- Msg(retvals_csv)
        if retvals_csv ~= "" then
            reacognition.save_json(tostring(retvals_csv),"fuzzy_text_to_compare")
            local command = [["]] .. script_path .. separator ..[[lkc_reacognition]] .. separator .. [[lkc_reacognition.exe" --fuzzy]]
            os.execute(command)
            reacognition.show_fuzzy_results(main_item)
            reacognition.delete_json_files()
        end
    end
end


reacognition.name_the_item = function(item, final_string, line_details)
    -- Msg("NAME THE ITEM")
    take = reaper.GetActiveTake(item,0)
    group_id = reaper.GetMediaItemInfo_Value(item, "I_GROUPID")
    if group_id == 0 then
        -- Msg("GRO")
        --TODO: Erase everything after ; and ; for single items
        reaper.GetSetMediaItemTakeInfo_String(take, "P_NAME", final_string, true)

        local item_start = reaper.GetMediaItemInfo_Value(item, "D_POSITION")
        local item_len = reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
        local item_track = reaper.GetMediaItem_Track(item)
        local track_number = tonumber(reaper.GetMediaTrackInfo_Value(item_track, "IP_TRACKNUMBER"))
        local upper_track = reaper.GetTrack(0, track_number - 2)

        local rea_mode = reaper.HasExtState("LKC_REACOGNITION", "mode")
        if rea_mode then
            rea_mode = tonumber(reaper.GetExtState("LKC_REACOGNITION", "mode"))
            -- Msg(reamode)
        else
            rea_mode = 1
        end
        -- Msg("readmode:"..tostring(rea_mode))
        if rea_mode == 1 then
            -- Msg("X")
            NEW_ITEM_START = item_start
            NEW_ITEM_END = item_start + item_len
        elseif rea_mode == 2 then
            
            --REGION HANDLING
            reaper.SetEditCurPos(item_start, false, false)
            markeridx, regionidx = reaper.GetLastMarkerAndCurRegion( 0, item_start )
            retval, isrgn, pos, rgnend, name, markrgnindexnumber, color = reaper.EnumProjectMarkers3( 0, regionidx )
            if isrgn then
                reaper.SetProjectMarker3(0, markrgnindexnumber, isrgn, pos, rgnend, final_string, color)
                -- Msg("A")
                NEW_ITEM_START = pos
                NEW_ITEM_END = rgnend
            else
                -- Msg("B")
                reaper.AddProjectMarker(0, true, item_start, item_start + item_len, final_string, 0)
                NEW_ITEM_START = item_start
                NEW_ITEM_END = item_start + item_len
            end
        else
            -- Msg("NO DATA")
        end

        ---- LABEL ITEM HANDLING START =======================================================
        -----LABEL ITEM HANDLING END =========================================================
    else
        reaper.Main_OnCommand(40289, 0) --unselect all items
        reaper.SetMediaItemSelected(item, true)
        reaper.Main_OnCommand(40034, 0) -- item grouping: select all items in groups
        main_item = reaper.GetSelectedMediaItem(0, 0)
        reaper.ULT_SetMediaItemNote(main_item, "@" .. final_string .. "\n;" .. line_details)
        reacognition.set_note_stretch_to_fit(main_item)
    end
end


reacognition.set_note_stretch_to_fit = function(item)
    local strNeedBig = ""
    retval, strNeedBig = reaper.GetItemStateChunk( item, strNeedBig, false )
    new_state = string.gsub(strNeedBig, "IMGRESOURCEFLAGS %d", "IMGRESOURCEFLAGS 2") --turn on stretch
    reaper.SetItemStateChunk( item, new_state, true )
end