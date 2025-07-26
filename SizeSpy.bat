@echo off
setlocal EnableDelayedExpansion
:: Disk Scanner Tool – Version 1.7.3
:: Author: Rydell Hall

title Disk Scanner v1.7.3 - By Rydell Hall

:: ---------- Defaults ----------
:: These are the initial settings; users can override them in the preferences menu.
set "scan_drive=C:"          :: The drive letter (with colon) to scan by default
set "min_size_mb=1024"       :: Minimum file/folder size in MB (1 GB) to include in results
set "display_limit=15"       :: How many top items (files/folders) to show
set "report_enabled=0"       :: Whether to generate a report file (0 = off, 1 = on)

:: ---------- MAIN MENU ----------
:mainmenu
cls
:: Determine human-readable report status
if "%report_enabled%"=="1" (set "report_status=Enabled") else (set "report_status=Disabled")

echo ===========================================================================================
echo                             DISK SCANNER MAIN MENU Version a1.7.3
echo ===========================================================================================
echo.
echo                                   Current Preferences
echo                         Drive to Scan           = %scan_drive%\
echo                         Minimum Size Threshold  = %min_size_mb% MB
echo                         Display Limit           = %display_limit%
echo                         Report Generation       = %report_status%
echo.
echo.
echo                    (R) Run                - Perform scan with current settings
echo                    (C) Set Preferences    - Change drive, thresholds, etc.
echo                    (Q) Quit               - Exit the script
echo.
echo.
echo.
:: Prompt for menu choice; case-insensitive
set /p choice=Choice (R/C/Q): 
if /I "%choice%"=="R" goto run
if /I "%choice%"=="C" goto configmenu
if /I "%choice%"=="Q" goto end
:: Invalid input simply redisplays the menu
goto mainmenu

:: ---------- REVIEW / CONFIRM ----------
:run
cls
echo ============================================
echo           SCAN SETTINGS REVIEW
echo ============================================
echo Drive:        %scan_drive%\
echo Min Size:     %min_size_mb% MB
echo Display Limit: %display_limit%
echo.
echo Y = Run   M = Main Menu   Q = Quit
:: Ask user to confirm before starting potentially lengthy scan
set /p ok=Proceed? (Y/M/Q): 
if /I "%ok%"=="M" goto mainmenu
if /I "%ok%"=="Q" goto end
if /I not "%ok%"=="Y" goto run

:: ---------- FILE SCAN ----------
cls & echo === Scanning files (this may take a while)...
:: Convert MB threshold to bytes for accurate comparison
set /a min_bytes=min_size_mb*1048576

:: Prepare temporary files to store unsorted and sorted results
set "filetmp=%TEMP%\ds_files.txt"
set "fileout=%TEMP%\ds_files_sorted.txt"
del "%filetmp%" 2>nul & del "%fileout%" 2>nul

:: Recursively enumerate every file under scan_drive
::   %%~zF returns file size in bytes
::   Only include files ≥ min_bytes to reduce result set
for /R "%scan_drive%\" %%F in (*) do (
    if %%~zF geq !min_bytes! echo %%~zF "%%F">>"%filetmp%"
)

:: Sort results in descending order by raw byte count
::   sort /R reverses lexicographical sort; files with larger byte strings come first
sort /R "%filetmp%" > "%fileout%"

cls
echo Top %display_limit% files (>= %min_size_mb% MB)
echo -----------------------------------------------
set /a shown=0

:: Display only the first <display_limit> entries
::   token 1 = byte count; token 2+ = file path
::   Use helper ToMB to convert bytes → MB for readability
for /F "usebackq tokens=1,* delims= " %%A in ("%fileout%") do (
    call :ToMB "%%A" MBVal
    echo !MBVal! MB    %%B
    set /a shown+=1
    if !shown! geq %display_limit% goto after_files
)
:after_files
echo -----------------------------------------------

