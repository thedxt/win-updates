#DK Teams MSI update

# the url for the download

$DLURL = "https://aka.ms/teams64bitmsi"

# the temp folder name for the download and the install to run from
$temp = "temp"

# the nice name of the item you are downloading
$name = "Teams Machine Wide MSI"

# the actual msi name (you dont need to add .msi)
$msi = "teams64bitmsi"




# function to check if temp exists if not make it

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
Invoke-WebRequest -Uri $DLURL -OutFile "$Env:SystemDrive\$temp\$msi.msi"
Write-host "$name is downloaded"

}

# Function to do the install
function install-TeamsMSI{
Write-host "Installing $name"


Start-Process msiexec.exe -Wait -ArgumentList "/i", "$Env:SystemDrive\$temp\$msi.msi", "ALLUSERS=1", "/qn"  -WindowStyle Hidden

Write-host "$name Should now be installed"
}

#function to find the users and nuke out old teams to force them to be updated
function AllUsers-Teams-Nuke{

# Already existing user AppData Teams loop

# Defines the location of Teams App Data
$Teams_users_appdata = "\AppData\Local\Microsoft\Teams"

# get the users minus Default and Administrator and Public
$list_of_users = Get-ChildItem -Path $Env:SystemDrive\Users | Where-Object {($_.Name -notlike "Public") -and ($_.Name -notlike "Administrator") -and ($_.Name -notlike "Default")}

# loop for each user found
Foreach ($user in $list_of_users)

{
# check if the folder exists already
if (Test-Path "$($user.FullName)$($Teams_users_appdata)")

# if found nuke the teams folder
{
write-host "Found $($user.FullName)$($Teams_users_appdata)"
Write-host "Nuking old Teams Install for $user"
Remove-Item "$($user.FullName)$($Teams_users_appdata)" -Force -Recurse -ErrorAction silentlycontinue

}
else
{
Write-host "No action needed for $user"
}
}
}

# check for old Teams MSI and nuke it
function Nuke-old-Teams{
$TeamsFinder = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  | 
Get-ItemProperty | Where-Object {$_.DisplayName -eq "Teams Machine-Wide Installer" }  | Select-Object -Property DisplayName, pschildname

if (-not($TeamsFinder))
{
write-host "$name NOT found"
}else{
write-host "Found old $name"
write-host "Nuking old $name"

If ($TeamsFinder.PSChildName) 
{
        $Teams_MSI_Nuke = $TeamsFinder.PSChildName
        start-Process msiexec.exe -ArgumentList "/x", "$Teams_MSI_Nuke", "/qn" -WindowStyle Hidden -wait
}

write-host "$name Nuke Completed"
}

}
#kill Teams if users have it open
Function kill-running-teams{
Get-Process | Where {$_.Description -eq "Microsoft Teams"} | Stop-Process -force
}

#run it

Download
Nuke-old-Teams
kill-running-teams
AllUsers-Teams-Nuke
install-TeamsMSI

