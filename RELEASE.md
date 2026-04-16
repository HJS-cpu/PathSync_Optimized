### Downloads

| Package | Description |
|---------|-------------|
| **PathSync-Portable.zip** | Standalone EXE — no installation needed, just extract and run |
| **PathSync-Installer.zip** | NSIS setup with Start Menu shortcut and uninstaller |

### What's New in v0.5.5

- **Added:** "Delete first" option — removes target files/folders before copying new ones. Saves space when the target disk is tight and avoids "disk full" errors during redistribution syncs.
- **Fixed:** Sync errors when deleting folders after sorting the list by column header. The list is now always sorted in safe execution order (parent directories after their contents) before sync starts.
- **Fixed:** Filename column sorting now preserves the parent-after-children invariant, so visual sorting matches safe deletion order.

### Key Features

- **Long Path Support** — handles paths up to 32,767 characters (beyond the 260 char Windows limit)
- **Optimized Performance** — 5-10x faster UI rendering, 20-50% faster file copying (1 MB buffer)
- **Drag & Drop** — drop folders directly onto Local/Remote path fields
- **Window Memory** — remembers position, size, and maximized state
- **Modern UI** — native Windows visual styles with Segoe UI font
- **Full Compatibility** — works with original PathSync .pss settings files

### System Requirements

- Windows XP / Vista / 7 / 8 / 10 / 11
- No external dependencies

### Links

- [Website](https://hjs.page.gd/pso/)
- [Source Code](https://gitlab.com/HJS-cpu/pathsync-optimized)
- [All Releases](https://gitlab.com/HJS-cpu/pathsync-optimized/-/releases)

### License

GNU General Public License v2.0 — see [license.txt](https://gitlab.com/HJS-cpu/pathsync-optimized/-/blob/main/license.txt) for details.
