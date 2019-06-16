# OS X installation instructions

## Set hostname:

Run the following in a terminal:
```bash
sudo scutil --set HostName "newname"
sudo scutil --set LocalHostName "newname"
dscacheutil -flushcache
sudo reboot
```

## Auto-hide dock

Right click Dock and choose "Dock preferences", then auto-hide dock.

## Remove extra dock icons

Drag and drop each unnecessary icon on the dock to the trash.

## Make TouchBar buttons behave like a reasonable keyboard

Keyboard => Touch Bar Shows => Expanded Control Strip
Keyboard => Customize Control Strip => drag `Screen Lock` in place of Siri icon

## Disable capslock

System Preferences => Keyboard => Keyboard => Modifier Keys => set capslock to "No action"

## Disable all keyboard autocorrect nonsense

System Preferences => Keyboard => Text => uncheck everything

## Disable OS X sounds

System Preferences => Sound
- uncheck "Play user interface sound effects"
- set alert volume to 0

## Enable bluetooth icon in menu bar

- System Preferences => Bluetooth => Show Bluetooth in menu bar

## Show battery percentage

Click battery indicator in top menu and choose "Show Percentage"

## Require password on screen lock

- System Preferences => Security & Privacy => General => Require password immediately

## Enable firewall

- System Preferences => Security & Privacy => Turn On Firewall
- System Preferences => Security & Privacy => Firewall Options => Uncheck "Automatically allow ..." checkboxes
- System Preferences => Security & Privacy => Firewall Options => Check "Enable stealth mode"

## Disable automatic screen brightness

- System Preferences => Displays => Uncheck "Automatically adjust brightness"


# Application installation/setup

## Chrome

```bash
curl -O 'https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg'
open googlechrome.dmg
```

- Do in all profiles:
  - Sign into chrome
  - Configure sync settings
  - Install ublock origin

## iTerm2

```bash
curl -o - https://iterm2.com/downloads/stable/iTerm2-3_2_6.zip | bsdtar -x
open .
```

Then drag and drop to Applications.

Run iterm and configure:
- iTerm => Preferences => Profiles
  - General => reuse previous session's current directory
  - Colors => Color Presets => Light Background
    - Change color for yellow to something more visible.
  - Text => Font => font size 16
  - Terminal => check "Silence bell"
  - Session => "Prompt before closing if there are jobs running besides..."
  - Keys:
    - Set Left ⎇  Key: Esc+
    - Add ⎇ +← mapping: Send Escape Sequence: b
    - Add ⎇ +→ mapping: Send Escape Sequence: f
    - (Note that the alt symbol is reversed in this doc for some reason; fixme)
  - Other actions => Set as default

## Slack

```bash
curl -o slack.dmg https://slack.com/ssb/download-osx
```

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
git clone https://github.com/kkroening/nucleus.git ~/nucleus
cd ~/nucleus
git submodule update --init
mkdir -p ~/bin ~/.vim ~/.vim/autoload ~/.vim/bundle ~/.vim/ftplugin
ln -s ~/nucleus/keygen/keygen.py ~/bin/key
ln -s ~/nucleus/dotfiles/.* ~/
ln -s ~/nucleus/.vim/autoload/* ~/.vim/autoload/
ln -s ~/nucleus/.vim/bundle/* ~/.vim/bundle/
ln -s ~/nucleus/.vim/ftplugin/* ~/.vim/ftplugin/
```

## Python

```bash
brew install pyenv
pyenv install 2.7.14
pyenv install 3.6.4

pyenv shell 2.7.14
pip install -U pip
pip install -U virtualenv

pyenv shell 3.7.2
pip install -U pip
pip install -U virtualenv

pyenv global 2.7.14 3.7.2
```

## Nucleus installation (part 2)

> _Note: This second part of the nucleus installation must be done *after* Python is set up._

```bash
cd ~/nucleus
.vc
.va
pip install -e .
```

## Install packages via homebrew

```bash
brew install coreutils
brew install vim
brew install htop
brew install watch
brew install ffmpeg --with-sdl2 --with-freetype --with-fontconfig --with-libass
brew install go
brew install nvm
brew install mdcat
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

## gcloud sdk

```bash
cd ~
curl https://sdk.cloud.google.com | bash
```
- Refer to https://cloud.google.com/sdk/downloads
- run `install.sh` to add to bash_profile

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
