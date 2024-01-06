@echo off 
setlocal enableDelayedExpansion
chcp 65001

cd /d "%~dp0"

set "i=0"
for /r %%a in (*.aac *.flac *.mp3) do (   
    set /a "i+=1"
    set "song[!i!]=%%a" 
)   

set "total=!i!"
>>playlist.m3u8 echo #EXTM3U8
>>playlist.m3u8 echo.
>>playlist.m3u8 (
    for /l %%p in (1,1,!total!) do (
        echo !song[%%p]!
	echo. 
    )
)
