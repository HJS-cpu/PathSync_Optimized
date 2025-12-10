@echo off
REM PathSync Build Script for MinGW-w64
REM ====================================
REM
REM Prerequisites:
REM   1. Install MSYS2: https://www.msys2.org/
REM   2. In MSYS2 terminal, run: pacman -S mingw-w64-x86_64-gcc
REM   3. Add C:\msys64\mingw64\bin to your PATH
REM
REM Or use pre-built MinGW-w64:
REM   https://winlibs.com/ (recommended: UCRT runtime)

echo PathSync Build Script
echo =====================
echo.

REM Check for windres (resource compiler)
where windres >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: windres not found!
    echo Please install MinGW-w64 and add it to your PATH.
    echo.
    echo Download from: https://winlibs.com/
    pause
    exit /b 1
)

REM Check for g++
where g++ >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: g++ not found!
    echo Please install MinGW-w64 and add it to your PATH.
    pause
    exit /b 1
)

echo Compiler found. Building PathSync...
echo.

REM Create build directory
if not exist build mkdir build

REM Compile resource file
echo [1/3] Compiling resources...
windres PathSync\res.rc -O coff -o build\res.o
if %errorlevel% neq 0 (
    echo ERROR: Resource compilation failed!
    pause
    exit /b 1
)

REM Compile source files
echo [2/3] Compiling source files...
g++ -c -O2 -DWIN32 -D_WINDOWS -DUNICODE -D_UNICODE -I WDL ^
    PathSync\pathsync.cpp -o build\pathsync.o ^
    PathSync\fnmatch.cpp -o build\fnmatch.o ^
    WDL\WinGUI\wndsize.cpp -o build\wndsize.o ^
    WDL\win32_utf8.c -o build\win32_utf8.o

if %errorlevel% neq 0 (
    echo ERROR: Compilation failed!
    pause
    exit /b 1
)

REM Link
echo [3/3] Linking...
g++ -o build\PathSync.exe -mwindows ^
    build\pathsync.o build\fnmatch.o build\wndsize.o build\win32_utf8.o build\res.o ^
    -lkernel32 -luser32 -lgdi32 -lshell32 -lcomctl32 -lcomdlg32 -ladvapi32 -lole32

if %errorlevel% neq 0 (
    echo ERROR: Linking failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo Build successful!
echo Output: build\PathSync.exe
echo ========================================
echo.

REM Show file info
dir build\PathSync.exe

pause
