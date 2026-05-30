### Downloads

| Package | Description |
|---------|-------------|
| **PathSync-Portable.zip** | Standalone EXE — no installation needed, just extract and run |
| **PathSync-Installer.zip** | NSIS setup with Start Menu shortcut and uninstaller |

### What's New in v0.5.7

Code-audit hardening release — correctness, Unicode and performance fixes from a systematic review.

- **Fixed:** Diff / Open Local / Open Remote now open files and folders with non-ASCII names (umlauts, accents, CJK) correctly, and report an error instead of failing silently.
- **Fixed:** The folder browser now returns correct paths for folders with non-ASCII names.
- **Fixed:** The "Enable logging" off-state is now saved correctly (logging was wrongly re-enabled after restart).
- **Fixed:** Read-only files and folders are now deleted/overwritten during sync instead of failing with an access error.
- **Fixed:** Copied files no longer receive a corrupted timestamp if the source time cannot be read (prevented needless re-copies).
- **Fixed:** "Time Remaining" no longer shows a bogus value when a file grows during synchronization.
- **Fixed:** Filename-mask character classes (e.g. `[a-z]`) are now case-insensitive, consistent with the rest of the pattern matching.
- **Fixed:** Files with very long relative paths (over 2047 characters) are now copied/deleted correctly.
- **Fixed:** Settings (.pss) files without a version key are no longer falsely reported as load errors.
- **Fixed:** The system-tray context menu no longer leaks a menu handle on each right-click.
- **Improved:** Much faster analysis of large folders (linear list building instead of quadratic; fewer redundant system calls).
- **Improved:** Internal hardening — bounded string buffers, resource-leak fixes on error paths, and code cleanup.

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
