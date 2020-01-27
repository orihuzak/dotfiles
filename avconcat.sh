#!/bin/bash
# ffmpegでvideoやaudioファイルを連結するshell script
# 使い方
#   ~/mylist.txtに連結したいファイルを書き込む
#   path/to/avconcat.sh output

ffmpeg -f concat -safe 0 -i ~/mylist.txt -c copy ${1}
exit 0