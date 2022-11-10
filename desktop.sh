#!/bin/bash

wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
sudo apt update && sudo apt upgrade
sudo apt install -y slim
sudo apt install -y ubuntu-desktop
sudo reboot
