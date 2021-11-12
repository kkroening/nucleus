# OS X installation instructions

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

### Set window management hotkey(s)

System Preferences => Keyboard
- _(Optional):_ Shortcuts => App Shortcuts => `+` button:
  - Menu Title: `Zoom`
  - Keyboard Shortcut: `⌥ ⌘ =`
- Shortcuts => Accessibility => unselect all.

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

Do in all profiles:
- Sign into gmail account
- Configure sync settings
- Install ublock origin
- Install [Rearrange Tabs](https://chrome.google.com/webstore/detail/rearrange-tabs/ccnnhhnmpoffieppjjkhdakcoejcpbga?hl=en-US) extension

## Homebrew

[https://brew.sh](https://brew.sh)

## Git

```bash
brew install git
git config --global user.email "karlk@kralnet.us"
git config --global user.name "Karl Kroening"
git config --global core.excludesfile ~/.global_gitignore
```

## Nucleus installation (part 1)

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

## iTerm2

```bash
brew install iTerm2
```

Run iterm and configure:
- iTerm -> Preferences => Appearance
  - Theme => "Light (High Contrast)"
- iTerm => Preferences => Profiles
  - General => Reuse previous session's current directory
  - General => Characters considered part of word for selection => `/-+\~_.@`  (FIXME: no logner present?)
  - General -> Title: "Job+Args"
  - Colors => Color Presets => Light Background
    - Change color for yellow to something more visible.
  - Text => Font => Font Size: 16
  - Window => Settings For New Windows => Style: "Full Screen"
  - Terminal => Check "Silence bell"
  - Session => "Prompt before closing if there are jobs running besides..."
  - Keys:
    - Set Left ⎇  Key: Esc+
    - Add ⎇ +← mapping: Send Escape Sequence: b
    - Add ⎇ +→ mapping: Send Escape Sequence: f
    - (Note that the alt symbol is reversed in this doc for some reason; fixme)
  - Other actions => Set as Default

## Python

```bash
brew install pyenv
pyenv install 2.7.14
pyenv install 3.7.3

pyenv shell 2.7.14
pip install -U pip
pip install -U virtualenv

pyenv shell 3.7.3
pip install -U pip
pip install -U virtualenv

pyenv global 2.7.14 3.7.3
```

**pyenv-virtualenv (TBD)**:

If you see the following error, `pyenv-virtualenv` may need to be installed:
```
pyenv: no such command `virtualenv-init'
```

In this case, install `pyenv-virtualenv`:
```bash
brew install pyenv-virtualenv
```

_Source_: [pyenv: no such command `virtualenv' (Stack Overflow)](https://stackoverflow.com/a/67676109).

> _**Note**_: It's not clear why this pyenv plugin is even needed, so this sub-section may be unnecessary.

## Nucleus installation (part 2)

> _**Note**_: This second part of the nucleus installation must be done *after* Python is set up.

```bash
cd ~/nucleus
virtualenv venv \
  && venv/bin/pip install -r requirements.txt
virtualenv venv2 -p "$(which python2)" \
  && venv2/bin/pip install -r requirements-py2.txt
```

## Install packages via homebrew

> _**Note**_: The `brew install` items in this section are optional, so season the commands to taste.

> _**Note**_: Some particularly tricky package installations are shown separately (e.g. `ffmpeg`).

**Assorted packages (optional):**

```bash
brew install \
  ctags \
  direnv \
  htop \
  mdcat \
  fswatch \
  nvm \
  vim \
  watch
```

**ffmpeg (optional):**
```bash
brew install ffmpeg --with-sdl2 --with-freetype --with-fontconfig --with-libass
```

**universal-ctags (optional):**
```bash
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

## Add github ssh key

Run the following and then paste into github:
```bash
ssh-keygen
cat ~/.ssh/id_rsa.pub | pbcopy
```

## Setup gpg key

```bash
brew install gpg
gpg --full-generate-key
```

## Python

- `brew install pyenv`
  - add to .bash_profile:
    ```bash
    eval "$(pyenv init -)"
    ```

- install python versions:
  ```bash
  pyenv install 2.7.14
  pyenv install 3.7.3
  ```

- Install latest virtualenv + pip in each pyenv:
  ```bash
  pyenv shell 2.7.14
  pip install -U pip
  pip install -U virtualenv
  pip install -U readline

  pyenv shell 3.7.3
  pip install -U pip
  pip install -U virtualenv
  pip install -U readline
  ```

- Set global default Python interpreters:
  ```bash
  pyenv global 3.7.3 2.7.14
  ```

- Install pyflakes for homebrew vim:
  ```bash
  (unset PIP_REQUIRE_VIRTUALENV; /usr/local/bin/pip3 install pyflakes)
  ```

## Rust

```bash
brew install rustup-init
```

## gcloud sdk

```bash
cd ~
curl https://sdk.cloud.google.com | bash
```
- Refer to https://cloud.google.com/sdk/downloads
- run `install.sh` to add to bash_profile

## Slack

```bash
curl -o slack.dmg https://slack.com/ssb/download-osx
```

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

_TODO: pull out common parts of the above and fill in this section.  For now it's just a collection of various notes._

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
