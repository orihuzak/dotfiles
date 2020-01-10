#!/bin/bash
# ffmpegでvideoファイルをmp3に変換する実行文を短く書くためのshell script
# 使い方
#   path/to/tomp3.sh 変換したい動画ファイル
# 出力
#   拡張子以外の部分はinputファイルと同じ
#   拡張子はmp3になる
input="$1"
output=${input%.*}'.mp3'
ffmpeg -i "${input}" -vn -f mp3 "${output}"
exit 0