PathSync Optimized
==================
Current Version: v0.5.8


Version history:

v0.5.8 (03/06/2026)
  + New "Show Local in Explorer" / "Show Remote in Explorer" context-menu entries — open the containing folder with the file pre-selected
  + Open Local / Open Remote / Diff now hand the file to an already-running DDE app (e.g. WinAmp) immediately, instead of doing nothing until the app is closed

v0.5.7 (30/05/2026)
  + Diff / Open Local / Open Remote now open files and folders with non-ASCII names (umlauts, accents, CJK) and report errors instead of failing silently
  + Folder browser now returns correct paths for folders with non-ASCII names
  + "Enable logging" off-state is now saved correctly (logging was wrongly re-enabled after restart)
  + Read-only files and folders are now deleted/overwritten during sync instead of failing
  + Copied files no longer receive a corrupted timestamp if the source time cannot be read
  + "Time Remaining" no longer shows a bogus value when a file grows during sync
  + Filename mask character classes (e.g. [a-z]) are now case-insensitive like the rest of the pattern
  + Files with very long paths (over 2047 chars) are now copied/deleted correctly
  + Settings (.pss) files without a version key are no longer falsely reported as load errors
  + Fixed a system-tray menu handle leak (one per right-click)
  + Faster analysis of large folders (linear list building instead of quadratic; fewer redundant system calls)
  + Internal hardening — bounded string buffers, leak fixes on error paths, code cleanup

v0.5.6 (29/05/2026)
  + Fixed potential out-of-bounds write when dropping a file with a very long path onto a path field
  + Fixed system tray tooltip reading past its buffer (missing null-termination)
  + Filename mask matching and command-line parsing now handle non-ASCII (UTF-8) characters safely

v0.5.5 (16/04/2026)
  + "Delete first" option — removes target files/folders before copying new ones (saves space on tight targets)
  + Fixed sync errors when deleting folders after sorting the list by column header
  + List is now always sorted in safe execution order (parent directories after their contents) before sync starts
  + Filename column sorting now preserves the parent-after-children invariant

v0.5.4 (14/04/2026)
  + Column sorting — click any column header to sort ascending/descending with arrow indicator
  + Optimized sort performance with pre-built text cache for Status/Action columns

v0.5.3 (13/03/2026)
  + Website link in Help menu (? → Website)
  + Security hardening — replaced all sprintf with _snprintf to prevent buffer overflows
  + Fixed format string vulnerability in log output
  + Fixed createdir error reporting — errors are now correctly detected and shown
  + Removed deprecated Windows 9x compatibility code
  + Code quality — fixed variable shadowing, reserved keyword usage, added bounds checks

V0.5.2 (01/01/2026)
  + PathSync now properly handles file and folder names with special characters

v0.5.1 (17/12/2025)
  + Updated to latest WDL
  + Updated installer (NSIS 2.5.0 DLL hijack fixes)

v0.5 (08/12/2025)
  + Preliminary unicode filename support (via UTF-8)
  + Work to prepare for OS X support
  + Uses more of WDL for file read/write
  + Fixed bug in fn matching for directories

Special thanks to:
- Cockos Incorporated for the original PathSync (https://www.cockos.com/pathsync/).

Copyright 2025-2026 HJS

Contact Info
------------
Web: https://hjs.page.gd/pso/
GitLab: https://gitlab.com/HJS-cpu/pathsync-optimized
GitHub: https://github.com/HJS-Lab/PathSync_Optimized
E-Mail: pathsync@gmx.org
