# OS X installation instructions

> _**Note**_: Most of the sections in this setup guide are optional, and can be applied on an à la carte basis, depending on personal requirements/preferences.

## System settings

### Sign into Apple Store

_(Optional):_ Install application updates.

### Set hostname:

Run the following in a terminal:
```bash
sudo scutil --set HostName "newname"
sudo scutil --set LocalHostName "newname"
dscacheutil -flushcache
sudo reboot
```

### Auto-hide dock

Right click Dock and choose "Dock preferences", then auto-hide dock.

### Remove extra dock icons

Drag and drop each unnecessary icon on the dock to the trash.

### Link home directory in Finder

Open Finder, navigate to Documents, hit Command + up-arrow twice to navigate to `/Users`, then drag and drop your home directory onto the favorite bar on the left.

## System Preferences

### Make TouchBar buttons behave like a reasonable keyboard

System Preferences => Keyboard
- Touch Bar Shows => Expanded Control Strip
- Customize Control Strip => drag `Screen Lock` in place of Siri icon

### Disable capslock

System Preferences => Keyboard
- Modifier Keys => set capslock to "No action"

### Disable all keyboard autocorrect nonsense

System Preferences => Keyboard
- Text => uncheck everything

### Add keyboard shortcuts

System Preferences => Keyboard => Text
- Add `:>>:` -> `»`

### Setup trackpad gestures

System Preferences => Trackpad => More Gestures
- Uncheck "Swipe between pages"
- Uncheck "App Exposé"

### Set window management hotkey(s)

System Preferences => Keyboard
- _(Optional):_ Shortcuts => App Shortcuts => `+` button:
  - Menu Title: `Zoom`
  - Keyboard Shortcut: `⌥ ⌘ =`
- Shortcuts => Accessibility => unselect all.
- Dictation => Shortcut => Off (or "Press 🎙" if the _Off_ option is missing)

### Disable OS X sounds

System Preferences => Sound
- Uncheck "Play sound on startup"
- Uncheck "Play user interface sound effects"
- Set alert volume to 0
- "Show Sound in menu bar" => "always"

### Enable bluetooth icon in menu bar

System Preferences => Bluetooth
- Show Bluetooth in menu bar

### Enable FileVault disk encryption

System Preferences => Security & Privacy => FileVault

### Screen lock settings

System Preferences => Security & Privacy
- General => "Require password 15 minutes after sleep or screen saver begins"

### Enable firewall

System Preferences => Security & Privacy
- Turn On Firewall
- Firewall Options => Uncheck "Automatically allow ..." checkboxes
- Firewall Options => Check "Enable stealth mode"
- _(TBD):_ Drop "Control Center" firewall allowance rule

### Disable automatic screen brightness

System Preferences => Displays => Display Settings
- Uncheck "Automatically adjust brightness"

### Disable nonsensical automatic virtual desktop reordering

System Preferences => Mission Control
- Uncheck "Automatically rearrange spaces"

### Disable "fast user switching" menu

System Preferences => Users & Groups
- Login Options => Uncheck "Show fast user switching menu"

# Application installation/setup

## Chrome

```bash
curl -O 'https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg'
open googlechrome.dmg
```

- Set as default browser (`chrome://settings/defaultBrowser`) -> "Make default".

