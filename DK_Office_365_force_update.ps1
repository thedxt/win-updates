# Check is Office Click to Run exists
if (Test-Path "C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe")

# run Force updates if found
{
Write-Host "Office Click To Run is found"
Write-host "Forcing Office to be closed"

# Ignore errors if office apps aren't open
$ErrorActionPreference = 'SilentlyContinue'

# kill OfficeClickToRun to help office force the updates
Get-Process -Name OfficeClickToRun | Stop-Process -Force

Write-Host "Running Forced Office Updates"

cmd /c “C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeC2RClient.exe” /update user updatepromptuser=false forceappshutdown=true displaylevel=false
}
else
# don't do anything if Click to Run is not found
{
Write-Host "Office Click To Run is not found"
}
