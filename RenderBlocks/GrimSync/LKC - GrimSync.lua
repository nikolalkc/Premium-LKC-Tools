--[[
 ReaScript Name:Grim Sync - Advanced REAPER to Wwise bridge system
 MetaPackage: true
 Author: LKC
 REAPER: 6.44+
 Extensions: ReaPack, SWS, ReaImGui, LKC Render Blocks
 Version: 1.09
 Provides:
  [Main] LKC - GrimSync - Grim Manager.lua
  [Main] LKC - GrimSync - Wwise object - Create link region.lua
  [Main] LKC - GrimSync - Wwise object - Create link track.lua
  [Main] LKC - GrimSync - Validate and update links to Wwise.lua
  [Main] LKC - GrimSync - Add timeline delay metatags to selected blocks.lua
  [Main] LKC - GrimSync - RenderBlock - Unlink selected from Wwise object.lua
  [Main] LKC - GrimSync - Show last log.lua
  [Main] LKC - GrimSync - Grim Sync now.lua
  [Main] extra/LKC - GrimSync - Region Structure - Delete selected region.lua
  [Main] extra/LKC - GrimSync - Region Structure - Object - Actor-Mixer.lua
  [Main] extra/LKC - GrimSync - Region Structure - Object - Blend Container.lua
  [Main] extra/LKC - GrimSync - Region Structure - Object - Music Playlist Container.lua
  [Main] extra/LKC - GrimSync - Region Structure - Object - Music Segment.lua
  [Main] extra/LKC - GrimSync - Region Structure - Object - Music Switch Container.lua
  [Main] extra/LKC - GrimSync - Region Structure - Object - Random Container.lua
  [Main] extra/LKC - GrimSync - Region Structure - Object - Sequence Container.lua
  [Main] extra/LKC - GrimSync - Region Structure - Object - Switch Container.lua
  [Main] extra/LKC - GrimSync - Region Structure - Object - Virtual Folder.lua
  [Main] extra/LKC - GrimSync - Region Structure - Object - Work Unit.lua
  [Main] extra/LKC - GrimSync - Region Structure - Rename region.lua
  [Main] extra/LKC - GrimSync - Region Structure - Set basic region.lua
  [Main] extra/LKC - GrimSync - Region Structure - Toggle region ignore.lua
  [Main] extra/LKC - GrimSync - Region Structure - Toggle region path only.lua
  [Main] extra/LKC - GrimSync - Track Structure - Delete selected track name.lua
  [Main] extra/LKC - GrimSync - Track Structure - Object - Actor-Mixer.lua
  [Main] extra/LKC - GrimSync - Track Structure - Object - Blend Container.lua
  [Main] extra/LKC - GrimSync - Track Structure - Object - Music Playlist Container.lua
  [Main] extra/LKC - GrimSync - Track Structure - Object - Music Segment.lua
  [Main] extra/LKC - GrimSync - Track Structure - Object - Music Switch Container.lua
  [Main] extra/LKC - GrimSync - Track Structure - Object - Random Container.lua
  [Main] extra/LKC - GrimSync - Track Structure - Object - Sequence Container.lua
  [Main] extra/LKC - GrimSync - Track Structure - Object - Switch Container.lua
  [Main] extra/LKC - GrimSync - Track Structure - Object - Virtual Folder.lua
  [Main] extra/LKC - GrimSync - Track Structure - Object - Work Unit.lua
  [Main] extra/LKC - GrimSync - Track Structure - Rename track.lua
  [Main] extra/LKC - GrimSync - Track Structure - Set basic track.lua
  [Main] extra/LKC - GrimSync - Track Structure - Toggle track ignore.lua
  [Main] extra/LKC - GrimSync - Track Structure - Toggle track path only.lua
  LKC - GrimSync - RenderBlock - Link selected with Wwise object.lua
  LKC - GrimSync - Clean render folder.lua
  LKC - GrimSync - Generate Wwise Data.lua
  LKC - GrimSync - Import and create events.lua
  bin/GrimSync.exe
  bin/GrimSync.py
  json_lua/json.lua
  json_lua/LICENSE
  Data/53/x64/lkc_grimsync_designer.dll
  Data/53/x64/lkc_grimsync_generate_data.dll
  Data/53/x64/lkc_grimsync_shared_functions.dll
  Data/53/x64/lkc_render_controller.dll
  Data/53/x64/lkc_render1.dat
  Data/53/x64/lkc_render2.dat
  Data/53/x64/lkc_render3.dat
  Data/53/x64/lkc_grimsync_update_links.dll
  Data/53/x86/lkc_grimsync_designer.dll
  Data/53/x86/lkc_grimsync_generate_data.dll
  Data/53/x86/lkc_grimsync_shared_functions.dll
  Data/53/x86/lkc_render_controller.dll
  Data/53/x86/lkc_render1.dat
  Data/53/x86/lkc_render2.dat
  Data/53/x86/lkc_render3.dat
  Data/53/x86/lkc_grimsync_update_links.dll
  Data/54/x64/lkc_grimsync_designer.dll
  Data/54/x64/lkc_grimsync_generate_data.dll
  Data/54/x64/lkc_grimsync_shared_functions.dll
  Data/54/x64/lkc_render_controller.dll
  Data/54/x64/lkc_render1.dat
  Data/54/x64/lkc_render2.dat
  Data/54/x64/lkc_render3.dat
  Data/54/x64/lkc_grimsync_update_links.dll
  Data/54/x86/lkc_grimsync_designer.dll
  Data/54/x86/lkc_grimsync_generate_data.dll
  Data/54/x86/lkc_grimsync_shared_functions.dll
  Data/54/x86/lkc_render_controller.dll
  Data/54/x86/lkc_render1.dat
  Data/54/x86/lkc_render2.dat
  Data/54/x86/lkc_render3.dat
  Data/54/x86/lkc_grimsync_update_links.dll
  Data/save_table.dat
  [data] graphics/toolbar_icons/lkc_grimsync_action_basic_name.png > toolbar_icons/lkc_grimsync_action_basic_name.png
  [data] graphics/toolbar_icons/lkc_grimsync_action_delete_clear.png > toolbar_icons/lkc_grimsync_action_delete_clear.png
  [data] graphics/toolbar_icons/lkc_grimsync_action_ignore.png > toolbar_icons/lkc_grimsync_action_ignore.png
  [data] graphics/toolbar_icons/lkc_grimsync_action_path_only.png > toolbar_icons/lkc_grimsync_action_path_only.png
  [data] graphics/toolbar_icons/lkc_grimsync_action_rename.png > toolbar_icons/lkc_grimsync_action_rename.png
  [data] graphics/toolbar_icons/lkc_grimsync_actor_mixer.png > toolbar_icons/lkc_grimsync_actor_mixer.png
  [data] graphics/toolbar_icons/lkc_grimsync_blend.png > toolbar_icons/lkc_grimsync_blend.png
  [data] graphics/toolbar_icons/lkc_grimsync_folder.png > toolbar_icons/lkc_grimsync_folder.png
  [data] graphics/toolbar_icons/lkc_grimsync_logo.png > toolbar_icons/lkc_grimsync_logo.png
  [data] graphics/toolbar_icons/lkc_grimsync_music_playlist.png > toolbar_icons/lkc_grimsync_music_playlist.png
  [data] graphics/toolbar_icons/lkc_grimsync_music_segment.png > toolbar_icons/lkc_grimsync_music_segment.png
  [data] graphics/toolbar_icons/lkc_grimsync_music_switch.png > toolbar_icons/lkc_grimsync_music_switch.png
  [data] graphics/toolbar_icons/lkc_grimsync_random.png > toolbar_icons/lkc_grimsync_random.png
  [data] graphics/toolbar_icons/lkc_grimsync_sequence.png > toolbar_icons/lkc_grimsync_sequence.png
  [data] graphics/toolbar_icons/lkc_grimsync_switch.png > toolbar_icons/lkc_grimsync_switch.png
  [data] graphics/toolbar_icons/lkc_grimsync_workunit.png > toolbar_icons/lkc_grimsync_workunit.png
  [data] graphics/toolbar_icons/lkc_grimsync_wwise_logo.png > toolbar_icons/lkc_grimsync_wwise_logo.png
  Data/grimsync_icons.ttf
  [data] graphics/track_icons/wwise_actor-mixer.png > track_icons/wwise_actor-mixer.png
  [data] graphics/track_icons/wwise_blend_container.png > track_icons/wwise_blend_container.png
  [data] graphics/track_icons/wwise_link.png > track_icons/wwise_link.png
  [data] graphics/track_icons/wwise_music_playlist_container.png > track_icons/wwise_music_playlist_container.png
  [data] graphics/track_icons/wwise_music_segment.png > track_icons/wwise_music_segment.png
  [data] graphics/track_icons/wwise_music_switch_container.png > track_icons/wwise_music_switch_container.png
  [data] graphics/track_icons/wwise_random_container.png > track_icons/wwise_random_container.png
  [data] graphics/track_icons/wwise_sequence_container.png > track_icons/wwise_sequence_container.png
  [data] graphics/track_icons/wwise_switch_container.png > track_icons/wwise_switch_container.png
  [data] graphics/track_icons/wwise_virtual_folder.png > track_icons/wwise_virtual_folder.png
  [data] graphics/track_icons/wwise_work_unit.png > track_icons/wwise_work_unit.png
  EULA.txt
  CREDITS.txt
  extra/lkc_grimsync_structure_manager.lua
  extra/lkc_grimsync_metaobject_functions.lua
 About:
  # Grim Sync

  ## Advanced bridge system between REAPER and Wwise based on LKC Render Blocks

  Website:  https://www.lkctools.com/grimsync

  Help: http://premium.lkc.tools/grimsync_help.php
  
  Video Presentation: https://www.youtube.com/watch?v=0hFxBcwi_1k

  Platform: PC

  Requires: 

  * REAPER: 6.44+
  * ReaPack
  * SWS
  * ReaImgui
  * LKC Render Blocks (Free or Premium)
  * Python (on OSX and Linux)
  
  NOTE: Premium license for GrimSync includes premium license for LKC Content Navigator and LKC Render Blocks
]]

