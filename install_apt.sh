#!/bin/bash

. ./echo_green.sh --source-only

echo_green "Updating the system..."
sleep 1

# Update the system
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove
sudo apt autoclean
sudo apt clean
sudo fwupdmgr get-devices
sudo fwupdmgr get-updates
sudo fwupdmgr update

echo_green "The system has been updated."
sleep 2

# Install the basic packages
sudo apt install -y build-essential procps curl file git wget gparted htop bashtop net-tools nmap brightnessctl suckless-tools tree fzf autorandr openssh-server

# Install the development packages
sudo apt install -y python3 python3-pip python-is-python3 jq nodejs npm pandoc texlive-full texlive-xetex

# Install utils/ricing packages
sudo apt install -y bat bspwm cava cmatrix fdupes feh gh neofetch kitty picom polybar pulsemixer ranger rofi sxhkd tmux tty-clock vim zsh

# Flatpak set up
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo apt update -y
sudo apt dist-upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y

echo_green "The packages have been installed. Reboot the system to apply the changes."



## FUTURE
# sudo apt install virtualbox -y
# sudo apt install preload -y