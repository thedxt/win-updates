# DK Win Updates
This will check for updates and download and install them. It will list all the updates it finds. It will not check for Driver updates. It will then move on to installing those updates. Once done installing if the system needs a reboot it will reboot the system and give 5 min warning before the reboot.

* This has only been tested on Windows 10 / Server 2016 / Server 2019. You should upgrade if you are running stuff older than that :P
* This can't detect Windows 10 Feature Updates / Upgrades
* It may install a preview update but only if the preview update would normally be available if you clicked check for updates in the normal Windows update UI
* The Windows Updates history in Windows settings won't show the fact that the script has installed the updates, but if you look in Programs and Features > Installed Updates they will show up. They also show in event viewer.
* This won't look for driver updates.
## Future Plans
* better verbose output of the updates it is downloading and installing as it does them
* Output the verbose info to a log file to work better with some RMMs

# Office 365 nice update
This will install Office updates on the system and will warn the user if they have Office open.

If the user has Office open they will see a message similar to this

![image](https://user-images.githubusercontent.com/4249262/114624998-d5121600-9c6e-11eb-8591-432d3c074969.png)


# Office 365 force update
This will force the install of Office updates on the system and it will not warn the user. It will just close the applications it needs to in order to install the update.

## Know issues
* The end usre may still see a screen that tells them Updates were installed.

![image](https://user-images.githubusercontent.com/4249262/114624847-8f554d80-9c6e-11eb-914f-f6ca8c81f10d.png)

# Teams MSI update
This will update the Teams Machine Wide MSI. It will just close Teams if the user has it open.

This resolves the Teams needs an update issue on shared PCs

![image](https://user-images.githubusercontent.com/4249262/218810874-8682eb7f-bd71-4707-a2a9-50501f32762e.png)

## Know issues
* The system will need to be rebooted for the Teams install to kick off for the users (or all users need to logoff and login again).
  * You can manually force it to install for a user by running the Teams install check as the user `C:\Program Files (x86)\Teams Installer\Teams.exe --checkInstall`
  * You can check for errors for Teams not installing are here `C:\users\%username%\AppData\Local\SquirrelTemp\SquirrelSetup.log`
