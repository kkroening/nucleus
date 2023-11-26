## Create installation flash drive

-   Download official Windows iso
-   Install unetbootin
-   Create flash drive using unetbootin and Windows iso
-   Install `wimtools` (`brew install wimtools` on OS X)
-   Fix `sources/install.wim` file size (>4GB is too big for FAT32):
    ```bash
    rm /Volumes/usbflash/sources/install.wim
    wimsplit \
      /Volumes/winiso/sources/install.wim \
      /Volumes/usbflash/sources/install.swm \
      3000
    ```
-   Eject flash drive

## Install Windows

-   Boot from flash drive
-   Choose "I don't have a product key" (can be activated later)
-   Choose standard edition - no "Single Language" or "N" version or whatever.
-   After several restarts, when prompted with internet requirement for Microsoft Account login,
    hit Shift + F10 and run `OOBE\BYPASSNRO` and proceed without internet.
-   Note: You may need to also disable the network adapter through whatever various means.

### Alternative OOBE bypass methods

> **Note**: It's likely that the bypass method will break in the future, so some alternatives are below.

See [Windows 11 Setup Without Internet](https://www.minitool.com/news/windows-11-setup-without-internet.html) guide.

**Method 1** - `OOBE\\BYPASSNRO``:

-   Press Shift + F10 when prompted for internet/login
-   Run `OOBE\\BYPASSNRO`

**Method 2** - Task Manager:

-   Ctrl + Shift + Esc to open Task Manager
-   Kill _Network Connection Flow_ process

**Method 3** - End network connection:

-   Shift + F10
-   Run `taskkill /F /IM oobenetworkconnectionflow.exe`

**Method 4** - Alt + F4

-   Simply press Alt + F4 on the "Let’s connect you to a network" screen.

## Customize Windows

### System Settings

-   Taskbar settings
    -   Right-click taskbar => Taskbar settings
    -   Taskbar items => Search => Hide
    -   Taskbar items => All off
    -   Other system tray icons => Windows Security + Safely Remove Hardware on, all others off

    -   _(TODO)_
-   Night light

### Chrome

-   Use Edge to install Chrome, and don't be swayed by the pleas to stick with Edge
-   Set as default browser: Win + I => Default apps => Google Chrome => Set default
-   Launch Chrome
-   Chrome settings - `about:settings`
    -    Hamburger menu => Downloads => Ask where to save each file before downloading

### Performance monitoring

Install standard performance monitoring tools as soon as possible in order to keep an eye on important metrics such as temperature readings (especially for new machine build):

-   [CPU-Z](https://www.cpuid.com/softwares/cpu-z.html)
-   [GPU-Z](https://www.techpowerup.com/gpuz/)
-   [HWMonitor](https://www.cpuid.com/softwares/hwmonitor.html)
-   [Corsair iCUE](https://www.corsair.com/us/en/s/downloads)
-   [Samsung Magician](https://semiconductor.samsung.com/consumer-storage/magician/)
-   [ASRock Motherboard Utility ver:4.0.72](https://download.asrock.com/Utility/MotherboardUtility/MotherboardUtility(v4.0.72).zip)

> **Tip**: After installing each app, to prevent being prompted for administrator permission every time, right click each desktop icon and select properties.  Then in the shortcut => advanced settings, enable _Run as administrator_.

### Drivers

#### ASRock Z790 Nova

-   [Downloads page](https://pg.asrock.com/mb/Intel/Z790%20Nova%20WiFi/index.asp#Download)
    -   Update BIOS first, and then use ASRock auto-installer if possible.

#### NVIDIA

-   [NVIDIA Driver Downloads](https://www.nvidia.com/download/index.aspx)
-   _Optional_: [GeForce Experience](https://www.nvidia.com/en-us/geforce/drivers/) (automatic driver installer, etc.)

### De-bloating

-   Disable OneDrive nagging: Ctrl+Shift+Esc => Startup apps => Disable `OneDrive.exe`
-   Disable Edge:
    -   Ctrl+Shift+Esc => Startup apps => Disable `msedge.exe`
    -   _(TODO: additional Edge de-bloating)_
-   Disable start menu internet search spyware:
    -   Win+X => Terminal (Admin)
    -   ```
        reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f
        ```
