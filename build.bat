@echo off
set comp_name="Fat Camel Studio"
set app_name=Renamator

set full_version=0.0.1.0
set version=%full_version:~0,-2%
set version_type=%full_version:~-1%

if %version_type%==0 set version_type=pre
if %version_type%==1 set version_type=alpha
if %version_type%==2 set version_type=beta
if %version_type%==3 set version_type=unstable
if %version_type%==4 set version_type=stable

set build_folder=build\win64-%version%-%version_type%
rmdir /s /q %build_folder%
mkdir %build_folder%

python -m nuitka --standalone --output-dir=%build_folder% --remove-output ^
    --mingw64 ^
    --windows-company-name=%comp_name% ^
    --windows-product-name=%app_name% ^
    --windows-product-version=%version% ^
    --windows-file-version=%version% ^
    --windows-icon-from-ico=assets\icon.ico ^
    --windows-disable-console ^
    src\renamator.py

xcopy /s /y %build_folder%\renamator.dist %build_folder%
rmdir /s /q %build_folder%\renamator.dist

:scriptend