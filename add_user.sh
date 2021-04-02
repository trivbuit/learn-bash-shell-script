#/bin/bash

echo "Adding user $1"
useradd $1

echo "Change password for user $1"
passwd $1

echo "Adding user $1 to sudoers"
touch /etc/sudoers.d/client 
echo "$1 ALL = (ALL) NOPASSWD: ALL, !/sbin/reboot, !/sbin/shutdown, !/sbin/init ,!/usr/sbin/visudo, !/bin/su" > /etc/sudoers.d/client