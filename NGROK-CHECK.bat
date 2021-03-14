@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
curl -O https://raw.githubusercontent.com/Motdulieu/Vps-AP/main/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\FastConfigVPS_v5.1.exe" https://raw.githubusercontent.com/Motdulieu/Vps-AP/main/FastConfigVPS_v5.1.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\EVKey64.exe" https://raw.githubusercontent.com/Motdulieu/Vps-AP/main/EVKey64.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\winrar-x64-600.exe" https://raw.githubusercontent.com/Motdulieu/Vps-AP/main/winrar-x64-600.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\idman638build18.exe" https://raw.githubusercontent.com/Motdulieu/Vps-AP/main/idman638build18.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\FshareSetup_5.3.0.174.exe" https://raw.githubusercontent.com/Motdulieu/Vps-AP/main/FshareSetup_5.3.0.174.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Motdulieu_AirExplorer2.8.1.zip" https://raw.githubusercontent.com/Motdulieu/Vps-AP/main/Motdulieu_AirExplorer2.8.1.zip > out.txt 2>&1
net user administrator Motdulieu2021 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Re-run jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, be sure NGROK_AUTH_TOKEN is correct in Settings> Secrets> Repository secret. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels "
echo User: Administrator
echo Pass: Motdulieu2021
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
ping -n 10 127.0.0.1 >nul
