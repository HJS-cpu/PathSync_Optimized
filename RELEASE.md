## PathSync Optimized — File Synchronization Tool

A modernized, optimized fork of [PathSync](https://www.cockos.com/pathsync/) by Cockos Incorporated.

### Downloads

| Package | Description |
|---------|-------------|
| **PathSync-Portable.zip** | Standalone EXE — no installation needed, just extract and run |
| **PathSync-Installer.zip** | NSIS setup with Start Menu shortcut and uninstaller |

### What's New in v0.5.3

- **Website link** in Help menu (? → Website)
- **Security hardening** — replaced all `sprintf` with `_snprintf` to prevent buffer overflows with long paths
- **Fixed format string vulnerability** in log output
- **Fixed `createdir` error reporting** — directory creation errors are now correctly detected and shown
- **Removed deprecated Windows 9x compatibility code**
- **Code quality** — fixed variable shadowing, reserved keyword usage, added bounds checks

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
