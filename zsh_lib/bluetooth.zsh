kill-bluetooth() {
  if [[ `uname -s` -ne "Darwin" ]]; then
    echo "This is meant for OS X only"
    return
  fi

  sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist ControllerPowerState 0
  sudo killall blued
  launchctl stop com.apple.blued
  launchctl unload /System/Library/LaunchDaemons/com.apple.blued.plist
}

start-bluetooth() {
  if [[ `uname -s` -ne "Darwin" ]]; then
    echo "This is meant for OS X only"
    return
  fi

  sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist ControllerPowerState 1
  launchctl load /System/Library/LaunchDaemons/com.apple.blued.plist
  launchctl start com.apple.blued
}
