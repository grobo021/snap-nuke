#!/bin/bash
if [[ "$EUID" == 0 ]]
then 
cat << EOF
┌──────────────────────────────────────────────────────────────────────┐
│Please don't run this script as root as it may break you system.      │
│We will ask you for the password if we need root access.              │
└──────────────────────────────────────────────────────────────────────┘
┬─┬ ノ( ゜-゜ノ)
EOF
exit
fi

cat << EOF
┌──────────────────────────────────────────────────────────────────────┐
│This Bash Script is made by u/Techno021 to nuke snaps from Ubuntu.    │
│                                                                      │
│Note: This has only been tested on Ubuntu 20.04 LTS, and may not work │
│as intended on other versions. I will not be responsible for any      │
│damage if this script breaks your pc                                  │
└──────────────────────────────────────────────────────────────────────┘
EOF

while true; do
    read -p "Do you wish to run the script? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo snap remove $(snap list | awk '!/^Name|^core|^bare|^snapd/ {print $1}')
sudo snap remove $(snap list | awk '/^bare/ {print $1}')
sudo snap remove $(snap list | awk '/^core/ {print $1}')
sudo snap remove $(snap list | awk '/^snapd/ {print $1}')

for I in $(df -h | awk '/snap/ {print $6}')
do
    sudo umount $I
done

cat << EOF > nosnap.pref
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

sudo mv nosnap.pref /etc/apt/preferences.d/nosnap.pref

sudo apt-get purge snapd
rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/lib/snapd

cat << EOF
┌─────────────────────────────────────────────────────────────────────┐
│All Done! This script has succesfully completed, please reboot so    │
│that changes take effect.                                            │
└─────────────────────────────────────────────────────────────────────┘
(╯°□°）╯︵ ┴─┴ 
EOF
echo
