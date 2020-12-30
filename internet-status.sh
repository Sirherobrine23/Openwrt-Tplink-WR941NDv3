#!/bin/sh
LED="/sys/class/leds/tp-link:green:qss/brightness"
URL="http://ftp.debian.org"
update_led="1s"
# Starting the loop
while [ true ]; do 
if wget -q -O /tmp/tested --spider "$URL"; then
  echo "1" > $LED
else
  echo "0" > $LED
fi
sleep $update_led
done
