#!/bin/bash

# Environment
# Update System
apt update && apt upgrade

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Tools
cd ~ 
mkdir Tools && cd Tools

# dirsearch
git clone https://github.com/maurosoria/dirsearch.git

# Stegsolver
wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar
chmod +x stegsolve.jar

# bettercap
apt install golang git build-essential libpcap-dev libusb-1.0-0-dev libnetfilter-queue-dev
go get -u github.com/bettercap/bettercap

# pwntools
apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev

# radare2
git clone https://github.com/radareorg/radare2
bash ./radare2/sys/install.sh

# gef
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# you may also want to install cutter
