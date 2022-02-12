#!/bin/bash
sudo snap remove $(snap list | awk '!/^Name|^core|^bare|^snapd/ {print $1}')
sudo snap remove $(snap list | awk '/^bare/ {print $1}')
sudo snap remove $(snap list | awk '/^core/ {print $1}')
sudo snap remove $(snap list | awk '/^snapd/ {print $1}')

for VARIABLE in $(df -h | awk '/snap/ {print $6}')
do
        sudo umount $VARIABLE
done

sudo cp nosnap.pref /etc/apt/preferences.d/nosnap.pref

sudo apt-get purge snapd
rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/lib/snapd
