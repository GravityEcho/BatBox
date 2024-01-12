@echo off
setlocal

REM Get the current date
for /F "tokens=1-4 delims=/- " %%a in ("%date%") do (
    set "current_year=%%d"
    set "current_month=%%b"
    set "current_day=%%c"
)

REM Echo the current date separately
mkdir %current_year%.%current_month%.%current_day%
cd %current_year%.%current_month%.%current_day%
echo.>>NOTE.CSV
echo.>>INCOMING.CSV
echo.>>INCOMING.CSV
echo TIMESTAMP %current_year%.%current_month%.%current_day% %time:~0,8%>>INCOMING.CSV

echo.
echo %current_year%.%current_month%.%current_day%
echo %time:~0,8%
echo.

endlocal