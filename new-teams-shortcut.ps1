# New Teams Public Desktop Shortcut
# author theDXT

#shortcut name
$short_name = "Microsoft Teams (work or school)"
#url for the shortcut
$URL = "msteams:/"

# define and call the Windows Shell
$Shell = New-Object -ComObject ("WScript.Shell")

# create and save the shortcut
$shortcut = $Shell.CreateShortcut("$env:Public\Desktop\$short_name.url")
$shortcut.TargetPath = $URL;
$shortcut.Save()
