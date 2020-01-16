#!/bin/bash
# 現状使えない
#   font fileのダウンロードはできるけど使用できない
# A shell script to install Firacode font manually
# Firacode
#   https://github.com/tonsky/FiraCode
# How to install fonts for debian
#   https://wiki.debian.org/Fonts
# firacode_2.zip
# https://github.com/tonsky/FiraCode/releases/download/2/FiraCode_2.zip

curl -OL https://github.com/tonsky/FiraCode/releases/download/2/FiraCode_2.zip
unzip FiraCode_2.zip -d FiraCode_2
sudo cp ./FiraCode_2/otf/* /usr/local/share/fonts
sudo fc-cache -fv
# if you want to remove  FiraCode_2.zip and ./FiraCode_2 directory, remove comment out below
# sudo rm -r ./FiraCode_2.zip ./FiraCode_2
