#!/bin/bash
# ffmpegでmp4からm4a音声ファイルを取り出すshell script
# 使い方
#   path/to/tom4a.sh 変換したい動画ファイル
# output
#   拡張子以外の名前の部分はinput fileと同じ
#   拡張子はm4aになる
input="$1"
output=${input%.*}'.m4a'
ffmpeg -i "${input}" -vn -acodec copy "${output}"
exit 0