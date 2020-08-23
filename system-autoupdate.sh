#!/bin/sh
TIMES=1d
if [ $(TZ=UTC+3 date +"%H") = 23 ]; then
    while [ true ]; do 
        # --------------------------------  
        OPENVERSION=$(wget -qO- http://api.github.com/repos/Sirherobrine23/WR941NDv3-OpenWRTBuild/releases | grep -o '"tag_name": ".*"' | head -n 1 | sed 's/"//g;s/v//g' | sed 's/tag_name: //g')
        [ -z $OPENVERSION ] && exit 1
        VERSIOSS=$(wget -qO- http://api.github.com/repos/Sirherobrine23/WR941NDv3-OpenWRTBuild/releases | grep -o '"browser_download_url": ".*"' | grep 'sysupgrade' | grep '.bin' | head -n 1 | sed 's/"//g;s/v//g' | sed 's/browser_download_url: //g')
        # --------------------------------
        sysupgrade -c "$VERSIOSS"
        sleep $TIMES
    done
else
 exit 127
fi