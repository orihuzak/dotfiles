#!/bin/bash
# install python3.8 for debian
#   see https://tecadmin.net/install-python-3-8-ubuntu/
# python3の最新のソースリリースはここをみる
#   https://www.python.org/downloads/source/
#   ここから任意のリリースのdownload urlを取ってこれる
#   
sudo apt install build-essential checkinstall
sudo apt install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
cd /opt
sudo wget https://www.python.org/ftp/python/3.8.1/Python-3.8.1.tgz
sudo tar xzf Python-3.8.1.tgz
cd Python-3.8.0
sudo ./configure --enable-optimizations
sudo make altinstall

# remove downloaded archive
cd /opt
sudo rm -f Python-3.8.0.tgz
