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
