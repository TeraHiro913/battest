@echo off

if "%1" == "" goto START_CALL
if "%1" == "1" goto PING_DISPLAY_CALL
if "%1" == "2" goto PING_TXT_CALL

:START_CALL
set INPUT=
set /P INPUT="番号を入力してください: "
for /f "tokens=1,2" %%i in (pinglist.txt) do (
  start BTping.bat 1 %%i %INPUT% %%j 
  start BTping.bat 2 %%i %INPUT%
)
exit 

::ping結果画面表示
:PING_DISPLAY_CALL
echo %4
echo %date% %time%
ping -t %2 -r 9 
pause
exit /b

::ping結果txtファイル作成
:PING_TXT_CALL
echo %date% %time% > %3_%2_ping.txt
ping -t %2 -r 9 >> %3_%2_ping.txt
pause
exit /b
