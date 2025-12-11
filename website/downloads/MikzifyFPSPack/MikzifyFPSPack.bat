@echo off
title Mikzify FPS Pack - Ultimate Edition
color 0a

:: ========================================
:: Check Admin Privileges
:: ========================================
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this script as Administrator!
    pause
    exit
)

:: ========================================
:: HEADER / ASCII LOGO
:: ========================================
:header
cls
echo.
echo  ############################################################
echo  #                                                          #
echo  #             M I K Z I F Y   F P S   P A C K             #
echo  #                  Ultimate Edition v2.3                 #
echo  #                                                          #
echo  ############################################################
echo.
goto menu

:: ========================================
:: MAIN MENU
:: ========================================
:menu
cls
echo.
echo [1] FPS BOOST - Increase frame rate instantly
echo [2] Mouse Optimization - Improve responsiveness
echo [3] GPU Optimizer - Open your GPU software
echo [4] Full Optimization - Apply all tweaks
echo [5] Restore Default Mouse Settings
echo [6] RAM Cleaner - Clear standby memory
echo [7] Internet / Ping Optimizer
echo [8] Windows Bloat Remover
echo [9] Visual Effects Optimizer
echo [10] Storage Optimizer
echo [11] Mikzify Ultimate Power Plan
echo [12] Gaming Mode - Temporarily boost performance
echo [13] System Info - View system specs
echo [14] Advanced Registry Tweaks
echo [15] Exit
echo [16] Restore All Settings
echo.
set /p choice=Choose an option (1-16): 

if "%choice%"=="1" goto fps
if "%choice%"=="2" goto mouse
if "%choice%"=="3" goto gpu
if "%choice%"=="4" goto full
if "%choice%"=="5" goto restore
if "%choice%"=="6" goto ram
if "%choice%"=="7" goto internet
if "%choice%"=="8" goto bloat
if "%choice%"=="9" goto visual
if "%choice%"=="10" goto storage
if "%choice%"=="11" goto power
if "%choice%"=="12" goto gamingmode
if "%choice%"=="13" goto sysinfo
if "%choice%"=="14" goto registry
if "%choice%"=="15" exit
if "%choice%"=="16" goto restoreall
goto menu

:: ========================================
:: FPS BOOST
:: ========================================
:fps
cls
echo Running Mikzify FPS Boost...
call :loading
powercfg -setactive SCHEME_MIN >nul
del /s /f /q "%temp%\*.*" >nul 2>&1
rd /s /q "%temp%" >nul 2>&1
mkdir "%temp%" >nul 2>&1
del /s /f /q "C:\Windows\Temp\*.*" >nul 2>&1
ipconfig /flushdns >nul
taskkill /f /im explorer.exe >nul
start explorer.exe
wmic process where name="explorer.exe" CALL setpriority "high priority" >nul
echo FPS Boost Complete!
pause
goto menu

:: ========================================
:: MOUSE OPTIMIZER
:: ========================================
:mouse
cls
echo Applying Mouse Optimizations...
call :loading
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseTrails /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f >nul
net stop hidserv >nul 2>&1
net start hidserv >nul 2>&1
echo Mouse Optimization Complete!
pause
goto menu

:: ========================================
:: GPU OPTIMIZER
:: ========================================
:gpu
cls
echo GPU Optimizer Menu:
echo [1] NVIDIA
echo [2] AMD
echo [3] Intel
echo [4] Back
set /p gpuChoice=Choose GPU (1-4): 
if "%gpuChoice%"=="1" goto nvidia
if "%gpuChoice%"=="2" goto amd
if "%gpuChoice%"=="3" goto intel
if "%gpuChoice%"=="4" goto menu
goto gpu

:nvidia
cls
echo Opening NVIDIA Control Panel...
start "" "C:\Program Files\NVIDIA Corporation\Control Panel Client\nvcplui.exe" >nul 2>&1
pause
goto gpu

:amd
cls
echo Opening AMD Radeon Software...
start "" "C:\Program Files\AMD\CNext\CNext\RadeonSoftware.exe" >nul 2>&1
pause
goto gpu

:intel
cls
echo Opening Intel Graphics Command Center...
start "" "C:\Program Files\Intel\GCC\GCC.exe" >nul 2>&1
pause
goto gpu

:: ========================================
:: FULL OPTIMIZATION
:: ========================================
:full
cls
echo Running FULL Mikzify Optimization...
call :loading
call :fps_no_menu
call :mouse_no_menu
call :ram_no_menu
call :internet_no_menu
call :bloat_no_menu
call :visual_no_menu
call :storage_no_menu
call :power_no_menu
call :registry_no_menu
echo Full Optimization Complete!
pause
goto menu

:: ========================================
:: RESTORE DEFAULT MOUSE
:: ========================================
:restore
cls
echo Restoring Default Mouse Settings...
call :loading
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 1 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 6 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 10 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseTrails /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f
echo Defaults Restored!
pause
goto menu

