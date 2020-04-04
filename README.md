# LinuxUtil
Small script and configuration files for Linux

## Grub2
### simple-reboot
Simple script for rebooting into a different operating system.
The script will search the boot entries for a set keyword.
It will select the first entry that contains said keyword and reboot the system into it.
(Requires super user rights)

`simpler-reboot <keyword>`

e.g. `sudo simple-reboot Windows` will boot into the first Grub entry that contains the word Windows


## Git
### gitstatus / gitpull / gitpush
A simple predefined script to check the status of multiple git repositories at once.
This script will check in every provided folder and return the status.

`gitstatus <repo>`

e.g. `gitstatus Git/*`


## apt
### search
A simple predefined script to format the apt-cache search for better readability and highlighted search term.
(Inspired by eopkg search from Solos)

```
<package name>       - <description>
<package name>       - <description>
<package name>       - <description>
```

`search <params>`

e.g. `search nodejs
`

## status\_bar
### status
A simple script to display the current system status for systembars like i3status or swaybar.


