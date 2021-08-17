#!/bin/bash

echo "Installing the vncserver ... "

sudo apt update
sudo apt install ubuntu-desktop
sudo apt install tightvncserver
sudo apt install gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal

sleep 1

vncserver :1

#nano ~/.vnc/xstartup

echo $'export XKL_XMODMAP_DISABLE=1 \n
unset SESSION_MANAGER \n
unset DBUS_SESSION_BUS_ADDRESS \n
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup \n
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources \n
xsetroot -solid grey \n
vncconfig -iconic & \n
gnome-panel & \n
gnome-settings-daemon & \n
metacity & \n
nautilus & \n
gnome-terminal &' > ~/.vnc/xstartup

vncserver -kill :1

vncserver :1

echo
echo "[+] setup is ready ! you can connect with public_ip:1 in VNC application"
echo
