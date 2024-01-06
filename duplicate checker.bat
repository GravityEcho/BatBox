@echo off
setlocal enabledelayedexpansion
set /p filename=File name and extension:

set "dupes="
set "c=0"
for /f "usebackq delims=" %%a in ("%filename%") do (
  set /a "c+=1"
  if defined line[%%a] (
    set "dupes=!dupes!, !c!"
  ) else (
    set "line[%%a]=1"
  )
)

if defined dupes (
  echo Duplicate strings found on rows: %dupes:~2%
) else (
  echo No duplicate strings found.
)