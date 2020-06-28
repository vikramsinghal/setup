wifi_name=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}')
echo "Current network or wifi you are connected to$wifi_name"
get_wifi=$(security find-generic-password -ga $wifi_name | grep password)
# echo "Your password '${get_wifi}' has been copied to the clipboard."
# echo $get_wifi | pbcopy