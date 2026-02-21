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

> [!NOTE]
> It's likely that the bypass method will break in the future, so some alternatives are below.

See [Windows 11 Setup Without Internet](https://www.minitool.com/news/windows-11-setup-without-internet.html) guide.

**Method 1** - `OOBE\BYPASSNRO`:

-   Press Shift + F10 when prompted for internet/login
-   Run `OOBE\BYPASSNRO`

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

### Disable Capslock Permanently

-   Install [PowerToys](https://learn.microsoft.com/en-us/windows/powertoys/install).
-   Open **Keyboard Manager**.
-   Click **Remap a key** and map **Caps Lock** to **Disable (Unassigned)**.

### Windhawk

-   Install [Windhawk](https://windhawk.net/)
-   Add _Taskbar keyboard-only auto-hide_ mod to prevent mouse cursor from accidentally un-hiding
    the taskbar - i.e. require pressing Windows key to un-hide taskbar.

### Performance monitoring

Install standard performance monitoring tools as soon as possible in order to keep an eye on important metrics such as temperature readings (especially for new machine build):

-   [CPU-Z](https://www.cpuid.com/softwares/cpu-z.html)
-   [GPU-Z](https://www.techpowerup.com/gpuz/)
-   [HWMonitor](https://www.cpuid.com/softwares/hwmonitor.html)
-   [Corsair iCUE](https://www.corsair.com/us/en/s/downloads)
-   [Samsung Magician](https://semiconductor.samsung.com/consumer-storage/magician/)
-   [ASRock Motherboard Utility ver:4.0.72](https://download.asrock.com/Utility/MotherboardUtility/MotherboardUtility(v4.0.72).zip)

> **Tip**: After installing each app, to prevent being prompted for administrator permission every time, right click each desktop icon and select properties.  Then in the shortcut => advanced settings, enable _Run as administrator_.

## Drivers

### ASRock Z790 Nova

-   [Downloads page](https://pg.asrock.com/mb/Intel/Z790%20Nova%20WiFi/index.asp#Download)
    -   Update BIOS first, and then use ASRock auto-installer if possible.

### NVIDIA

-   [NVIDIA Driver Downloads](https://www.nvidia.com/download/index.aspx)
-   _Optional_: [GeForce Experience](https://www.nvidia.com/en-us/geforce/drivers/) (automatic driver installer, etc.)

#### Logitech Keyboard + Mouse

-   [Logitech G HUB](https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exeq)

## De-bloating

-   Disable OneDrive nagging: Ctrl+Shift+Esc => Startup apps => Disable `OneDrive.exe`
-   Disable Edge:
    -   Ctrl+Shift+Esc => Startup apps => Disable `msedge.exe`
    -   _(TODO: additional Edge de-bloating)_
-   Disable start menu internet search spyware:
    -   Win+X => Terminal (Admin)
    -   ```
        reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f
        ```

## Additional Software

### Chrome

-   Use Edge to install Chrome, and don't be swayed by the pleas to stick with Edge
-   Set as default browser: Win + I => Default apps => Google Chrome => Set default
-   Launch Chrome
-   Chrome settings - `about:settings`
    -    Hamburger menu => Downloads => Ask where to save each file before downloading

### Steam

-   Install [Steam](https://store.steampowered.com/about/)
-   In **Steam** -> **Settings** -> **Interface**, uncheck _"Notify me about additions or changes to my games, new releases, and upcoming releases**"_.

### OpenJDK

[Install OpenJDK](https://learn.microsoft.com/en-us/java/openjdk/install)

```bash
winget search Microsoft.OpenJDK
winget install Microsoft.OpenJDK.21  # adjust as needed
```

## WSL2

### Install WSL2

```powershell
wsl --install
```

### Debian

#### Install Debian:

```powershell
wsl --install Debian
```

#### Update packages:

```powershell
wsl
```

```bash
sudo apt update
sudo apt upgrade
```

### Enable systemd

Add the following in `/etc/wsl.conf`:

```init
[boot]
systemd=true
```

### Enable SSH server

#### Install `openssh-server`:

In a WSL shell, install `openssh-server`:

```bash
sudo apt install jq openssh-server
sudo service ssh start
```

#### _Optional_: Disable MOTD banner:

Disable the hideous "ABSOLUTELY NO WARRANTY" message banner:

```bash
sudo rm /etc/motd
```

#### Configure firewall:

-   Open Windows Firewall and click on "Advanced settings".
-   Inbound Rules > New Rule.
-   Select Port, click Next, and specify the SSH port (default is 22).
-   Allow the connection, and make sure it applies to Domain, Private, and Public.
-   Name the rule (e.g., "WSL2 SSH").

#### Configure netsh portproxy:

Determine the WSL VM's internal IP address by running `ip addr | grep 'inet 172'` in WSL - e.g. `172.28.43.167`.

Then outside of WSL, configure a netsh portproxy:

```bash
netsh interface portproxy add v4tov4 ssh 172.21.229.68 ssh

```

> [!NOTE]
> The portproxy setting survives reboots, but WSL IP addresses change frequently, so you'll need to reconfigure the portproxy by using `netsh interface portproxy delete v4tov4 ssh` and then repeating the aforementioned steps.

#### Configure `~/.ssh/authorized_keys`:

Enabling password-based login can help with bootstrapping the authorized keys:

```bash
sudo vi /etc/ssh/ssd_config
# (Enable `PasswordAuthentication`)
sudo service ssh restart
```

Determine the main Windows (not WSL) IP address by running `ipconfig` - e.g. `192.168.1.214`.

Connect via ssh using a password to populate the `~/.ssh/authorized_keys` file with your public key - e.g. `~/.ssh/id_rsa.pub`:

```bash
cat ~/.ssh/id_rsa.pub | pbcopy
ssh 192.168.1.214
umask 077
mkdir -p ~/.ssh
vi ~/.ssh/authorized_keys
# (paste public key)
```

_Optional_: Disable password-based login by disabling `PasswordAuthentication` as described above.

#### Confirm SSH setup:

Confirm that you can connect using passwordless login:

```bash
ssh 192.168.1.214
```

#### _Optional_: Configure DHCP and DNS:

Consider enabling DHCP in your router settings so that Windows gets a predictable IP address.  Then also configure DNS either in your router settings, or by writing an entry in `/etc/hosts`.

### Perform standard Nucleus setup for Debian

Refer to [install-debian.md](./install-debian.md).

### Additional WSL-specific Debian setup:

#### _Nvidia-only_: Link `nvidia-smi`:

```bash
ln -s /usr/lib/wsl/lib/nvidia-smi ~/bin/
```

> [!WARNING]
> As mentioned in the [CUDA on WSL User Guide](https://docs.nvidia.com/cuda/wsl-user-guide/index.html#cuda-support-for-wsl-2):
>
> > users must not install any NVIDIA GPU Linux driver within WSL 2. One has to be very careful here as the default CUDA Toolkit comes packaged with a driver, and it is easy to overwrite the WSL 2 NVIDIA driver with the default installation.
>

## Docker

Install [Docker Desktop on Windows](https://docs.docker.com/desktop/install/windows-install/) and follow all the prompts, selecting WSL2 as the backend.

Once Docker Desktop is running, in the settings => Resources => WSL Integration, check "Enable integration with additional distros."

### Configure symlink(s)

You might encounter errors like this when running `docker build ...` when connecting to WSL2 over ssh:

```
error getting credentials - err: exec: "docker-credential-desktop.exe": executable file not found in $PATH
```

Apparently WSL2 sets additional environment variables when running a shell locally, as compared to connecting via ssh, and part of the shell setup includes adjusting `$PATH` to point to additional Docker binaries.  One in particular is the `docker-credential-desktop.exe`.  It's not clear when/where/why/how this `$PATH` setup happens, but a targeted workaround is to symlink the file into `~/bin`:

```bash
ln -s /mnt/c/Program\ Files/Docker/Docker/resources/bin/docker-credential-desktop.exe ~/bin/
```

> [!NOTE]
> The entire directory could be added to the path, but it's probably better to be a bit more targeted here with the least amount of additional system customization.
