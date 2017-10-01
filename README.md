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

#### Installation:

Copy or link the script to /usr/bin/ or /usr/local/bin 

Link:
`ln -s \<pathToRepository\>/LinuxUtil/grub/simple-reboot /usr/bin`

or

Copy:
`cp \<pathToRepository\>/LinuxUtil/grub/simple-reboot /usr/bin`

### boot-windows
A simple predefined script to boot into Windows.
This script requires simple-reboot to be installed and simply executes `simple-reboot Windows`
(Requires super user rights)

`boot-windows`

e.g. `sudo boot-windows`

#### Installation:

*Requires simple-reboot*

Copy or link the script to /usr/bin/ or /usr/local/bin 

Link:
`ln -s \<pathToRepository\>/LinuxUtil/grub/boot-windows /usr/bin`

or

Copy:
`cp \<pathToRepository\>/LinuxUtil/grub/boot-windows /usr/bin`


## Vim
### .vimrc
Slim configuration file for vim.
This configuration will:
- set cursorline visible
- changes cursorline from underline to highlight background in black
- set line numbers visible
- changes the color of the current line number to yellow and others to gray
- set spellcheck highlights to underline and to a red font color

#### Installation

Copy or link the configuration to ~/.vimrc or add the content to your current .vimrc

Link:
`ln -s \<pathToRepository\>/LinuxUtil/vim/.vimrc ~/.vimrc`

(Caution! This will overwrite any existing .vimrc script!)

or

Copy:
`cp \<pathToRepository\>/LinuxUtil/vim/.vimrc ~/.vimrc`

(Caution! This will overwrite any existing .vimrc script!)

or 

Append to existing file:
`cat \<pathToRepository\>/LinuxUtil/vim/.vimrc ~/.vimrc`

