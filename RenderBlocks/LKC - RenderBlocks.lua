--[[
 ReaScript Name: Render Blocks
 MetaPackage: true
 Author: LKC
 REAPER: 5+
 Extensions: SWS
 Version: 1.18
 Provides:
  [Main] LKC - RenderBlocks - Pack or Unpack.lua
  [Main] LKC - RenderBlocks - Destroy.lua
  [Main] LKC - RenderBlocks - Settings.lua
  [Main] LKC - RenderBlocks - Render.lua
  [Main] LKC - RenderBlocks - Enter name.lua
  [Main] LKC - RenderBlocks - Enter name (no prefix).lua
  [Main] LKC - RenderBlocks - Enter metatag.lua
  [Main] LKC - RenderBlocks - Restore colors.lua
  [Main] LKC - RenderBlocks - Pack clusters.lua
  [Main] LKC - RenderBlocks - Pack clusters (vertical only).lua
  [Main] LKC - RenderBlocks - Default item colors.lua
  [Main] LKC - RenderBlocks - Toggle labels and item icons.lua
  [Main] LKC - RenderBlocks - Pack clusters and Enter name.lua
  [Main] LKC - RenderBlocks - AutoName settings.lua
  [Main] LKC - RenderBlocks - AutoName.lua
  Data/Lokasenna_GUI/Class - Button.dat
  Data/Lokasenna_GUI/Class - Options.dat
  Data/Lokasenna_GUI/Class - Label.dat
  Data/Lokasenna_GUI/Class - TextEditor.dat
  Data/Lokasenna_GUI/Class - TextEditor2.dat
  Data/Lokasenna_GUI/Class - Textbox.dat
  Data/Lokasenna_GUI/Class - Window.dat
  Data/Lokasenna_GUI/Class - Listbox.dat
  Data/Lokasenna_GUI/Class - Listbox2.dat
  Data/Lokasenna_GUI/Class - Tabs.dat
  Data/Lokasenna_GUI/Core.dat
  Data/53/x64/lkc_renderblocks_destroy.dll
  Data/53/x64/lkc_renderblocks_pack_unpack.dll
  Data/53/x64/lkc_renderblocks_name_editor.dll
  Data/53/x64/lkc_renderblocks_render.dll
  Data/53/x64/lkc_renderblocks_settings_gui.dll
  Data/53/x64/lkc_render1.dat
  Data/53/x64/lkc_render2.dat
  Data/53/x64/lkc_render3.dat
  Data/53/x64/lkc_renderblocks_region_class.dll
  Data/53/x64/lkc_render_controller.dll
  Data/53/x64/lkc_renderblocks_pack_clusters.dll
  Data/53/x64/lkc_renderblocks_restore_colors.dll
  Data/53/x64/lkc_renderblocks_autonaming.dll
  Data/53/x64/lkc_renderblocks_autonaming_settings.dll
  Data/53/x86/lkc_renderblocks_destroy.dll
  Data/53/x86/lkc_renderblocks_pack_unpack.dll
  Data/53/x86/lkc_renderblocks_name_editor.dll
  Data/53/x86/lkc_renderblocks_render.dll
  Data/53/x86/lkc_renderblocks_settings_gui.dll
  Data/53/x86/lkc_render1.dat
  Data/53/x86/lkc_render2.dat
  Data/53/x86/lkc_render3.dat
  Data/53/x86/lkc_renderblocks_region_class.dll
  Data/53/x86/lkc_render_controller.dll
  Data/53/x86/lkc_renderblocks_pack_clusters.dll
  Data/53/x86/lkc_renderblocks_restore_colors.dll
  Data/53/x86/lkc_renderblocks_autonaming.dll
  Data/53/x86/lkc_renderblocks_autonaming_settings.dll
  Data/54/x64/lkc_renderblocks_destroy.dll
  Data/54/x64/lkc_renderblocks_pack_unpack.dll
  Data/54/x64/lkc_renderblocks_name_editor.dll
  Data/54/x64/lkc_renderblocks_render.dll
  Data/54/x64/lkc_renderblocks_settings_gui.dll
  Data/54/x64/lkc_render1.dat
  Data/54/x64/lkc_render2.dat
  Data/54/x64/lkc_render3.dat
  Data/54/x64/lkc_renderblocks_region_class.dll
  Data/54/x64/lkc_render_controller.dll
  Data/54/x64/lkc_renderblocks_pack_clusters.dll
  Data/54/x64/lkc_renderblocks_restore_colors.dll
  Data/54/x64/lkc_renderblocks_autonaming.dll
  Data/54/x64/lkc_renderblocks_autonaming_settings.dll
  Data/54/x86/lkc_renderblocks_destroy.dll
  Data/54/x86/lkc_renderblocks_pack_unpack.dll
  Data/54/x86/lkc_renderblocks_name_editor.dll
  Data/54/x86/lkc_renderblocks_render.dll
  Data/54/x86/lkc_renderblocks_settings_gui.dll
  Data/54/x86/lkc_render1.dat
  Data/54/x86/lkc_render2.dat
  Data/54/x86/lkc_render3.dat
  Data/54/x86/lkc_renderblocks_region_class.dll
  Data/54/x86/lkc_render_controller.dll
  Data/54/x86/lkc_renderblocks_pack_clusters.dll
  Data/54/x86/lkc_renderblocks_restore_colors.dll
  Data/54/x86/lkc_renderblocks_autonaming.dll
  Data/54/x86/lkc_renderblocks_autonaming_settings.dll
  Data/ini_file_reader.dat
  Data/save_table.dat
  [data] LKC - RenderBlocks.png > toolbar_icons/LKC - RenderBlocks.png
 Changelog:
  + New publish script testing
 About:
  # LKC RENDER BLOCKS

  ## One click export solution

  ### Now with Content Navigator and AutoNaming

  Set of special scripts that will allow you to organize, name and export audio files quickly and easily.

  ### Webpage:

  https://www.lkctools.com/renderblocks

  ### Quick Start Guide:

  http://premium.lkc.tools/rblocks_help.php
--]]

