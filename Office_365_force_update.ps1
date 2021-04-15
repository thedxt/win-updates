# Check is Office Click to Run exists
if (Test-Path "C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe")

# run Force updates if found
{
Write-Host "Office Click To Run is found"
Write-host "Forcing Office to be closed"

# Ignore errors if office apps aren't open
$ErrorActionPreference = 'SilentlyContinue'

# kill word
#Get-Process -Name winword | Stop-Process -Force

# kill excel
#Get-Process -Name excel | Stop-Process -Force

# Kill outlook
#Get-Process -Name outlook | Stop-Process -Force

# kill powerpoint
#Get-Process -Name POWERPNT | Stop-Process -Force

# kill onenote
#Get-Process -Name "*onenote*" | Stop-Process -Force

# kill publisher
#Get-Process -Name MSPUB | Stop-Process -Force

# kill MS Access
#Get-Process -Name MSACCESS | Stop-Process -Force

# kill OfficeClickToRun (might be the only one needed)
Get-Process -Name OfficeClickToRun | Stop-Process -Force

Write-Host "Running Forced Updates"

cmd /c “C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeC2RClient.exe” /update user updatepromptuser=false forceappshutdown=true displaylevel=false
}
else
# don't do anything if not found
{
Write-Host "Office Click To Run is not found"
}
