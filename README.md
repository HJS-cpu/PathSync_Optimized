# PathSync v0.5 Optimized

**Fork des originalen PathSync v0.4 Beta von Cockos Incorporated mit Performance-Optimierungen.**

![Build Status](https://github.com/YOUR_USERNAME/pathsync-optimized/actions/workflows/build-windows.yml/badge.svg)

## 🚀 Optimierungen

Diese Version enthält folgende Verbesserungen gegenüber dem Original:

### 1. ListView Performance (Größter Speedup!)
- **WM_SETREDRAW Optimierung**: ListView-Updates werden während der Analyse gebatcht
- Verhindert tausende einzelne Redraws bei großen Verzeichnissen
- **Geschätzte Verbesserung: 5-10x schneller bei >10.000 Dateien**

### 2. Größerer Copy-Buffer
- Erhöht von 128KB auf 1MB
- Bessere Nutzung von SSD/NVMe-Performance
- **Geschätzte Verbesserung: 20-50% schnelleres Kopieren**

### 3. Optimierte String-Vergleiche
- First-Char-Check vor strcmp() in Action-Vergleichen
- Vermeidet unnötige Stringvergleiche
- **Geschätzte Verbesserung: ~10% bei vielen Dateien**

### 4. Sauberer Abbruch
- Korrektes ListView-Redraw auch bei Analyse-Abbruch

---

## 📥 Download

### Option 1: Fertige EXE (Empfohlen)
Gehe zu [Releases](../../releases) und lade die neueste `PathSync.exe` herunter.

### Option 2: Automatischer Build via GitHub Actions
1. Forke dieses Repository
2. GitHub Actions baut automatisch bei jedem Push
3. Die EXE findest du unter "Actions" → letzter Build → "Artifacts"

### Option 3: Selbst kompilieren

#### Mit Visual Studio (Windows)
1. Öffne `PathSync/pathsync.dsp` in Visual Studio
2. Build → Build Solution

#### Mit MinGW-w64 (Windows)
1. Installiere [MinGW-w64](https://winlibs.com/)
2. Führe `build-mingw.bat` aus

---

## 🔧 Nutzung

PathSync ist ein einfaches Zwei-Wege-Synchronisierungstool:

1. **Local Path**: Das lokale Verzeichnis
2. **Remote Path**: Das Zielverzeichnis (kann lokal oder Netzwerk sein)
3. **Analyze!**: Vergleicht beide Verzeichnisse
4. **Synchronize!**: Führt die Synchronisierung durch

### Optionen
- **Ignore Size/Date**: Ignoriert Größen-/Datumsunterschiede
- **Ignore missing local/remote**: Ignoriert fehlende Dateien
- **Sync folders**: Synchronisiert auch leere Ordner
- **Include files**: Filter mit Wildcards (z.B. `*.txt;*.doc`)

### Kommandozeile
```
pathsync -loadpss settings.pss [-autorun]
```

---

## 📜 Lizenz

PathSync ist freie Software unter der **GNU General Public License v2**.

Original Copyright (C) 2004-2015 Cockos Incorporated and others.
Optimierungen 2024.

---

## 🙏 Credits

- **Cockos Incorporated** - Original PathSync & WDL Library
- **Alan Davies** (alan@goatpunch.com)
- **Francis Gastellu**
- **Brennan Underwood**
- **GNU C Library** - fnmatch

---

## 📝 Changelog

### v0.5-optimized
- ✨ WM_SETREDRAW für ListView-Updates (massiver Speedup)
- ✨ Größerer Copy-Buffer (1MB statt 128KB)
- ✨ Optimierte Action-String-Vergleiche
- 🐛 Korrektes ListView-Redraw bei Abbruch

### v0.4 BETA2 (Original)
- Letzte Version von Cockos
