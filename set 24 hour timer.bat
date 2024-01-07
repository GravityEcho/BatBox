@echo off

REM Prompt the user to input a specific time
set /p userInput=Enter the desired time (in HH:MM format): 

:begin

REM Get the current time
for /f "tokens=1-3 delims=:." %%a in ("%time%") do (
    set /a currentTime=%%a*3600 + %%b*60 + %%c
)

REM Convert the userInput to seconds
for /f "tokens=1-2 delims=:" %%a in ("%userInput%") do (
    set /a inputTime=%%a*3600 + %%b*60
)

REM If the input time is already in the past, calculate the next occurrence
if %inputTime% LSS %currentTime% (
    set /a inputTime+=86400
)

REM Calculate the number of seconds to wait until the desired time
set /a timeDiff=inputTime - currentTime

REM Display a message to the user with the time remaining
echo Waiting for %userInput%...

REM Delay the script execution for the calculated number of seconds
timeout /t %timeDiff%

REM Execute the script.bat file
START hello.bat

GOTO begin