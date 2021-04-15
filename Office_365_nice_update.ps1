# Check is Office Click to Run exists
if (Test-Path "C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe")

# run nice updates if found
{
Write-Host "Office Click To Run is found"
Write-Host "Running Nice Updates"
cmd /c "C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe" /update user
}
else
# don't do anything if not found
{
Write-Host "Office Click To Run is not found"
}
