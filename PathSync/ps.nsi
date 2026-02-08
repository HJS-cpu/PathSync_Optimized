;--------------------------------
; PathSync Optimized - NSIS Installer Script
; Modern NSIS 3.x Unicode build
;--------------------------------

Unicode True

!include "MUI2.nsh"

;--------------------------------
; General

; Extract version from source code: #define PATHSYNC_VER "v0.5.2 Optimized"
!searchparse /file pathsync.cpp '#define PATHSYNC_VER "v' VER_MAJOR '.' VER_MINOR '.' VER_PATCH ' '

!define PRODUCT_NAME "PathSync"
!define PRODUCT_PUBLISHER "HJS"
!define PRODUCT_WEB_SITE "https://github.com/HJS-cpu/PathSync_Optimized"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"

SetCompressor lzma
RequestExecutionLevel admin

; Name and file
Name "${PRODUCT_NAME} v${VER_MAJOR}.${VER_MINOR}.${VER_PATCH} Optimized"
OutFile "..\build\PathSync-${VER_MAJOR}.${VER_MINOR}.${VER_PATCH}-setup.exe"

; Default installation folder
InstallDir "$PROGRAMFILES\PathSync"

; Get installation folder from registry if available
InstallDirRegKey HKLM "Software\${PRODUCT_NAME}" "InstallDir"

;--------------------------------
; Interface Settings

!define MUI_ABORTWARNING
!define MUI_ICON "icon1.ico"
!define MUI_UNICON "icon1.ico"
!define MUI_COMPONENTSPAGE_NODESC

;--------------------------------
; Pages

!insertmacro MUI_PAGE_LICENSE "..\LICENSE"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
; Languages

!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "German"

;--------------------------------
; Installer Sections

Section "PathSync (required)" SecCore

  SectionIn RO
  SetOutPath "$INSTDIR"

  ; Application executable
  File "..\build\PathSync.exe"

  ; License file
  File /oname=LICENSE.txt "..\LICENSE"

  ; Store installation folder
  WriteRegStr HKLM "Software\${PRODUCT_NAME}" "InstallDir" $INSTDIR

  ; Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  ; Add/Remove Programs entry
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "DisplayName" "${PRODUCT_NAME} v${VER_MAJOR}.${VER_MINOR}.${VER_PATCH} Optimized"
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${VER_MAJOR}.${VER_MINOR}.${VER_PATCH}"
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\PathSync.exe,0"
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "UninstallString" '"$INSTDIR\Uninstall.exe"'
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "QuietUninstallString" '"$INSTDIR\Uninstall.exe" /S'
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "InstallLocation" "$INSTDIR"
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegDWORD HKLM "${PRODUCT_UNINST_KEY}" "NoModify" 1
  WriteRegDWORD HKLM "${PRODUCT_UNINST_KEY}" "NoRepair" 1

  ; Estimate installed size (in KB)
  SectionGetSize ${SecCore} $0
  WriteRegDWORD HKLM "${PRODUCT_UNINST_KEY}" "EstimatedSize" $0

SectionEnd

Section "Associate with PSS files" SecPSS

  WriteRegStr HKCR ".pss" "" "pssfile"
  WriteRegStr HKCR "pssfile" "" "PathSync Settings file"
  WriteRegStr HKCR "pssfile\DefaultIcon" "" "$INSTDIR\PathSync.exe,0"
  WriteRegStr HKCR "pssfile\shell\open\command" "" '"$INSTDIR\PathSync.exe" -loadpss "%1"'

  ; Notify shell of file association change
  System::Call 'shell32::SHChangeNotify(i 0x08000000, i 0x0000, p 0, p 0)'

SectionEnd

Section "Desktop shortcut" SecDesktop

  CreateShortcut "$DESKTOP\PathSync.lnk" "$INSTDIR\PathSync.exe"

SectionEnd

Section "Start Menu shortcuts" SecStartMenu

  CreateDirectory "$SMPROGRAMS\PathSync"
  CreateShortcut "$SMPROGRAMS\PathSync\PathSync.lnk" "$INSTDIR\PathSync.exe"
  CreateShortcut "$SMPROGRAMS\PathSync\License.lnk" "$INSTDIR\LICENSE.txt"
  CreateShortcut "$SMPROGRAMS\PathSync\Uninstall PathSync.lnk" "$INSTDIR\Uninstall.exe"

SectionEnd

;--------------------------------
; Uninstaller Section

Section "Uninstall"

  ; Remove application files
  Delete "$INSTDIR\PathSync.exe"
  Delete "$INSTDIR\PathSync.exe.ini"
  Delete "$INSTDIR\LICENSE.txt"
  Delete "$INSTDIR\Uninstall.exe"

  ; Remove Start Menu shortcuts
  Delete "$SMPROGRAMS\PathSync\*.lnk"
  RMDir "$SMPROGRAMS\PathSync"

  ; Remove Desktop shortcut
  Delete "$DESKTOP\PathSync.lnk"

  ; Remove registry keys
  DeleteRegKey HKLM "Software\${PRODUCT_NAME}"
  DeleteRegKey HKLM "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKCR ".pss"
  DeleteRegKey HKCR "pssfile"

  ; Notify shell of file association change
  System::Call 'shell32::SHChangeNotify(i 0x08000000, i 0x0000, p 0, p 0)'

  ; Remove installation directory (only if empty)
  RMDir "$INSTDIR"

SectionEnd
