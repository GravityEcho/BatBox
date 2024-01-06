@echo off 
setlocal enableDelayedExpansion
chcp 65001
set / plname=Enter playlist name:

cd /d "%~dp0"

set "i=0"
@for /f %%a in ('findstr /b "http" %plname%.m3u8') do (   
    set /a "i+=1"
    set "song[!i!]=%%a" 
)   

set "total=!i!"
>%plname%.pls echo [playlist]
>%plname%.pls echo NumberOfEntries=!total! 
>%plname%.pls (
    for /l %%p in (1,1,!total!) do (
        echo File%%p=!song[%%p]!&echo Title%%p=!song[%%p]!
    )
)
