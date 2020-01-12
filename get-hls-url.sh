#!/bin/bash
# youtube liveのhls urlを取得するためのshell script
#   フォーマット
#     動画と音声が含まれる単一ファイルの最高品質のもの
# 依存関係
#   youtube-dl
# 使い方
#   path/to/get-hls-url.sh youtube-live-url
youtube-dl -f best -g ${1}
exit 0