:: ========================================
:: RAM CLEANER
:: ========================================
:ram
cls
echo Running RAM Cleaner...
call :loading
echo Clearing standby memory...
if exist "EmptyStandbyList.exe" (
    start "" /wait "EmptyStandbyList.exe" standbylist
    echo RAM cleared!
) else (
    echo EmptyStandbyList.exe not found! Attempting download...
    bitsadmin /transfer myDownloadJob /download /priority normal https://wj32.org/wp/software/empty-standby-list/EmptyStandbyList.exe "%cd%\EmptyStandbyList.exe"
    if exist "EmptyStandbyList.exe" (
        start "" /wait "EmptyStandbyList.exe" standbylist
        echo RAM cleared!
    ) else (
        echo Download failed. Please place EmptyStandbyList.exe in this folder.
    )
)
pause
goto menu

:: ========================================
:: INTERNET / PING OPTIMIZER
:: ========================================
:internet
cls
echo Running Internet / Ping Optimizer...
call :loading
netsh int ip reset >nul
netsh winsock reset >nul
ipconfig /flushdns >nul
echo Internet Optimization Complete!
pause
goto menu

:: ========================================
:: WINDOWS BLOAT REMOVER
:: ========================================
:bloat
cls
echo Disabling unnecessary Windows features...
call :loading
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul
echo Windows Bloat Removed!
pause
goto menu

:: ========================================
:: VISUAL EFFECTS OPTIMIZER
:: ========================================
:visual
cls
echo Optimizing Windows Visual Effects...
call :loading
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 90120000 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
echo Visual Effects Optimized!
pause
goto menu

:: ========================================
:: STORAGE OPTIMIZER
:: ========================================
:storage
cls
echo Optimizing Storage...
call :loading
del /s /f /q "C:\Windows\Prefetch\*.*" >nul 2>&1
del /s /f /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1
echo Storage Optimized!
pause
goto menu

:: ========================================
:: MIKZIFY ULTIMATE POWER PLAN
:: ========================================
:power
cls
echo Creating Mikzify Ultimate Power Plan...
call :loading
powercfg -duplicatescheme SCHEME_MIN MikzifyUltimateFPS >nul 2>&1
powercfg -setactive SCHEME_MIN >nul
echo Ultimate Power Plan Applied!
pause
goto menu

:: ========================================
:: GAMING MODE
:: ========================================
:gamingmode
cls
echo Activating Gaming Mode...
call :loading
net stop "SysMain" >nul 2>&1
net stop "Windows Search" >nul 2>&1
echo Gaming Mode Active! FPS may improve.
pause
goto menu

:: ========================================
:: SYSTEM INFO
:: ========================================
:sysinfo
cls
echo System Information:
echo -------------------
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"Total Physical Memory"
wmic cpu get name
wmic path win32_VideoController get name
pause
goto menu

:: ========================================
:: ADVANCED REGISTRY TWEAKS
:: ========================================
:registry
cls
echo Applying Advanced Registry Tweaks...
call :loading
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 90120000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f
echo Registry Tweaks Applied!
pause
goto menu

:: ========================================
:: RESTORE ALL SETTINGS
:: ========================================
:restoreall
cls
echo Restoring All Settings to Defaults...
call :loading

:: Mouse defaults
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 1 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 6 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 10 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseTrails /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f

:: Visual effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 90140000 /f >nul
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 400 /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 1 /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t REG_DWORD /d 7 /f

:: Network defaults
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /f >nul 2>&1
netsh int ip reset >nul
netsh winsock reset >nul
ipconfig /flushdns >nul

:: Services defaults
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v Start /t REG_DWORD /d 3 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v Start /t REG_DWORD /d 2 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v Start /t REG_DWORD /d 2 /f >nul

:: GPU scheduling default
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /f >nul 2>&1

:: Power plan default
powercfg -setactive SCHEME_BALANCED >nul

echo All settings restored to Windows defaults!
pause
goto menu

:: ========================================
:: HIDDEN CALLS FOR FULL BOOST
:: ========================================
:fps_no_menu
call :fps
exit /b

:mouse_no_menu
call :mouse
exit /b

:ram_no_menu
call :ram
exit /b

:internet_no_menu
call :internet
exit /b

:bloat_no_menu
call :bloat
exit /b

:visual_no_menu
call :visual
exit /b

:storage_no_menu
call :storage
exit /b

:power_no_menu
call :power
exit /b

:registry_no_menu
call :registry
exit /b

:: ========================================
:: LOADING ANIMATION
:: ========================================
:loading
echo.
<nul set /p="Loading"
for /l %%x in (1,1,3) do (
    ping localhost -n 2 >nul
    <nul set /p="."
)
echo.
exit /b
