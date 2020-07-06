#!/bin/bash

# function getUDID {
#   udid=($(system_profiler SPUSBDataType | grep -A 11 -w "iPad\|iPhone\|iPod\|AppleTV" | grep "Serial Number" | awk '{ print $3 }'))
#   for id in "${udid[@]}"; do
#   if [ ${#id} -eq 24 ]; then
#   id=`echo $id | sed 's/\(........\)/\1-/'` # Add proper formatting for new-style UDIDs
#   fi
#   echo -n $id | pbcopy # Copy the UDID to the clipboard since we probably want to paste it somewhere.
#   echo "$id"
#   done
# }

# getUDID=$(ideviceinfo | grep UniqueDeviceID | awk '{print $2}')
# echo $getUDID

# if [ -z $getUDID ]; then
#   echo "No device detected. Please ensure an iOS device is plugged in."
#   exit 1
# fi

# product_version=`ideviceinfo -u $(getUDID) --simple | grep ProductVersion | awk '{print $2}'`
# echo $product_version
# device_name=`ideviceinfo -u $(getUDID) | grep DeviceName | awk '{print $2}'`
battery_level=`ideviceinfo --domain com.apple.mobile.battery | grep BatteryCurrentCapacity | awk '{print $2}'`
echo "Current battery level is: $battery_level%"