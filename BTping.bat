@echo off

if "%1" == "" goto START_CALL
if "%1" == "1" goto PING_DISPLAY_CALL
if "%1" == "2" goto PING_TXT_CALL

:START_CALL
set INPUT=
set /P INPUT="�ԍ�����͂��Ă�������: "
for /f "tokens=1,2" %%i in (pinglist.txt) do (
  start BTping.bat 1 %%i %INPUT% %%j 
  start BTping.bat 2 %%i %INPUT%
)
exit 

::ping���ʉ�ʕ\��
:PING_DISPLAY_CALL
echo %4
echo %date% %time%
ping -t %2 -r 9 
pause
exit /b

::ping����txt�t�@�C���쐬
:PING_TXT_CALL
echo %date% %time% > %3_%2_ping.txt
ping -t %2 -r 9 >> %3_%2_ping.txt
pause
exit /b
