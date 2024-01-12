@echo off
chcp 65001
color 0a
for /F "tokens=1-4 delims=/- " %%a in ("%date%") do (
    set "current_year=%%d"
    set "current_month=%%b"
    set "current_day=%%c"
)
cd %current_year%.%current_month%.%current_day%
echo.>>NOTE.CSV
:begin
set /p entryline=Enter the following line:
echo %entryline%,%time:~0,8%>>NOTE.CSV
echo.
echo %entryline% entered into %current_year%.%current_month%.%current_day%/NOTE.CSV
echo.

goto begin
