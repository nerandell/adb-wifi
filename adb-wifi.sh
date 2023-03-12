#!/bin/bash

# Connect to Android device over WiFi using ADB

# Define help function
function show_help {
  echo "Usage: connect-to-device [options]"
  echo ""
  echo "Connect to an Android device over WiFi using ADB."
  echo ""
  echo "Options:"
  echo "  -h, --help       Display this help message."
  exit 0
}

# Parse command-line options
while [[ "$#" -gt 0 ]]; do
  case $1 in
  -h | --help) show_help ;;
  *)
    echo "Unknown option: $1. Use --help to see available options"
    exit 1
    ;;
  esac
done

# Get device IP address
device_ip=$(adb shell ifconfig wlan0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1 }')

if [ -z "$device_ip" ]; then
  echo "No device is connected via USB. Connect a device and try again."
  exit 1
fi

# Set the device to listen for ADB commands on TCP port 5555
adb tcpip 5555

# Connect to device over WiFi
adb connect $device_ip:5555

# Check connection status
if adb devices | grep $device_ip >/dev/null; then
  echo "Device connected via WiFi. You can remove the USB. To disconnect, use: adb disconnect"
else
  echo "Failed to connect to device via WiFi"
fi
