#!/bin/bash

# Environment
# Update System
sudo apt update && apt upgrade
sudo apt install curl -y
sudo curl https://raw.githubusercontent.com/ya0guang/InitScripts/master/apt_common.sh | bash

# Docker
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io


# Install Tools
cd ~ 
mkdir Tools && cd Tools

# dirsearch
git clone https://github.com/maurosoria/dirsearch.git

# Stegsolver
wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar
chmod +x stegsolve.jar

# bettercap
sudo apt install golang git build-essential libpcap-dev libusb-1.0-0-dev libnetfilter-queue-dev
go get -u github.com/bettercap/bettercap

# pwntools
sudo apt install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev

# radare2
git clone https://github.com/radareorg/radare2
cd ./radare2
bash ./sys/install.sh
cd ..
# you may also want to install cutter

# gef
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# vuls
sudo systemctl start docker
git clone https://github.com/vulsio/vulsctl.git
cd ./vulsctl
bash ./update-all.sh
cd ..
# refer to https://github.com/vulsio/vulsctl for detailed settings

# Sn1per https://github.com/1N3/Sn1per
Download https://raw.githubusercontent.com/1N3/Sn1per/master/Dockerfile
docker build -t sn1per . 
docker run -it sn1per /bin/bash

