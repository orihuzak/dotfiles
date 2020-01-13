#!/bin/bash
# A shell script to install Firacode font manually
# Firacode
#   https://github.com/tonsky/FiraCode
# How to install fonts for debian
#   https://wiki.debian.org/Fonts

fonts_dir="usr/local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
    echo "mkdir -p $fonts_dir"
    mkdir -p "${fonts_dir}"
else
    echo "Found fonts dir $fonts_dir"
fi

# see https://wiki.debian.org/Fonts
for type in Bold Light Medium Regular Retina; do
    # for all usersのディレクトリに保存
    file_path="/usr/local/share/fonts/FiraCode-${type}.ttf"
    file_url="raw.githubusercontent.com/tonsky/FiraCode/master/distr/ttf/FiraCode-${type}.ttf"
    if [ ! -e "${file_path}" ]; then
      echo "curl -o $file_path $file_url"
      curl -o "$file_path" "$file_url"
    else
      echo "Found existing file $file_path"
    fi;
done

echo "fc-cache -f"
fc-cache -f