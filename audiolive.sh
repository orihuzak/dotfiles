#!/bin/bash
# youtube liveの最高品質のhls urlを取得して、vlcで開く
url=`youtube-dl -f best -g $1`
vlc -vvv --no-video $url
exit 0