#!/bin/sh
LED="/sys/class/leds/tp-link:green:qss/brightness"
URL="http://apt.sh23.org/"
update_led="2s"
# Iniciando o loop
while [ true ]; do 
wget -q -O tested --spider "$URL"
if [ $? -eq 0 ]; then
  echo "1" > $LED
else
  echo "0" > $LED
fi
sleep $update_led
done
