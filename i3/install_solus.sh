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

# Install i3-GNOME
echo Installing i3-GNOME..
sudo git clone https://github.com/jcstr/i3-gnome.git $I3GNOME
cd $I3GNOME
make install

# Installing dependencies (rofi, compton, font-awesome-4)
echo Installing dependencies \(rofi, compton, font-awesome-4\)
sudo eopkg install -y rofi compton font-awesome-4



if [ -f /home/$SUDO_USER/.config/i3/config ]; then
	echo Found existing i3 config
	echo -\> Backup i3 config to /home/$SUDO_USER/backup/i3/config
	sudo -u $SUDO_USER mkdir -p /home/$SUDO_USER/backup/i3
	sudo -u $SUDO_USER cp /home/$SUDO_USER/.config/i3/config /home/$SUDO_USER/backup/i3/config
fi
echo Installing i3 config
sudo -u $SUDO_USER mkdir -p /home/$SUDO_USER/.config/i3
sudo -u $SUDO_USER cp config /home/$SUDO_USER/.config/i3/config

if [ -f /home/$SUDO_USER/.i3status.conf ]; then
	echo Found existing i3 status config
	echo -\> Backup i3 config to /home/$SUDO_USER/backup/i3/i3status.conf
	sudo -u $SUDO_USER mkdir -p /home/$SUDO_USER/backup/i3
	sudo -u $SUDO_USER cp /home/$SUDO_USER/.i3status.conf /home/$SUDO_USER/backup/i3/i3status.conf
fi
echo Installing i3status.conf
sudo -u $SUDO_USER cp i3status.conf /home/$SUDO_USER/.config/i3/i3status.conf
sudo -u $SUDO_USER cp lock.png /home/$SUDO_USER/.config/i3/

echo Installing darkdawn.rasi theme
sudo mkdir /usr/share/rofi/themes/
sudo cp rofi/darkdawn.rasi /usr/share/rofi/themes/
echo Setting darkdawn.rasi as default rofi theme

sudo -u $SUDO_USER mkdir -p /home/$SUDO_USER/.config/rofi
sudo echo rofi.theme: /usr/share/rofi/themes/darkdawn.rasi  >> /home/$SUDO_USER/.config/rofi/config

echo Installation is finished
