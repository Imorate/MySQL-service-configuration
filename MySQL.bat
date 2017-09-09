@echo off
color a
Title MySQL Service Configuration
:service_name
echo.
echo   88b           d88                ad88888ba     ,ad8888ba,    88           
echo   888b         d888               d8"     "8b   d8"'    `"8b   88           
echo   88`8b       d8'88               Y8,          d8'        `8b  88           
echo   88 `8b     d8' 88  8b       d8  `Y8aaaaa,    88          88  88           
echo   88  `8b   d8'  88  `8b     d8'    `"""""8b,  88          88  88           
echo   88   `8b d8'   88   `8b   d8'           `8b  Y8,    "88,,8P  88           
echo   88    `888'    88    `8b,d8'    Y8a     a8P   Y8a.    Y88P   88           
echo   88     `8'     88      Y88'      "Y88888P"     `"Y8888Y"Y8a  88888888888  
echo                          d8'                                                
echo                         d8'                                                 
echo.
echo.
echo  MySQL Service configuration for installed as a Service - Step 1
echo.
echo.
echo  Please enter MySQL Service name. The default value is "MySQL"
echo.
echo.
set SERVICE=MySQL
set /p SERVICE= "Enter MySQL Service name: " 
cls
goto begin
:begin
cls
color b
echo.
echo   88b           d88                ad88888ba     ,ad8888ba,    88           
echo   888b         d888               d8"     "8b   d8"'    `"8b   88           
echo   88`8b       d8'88               Y8,          d8'        `8b  88           
echo   88 `8b     d8' 88  8b       d8  `Y8aaaaa,    88          88  88           
echo   88  `8b   d8'  88  `8b     d8'    `"""""8b,  88          88  88           
echo   88   `8b d8'   88   `8b   d8'           `8b  Y8,    "88,,8P  88           
echo   88    `888'    88    `8b,d8'    Y8a     a8P   Y8a.    Y88P   88           
echo   88     `8'     88      Y88'      "Y88888P"     `"Y8888Y"Y8a  88888888888  
echo                          d8'                                                
echo                         d8'                                                 
echo.
echo.
echo  MySQL Service configuration for installed as a Service - Step 2
echo.
echo.
echo  1) %SERVICE% Service start
echo.
echo  2) %SERVICE% Service stop
echo.
echo  3) %SERVICE% Service status
echo.
echo  4) Change %SERVICE% Service configuration
echo.
echo  5) Exit
echo.
echo.
set /p NUMBER= "Enter a number to proceed: "
if %NUMBER% EQU 1 goto mysql_start
if %NUMBER% EQU 2 goto mysql_stop
if %NUMBER% EQU 3 goto mysql_status
if %NUMBER% EQU 4 goto mysql_config
if %NUMBER% EQU 5 goto exit
cls
echo  Please pick an action:
echo.
goto begin

:mysql_start
cls
color a
net start %SERVICE%
cls
if %ERRORLEVEL% EQU 0 (
    echo.
    echo  %SERVICE% Service was started Successfuly.
    echo.
)
if %ERRORLEVEL% EQU 2 (
    echo.
    echo  An error has occurred.
    echo.
    echo  Check if Service is installed or %SERVICE% has already been started.
    echo.
)
pause
cls
goto begin

:mysql_stop
cls
color a
net stop %SERVICE%
cls
if %ERRORLEVEL% EQU 0 (
    echo.
    echo  %SERVICE% Service was stopped successfuly. 
    echo.
)
if %ERRORLEVEL% EQU 2 (
    echo.
    echo  An error has occurred.
    echo.
    echo  Check if Service is installed or %SERVICE% was stoped before.
    echo.
)
pause
cls
goto begin

:mysql_status
cls
color a
sc query %SERVICE% | FIND "STATE" | FIND "RUNNING"
cls
if %ERRORLEVEL% EQU 1 (
    echo.
    echo  The %SERVICE% Service is not currently running !
    echo.
    echo  Status: Not Running
    echo.
) else (
    echo.
    echo  The %SERVICE% Service is currently running !
    echo.
    echo  Status: Running
    echo.
)
pause
cls
goto begin

:mysql_config
color b
cls
echo.
echo   88b           d88                ad88888ba     ,ad8888ba,    88           
echo   888b         d888               d8"     "8b   d8"'    `"8b   88           
echo   88`8b       d8'88               Y8,          d8'        `8b  88           
echo   88 `8b     d8' 88  8b       d8  `Y8aaaaa,    88          88  88           
echo   88  `8b   d8'  88  `8b     d8'    `"""""8b,  88          88  88           
echo   88   `8b d8'   88   `8b   d8'           `8b  Y8,    "88,,8P  88           
echo   88    `888'    88    `8b,d8'    Y8a     a8P   Y8a.    Y88P   88           
echo   88     `8'     88      Y88'      "Y88888P"     `"Y8888Y"Y8a  88888888888  
echo                          d8'                                                
echo                         d8'                                                 
echo.
echo.
echo  MySQL Service start up configuration for installed as a Service - Step 3
echo.
echo.
echo  1) Automatic
echo.
echo  2) Automatic (Delayed Start)
echo.
echo  3) Manual
echo.
echo  4) Disabled
echo.
echo  5) back
echo.
echo  6) Exit
echo.
echo.
set /p NUMBER_1= "Enter a number to proceed: "
if %NUMBER_1% EQU 1 goto config_auto
if %NUMBER_1% EQU 2 goto config_auto_delay
if %NUMBER_1% EQU 3 goto config_demand
if %NUMBER_1% EQU 4 goto config_disabled
if %NUMBER_1% EQU 5 goto begin
if %NUMBER_1% EQU 6 goto exit
cls
echo  Please pick an action:
echo.
goto mysql_config
:config_auto
cls
color a
cls
sc config %SERVICE% start= auto
cls
if %ERRORLEVEL% EQU 0 (
    echo.
    echo  %SERVICE% Service start up configuration was successfuly changed to: Automatic
    echo.
)
if %ERRORLEVEL% EQU 1 (
    echo.
    echo  An error occurred. Check Service.msc for more information. 
    echo.
)
pause
cls
goto mysql_config
:config_auto_delay
cls
color a
cls
sc config %SERVICE% start= delayed-auto
cls
if %ERRORLEVEL% EQU 0 (
    echo.
    echo  %SERVICE% Service start up configuration was successfuly changed to: Automatic-Delayed
    echo.
)
if %ERRORLEVEL% EQU 1 (
    echo.
    echo  An error occurred. Check Service.msc for more information. 
    echo.
)
pause
cls
goto mysql_config
:config_demand
cls
color a
cls
sc config %SERVICE% start= demand
cls
if %ERRORLEVEL% EQU 0 (
    echo.
    echo  %SERVICE% Service start up configuration was successfuly changed to: Manual
    echo.
)
if %ERRORLEVEL% EQU 1 (
    echo.
    echo  An error occurred. Check Service.msc for more information. 
    echo.
)
pause
cls
goto mysql_config
:config_disabled
cls
color a
cls
sc config %SERVICE% start= disabled
cls
if %ERRORLEVEL% EQU 0 (
    echo.
    echo  %SERVICE% Service start up configuration was successfuly changed to: Disabled
    echo.
)
if %ERRORLEVEL% EQU 1 (
    echo.
    echo  An error occurred. Check Service.msc for more information. 
    echo.
)
pause
cls
goto mysql_config
:exit
exit