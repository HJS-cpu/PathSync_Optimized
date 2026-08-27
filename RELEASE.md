### Downloads

| Package | Description |
|---------|-------------|
| **PathSync-Portable.zip** | Standalone EXE — no installation needed, just extract and run |
| **PathSync-Installer.zip** | NSIS setup with Start Menu shortcut and uninstaller |

### What's New in v0.5.8

Usability release — open files reliably in an already-running app, and jump straight to any item in Explorer.

- **Added:** New context-menu entries "Show Local in Explorer" and "Show Remote in Explorer" — open the containing folder with the file pre-selected, instead of hunting for the folder entry in the list.
- **Fixed:** Open Local / Open Remote / Diff now hand the file to an already-running DDE-based application (e.g. WinAmp) immediately, instead of doing nothing until that application is closed and then launching a stray second instance.

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

- [Website](https://hjslab.de/pso/)
- [Source Code](https://gitlab.com/HJS-Lab/pathsync-optimized)
- [All Releases](https://gitlab.com/HJS-Lab/pathsync-optimized/-/releases)

### License

GNU General Public License v2.0 — see [license.txt](https://gitlab.com/HJS-Lab/pathsync-optimized/-/blob/main/license.txt) for details.
