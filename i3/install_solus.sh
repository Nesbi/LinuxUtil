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

echo Installation is finished
