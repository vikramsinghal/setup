#!/bin/bash

function getUDID {
  udid=($(system_profiler SPUSBDataType | grep -A 11 -w "iPad\|iPhone\|iPod\|AppleTV" | grep "Serial Number" | awk '{ print $3 }'))
  for id in "${udid[@]}"; do
  if [ ${#id} -eq 24 ]; then
  id=`echo $id | sed 's/\(........\)/\1-/'` # Add proper formatting for new-style UDIDs
  fi
  echo -n $id | pbcopy # Copy the UDID to the clipboard since we probably want to paste it somewhere.
  echo "$id"
  done
}

udid=$(getUDID)
echo "Device UDID is $udid"

if [ -z $udid ]; then
  echo "No device detected. Please ensure an iOS device is plugged in."
  exit 1
fi

product_version=`ideviceinfo -u $(getUDID) --simple | grep ProductVersion | awk '{print $2}'`
# device_name=`ideviceinfo -u $(getUDID) | grep DeviceName | awk '{print $2}'`
battery_level=`ideviceinfo -u $(getUDID) --domain com.apple.mobile.battery | grep BatteryCurrentCapacity | awk '{print $2}'`

#start loop

# echo "$(getUDID)"
#echo "Current battery level is" $battery_level"%"

if [[ $battery_level = 100 ]]; then
  echo "iOS $product_version is fully charged to 100%"
  exit
else
  echo "Device is not fully charged. Battery level of iOS "$product_version "is" $battery_level"%"
fi
echo "Let's check the next battery level in two minutes."

seconds=120
#echo "$seconds Seconds Wait!"
echo -n "One Moment please "
while [ $seconds -ge 1 ]; do
   printf -v j "%03d" $seconds
   echo -n "$j"
   sleep 1
   echo -en "\b\b\b"
   seconds=$[$seconds-1]
done

echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
echo "Ready!                                        "

current_battery_level=`ideviceinfo -u $(getUDID) --domain com.apple.mobile.battery | grep BatteryCurrentCapacity | awk '{print $2}'`
echo "Current battery level is" $current_battery_level"%"

if [[ $current_battery_level > $battery_level ]]; then
  echo "Battery is currently charging."
else
  echo "Battery either didn't charge or change percentage in last two minutes."
fi

battery_level=$current_battery_level

#end loop
