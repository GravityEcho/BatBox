@echo off
setlocal enabledelayedexpansion

:begin
rem Prompt user for text to search for
set /p "search_text=Enter text to search for: "

rem Prompt user for replacement text
set /p "replace_text=Enter replacement text: "

rem Loop through all .m3u8 files in the directory
for /R %%f in (*.m3u8) do (
    rem Perform search and replace operation on each file
    set "output_file=%%~nf.SR.m3u8"
    (
        for /f "usebackq delims=" %%l in ("%%f") do (
            set "line=%%l"
            
            rem Skip empty lines
            set "is_empty="
            if "!line!"=="" set "is_empty=true"
            
            if "!is_empty!"=="true" (
                echo.
            ) else (
                setlocal enabledelayedexpansion
                set "line=!line:%search_text%=%replace_text%!"
                echo(!line!
                endlocal
            )
        )
    ) > "!output_file!"

    rem Replace the original file with the new file
    move /y "!output_file!" "%%f"
)
GOTO begin