:: ---------- FOLDER SCAN ----------
echo.
echo === Scanning folders (slow; walks each directory's contents)...
:: Prepare temp files for folder sizes
set "dirtmp=%TEMP%\ds_dirs.txt"
set "dirout=%TEMP%\ds_dirs_sorted.txt"
del "%dirtmp%" 2>nul & del "%dirout%" 2>nul

:: Enumerate all subdirectories including root
::   dir /S /-C "path" produces a summary line "File(s) N bytes"
::   tokens=3 extracts the raw byte count
for /F "delims=" %%D in ('dir /AD /B /S "%scan_drive%\"') do (
    for /F "tokens=3" %%N in ('dir /S /-C "%%D" ^| find "File(s)"') do (
        echo %%N "%%D">>"%dirtmp%"
    )
)

:: Sort folder sizes descending so largest appear first
sort /R "%dirtmp%" > "%dirout%"

echo.
echo Top %display_limit% folders
echo -----------------------------------------------
set /a dshown=0

:: Display only the first <display_limit> folder entries
for /F "usebackq tokens=1,* delims= " %%A in ("%dirout%") do (
    call :ToMB "%%A" MBVal
    echo !MBVal! MB    %%B
    set /a dshown+=1
    if !dshown! geq %display_limit% goto after_dirs
)
:after_dirs
echo -----------------------------------------------
pause

:: Return to main menu after pause
goto mainmenu

:: ---------- PREFERENCES MENU ----------
:configmenu
cls
echo === SET PREFERENCES MENU ===
echo 1) Drive            (currently %scan_drive%:)
echo 2) Min Size (MB)    (currently %min_size_mb% MB)
echo 3) Display Limit    (currently %display_limit%)
echo 4) Toggle Report    (currently %report_status%)
echo.
echo M) Main Menu   Q) Quit
echo.
:: Show current values again for clarity
echo   Current:
echo     Drive  = %scan_drive%\
echo     Min MB = %min_size_mb%
echo     Limit  = %display_limit%
echo     Report = %report_status%
echo.
set /p opt=Choose: 
if /I "%opt%"=="1" goto setdrive
if /I "%opt%"=="2" goto setsize
if /I "%opt%"=="3" goto setlimit
if /I "%opt%"=="4" goto togglereport
if /I "%opt%"=="M" goto mainmenu
if /I "%opt%"=="Q" goto end
goto configmenu

:: ---------- Update Drive ----------
:setdrive
:: Prompt for a single drive letter; normalize input to X:
set /p newdrv=Drive letter (e.g. D): 
if defined newdrv set "scan_drive=%newdrv:~0,1%:"
:: Return to preferences menu
goto configmenu

:: ---------- Update Minimum Size ----------
:setsize
:: Prompt for new minimum size in MB
set /p newmb=Min size MB: 
if defined newmb set "min_size_mb=%newmb%"
goto configmenu

:: ---------- Update Display Limit ----------
:setlimit
:: Prompt for how many items to show
set /p newlim=Display limit: 
if defined newlim set "display_limit=%newlim%"
goto configmenu

:: ---------- Toggle Report Flag ----------
:togglereport
:: Flip between 0 (off) and 1 (on)
if "%report_enabled%"=="1" (set report_enabled=0) else (set report_enabled=1)
goto configmenu

:: ---------- Exit Script ----------
:end
exit /b

:: ---------- Helper Function: bytes → MB ----------
:ToMB
:: Converts a large byte count (%1) to integer MB using PowerShell
:: We cannot use CMD’s SET /A for >2^31-1, so offload to PS for safety
:: %2 is the name of the variable to return (MBVal)
setlocal
set "bytes=%~1"
for /f %%M in ('
  powershell -NoLogo -NoProfile -Command "[math]::Floor(%bytes%/1MB)"
') do set "mb=%%M"
endlocal & set "%~2=%mb%"
goto :eof