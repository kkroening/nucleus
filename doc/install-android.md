# Android setup guide

## Unlock / root device

> [!WARNING]
> Rooting the Android device results in all data being wiped (by design, for security/privacy reasons) so this should ideally be done early in the device setup process.

Reference: [Unlock Bootloader + Root Google Pixel Tablet with Magisk](https://xdaforums.com/t/guide-unlock-bootloader-root-google-pixel-tablet-with-magisk-adb-fastboot-command-lines.4615841/)

High-level steps:

-   Perform minimal Android device setup - e.g. skip Wi-Fi configuration, skip Google sign-in, etc. since everything will be wiped anyways.
-   Note current Android build number.
-   Enable USB debugging and allow unsigned APK installation via USB.
-   Unlock bootloader
-   [Download factory image](https://developers.google.com/android/images?hl=en#tangorpro) to PC.
    -   _(optional)_: If updating to a different/newer factory image, then it's worthwhile to do the ordinary flashing process _before_ doing the rooting-specific steps.  In this case, extract the factory image and run `./flash-all.sh`.  Then repeat the above steps.  ALL EXISTING DATA WILL BE ERASED ON THE DEVICE.
-   Extract `init_boot.img` from factory image on PC.
-   Copy `init_boot.img` from PC to Android device (`adb push init_boot.img /storage/emulated/0/Download/`)
-   [Download Magisk](https://github.com/topjohnwu/Magisk/releases) APK to PC and install with `adb install ...`
-   Launch Magisk on Android and tap "Installer" next to Magisk.  Select and patch file.
-   Copy patched boot image from Android to PC via `adb pull ...`
-   Update the image zip file to contain the pathched `init_boot.img`
-   Run `./flash-all.sh`
-   Confirm that the device is now rooted by running `adb shell` and then `su`.  The device will show a confirmation prompt to allow root access.

## Termux

Install [Termux](https://termux.dev/en/).

#### Download APK from GitHub releases

Download the APK from the [Termux GitHub releases page](https://github.com/termux/termux-app/releases).

#### Alternate: Download APK from F-Droid

An alernate method is by downloading the [APK from F-Droid](https://f-droid.org/en/packages/com.termux/).  The benefit of doing so is that the APK is signed with the production key, but the downside is that the binaries are non-debuggable.

---

Launch Termux on the device, and then perform basic setup:

```bash
termux-change-repo  # select North America mirror group
pkg update
pkg upgrade
termux-setup-storage
```

### Install common Termux packages

```bash
pkg install mandoc
pkg install sudo
pkg install wget
pkg install which
```

#### `lsusb`

```bash
pkg install termux-api libusb clang
```

## System preferences

Settings => Sound
-   Screen locking sound: off
-   Charging sounds: off
-   Docking sounds: off
-   Tap & click sounds: off

