# Installation notes - Debian

This guide applies to multiple Debian variants, including (but not limited to) Raspberry Pi OS,
Ubuntu, etc.

>   [!NOTE]
>   This instructions in this guide have not been exercised for a while, and may be outdated.


## Raspberry Pi disk image

_(Skip this section for non- Raspberry Pi)_

For Raspberry Pi setup, use [Raspberry Pi Imager](https://www.raspberrypi.com/software/) on a host
system (e.g. `brew install raspberry-pi-imager` on OS X) to create the base image, and customize as
desired.

Notes:
*   Enable ssh server, and optionally pre-register public key


## Install Debian packages

```bash
sudo apt update
sudo apt install \
  build-essential \
  curl \
  dnsutils \
  git \
  htop \
  jq \
  man \
  pyflakes3 \
  vim-nox \
  shfmt \
  wget

sudo update-alternatives --set editor /usr/bin/vim.nox
```


## Git

### Git config

```bash
git config --global user.email "***@***"  # (redacted)
git config --global user.name "Karl Kroening"
git config --global core.excludesfile ~/.global_gitignore
```

### Add GitHub SSH key

Run the following and then paste into github:

```bash
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub | pbcopy
```


## Nucleus installation - shell customization, Vim configuration, etc.

[Nucleus](https://github.com/kkroening/nucleus) includes shell setup/customization, Vim configuration, etc.

```bash
git clone https://github.com/kkroening/nucleus.git ~/nucleus

cd ~/nucleus
git submodule update --init

mkdir -p \
  ~/.bash_profile.d \
  ~/.vim/autoload \
  ~/.vim/bundle \
  ~/.vim/ftplugin \
  ~/bin

ln -s ~/nucleus/.bashrc ~/.bashrc
ln -s ~/nucleus/.bash_profile ~/.bash_profile
ln -s ~/nucleus/.bash_profile.d/* ~/.bash_profile.d/
ln -s ~/nucleus/.global_gitignore ~/.global_gitignore
ln -s ~/nucleus/.vim/autoload/* ~/.vim/autoload/
ln -s ~/nucleus/.vim/bundle/* ~/.vim/bundle/
ln -s ~/nucleus/.vim/ftplugin/* ~/.vim/ftplugin/
ln -s ~/nucleus/.vimrc ~/.vimrc
ln -s ~/nucleus/keygen/keygen.py ~/bin/key
ln -s ~/nucleus/.jupyter/lab/user-settings ~/.jupyter/lab/
```


## Python

### Install pyenv

Perform the `apt-get install` commands listed in pyenv's [Suggested build environment] article
first.

**For example** (subject to change):

```bash
sudo apt update
sudo apt install -y \
  build-essential \
  curl \
  git \
  libbz2-dev \
  libffi-dev \
  liblzma-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libzstd-dev \
  llvm \
  make \
  tk-dev \
  xz-utils \
  zlib1g-dev
```

>   [!NOTE]
>   The above pyenv prerequisite apt package list above will likely change over time, and may be
>   inaccurate by the time you're reading this.  Refer to the [Suggested build environment] and
>   [Common build problems] articles.
>
>   (TBD: `libncurses5-dev`, `python-openssl`, `wget` were needed in the past)

Then fetch and launch the [pyenv installer]:

```bash
curl https://pyenv.run | bash
```

>   [!NOTE]
>   The pyenv installer output suggests shell profile/init changes, but it should all be handled
>   already via the Nucleus setup instructions (assuming you didn't skip it).

Finally, set vim as the default editor:

```bash
sudo update-alternatives --config editor
```

### Install Python

With pyenv now installed, use pyenv to install/configure Python itself:

```bash
(
  unset PIP_REQUIRE_VIRTUALENV 2>/dev/null
  pyenv install 3.14.6
  pyenv shell 3.14.6
  pip install -U pip
  pip install -U virtualenv
  # pip install -U readline  # TBD: maybe no longer necessary
  pyenv global 3.14.6

  cd ~/nucleus
  python -m .venv .venv
  .venv/bin/pip install -r requirements.txt
)
```

[Suggested build environment]: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
[Common build problems]: https://github.com/pyenv/pyenv/wiki/Common-build-problems#prerequisites
[pyenv installer]: https://github.com/pyenv/pyenv-installer

### pyflakes-vim

[pyflakes-vim](https://github.com/kevinw/pyflakes-vim) is officially deprecated, but it's still
the best vim Python plugin due to its simplicity and speed (as compared to [ALE] and [Syntastic]
which are horrifyingly slow out of the box, to the point of being completely unusable).

`pyflakes-vim` should work with a standard `apt install vim python-flake8` (or maybe
`python3-pyflakes`), so long as Pathogen and pyflakes-vim are present in the appropriate `~/.vim`
directories (e.g. via the Nucleus setup instructions above).

[ALE]: https://github.com/dense-analysis/ale
[Syntastic]: https://github.com/vim-syntastic/syntastic


## Node.js

Install nvm:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
```

Restart your shell, and then install Node.js LTS:

```bash
nvm install --lts
```


## SSH server

### Disable MOTD banner

Disable the hideous "ABSOLUTELY NO WARRANTY" message banner:

```bash
sudo rm /etc/motd
```


## Rust

### Install rustup

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -- -y
rustup component add rust-src
```


## Other packages

```bash
sudo apt install \
  yt-dlp
```


## DNS

>   [!NOTE]
>   This section hasn't been fully written yet - mostly TBD.

Ensure IP forwarding is enabled:

```bash
sudo vi /etc/sysctl.conf
```

```
net.ipv4.ip_forward=1
```

```bash
sudo sysctl -p
```


## WireGuard

_(WIP)_

Follow the WireGuard [Quick Start](https://www.wireguard.com/quickstart/) instructions.

Gateway:

```bash
sudo apt install wireguard
ip link add dev wg0 type wireguard
ip address add dev wg0 10.0.0.1/24
```


## Raspberry Pi specific steps

### Fix locale (if necessary)

```bash
sudo raspi-config
# change locale settings to ensure `en_US`, etc.
```

>   **TODO**: Figure out why this happens (sometimes?) with Raspberry Pi Imager, and ideally
>   prevent it upfront.

### Terminal

#### Configure keyboard shortcuts

*   _Edit_ => _Preferences_ => _Shortcuts_
    *   _Previous Tab_: Ctrl+Left
    *   _Next Tab_: Ctrl+Right
    *   _Move Tab Left_: Ctrl+Down
    *   _Move Tab Right_: Ctrl+Up

### Chromium

Log into any desired accounts, add GitHub public key, etc.


## NVIDIA GPU drivers / Tensorflow-GPU

The NVIDIA GPU drivers should be installed as part of the Tensorflow-GPU setup to ensure that all
the drivers and various CUDA/cuDNN libraries are compatible.  Currently, the best place to look
for instructions is in the [Tensorflow GPU support article], but do jump straight to the "Ubuntu
18.04" section and don't get distracted by the other section that points you to a bunch of rabbit
hole links in the "Software requirements" section. (All of this will probably change by the time
this install guide is revisited, but alas.)

If the system gets into a weird state with conflicting library versions, it seems to be safe to
do a heavy `sudo apt purge *nvidia* *cuda* *cudnn* && sudo apt autoremove` to eradicate
everything and start fresh, so long as you have `nouveau` drivers for backup after the nvidia
drivers are wiped and/or are comfortable working from a recovery mode shell and reinstalling
things from there.

If you encounter errors during NVIDIA driver installation due to drivers already being in use or
nouveau needing to be disabled, simply reboot into a recovery mode shell, enable networking with 
sudo service networking start && sudo dhclient && some other stuff` and repeat the installation
there.  (Or avoid needing networking in that situation by installing via dpkg).

The `nvidia-smi` tool is your friend to help figure out what's going on, as it shows the current
NVIDIA drivers in use, or logs an error if the drivers aren't loaded.

Once everything's set up, running a Tensorflow example should cause a GPU usage spike that should
be apparent in the `nvidia-smi` output (e.g. `watch -n 1 nvidia-smi`).  If there's no GPU usage
spike but the Tensorflow example finishes anyways, there's a good chance it simply fell back to
CPU execution.  Also, if running `tensorboard` doesn't work then you still have work to do.

[Tensorflow GPU support article]: https://www.tensorflow.org/install/gpu#ubuntu_1804_cuda_101

## Steam

After installing the NVIDIA drivers as described above, it's also necessary to install some 32
bit dependencies in order for Steam to work:

```bash
sudo apt install libnvidia-gl-440:i386
```

Then install Steam "as usual." (My process this time around was to download the official Steam `
deb` file from the Steam website, install it with dpkg, then `sudo apt install steam`, but there
might be a less roundabout way)

See also: https://github.com/ValveSoftware/steam-for-linux/issues/5553#issuecomment-402396591

These also seem to be necessary:
```bash
sudo apt install \
  libbz2-1.0:i386 \
  libgdk-pixbuf2.0-0:i386 \
  libglib2.0-0:i386 \
  libgtk2.0-0:i386 \
  libpulse0:i386 \
  libva2:i386 \
  libva-x11-2:i386 \
  libvdpau1:i386 \
  libxrandr2:i386 \
  libxtst6:i386
```


## Misc

### Limit alt+tab switching to the current workspace only:
```bash
gsettings set org.gnome.shell.app-switcher current-workspace-only true
```

### Enable alt-left + alt-right keys in terminal

Write the following to `~/.inputrc`:
```
"\e[1;3D": backward-word ### Alt left
"\e[1;3C": forward-word ### Alt right
```

See [stackexchange post 108098].

[stackexchange post 108098]: https://unix.stackexchange.com/questions/108098/alt-left-to-skip-words-does-not-work-in-terminal-emulators
