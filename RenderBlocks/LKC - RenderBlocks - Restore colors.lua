--[[
 Noindex: true
 ReaScript Name:LKC - RenderBlocks - Restore colors
 Author: LKC
 REAPER: 5+
 Version: 1.1
 About:
  Restores original (pre-render) colors to RenderBlocks.
]]



--[[
 * Changelog:
 * v1.1 (2018-07-12)
	+ Fix RenderBlocks with just one item
 * v1.0 (2018-07-06)
	+ Initial commit
]]

local sws = reaper.APIExists("CF_GetClipboardBig")
if sws then
    r = reaper

    reaper.PreventUIRefresh( 1 )
    reaper.Undo_BeginBlock()

    r.Main_OnCommand(41234,0)--save selection set 6
    local items = {}

    local selected_count = r.CountSelectedMediaItems(0)

    for i=0,selected_count-1 do
        items[i]=r.GetSelectedMediaItem(0,i)
    end

    r.Main_OnCommand(41333,0) -- set active takes to default colors


    for k,v in pairs(items) do
        local take = r.GetActiveTake(v)
        if take == nil then
            r.Main_OnCommand(40289,0) --unselect all items
            r.SetMediaItemSelected( v, true )
            r.Main_OnCommand(40034,0) --select all in group
            local first_colored_item = r.GetSelectedMediaItem(0,1) --1 is empty item, 1 is first next item, 
            if first_colored_item ~= nil then
                local original_color =  reaper.GetMediaItemInfo_Value( first_colored_item, "I_CUSTOMCOLOR") 
                r.SetMediaItemInfo_Value(v,"I_CUSTOMCOLOR",original_color)
            end
        end

    end

    r.Main_OnCommand(41244,0)--load selection set 6

    reaper.PreventUIRefresh(-1)
    reaper.Undo_EndBlock("LKC - RenderBlocks - Restore colors", -1)
else
    reaper.ShowMessageBox("Please install SWS Extension version 2.9.7 or higher from:\nhttps://sws-extension.org/", "NO SWS FOUND", 0)
end