#!/bin/bash
. ./echo_green.sh --source-only

echo_green "Installing Docker..."
echo_green "At the end of this script, there are some commented commands to test Docker and to configure it to start on boot."
sleep 3

## Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo_green "Docker's official GPG key has been added."
sleep 2

## Add the repository to Apt sources:
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo_green "Docker has been installed."
sleep 2

## Verify that Docker is installed correctly by running the hello-world image
# sudo docker run hello-world

## Add your user to the docker group
sudo usermod -aG docker $USER

echo_green "Your user has been added to the docker group."
sleep 2

## Install Docker Compose
sudo apt install -y docker-compose
echo_green "Docker Compose has been installed."
sleep 2

## Install lazydocker (Docker GUI)
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
echo_green "Lazydocker has been installed."

## Test Docker without sudo
# docker run hello-world
## Troubleshooting
# sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
# sudo chmod g+rwx "$HOME/.docker" -R

## Configure Docker to start on boot
# sudo systemctl enable docker.service
# sudo systemctl enable containerd.service
## Don't start Docker on boot
# sudo systemctl disable docker.service
# sudo systemctl disable containerd.service
