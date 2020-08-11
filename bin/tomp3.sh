#!/bin/bash
# ffmpegでmp4をmp3に変換するscript
# 使い方
#   path/to/tomp3.sh 変換したい動画ファイル
# output
#   拡張子以外の名前の部分はinputと同じ
#   拡張子はmp3になる
input="$1"
output=${input%.*}'.mp3'
ffmpeg -i "${input}" -vn -f mp3 "${output}"
exit 0