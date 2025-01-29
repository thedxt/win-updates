# Clear-WSUS.ps1
# Author: Daniel Keer
# Author URI: https://thedxt.ca
# Script URI: https://github.com/thedxt/win-updates
#
# clears out the WSUS settings
#
Stop-Service -Name wuauserv
Remove-Item HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Recurse
Start-Service -name wuauserv
