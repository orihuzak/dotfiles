#!/bin/bash
# 参考 https://www.axon.jp/entry/2018/10/18/201812
# you can get other versions from https://github.com/adobe-fonts/source-han-code-jp/releases
curl -OL https://github.com/adobe-fonts/source-han-code-jp/archive/2.011R.tar.gz
tar zxf 2.011R.tar.gz
sudo cp ./source-han-code-jp-2.011R/OTF/* /usr/local/share/fonts
sudo fc-cache -fv
# if you want to remove ./source-han-code-jp-2.011R, remove comment out below
# sudo rm -r ./source-han-code-jp-2.011R