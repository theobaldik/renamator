!define VERSION "0.0.1"
!define VERSION_TYPE "0"
!define VERSION_WORD "pre"
!define APP_NAME "Renamator"
!define APP_NAME_PASCAL "Renamator"
!define COMP_NAME "Fat Camel Studio"
!define YEAR "2022"

; -----------------------------------------------------------------------------

; Installer VersionInfo
Name "${APP_NAME}"
OutFile "..\dist\win64\${APP_NAME}-${VERSION}-${VERSION_WORD}-setup-win64.exe"
LoadLanguageFile "${NSISDIR}\Contrib\Language files\English.nlf"
VIProductVersion "${VERSION}.${VERSION_TYPE}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${APP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${COMP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright (c) ${YEAR} ${COMP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${APP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${VERSION}"

; Installer style
InstallDir "$PROGRAMFILES64\${COMP_NAME}\${APP_NAME}"
BrandingText "(c) ${YEAR} ${COMP_NAME}"
Caption "${APP_NAME} ${VERSION} Setup"
UninstallIcon "..\assets\icon.ico"
Icon "..\assets\icon.ico"
Unicode true
Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

Section    
    SetOutPath "$INSTDIR"
    WriteUninstaller "$INSTDIR\uninstall.exe"
    CreateDirectory "$SMPROGRAMS\${APP_NAME}"
    CreateShortcut "$SMPROGRAMS\${APP_NAME}\Uninstall.lnk" "$INSTDIR\uninstall.exe" 
    
    ; Files
    File "..\build\win64-${VERSION}-${VERSION_WORD}\libcrypto-1_1.dll"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\libffi-7.dll"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\libssl-1_1.dll"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\pyexpat.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\python310.dll"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\renamator.exe"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\select.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\unicodedata.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\vcruntime140.dll"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_asyncio.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_bz2.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_ctypes.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_decimal.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_elementtree.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_hashlib.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_lzma.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_overlapped.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_queue.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_socket.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_ssl.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_uuid.pyd"
    File "..\build\win64-${VERSION}-${VERSION_WORD}\_zoneinfo.pyd"

    ; Uninstaller registry 
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME_PASCAL}" "DisplayName" "${APP_NAME}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME_PASCAL}" "UninstallString" '"$INSTDIR\uninstall.exe"'
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME_PASCAL}" "InstallLocation" '"$INSTDIR"'
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME_PASCAL}" "Publisher" "${COMP_NAME}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME_PASCAL}" "DisplayVersion" "${VERSION}"

    ; Custom registry
    WriteRegStr HKCR "Directory\Background\shell\${APP_NAME_PASCAL}" "" "Renumber Items"
    WriteRegStr HKCR "Directory\Background\shell\${APP_NAME_PASCAL}" "Icon" "$INSTDIR\renamator.exe"
    WriteRegStr HKCR "Directory\Background\shell\${APP_NAME_PASCAL}" "NoWorkingDirectory" ""
    WriteRegStr HKCR "Directory\Background\shell\${APP_NAME_PASCAL}\Command" "" '"$INSTDIR\renamator.exe" "%V"'
SectionEnd

Section "uninstall"    
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME_PASCAL}"
    DeleteRegKey HKCR "Directory\Background\shell\${APP_NAME_PASCAL}"
    RMDir /r "$SMPROGRAMS\${APP_NAME}"

    Delete "$INSTDIR\libcrypto-1_1.dll"
    Delete "$INSTDIR\libffi-7.dll"
    Delete "$INSTDIR\libssl-1_1.dll"
    Delete "$INSTDIR\pyexpat.pyd"
    Delete "$INSTDIR\python310.dll"
    Delete "$INSTDIR\renamator.exe"
    Delete "$INSTDIR\select.pyd"
    Delete "$INSTDIR\unicodedata.pyd"
    Delete "$INSTDIR\vcruntime140.dll"
    Delete "$INSTDIR\_asyncio.pyd"
    Delete "$INSTDIR\_bz2.pyd"
    Delete "$INSTDIR\_ctypes.pyd"
    Delete "$INSTDIR\_decimal.pyd"
    Delete "$INSTDIR\_elementtree.pyd"
    Delete "$INSTDIR\_hashlib.pyd"
    Delete "$INSTDIR\_lzma.pyd"
    Delete "$INSTDIR\_overlapped.pyd"
    Delete "$INSTDIR\_queue.pyd"
    Delete "$INSTDIR\_socket.pyd"
    Delete "$INSTDIR\_ssl.pyd"
    Delete "$INSTDIR\_uuid.pyd"
    Delete "$INSTDIR\_zoneinfo.pyd"
    Delete "$INSTDIR\uninstall.exe"
    
    RMDir "$INSTDIR"
SectionEnd