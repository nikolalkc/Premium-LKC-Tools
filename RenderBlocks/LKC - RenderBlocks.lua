--[[
 ReaScript Name:Render Blocks
 MetaPackage: true
 Author: LKC
 REAPER: 5+
 Extensions: SWS
 Version: 1.5.4beta
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
 About:
  # LKC RENDER BLOCKS

  ## One click export solution

  ### Now with Content Navigator and AutoNaming

  Set  of special scripts that will allow you to organize, name and export audio files quickly and easily.

  ### Webpage:

  https://www.lkctools.com/renderblocks

  ### Quick Start Guide:

  http://premium.lkc.tools/rblocks_help.php
]]

--[[
 * Changelog:
 * v1.5.4beta (2025-02-25)
    + Fixed a bug with autonaming when using dash (-) as a separator
 * v1.5.3 (2024-10-16)
    + Added option in RenderBlocks Settings (Page B) to include take markers in wave files (requires proper render settings) 
 * v1.5.2 (2023-10-19)
    + REAPER 7 support
 * v1.5.2beta (2023-10-02)
    + REAPER 7 and Lua 5.4 support
 * v1.5.1 (2023-07-21)
    + Fixed 'Pack clusters (vertical only)' selection bug to allow for easier naming after packing
 * v1.5.0 (2023-03-21)
    + Added 'Pack clusters (vertical only)' action to avoid issue of tedious manual packing within a folder
 * v1.4.9 (2023-02-05)
    + Fixed string label that causes autonaming indexing to fail with experimental indexing
  * v1.4.8 (2023-02-05)
    + Fixed experimental indexing without zero prefix for naming and autonaming
  * v1.4.7 (2022-12-23)
    + Removed accidentally left debug messages
  * v1.4.6 (2022-12-22)
    + Fixed bug that caused unlinked time selection and loop markers to render silence
  * v1.4.5 (2022-12-03)
    + Fixed bug with $rblock wildcard and render block metatags giving wrong filename
  * v1.4.4 (2022-08-07)
    + Fixed issue of incorrect coloring of items to white after rendering
    + Fixed issue of automation items being deleted when unpacking blocks 
    + Added basic autonaming support for nvk folder items
    + Refactored license management system
    + Improved license key parsing
  * v1.4.3 (2022-05-23)
    + License management improvement
  * v1.4.2 (2022-01-12)
    + Support for rendering empty single items through folder track
    + Support for single items metatags
    + Fixed coloring of rendered blocks and items to white
  * v1.4.1 (2021-11-25)
    + Optimized render checking
  * v1.4 (2021-11-25)
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
  * v1.3.2beta (2021-11-05)
    + Tail is now always considered when rendering
  * v1.3.1 (2021-07-28)
    + Added slash and backslash support for AutoNaming (release)
  * v1.3.1pre1 (2021-07-18)
    + Added slash and backslash support for AutoNaming
  * v1.3 (2021-07-09)
    + Added support for Content Navigator (premium) - separate package
    + Added AutoNaming support (premium)
    + Added Channel metatags support (premium)
    + Added Reimport feature (premium)
    + Vastly optimized render process
    + Added experimental support for TAIL rendering
  * v1.2.2 (2021-05-20)
    + Added backend for optional region creation on packing and/or naming (experimental)
  * v1.2.1 (2021-05-14)
    + Added backend support for zero based indexing (experimental)
  * v1.2 (2021-04-05)
    + Added 'Pack clusters and Enter name' script
    + Added 'Toggle lables and item icons' script
    + Added 'Default item colors' script
  * v1.1 (2021-03-15)
    + Added action to pack multiple item clusters at the same time (Pack Clusters.lua)
    + Added $rblock wildcard for render settings window
    + Added option to disable rblock coloring when packing
  * v1.0.2 (2021-02-05)
    + Added 'Enter name (no prefix)' script to allow LKC Naming editor to be used for regular item naming
  * v1.0.1 (2021-01-14)
    + updated ReaPack repo description
    + eula is now online only
    + fixed bug with 'trim content behind media items' option when packing blocks
 * v1.0 (2020-12-25)
	+ Package created
]]
