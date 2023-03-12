# adb-wifi

`adb-wifi` enables you to send commands to an Android device over WiFi using ADB. It assumes that the
device is initially connected to the computer via USB, and that the device's WiFi interface is named `wlan0`. If your
setup is different, you may need to modify the script accordingly.

## Installation

### Option 1: Clone the repository

1. Clone or download the repository to your computer.

```bash
git clone https://github.com/nerandell/adb-wifi.git
```

2. Change into the `adb-wifi` directory.

```bash
cd adb-wifi
```

3. Make the script executable.

```bash
chmod +x adb-wifi.sh
```

### Option 2: Install via Homebrew

1. Tap the Homebrew repository that hosts the adb-wifi script by running the following command:

```bash
brew tap nerandell/adb
```

2. Install the adb-wifi script by running the following command:

```bash
brew install adb-wifi
```

3. Verify that the script is installed by running the following command:

```bash
which adb-wifi
```

The output should be `/usr/local/bin/adb-wifi`.

## Usage

1. Connect your Android device to your computer via USB and make sure that USB debugging is enabled in the device's
   developer options.

2. Run the script by typing `adb-wifi` in a terminal window.

3. The script will disconnect the USB cable from the device, obtain the device's IP address, and then connect to the
   device over WiFi using ADB.

## License

This script is licensed under the [MIT License](LICENSE).
