for open_screen in {1..2}
do
    adb shell input keyevent 82
done
sleep 1
adb shell input text '1234'
adb shell input keyevent 66
sleep 0.5
scrcpy -w