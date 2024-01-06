@echo off 
setlocal enableDelayedExpansion
chcp 65001

cd /d "%~dp0"

set "i=0"
for /r %%a in (*.ogg *.aac *.flac *.mp3 *.m4a) do (   
    set /a "i+=1"
    set "song[!i!]=%%a" 
)   

set "total=!i!"
>playlist.pls echo [playlist]
>>playlist.pls echo NumberOfEntries=!total! 
>>playlist.pls (
    for /l %%p in (1,1,!total!) do (
        echo File%%p=!song[%%p]!
    )
)
