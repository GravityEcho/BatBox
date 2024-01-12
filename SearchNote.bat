@echo off
color 0a
chcp 65001
set /p folder=Folder to search:
:begin
set /p search=Enter the text to search: 

FOR /R "%folder%" %%G IN (NOTE.CSV) DO (
    findstr /C:"%search%" "%%G" >nul
    if not errorlevel 1 (
        echo Text found at: %%G
    )
)
goto begin
