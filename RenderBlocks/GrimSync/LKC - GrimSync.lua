--[[
 ReaScript Name: Grim Sync - Advanced REAPER to Wwise bridge system
 MetaPackage: true
 Author: LKC
 REAPER: 6.44+
 Extensions: ReaPack, SWS, ReaImGui, LKC Render Blocks
 Version: 1.34
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
  [data] Data/LKCTools-GrimSync-RegionsToolbar.ReaperMenu > LKCTools-GrimSync-RegionsToolbar.ReaperMenu
  [data] Data/LKCTools-GrimSync-TracksToolbar.ReaperMenu > LKCTools-GrimSync-TracksToolbar.ReaperMenu
  EULA.txt
  CREDITS.txt
  extra/lkc_grimsync_structure_manager.lua
  extra/lkc_grimsync_metaobject_functions.lua
 Changelog:
  - Fix event creation from containers for Wwise 2025

 About:
  # Grim Sync

  ## Advanced bridge system between REAPER and Wwise based on LKC Render Blocks

  Website:  https://www.lkctools.com/grimsync

  Help: http://premium.lkc.tools/grimsync_help.php

  Video Presentation: https://www.youtube.com/watch?v=0hFxBcwi_1k

  Platform: PC, MAC, LINUX

  Requires:

  * REAPER: 6.44+
  * ReaPack
  * SWS
  * ReaImgui
  * LKC Render Blocks (Free or Premium)
  * Python (on OSX and Linux)

  NOTE: Premium license for GrimSync includes premium license for LKC Content Navigator and LKC Render Blocks
--]]

--[[
 Full Changelog History:
 v1.34 (2026-05-13)
    - Fix event creation from containers for Wwise 2025
 v1.33 (2026-06-13)
    + Fixed crazy version numeber 1.3233
 v1.32 (2026-03-13)
    + Final test of publishing script (no user facing changes)
    + Switching from beta to live in automatic way
 v1.31beta3 (2026-03-13)
    + Fetch vs push vs commit terminal test
 v1.31beta2 (2026-03-13)
    + Another push of beta version from terminal
 v1.31beta (2026-03-13)
    + Test push from terminal
 v1.30 (2026-03-13)
    + Test latest distribution system (no user facing changes)
 v1.29 (2026-03-13)
    + Fix toolbars location from Data/Data to just Data
 v1.28 (2026-03-13)
    + Added official toolbar menus for Regions and Tracks (look in REAPER Data folder)
 v1.27 (2026-03-13)
    + New publish script testing
 v1.26 (2026-03-13)
    - Version numbering unified with development branch
    - Support for region lanes
 v1.25 (2026-03-13)
    - Support for region lanes
 v1.24 (2026-03-12)
    - Property Container issue fix
 v1.23 (2026-03-11)
    - Essential support for Wwise 2025.1
 v1.22 (2025-12-10)
    - Fixed broken json decoding
    - Refactored multiple log reading sections
 v1.21 (2025-11-26)
    - Added support for OSX and Linux
 v1.17rc1 (2025-08-31)
    - Added support for live media transfer in Wwise 2024.1 and later
 v1.17beta (2025-08-25)
    - Fixed UI crash with ReaImgui 0.10+
    - Fixed slashes to be crossplatform compatible
 v1.16 (2025-03-23)
    - Fixed bug with using metatags to define custom buses and other string based parameters
 v1.15 (2023-12-26)
    - Added support for creation of events over network
    - Improved help notes
 v1.14 (2023-09-27)
    - REAPER 7 and Lua 5.4 support
 v1.13 (2023-07-31)
    - Fixed Wwise Automation Mode source control issue (WG-63863) on Wwise 2022.1.4 for events as well
    - Fixed (Path Only) braces being part of Smart Originals folder name
 v1.13beta (2023-05-30)
    - Fixed Wwise Automation Mode source control issue (WG-63863) on Wwise 2022.1.4
 v1.12 (2022-12-09)
    - Fixed broken exporting to and from network locations
    - Fixed typos
 v1.11 (2022-12-03)
    - Added ReaImgui 0.7.2 compatibility shims to fix 0.8+ breaks
 v1.10 (2022-08-26)
    - Fixed track/region coloring saving/loading
 v1.09 (2022-08-26)
    - GrimSync new build, ignore missing events file
 v1.08 (2022-08-26)
    - Fix Grim sync now action
 v1.07 (2022-08-26)
    - New region colors for music and wu
 v1.06 (2022-08-26)
    - Add credits, eula
 v1.05 (2022-08-26)
    - Fix rb path check
 v1.04 (2022-08-26)
    - Advanced options are available in premium version
    - Check for Render Blocks installation
 v1.03 (2022-08-26)
    - Added missing files
 v1.02 (2022-08-26)
    - Another Reapack fix
 v1.01 (2022-08-26)
    - Fixed Reapack again
 v1.0 (2022-08-26)
    - Fixed Reapack
 v0.4 (2022-08-26)
    - Suffix options for event names
    - Colors for link regions/tracks
    - Couple of bug fixes
    - Added new toolbar and track icons
    - Added all Structure management actions
 v0.3 (2022-08-23)
    - Validation system
    - Selection system improved
    - Various new options
    - Stop Events
    - Wwise Metatag support
    - Linkink system
 v0.2.9 (2022-08-13)
    - new originals/event subpath defaults
    - fixed clean script so it can restore colors
 v0.2.8 (2022-08-13)
    - new licensing system merged
    - clean script improved
    - dynamic event subpath support
    - ui improved
    - all buttons affect only items listed in gui
 v0.2.7 (2022-06-29)
    - Shared functions are wrapped to avoid crashes
 v0.2.6 (2022-06-21)
    - Fixed Reapack issue
 v0.2.5 (2022-06-21)
    - GUI manager
    - Simulation of resulting hierarchy
    - Event picker
    - Hierarchy issue detector
    - Missing file detector
    - Support for tracks as links to containers and events in wwise
    - Custom Originals subtath
    - Dynamic Originals subpath generation
    - Per project Originals settings
    - No more D:\BouncedSounds as required render path
    - Improved security when creating Wwise region in Reaper (forbid SoundSFX, SoundVoice etc.)
 v0.2.4 (2019-07-16)
    + GrimSync creates grim_audio_guid_table.json
    + Fixed syncing of just one wav file
 v0.2.3 (2019-07-16)
    + GrimSync now gets wav file name from selected Sound SFX object
    + Link selected RenderBlocks.lua now sets RenderBlocks name based on wav file name
    + Safer iteration overwriting when linking RenderBlocks directly to Sound SFX objects
 v0.2.2 (2019-07-15)
    + GrimSync now check if profiler in Wwise is connected
 v0.2.1 (2019-07-11)
    + Updated paths, fix 1
 v0.2 (2019-07-02)
    + Initial commit of GrimSync
--]]
