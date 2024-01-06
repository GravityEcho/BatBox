@echo off 
chcp 65001
set /p "fname=Enter file name and extension to sort:"
sort %fname% > sorted_%fname%
del %fname%
RENAME "sorted_%fname%" "%fname%"
echo.
echo sort complete for %fname%
pause