Do in all profiles:
- Sign into gmail account
- Configure sync settings
- Install ublock origin
- Install [Rearrange Tabs](https://chrome.google.com/webstore/detail/rearrange-tabs/ccnnhhnmpoffieppjjkhdakcoejcpbga?hl=en-US) extension

## Homebrew

[https://brew.sh](https://brew.sh)

## iTerm2

```bash
brew install iterm2
```

Run iterm and configure:
- iTerm -> Preferences => Appearance
  - Theme => "Light (High Contrast)"
- iTerm => Preferences => Profiles
  - General => Reuse previous session's current directory
  - General => Characters considered part of word for selection => `/-+\~_.@`  (FIXME: no logner present?)
  - General -> Title: "Job+Args"
  - Colors => Color Presets => Light Background
    - Change yellow colors to brown/peach to be more visible: `#c78d00` for normal and `#fec467` for bright.
  - Text => Font => Font Size: 16
  - Window => Settings For New Windows => Style: "Full Screen"
  - Terminal => Check "Silence bell"
  - Terminal => Mousing Reporting => Enable "Report mouse wheel events" and disable "Report mouse clicks & drags"
  - Terminal => Scrollback lines => 30,000
  - Session => "Prompt before closing if there are jobs running besides..."
  - Keys:
    - Set Left ⎇  Key: Esc+
    - Add ⎇ +← mapping: Send Escape Sequence: b
    - Add ⎇ +→ mapping: Send Escape Sequence: f
    - (Note that the alt symbol is reversed in this doc for some reason; fixme)
  - Other actions => Set as Default

## Setup bash

```bash
brew install bash
echo "$(which bash)" | sudo tee -a /etc/shells
chsh -s "$(which bash)"
```

## Git

```bash
brew install git
git config --global user.email "***@***"  # (email redacted)
git config --global user.name "Karl Kroening"
git config --global core.excludesfile ~/.global_gitignore
```

## Add GitHub SSH key

Run the following and then paste into github:
```bash
ssh-keygen
cat ~/.ssh/id_rsa.pub | pbcopy
```

## Python

```bash
brew install pyenv
```

Restart your terminal/shell and then run `which python`.  If it doesn't say `/Users/<user>/.pyenv/shims/python`, then pyenv is not configured properly.  Refer to the [official pyenv documentation](https://github.com/pyenv/pyenv) for more info.

```bash
unset PIP_REQUIRE_VIRTUALENV 2>/dev/null
pyenv install 3.9.6
pyenv shell 3.9.6
pip install -U pip
pip install -U virtualenv
pip install -U readline
pyenv global 3.9.6
```

## Nucleus installation - shell customization, Vim configuration, etc.

> _**Note**_: This section depends on the previous sections, including setup of Homebrew, git, GitHub, bash, coreutils, Python, etc.

[Nucleus](https://github.com/kkroening/nucleus) includes shell setup/customization, Vim configuration, etc.

```bash
brew install coreutils

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

Restart the terminal, and then set up a virtual environment for Nucleus:

```bash
cd ~/nucleus
virtualenv venv \
  && venv/bin/pip install -r requirements.txt
```

### Vim Python syntax

Install pyflakes for Homebrew's version of Vim:

```bash
(unset PIP_REQUIRE_VIRTUALENV; $(brew --prefix python@3.12)/bin/pip3.12 install pyflakes --break-system-packages)
```

> _**Note**_: Homebrew's version of vim periodically changes to depend on different versions of Python, so the above command may need to be adjusted in the future.  Refer to the output of `brew info vim`.

## Install packages via Homebrew

> _**Note**_: The `brew install` items in this section are optional, so season the commands to taste.

> _**Note**_: Some particularly tricky package installations are shown separately (e.g. `ffmpeg`).

**Assorted packages (optional):**

```bash
brew install \
  htop \
  mdcat \
  nvm \
  prettier \
  shfmt \
  vim \
  wasm-tools \
  watch
```

## Setup gpg key

```bash
brew install gpg
gpg --full-generate-key
```

## Rust

```bash
brew install rustup-init wasm-pack
rustup-init
```

> **Note**: Customize the `rustup-init` installation to not modify the PATH since nucleus already does it in `~/.bash_profile.d/rust`.

## Nix

[Install Nix](https://nixos.org/download#download-nix):

```bash
sh <(curl -L https://nixos.org/nix/install)
```

> **Note**: The above method of installation skips most of the prompts besides for running `sudo`.  If you prefer an interactive installation with more explanation and confirmation along the way, `curl` the install script to a file, set it as executable with `chmod +x install` and then run it directly as (`./install`).

> **Note**: If you see a mysterious "Oh no, something went wrong error", GNU coreutils may need to be disabled.  See [nix #7181](https://github.com/NixOS/nix/issues/7181).

### Install Nix-based tools

```bash
nix-env -iA \
  nixpkgs.nixfmt \
  nixpkgs.ripgrep
```

## gcloud sdk

```bash
cd ~
curl https://sdk.cloud.google.com | bash
```
- Refer to https://cloud.google.com/sdk/downloads
- run `install.sh` to add to `bash_profile`

## Visual Studio Code

Extensions:

* rust-analyzer

## Slack

```bash
brew install slack
```

> **TODO**: Explain Slack settings - e.g. sort conversations/channels alphabetically.

## Docker

- https://store.docker.com/edititions/community/docker-ce-desktop-mac

```bash
curl -O https://download.docker.com/mac/stable/Docker.dmg
```

TODO: see if there's a way to download/install without logging into docker store

## Minikube

```bash
brew cask install minikube
brew install kubernetes-cli
```

# Minimal terminal setup

If nucleus can't be installed for whatever reason, this section has the bare-minimal steps to configure a semi-reasonable terminal environment.

Write minimal `~/.bash_profile`:
```bash
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PATH=~/bin:${PATH}

if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

if [[ "${OSTYPE}" == "darwin"* ]]; then
    PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi
```

Install pathogen.vim:
``` bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

Write a minimal `~/.vimrc` by stripping down the nucleus `~/.vimrc`.

# Extra

## f.lux

[f.lux download](https://justgetflux.com)

Set bedtime color to 2700K.

## JupyterLab

Avoid globally installing JupyterLab, but do link user-settings:

```bash
mkdir -p ~/.jupyter/lab
ln -s ~/nucleus/.jupyter/lab/user-settings ~/.jupyter/lab/
```

## Spotify

```bash
curl -Lo - https://download.scdn.co/SpotifyInstaller.zip | bsdtar -x
open "Install Spotify.app"
```

## Karabiner Elements

Karabiner elements for emulating numpad with Blender:
- https://github.com/tekezo/Karabiner-Elements/issues/127

## yEd

- [Download yEd](https://www.yworks.com/products/yed/download#download)
- File => Preferences => Editor:
  - Check _Edit Label on Create Node_
  - Check _Dynamically Adjust Node Size to Label Size_

## Fix monitor issue:

- Remove `/Library/Preferences/com.apple.windowserver.plist`
- Remove `Users/karlk/Library/Preferences/com.apple.windowserver.*`
- nvram/pram reset: power off, then hit power then hold Command+Option+P+R for about 30 seconds; screen should flash twice
- smc reset: power off then cmd+option+shift+power
- edit: this doesn't actually fix it or even seem to make a difference.

## Various optional apps:

- `brew install mdcat`

# Ubuntu installation instructions

Follow _some_ of the above instructions (judiciously).

> _**Todo**_: Pull out common parts of the above and fill in this section.  For now it's just a collection of various notes.

## pyenv

Perform the `apt-get install` commands listed in pyenv's [Common build problems](https://github.com/pyenv/pyenv/wiki/Common-build-problems#prerequisites) article first, then follow the instructions in the [pyenv-installer readme](https://github.com/pyenv/pyenv-installer).  Be sure to make the `~/.bashrc` changes suggested in the `pyenv-installer` output.  Finally, set vim as the default editor using `sudo update-alternatives --config editor`.

At the time of this writing, the entire process looks like this:
```bash
sudo apt-get install -y \
  build-essential \
  curl \
  git
  libbz2-dev \
  libffi-dev \
  liblzma-dev \
  libncurses5-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  llvm \
  make \
  python-openssl \
  tk-dev \
  wget \
  xz-utils \
  zlib1g-dev \
curl https://pyenv.run | bash
echo "export PATH=\"${PYENV_ROOT}/bin:\$PATH\""
echo "eval \"\$(pyenv init -)\""
echo "eval \"\$(pyenv virtualenv-init -)\""
sudo update-alternatives --config editor
```

> _**Note**_: Some of the above apt packages may be redundant/unnecessary.

> _**Note**_: The `~/.bashrc` changes are already included in nucleus' `.bashrc` file.

## pyflakes-vim

[pyflakes-vim](https://github.com/kevinw/pyflakes-vim) is officially deprecated, but it's still my favorite vim Python plugin due to its simplicity and speed (as compared to [ALE](https://github.com/dense-analysis/ale) and [Syntastic](https://github.com/vim-syntastic/syntastic) which are horrifyingly slow out of the box, to the point of being completely unusable).

`pyflakes-vim` should work with a standard `apt install vim python-flake8` (or maybe `python3-pyflakes`), so long as Pathogen and pyflakes-vim are present in the appropriate `~/.vim` directories (e.g. by symlinking the corresponding nucleus submodules).

## NVIDIA GPU drivers / Tensorflow-GPU

The NVIDIA GPU drivers should be installed as part of the Tensorflow-GPU setup to ensure that all the drivers and various CUDA/cuDNN libraries are compatible.  Currently, the best place to look for instructions is in the [Tensorflow GPU support article](https://www.tensorflow.org/install/gpu#ubuntu_1804_cuda_101), but do jump straight to the "Ubuntu 18.04" section and don't get distracted by the other section that points you to a bunch of rabbit-hole links in the "Software requirements" section. (All of this will probably change by the time this install guide is revisited, but alas.)

If the system gets into a weird state with conflicting library versions, it seems to be safe to do a heavy `sudo apt purge *nvidia* *cuda* *cudnn* && sudo apt autoremove` to eradicate everything and start fresh, so long as you have `nouveau` drivers for backup after the nvidia drivers are wiped and/or are comfortable working from a recovery mode shell and reinstalling things from there.

If you encounter errors during NVIDIA driver installation due to drivers already being in use or nouveau needing to be disabled, simply reboot into a recovery mode shell, enable networking with `sudo service networking start && sudo dhclient && some other stuff` and repeat the installation there.  (Or avoid needing networking in that situation by installing via dpkg).

The `nvidia-smi` tool is your friend to help figure out what's going on, as it shows the current NVIDIA drivers in use, or logs an error if the drivers aren't loaded.

Once everything's set up, running a Tensorflow example should cause a GPU usage spike that should be apparent in the `nvidia-smi` output (e.g. `watch -n 1 nvidia-smi`).  If there's no GPU usage spike but the Tensorflow example finishes anyways, there's a good chance it simply fell back to CPU execution.  Also, if running `tensorboard` doesn't work then you still have work to do.

## Steam

After installing the NVIDIA drivers as described above, it's also necessary to install some 32-bit dependencies in order for Steam to work:

```bash
sudo apt install libnvidia-gl-440:i386
```

Then install Steam "as usual." (My process this time around was to download the official Steam `.deb` file from the Steam website, install it with dpkg, then `sudo apt install steam`, but there might be a less roundabout way)

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

See [stackexchange post 108098](https://unix.stackexchange.com/questions/108098/alt-left-to-skip-words-does-not-work-in-terminal-emulators).