--[[
 * Changelog:
   * v1.09 (2025-12-10)
    - Fixed broken json decoding
    - Refactored multiple log reading sections
   * v1.08 (2025-11-26)
    - Added support for OSX and Linux
    - Added support for live media transfer in Wwise 2024.1 and later
    - Fixed UI crash with ReaImgui 0.10+
    - Fixed slashes to be crossplatform compatible
   * v1.07rc1 (2025-08-31)
    - Added support for live media transfer in Wwise 2024.1 and later
   * v1.07beta (2025-08-25)
    - Fixed UI crash with ReaImgui 0.10+
    - Fixed slashes to be crossplatform compatible
   * v1.06 (2025-03-23)
    - Fixed bug with using metatags to define custom buses and other string based parameters
    - Fixed bug with wwise_.png project loading error
   * v1.05 (2023-12-26)
    - Added support for creation of events over network
    - Improved help notes
   * v1.04 (2023-10-19)
    - REAPER 7 support
   * v1.04beta (2023-10-02)
    - REAPER 7 and Lua 5.4 support
   * v1.03 (2023-07-31)
    - Fixed Wwise Automation Mode source control issue (WG-63863) on Wwise 2022.1.4 for events as well
    - Fixed (Path Only) braces being part of Smart Originals folder name
   * v1.03beta (2023-05-30)
    - Fixed Wwise Automation Mode source control issue (WG-63863) on Wwise 2022.1.4
   * v1.02 (2022-12-11)
    - Fixed broken exporting to and from network locations
    - Fixed typos
    * v1.01 (2022-12-03)
    - Added ReaImgui 0.7.2 compatibility shims to fix 0.8+ breaks
   * v1.0 (2022-08-28)
    - Initial commit
]]
