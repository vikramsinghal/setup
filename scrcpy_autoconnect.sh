# After connecting your android device to the internet, we need to get the IP of the device
adb kill-server
sleep 2
# getDeviceIP="$(adb shell ip route | awk '{print $9}' | sed -n '2p')"
getDeviceIP="$(adb shell ip route | awk '{print $9}')"
echo "The device IP is $getDeviceIP"
adb tcpip 5555
adb connect $getDeviceIP:5555
adb devices
echo "Now unplug your device and wait for 5 seconds..."
sleep 5
# for open_screen in {1..2}
# do
#     adb shell input keyevent 82
# done
# sleep 1
# adb shell input text '1234'
# adb shell input keyevent 66
# sleep 0.5
# scrcpy -w
