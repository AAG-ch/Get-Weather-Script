# Get-Weather-Script

Bash script to get current weather data from openweathermap.org and print it to stdout. Free openweathermap API key needed.

Prints output in metric system:

* Temperature, C
* Pressure, mm Hg
* Humidity, %
* Dew point, C
* Sunrise, hour
* Sunrise, minute
* Sunset, hour
* Sunset, minute

#### Prerequisites:
```
$ sudo apt-get install jq
$ sudo apt-get install bc
```

#### Usage:
```
$ chmod +x get-weather.sh
$ get-weather.sh longitude latitude APIkey
```

#### Example:
``` console
$ get-weather.sh 37.66 55.76 b6907d289e10d714a6e88b30761fae22
18.25
757.58
59
10.09
 4
58
20
08
$
```
