PowerShell -Command "Set-ExecutionPolicy Unrestricted" >> "%TEMP%\StartupLog.txt" 2>&1
PowerShell %USERPROFILE%\CodeMonkey\dotfiles\windows\startup.ps1 >> "%TEMP%\StartupLog.txt" 2>&1