--[[
 Full Changelog History:
 v1.18 (2026-03-13)
    + New publish script testing
 v1.17 (2026-03-11)
    + Version numbering unified with development branch
    + Support for region lanes
 v1.16 (2026-03-11)
    + Support for region lanes
 v1.15 (2026-03-11)
    + Linux build fixes
 v1.14beta (2025-02-25)
    + Disabled autonaming debug
 v1.13beta (2025-02-25)
    + Fixed a bug with autonaming when using dash (-) as a separator
 v1.12 (2024-10-16)
    + Added option to include take markers in wave files (requeres proper render settings) in RenderBlocks Settings (Page B)
 v1.11 (2023-09-27)
    + REAPER 7 and Lua 5.4 support
 v1.10.3 (2023-07-21)
    + Fixed 'Pack clusters (vertical only)' selection bug to allow for easier naming after packing
 v1.10.2 (2023-03-21)
    + Added 'Pack clusters (vertical only)' action to avoid issue of tedious manual packing within a folder
 v1.10.1 (2023-02-05)
    + Fixed string label that causes autonaming indexing to fail with experimental indexing
 v1.10.0 (2023-02-05)
    + Fixed experimental indexing without zero prefix for naming and autonaming
 v1.9.8 (2022-12-23)
    + Removed accidentally left debug messages
 v1.9.7 (2022-12-22)
    + Fixed bug that caused unlinked time selection and loop markers to render silence
 v1.9.6 (2022-12-03)
    + Fixed bug with $rblock wildcard and render block metatags giving wrong filename
 v1.9.5 (2021-08-07)
    + Fixed issue of incorrect coloring of items to white after rendering
    + Fixed issue of automation items being deleted when unpacking blocks
    + Added basic autonaming support for nvk folder items
    + Refactored license management system
    + Improved license key parsing
 v1.9.4 (2021-05-23)
    + License management improvement
 v1.9.3 (2021-12-18)
    + Support for rendering empty single items through folder track
    + Support for single items metatags
    + Fixed coloring of rendered blocks and items to white
 v1.9.2 (2021-11-25)
    + Added support for 'tail' metatag
    + Added support for 'ftail' metatag (faded tail)
    + Added support for 'loudness' metatag
    + Added support for 'limit' metatag
    + Added support for 'ch' metatag (! is deprecated, but backwards compatible)
    + Added support for any number of channels for 'ch' metatag (ch=1, ch=3 ,ch=7, ch=8 ...)
    + Improved formatting of metatags when using naming editor
    + Improved handling of stats window when normalization enabled
    + Tail setting in render options are now always considered
    + Fixed issue with deleting automation items when block destroyed
 v1.9.2beta (2021-11-05)
    + Rendering tail is now always considered
 v1.9.1 (2021-07-18)
    + Added slash and backslash support for AutoNaming
 v1.9.0 (2021-07-01)
    + New render process -- refactored completely
    + Added reimport feature
    + Internal debug system added
 v1.8.4 (2021-06-27)
    + Vastly optimized render process
    + Support for ignoring VIDEO and ** tracks for cluster packing
 v1.8.3 (2021-06-15)
    + New storefront url
 v1.8.2 (2021-06-15)
    + Additional help ARM support
 v1.8.1 (2021-06-15)
    + Help for Autonaming Formula
    + Support ARM OSX version for external links
 v1.8 (2021-06-15)
    + Autoname settings gui fix
 v1.7.9 (2021-06-07)
    + Fix 'Toggle labels and item icons' script
 v1.7.8 (2021-06-07)
    + AutoNaming feature added again
 v1.7.7 (2021-06-07)
    + AutoNaming feature added
    + Channel Metatags feature added
    + Add backend support to use tail length when rendering (experimental)
 v1.7.6 (2021-06-07)
    + Fixed "Destroy" script so it works on ARM version of OSX
 v1.7.5 (2021-05-20)
    + Backend for optional region creation on packing and/or naming (experimental)
 v1.7.4 (2021-05-13)
    + Backend for zero based indexing
 v1.7.3 (2021-04-05)
    + Added 'Pack clusters and Enter name' script
    + Added 'Toggle lables and item icons' script
    + Added 'Default item colors' script
 v1.7.2 (2021-03-14)
    + Added $rblock wildcard for render settings window
    + Added option to disable rblock coloring when packing
 v1.7.1 (2021-02-05)
    + Cluster packing update
 v1.7.0 (2021-02-05)
    + Version dll fix
 v1.6.9 (2021-02-05)
    + Added 'Enter name (no prefix)' script
 v1.6.8 (2021-01-14)
    + updated ReaPack repo description
    + eula is now online only
 v1.6.7 (2021-01-14)
    + fixed bug with 'trim content behind media items' option when packing blocks
 v1.6.6 (2020-12-25)
    + overwriting works for queue
 v1.6.5 (2020-12-25)
    + eula link updated to be online
    + feedback link updated
    + Overwrite off
 v1.6.4 (2020-12-23)
    + FIXED BUGS with settings gui (anchor, buttons)
 v1.6.3 (2020-12-23)
    + eula added
    + gray rather than white exported blocks
    + revert metatags label
 v1.6.2 (2020-12-23)
    + fixed label in settings
    + fixed label in name editor
 v1.6.1 (2020-12-23)
    + new icon
 v1.6 (2020-12-18)
    + added overwriting support
    + added support for multiple tabs
    + fix unpacking label bug
    + credits
    + new buy link
 v1.5 (2020-12-18)
    + new about button
 v1.4 (2020-12-18)
    + sws fix
 v1.3 (2020-12-18)
    + Improvements
 v1.2 (2020-12-17)
    + New Icon
 v1.1 (2020-12-17)
    + Added TextBox
 v1.0 (2020-12-17)
    + Package created
--]]
