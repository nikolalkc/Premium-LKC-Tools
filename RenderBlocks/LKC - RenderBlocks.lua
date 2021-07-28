--[[
 ReaScript Name:Render Blocks
 MetaPackage: true
 Author: LKC
 REAPER: 6+
 Extensions: SWS
 Version: 1.3.1
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
  Data/x64/lkc_renderblocks_destroy.dll
  Data/x64/lkc_renderblocks_pack_unpack.dll
  Data/x64/lkc_renderblocks_name_editor.dll
  Data/x64/lkc_renderblocks_render.dll
  Data/x64/lkc_renderblocks_settings_gui.dll
  Data/x64/lkc_renderblocks_render.dat
  Data/x64/lkc_renderblocks_region_class.dll
  Data/x64/lkc_renderblocks_controller.dll
  Data/x64/lkc_renderblocks_pack_clusters.dll
  Data/x64/lkc_renderblocks_restore_colors.dll
  Data/x64/lkc_renderblocks_autonaming.dll
  Data/x64/lkc_renderblocks_autonaming_settings.dll
  Data/x86/lkc_renderblocks_destroy.dll
  Data/x86/lkc_renderblocks_pack_unpack.dll
  Data/x86/lkc_renderblocks_name_editor.dll
  Data/x86/lkc_renderblocks_render.dll
  Data/x86/lkc_renderblocks_settings_gui.dll
  Data/x86/lkc_renderblocks_render.dat
  Data/x86/lkc_renderblocks_region_class.dll
  Data/x86/lkc_renderblocks_controller.dll
  Data/x86/lkc_renderblocks_pack_clusters.dll
  Data/x86/lkc_renderblocks_restore_colors.dll
  Data/x86/lkc_renderblocks_autonaming.dll
  Data/x86/lkc_renderblocks_autonaming_settings.dll
  Data/ini_file_reader.dat
  Data/save_table.dat
  [data] LKC - RenderBlocks.png > toolbar_icons/LKC - RenderBlocks.png
 About:
  # LKC RENDER BLOCKS

  ## One click export solution

  Set  of special scripts that will allow you to organize, name and export audio files quickly and easily.

  ### GETTING STARTED VIDEO

  https://www.youtube.com/watch?v=UKqOxV1ysY4

  ### Webpage:

  https://www.lkctools.com/renderblocks

  ### Quick Start Guide:

  http://premium.lkc.tools/rblocks_help.php
]]

--[[
 * Changelog:
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
