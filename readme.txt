PathSync Optimized
==================
Current Version: v0.5.4


Version history:

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
GitHub: https://github.com/HJS-cpu/PathSync_Optimized
E-Mail: pathsync@gmx.org
