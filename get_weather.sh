#!/bin/bash
if [ "$#" -ne 3 ]; then
    echo "Illegal number of parameters"
	echo "Example:"
	echo "./lux_weather.sh 37.66 55.76 b6907d289e10d714a6e88b30761fae22"
    exit 98
fi

lon=$1
lat=$2
key=$3

data="$(curl -s "http://api.openweathermap.org/data/2.5/weather?lat=$2&lon=$1&appid=$3&units=metric")"
[ -z "$data" ] && { echo "error"; exit 99; }

temp="$(echo "$data" | jq -r '.main | .temp')"
pres="$(echo "$data" | jq -r '.main | .pressure' | awk '{print "scale=2; ("$1" * 0.75008)/1"}' | bc -l)"
hum="$(echo "$data" | jq -r '.main | .humidity')"

dewp_c="$(echo "(17.271*$temp)/(237.7+$temp) + l($hum/100)" | bc -l)"
dewp="$(echo "scale=2; 237.7*$dewp_c/(17.271-$dewp_c)" | bc -l)"

sunrise="$(echo "$data" | jq -r '.sys | .sunrise')"
sunrise_h="$(date -d "@$sunrise" +%k)"
sunrise_m="$(date -d "@$sunrise" +%M)"

sunset="$(echo "$data" | jq -r '.sys | .sunset')"
sunset_h="$(date -d "@$sunset" +%k)"
sunset_m="$(date -d "@$sunset" +%M)"

echo -e "$temp\n$pres\n$hum\n$dewp\n$sunrise_h\n$sunrise_m\n$sunset_h\n$sunset_m"