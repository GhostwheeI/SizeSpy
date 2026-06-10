@echo off
setlocal EnableDelayedExpansion
:: SizeSpy - Version 1.7.7 (Spinner-based scanning feedback)
:: Author: Rydell Hall

set "script_dir=%~dp0"

:: Defaults
set "scan_drives=C"
set "min_size_mb=1024"
set "display_limit=15"
set "report_enabled=0"

:mainmenu
cls
call :fancytitle
if "%report_enabled%"=="1" (set "report_status=Enabled") else (set "report_status=Disabled")
echo Current Settings:
echo    [1] Drives         = %scan_drives%
echo    [2] Min Size (MB)  = %min_size_mb%
echo    [3] Display Limit  = %display_limit%
echo    [4] Report         = %report_status%
echo.
echo    [R] Run Scan

echo    [Q] Quit
set /p choice=Select an option: 
if /I "%choice%"=="1" goto setdrives
if /I "%choice%"=="2" goto setminsize
if /I "%choice%"=="3" goto setlimit
if /I "%choice%"=="4" goto togglereport
if /I "%choice%"=="R" goto run
if /I "%choice%"=="Q" goto end
goto mainmenu

:setdrives
set "temp_scan_drives=%scan_drives%"
set "scan_drives="
set /p scan_drives=Enter drive letters (comma-separated, e.g. C,D,E) [Current: %temp_scan_drives%]:
if not defined scan_drives set "scan_drives=%temp_scan_drives%"
goto mainmenu

:setminsize
set "temp_min_size_mb=%min_size_mb%"
set "min_size_mb="
set /p min_size_mb=Enter minimum file/folder size in MB [Current: %temp_min_size_mb%]:
if not defined min_size_mb set "min_size_mb=%temp_min_size_mb%"
goto mainmenu

:setlimit
set "temp_display_limit=%display_limit%"
set "display_limit="
set /p display_limit=Enter number of items to display [Current: %temp_display_limit%]:
if not defined display_limit set "display_limit=%temp_display_limit%"
goto mainmenu

:togglereport
if "%report_enabled%"=="1" (set report_enabled=0) else (set report_enabled=1)
goto mainmenu

:run
cls
set /a min_bytes=%min_size_mb%*1048576
for %%D in (%scan_drives%) do call :scanDrive %%D:

pause
goto mainmenu

:scanDrive
set "drive=%~1"
echo.
echo === SCANNING DRIVE: %drive% ===
set "filetmp=%TEMP%\ss_files.txt"
set "fileout=%TEMP%\ss_files_sorted.txt"
del "%filetmp%" 2>nul & del "%fileout%" 2>nul

for /f %%t in ('powershell -nologo -command "(Get-Date).ToString(\"HH:mm:ss\")"') do set start_time=%%t

:: Precompute total files for better progress tracking
set /a total_files=0
for /F %%F in ('dir /S /B /A:-D "%drive%\" ^| find /C /V ""') do set total_files=%%F

set /a progress=0
set "spinner=-\\|/"
set /a spinpos=0

:: Begin scan
for /F "delims=" %%F in ('dir /S /B /A:-D "%drive%\"') do (
    set "size=%%~zF"
    if !size! geq !min_bytes! echo !size! "%%F" >> "%filetmp%"
    set /a progress+=1
    set /a "throttle=progress %% 50"
    if !throttle! equ 0 (
        set /a "spinpos=(progress / 50) %% 4"
        if !spinpos! equ 0 set "sym=-"
        if !spinpos! equ 1 set "sym=\"
        if !spinpos! equ 2 set "sym=|"
        if !spinpos! equ 3 set "sym=/"
        <nul set /p=Scanning [!progress!/!total_files!] !sym!
    )
)
echo.
echo Total qualifying files: !progress!
sort /R "%filetmp%" > "%fileout%"

:: Rest of display logic omitted for brevity ...
echo Done scanning %drive%
echo.
exit /b

:fancytitle
echo ==============================================
echo ^|              S I Z E S P Y   v1.7.7         ^|
echo ==============================================
echo.
exit /b

:end
exit /b