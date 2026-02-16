@echo off
REM Build script for Visual Studio 2022
REM Run this from VS2022 Developer Command Prompt or Terminal

echo === Building PathSync Optimized ===

if not exist "build" mkdir build

REM Find and run vcvars32.bat to set up environment
if exist "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvars32.bat" (
    call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvars32.bat"
) else if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat" (
    call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"
) else if exist "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars32.bat" (
    call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars32.bat"
) else (
    echo ERROR: Could not find Visual Studio
    exit /b 1
)

echo === Compiling resources ===
rc /fo build\pathsync.res PathSync\res.rc

echo === Compiling pathsync.cpp ===
cl /c /O2 /EHsc /DNDEBUG /I. /Fobuild\pathsync.obj PathSync\pathsync.cpp

echo === Compiling fnmatch.cpp ===
cl /c /O2 /EHsc /DNDEBUG /I. /Fobuild\fnmatch.obj PathSync\fnmatch.cpp

echo === Compiling wndsize.cpp ===
cl /c /O2 /EHsc /DNDEBUG /I. /Fobuild\wndsize.obj WDL\wingui\wndsize.cpp

echo === Compiling win32_utf8.c ===
cl /c /O2 /DNDEBUG /I. /Fobuild\win32_utf8.obj WDL\win32_utf8.c

echo === Linking ===
link /OUT:build\PathSync.exe /SUBSYSTEM:WINDOWS build\pathsync.obj build\fnmatch.obj build\wndsize.obj build\win32_utf8.obj build\pathsync.res kernel32.lib user32.lib gdi32.lib comctl32.lib comdlg32.lib shell32.lib ole32.lib advapi32.lib

echo === Build complete ===
if exist "build\PathSync.exe" (
    echo SUCCESS: build\PathSync.exe created!
    dir build\PathSync.exe
) else (
    echo FAILED: PathSync.exe was not created
)
