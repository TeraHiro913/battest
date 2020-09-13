@echo off

if "%1" == "" goto START_CALL
if "%1" == "1" goto TRACE_CALL

:START_CALL

set INPUT=
set /P INPUT="”Ô†‚ð“ü—Í‚µ‚Ä‚­‚¾‚³‚¢: "

for /f "tokens=1,2" %%i in (pinglist.txt) do (
  start BTtrace.bat 1 %%i %INPUT% %%j 
)
exit 

::traceŽÀs
:TRACE_CALL
echo %4
echo %date% %time% > %3_%2_trace.txt
tracert  %2  >> %3_%2_trace.txt 
type %3_%2_trace.txt
pause
exit /b

