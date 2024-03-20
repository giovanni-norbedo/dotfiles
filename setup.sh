#!/bin/bash

## Check if user is in sudo group

## Add contrib non-free after main
# sudo nano /etc/apt/sources.list
# sudo apt update
# sudo apt upgrade
# sudo reboot

## Set up ufw firewall

## Set journalctl to use less space
# sudo journalctl --vacuum-time=3d

## Change the delay value to 0 seconds, by setting GRUB_TIMEOUT=2
# sudo nano /etc/default/grub
# sudo update-grub

## Enable universe and multiverse repositories
# sudo add-apt-repository universe
# sudo add-apt-repository multiverse
# sudo apt update

## Set up Git username and email
# git config --global user.name "my-username"
# git config --global user.email "my@email"

## Install the restricted extras (codecs, etc.)
# sudo apt-get install ubuntu-restricted-extras

## Set up regular backups

## Change passwords

## Set up SSH keys

## Set up TLP
# sudo apt update
# sudo apt install tlp tlp-rdw
# sudo tlp start

# sudo dpkg-reconfigure --priority=low unattended-upgrades