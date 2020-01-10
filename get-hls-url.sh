#!/bin/bash
# youtube-liveのhls-urlを取得するためのshell script
#   取得されるhls-urlは最も解像度の低いもの
# 依存関係
#   yotube-dl
# 使い方
#   path/to/get-hls-url.sh youtube-live-url
youtube-dl -f 91 -g ${1}
exit 0