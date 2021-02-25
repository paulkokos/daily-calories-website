#!/bin/bash

#Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them:
sudo apt-get remove docker docker-engine docker.io containerd runc

#Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Verify that you now have the key with the fingerprint <9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88>, by searching for the last 8 characters of the fingerprint.
sudo apt-key fingerprint 0EBFCD88

#List the versions available in your repo:
apt-cache madison docker-ce

#Use the following command to set up the stable repository.

#sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
sudo apt-get install docker-ce=5:20.10.3~3-0~ubuntu-focal docker-ce-cli=5:20.10.3~3-0~ubuntu-focal containerd.io
#Verify that Docker Engine is installed correctly by running the hello-world image.
sudo docker run hello-world

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

#If you would like to use Docker as a non-root user, you should now consider adding your user to the “docker” group with something like:
sudo usermod -aG docker "$USER"

# shellcheck disable=SC2046
docker build -t rails-toolbox --build-arg USER_ID=$(id -u)  --build-arg GROUP_ID=$(id -g) -f Dockerfile.rails .
