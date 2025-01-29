# Nuke-Update-Settings.ps1
# Author: Daniel Keer
# Author URI: https://thedxt.ca
# Script URI: https://github.com/thedxt/win-updates
#
# clears out the GPCache and WSUS settings for Windows Updates
#
Stop-Service -Name wuauserv
Remove-Item HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Recurse
Remove-Item HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\GPCache -Recurse
Start-Service -name wuauserv
