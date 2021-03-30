@echo off & setlocal ENABLEEXTENSIONS
call :GetTime h n s t

if %h%%n% GEQ 600 (%CD%\Light.theme&timeout 3&taskkill /f /im systemsettings.exe)
if %h%%n% GEQ 1800 (%CD%\Night.theme&timeout 3&taskkill /f /im systemsettings.exe)
goto :EOF

:GetTime hh nn ss tt
:: Args: %1 Var to receive hours, 2 digits, 00 to 23 (by ref)
::       %2 Var to receive minutes, 2 digits, 00 to 59 (by ref)
::       %3 Var to receive seconds, 2 digits, 00 to 59 (by ref)
::       %4 Var to receive centiseconds, 2 digits, 00 to 99 (by ref)
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS
for /f "tokens=5-8 delims=:,. " %%a in ('echo/^|time') do (
set hh=%%a&set nn=%%b&set ss=%%c&set cs=%%d)
endlocal&set %1=%hh%&set %2=%nn%&set %3=%ss%&set %4=%cs%&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
