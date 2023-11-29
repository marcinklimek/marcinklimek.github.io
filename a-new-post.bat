@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set datetime=%%a
set year=%datetime:~0,4%
set month=%datetime:~4,2%
set day=%datetime:~6,2%


setlocal enabledelayedexpansion

set "filename=%1"
shift

:concat
if "%1"=="" goto end
set "filename=!filename!-%1"
shift
goto concat

:end
set filename=%year%-%month%-%day%-!filename!.md

hugo new -k post posts/!filename!
subl "content\posts\!filename!"
