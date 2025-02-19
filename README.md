# Clear-GPCache.ps1
Clears out the cached settings of Windows updates stored as GPCache.

[More info about GPCache](https://thedxt.ca/2024/08/windows-update-settings-stuck/)

# Clear-WSUS.ps1
Clears out any WSUS settings.

# DK_Office_365_force_update.ps1
This will force the install of Office updates on the system and it will not warn the user. It will just close the applications it needs to in order to install the update.

## Know issues
* The end usre may still see a screen that tells them Updates were installed.

![image](https://user-images.githubusercontent.com/4249262/114624847-8f554d80-9c6e-11eb-914f-f6ca8c81f10d.png)

# DK_Office_365_nice_update.ps1
This will install Office updates on the system and will warn the user if they have Office open.

If the user has Office open they will see a message similar to this

![image](https://user-images.githubusercontent.com/4249262/114624998-d5121600-9c6e-11eb-8591-432d3c074969.png)

# DK_Teams_MSI_update.ps1
This will update the Classic Teams Machine Wide MSI. It will just close Teams if the user has it open.

This resolves the Teams needs an update issue on shared PCs

![image](https://user-images.githubusercontent.com/4249262/218810874-8682eb7f-bd71-4707-a2a9-50501f32762e.png)

[More detailed documentation](https://thedxt.ca/2023/02/fixing-teams-needs-an-update/)

## Know issues
* The system will need to be rebooted for the Teams install to kick off for the users (or all users need to logoff and login again).
  * You can manually force it to install for a user by running the Teams install check as the user `C:\Program Files (x86)\Teams Installer\Teams.exe --checkInstall`
  * You can check for errors for Teams not installing are here `C:\users\%username%\AppData\Local\SquirrelTemp\SquirrelSetup.log`

# DK_Win_Updates.ps1
This will check for updates and download and install them. It will list all the updates it finds. It will not check for Driver updates. It will then move on to installing those updates. Once done installing if the system needs a reboot it will reboot the system and give 5 min warning before the reboot.

* This has only been tested on Windows 10 / Windows 11 / Server 2016 / Server 2019 / Server 2022 / Server 2025 You should upgrade if you are running stuff older than that :P
* It may install a preview update but only if the preview update would normally be available if you clicked check for updates in the normal Windows update UI
* The Windows Updates history in Windows settings won't show the fact that the script has installed the updates, but if you look in Programs and Features > Installed Updates they will show up. They also show in event viewer.
* This won't look for driver updates.
## Future Plans
* better verbose output of the updates it is downloading and installing as it does them
* Output the verbose info to a log file to work better with some RMMs

# Nuke-Update-Settings.ps1
Nukes out the cached Windows update settings stored in GPCache and nukes out any WSUS settings.

# new-teams-bulk-install.ps1
This will download and install New Teams for all users.

This is only intended to be run on Windows 10 or Windows 11 systems.

- run as system or as administrator
- Downloads the latest Teams bootstrapper and the latest new Teams MSIX.
- Kill any running Microsoft Teams sessions be it new Teams or classic Teams.

[More detailed documentation](https://thedxt.ca/2024/03/new-teams-bulk-install-script/)

# new-teams-shortcut.ps1
This will create a shortcut for new Teams on the Public Desktop

- run as system or as administrator
- Creates a shortcut on the Public Dekstop to the URI of new Teams.

[More detailed documentation](https://thedxt.ca/2024/03/new-teams-desktop-shortcut/)
