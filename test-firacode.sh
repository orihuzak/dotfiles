#!/bin/bash

# curl -L raw.githubusercontent.com/tonsky/FiraCode/master/distr/ttf/FiraCode-Bold.ttf | echo
# see https://wiki.debian.org/Fonts
for type in Bold Light Medium Regular Retina; do
    # for all usersのディレクトリに保存
    file_path="/usr/local/share/fonts/FiraCode-${type}.ttf"
    file_url="raw.githubusercontent.com/tonsky/FiraCode/master/distr/ttf/FiraCode-${type}.ttf"
    if [ ! -e "${file_path}" ]; then
        echo "wget -O $file_path $file_url"
        wget -O "${file_path}" "${file_url}"
    else
  echo "Found existing file $file_path"
    fi;
done