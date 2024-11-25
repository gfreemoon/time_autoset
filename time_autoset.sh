#!/bin/bash

while ! ping -c 1 -W 1 google.com &> /dev/null; do
    echo "Awaiting internet connection..."
    sleep 5
done

# in "print $1-0", 0 is the timezone change in seconds (for example, "print $1-3600" will result in -1 hour change)
curl -s 'http://worldclockapi.com/api/json/utc/now' | \
grep -oP '"currentFileTime":\s*\K\d+' | \
awk '{print "scale=0; (" $1 "/10000000 - 11644473600) / 1"}' | \
bc | \
awk '{print $1-0}' | \
xargs -I {} date --set @{}
