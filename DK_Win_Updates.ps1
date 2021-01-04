#DK Win Updates
#It will check for updates and install them
#author theDXT
#last update 23 November 2020

clear-host
Write-host "Checking for Updates..." -foregroundcolor yellow
Write-host ""

#getting update info
$UpdateSession = New-Object -com Microsoft.Update.Session
$UpdateSearcher = $UpdateSession.CreateupdateSearcher()
$SearchResult =  $UpdateSearcher.Search("Type='Software' and IsHidden=0 and IsInstalled=0")

#makeing the list
$updatelist=New-Object -com Microsoft.Update.UpdateColl
For($i=0; $i -lt $searchResult.Updates.Count; $i++){
    $update=$searchResult.Updates.Item($i)
    if ($Update.EulaAccepted -eq 0) {$Update.AcceptEula()}
    [void]$updatelist.Add($Update)
    }

#math stuff
$UpdateLowNumber = 0
$UpdateHighNumber = 1
$InstallUpdateLowNumber = 0
$InstallUpdateHighNumber = 1
$NumberofUpdates = $searchResult.Updates.Count


clear-host
Write-host "$NumberofUpdates Updates Found" -foregroundcolor yellow
Write-host ""

#exit if no updates or keep running if updates
If ($NumberofUpdates -eq 0) {
Write-host "No Updates Found" -foregroundcolor yellow}
else
#start of If updates
{


Write-host "Listing Updates..." -foregroundcolor yellow
Write-host ""

#update list display loop
while ($UpdateHighNumber -le $NumberofUpdates) {
$Update = $searchResult.Updates.Item($UpdateLowNumber)
$Title = $update.Title
$KBArticleIDs = $update.KBArticleIDs
$SecurityBulletinIDs = $update.SecurityBulletinIDs
$MsrcSeverity = $update.MsrcSeverity
$LastDeploymentChangeTime = $update.LastDeploymentChangeTime
$MoreInfoUrls = $update.MoreInfoUrls
Write-host "--------------------------------------------"
Write-host "Update $UpdateHighNumber of $NumberofUpdates"
Write-host "Title: $Title"
if ($KBArticleIDs -ne "") {Write-host "KB #: $KBArticleIDs"}
if ($SecurityBulletinIDs -ne "") {write-host "Security Bulletin: $SecurityBulletinIDs"}
if ($MsrcSeverity -eq "Critical") {Write-host "Rating: $MsrcSeverity" -foregroundcolor red} else {Write-host "Rating: $MsrcSeverity"}
if ($LastDeploymentChangeTime -ne "") {Write-host "Released: $LastDeploymentChangeTime"}
if ($MoreInfoUrls -ne "") {Write-host "$MoreInfoUrls"}

Write-host "--------------------------------------------"
Write-host ""
Write-host ""

$Title = ""
$KBArticleIDs =  ""
$SecurityBulletinIDs =  ""
$MsrcSeverity =  ""
$LastDeploymentChangeTime =  ""
$MoreInfoUrls =  ""
$UpdateLowNumber = $UpdateLowNumber + 1
$UpdateHighNumber = $UpdateHighNumber + 1
if ($ProgressValue -lt $NumberofUpdates) {$ProgressValue = $ProgressValue + 1}
}


#Download the updates

Write-host "Downloading Updates..." -foregroundcolor yellow
Write-host ""

$downloader=$UpdateSession.CreateUpdateDownloader()
$downloader.Updates=$updatelist
$Downloader.Download()


#Installing
Write-host "Installing Updates..." -foregroundcolor yellow
Write-host ""
$Installer = $UpdateSession.CreateUpdateInstaller()
$Installer.Updates = $updatelist
$InstallationResult = $Installer.Install()

#Reboot if needed
if ($InstallationResult.ResultCode -eq 2){
Write-Host "Updates installed successfully"
                                         } else {
Write-Host "Some updates could not be installed"
                                         }
if ($InstallationResult.RebootRequired){
Write-Host "System needs to reboot"
# uncomment the following line to automatically reboot the system if a reboot is required after the updates are installed
shutdown -r -f -t 300 -c "Rebooting in 5 minutes to apply Windows updates"
}
#end of if updates
}
