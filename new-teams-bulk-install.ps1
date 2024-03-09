# new Teams bulk Install
# author theDXT

# the nice name that will be displayed in the output
$name = "New Teams Bulk Installer"

# define the URLs for the new Teams Install files.
$Teams_msix_url = "https://go.microsoft.com/fwlink/?linkid=2196106"
$Teams_bootstraper_url = "https://go.microsoft.com/fwlink/?linkid=2243204"

# define the temp folder for the installs to be downloaded into and installed from
$temp = "temp"

# define the exe and MSIX name and locations to be used in the install
$Teams_bootstraper_exe = "$Env:SystemDrive\$temp\Teams_bootstraper.exe"
$New_Teams_MSIX = "$Env:SystemDrive\$temp\New_Teams_x64.msix"


# function to check if the defined temp folder exists or not and create it as needed
function temp-check{

if (-not (Test-Path $Env:SystemDrive\$temp))
{
New-Item -ItemType Directory $Env:SystemDrive\$temp | out-null
}

}

# function do the download
function Download{

# enable TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Write-host "Downloading $name"
temp-check
# Download it
Invoke-WebRequest -Uri $Teams_msix_url -OutFile $New_Teams_MSIX
Write-host "$name MSIX is downloaded"
Invoke-WebRequest -Uri $Teams_bootstraper_url -OutFile $Teams_bootstraper_exe
Write-host "$name Bootstraper EXE is downloaded"
}

# function to do the install
function New-Teams-install{
Download
Write-host "Installing $name"

# run the install using the bootstraper and use the MSIX
& $Teams_bootstraper_exe -p -o $New_Teams_MSIX

Write-host "$name should now be installed for all users"
}

# kill Teams if users have it open
Function kill-running-teams{
Get-Process | Where {$_.Description -like "Microsoft Teams*"} | Stop-Process -force
}

# run it all
kill-running-teams
New-Teams-install
