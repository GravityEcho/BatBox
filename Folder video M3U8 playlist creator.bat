@echo off 
setlocal enableDelayedExpansion
chcp 65001

echo working...

cd /d "%~dp0"

set "i=0"
for /r %%a in (*.mkv *.avi *.mp4) do (   
    set /a "i+=1"
    set "song[!i!]=%%a" 
)   

set "total=!i!"
>>ALLPlaylist.m3u8 echo #EXTM3U8
>>ALLPlaylist.m3u8 echo.
>>ALLPlaylist.m3u8 (
    for /l %%p in (1,1,!total!) do (
        echo !song[%%p]!
	echo. 
    )
)
