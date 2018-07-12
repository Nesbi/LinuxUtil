#!/usr/bin/env sh

###########################
## My i3 install - Solus ##
###########################

# Variables and folders
CURRENT=$PWD
I3GNOME=/opt/i3-gnome/

# Install i3
echo Installing i3..
sudo eopkg install -y i3
echo finished

# Install i3-GNOME
echo Installing i3-GNOME..
sudo git clone https://github.com/jcstr/i3-gnome.git $I3GNOME
cd $I3GNOME
make install
echo finished

sudo eopkg install -y rofi compton font-awesome-ttf
if [ -f /home/$SUDO_USER/.config/i3/config]; then
	echo Found existing i3 config
	echo -\> Backup i3 config to /home/$SUDO_USER/backup/i3/config
	sudo -u $SUDO_USER mkdir -p /home/$SUDO_USER/backup/i3
fi

echo Installing darkdawn.rasi theme
sudo -u $SUDO_USER cp rofi/darkdawn.rasi /usr/share/rofi/themes/
echo Setting darkdawn.rasi as default rofi theme
sudo echo rofi.theme: /usr/share/rofi/themes/darkdawn.rasi  >> /home/$SUDO_USER/.config/rofi/config

echo Installation is finished
