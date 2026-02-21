# Installation notes - Debian

This guide applies to multiple Debian variants, including (but not limited to) Raspberry Pi OS.

## Raspberry Pi disk image

_(Skip this section for non- Raspberry Pi)_

For Raspberry Pi setup, use [Raspberry Pi Imager](https://www.raspberrypi.com/software/) on a host system (e.g. `brew install raspberry-pi-imager` on OS X) to create the base image, and customize as desired.

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
```

## Python

```bash
(
  set -e

  # It's anyone's guess as to where this package list comes from.
  # Welcome to stone-age package management.
  sudo apt install -y \
    build-essential \
    curl \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    llvm \
    tk-dev \
    wget \
    xz-utils \
    zlib1g-dev

  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  eval "$(pyenv init --path)"

  unset PIP_REQUIRE_VIRTUALENV 2>/dev/null
  pyenv install 3.12.0
  pyenv shell 3.12.0
  pip install -U pip
  pip install -U virtualenv
  pip install -U readline
  pyenv global 3.12.0

  cd ~/nucleus
  python -m venv venv
  venv/bin/pip install -r requirements.txt
)
```

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

#### Disable MOTD banner:

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

> [!NOTE]
> This section hasn't been fully written yet - mostly TBD.

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

> **TODO**: Figure out why this happens (sometimes?) with Raspberry Pi Imager, and ideally prevent it upfront.

### Terminal

#### Configure keyboard shortcuts

*   _Edit_ => _Preferences_ => _Shortcuts_
    *   _Previous Tab_: Ctrl+Left
    *   _Next Tab_: Ctrl+Right
    *   _Move Tab Left_: Ctrl+Down
    *   _Move Tab Right_: Ctrl+Up

### Chromium

Log into any desired accounts, add GitHub public key, etc.
