setlocal EnableDelayedExpansion
set "imgname=slack.exe"
set "opt=tokens=* delims="
echo:
set /a "count=0"
for /f "%opt%" %%i in ('tasklist /fi "imagename eq !imgname!" /fi "status eq running"') do (
    echo %%i
    set /a "count+=1"
)
set /a "count-=2"
echo:
echo There are !count! !imgname! processes running.
echo:
if "!count!" gtr "0" (call taskkill /f /fi "imagename eq !imgname!")
endlocal
