# OS Customization

## Set hostname:

Run the following in a terminal:
```bash
sudo scutil --set HostName "newname"
sudo scutil --set LocalHostName "newname"
dscacheutil -flushcache
sudo reboot
```

## Auto-hide dock

Right click Dock and choose "Dock preferences", then auto-hide dock

## Remove extra dock icons

Drag and drop each unnecessary icon on the dock to the trash.

## Make TouchBar buttons behave like a reasonable keyboard

Touch Bar Shows => Extended Control Strip
Customize Control Strip => drag `Screen Lock` in place of Siri icon

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

- Setup default chrome profile
  - People => Edit => rename "Person 1" to "Personal"
- Setup work profile:
  - People => Add Person, People => Edit => Rename to "Work"
- Do in all profiles:
  - Sign into chrome
  - Configure sync settings
  - Install ublock origin

## iTerm2

```bash
curl -o - https://iterm2.com/downloads/stable/iTerm2-3_1_6.zip | bsdtar -x
open .
```

Then drag and drop to Applications.

Run iterm and configure:
- iTerm => Preferences => Profiles
  - General => reuse previous session's current directory
  - Colors => Color Presets => Light Background
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

## Install coreutils

```bash
brew install coreutils
```

Follow instructions for setting PATH and MANPATH.  i.e., add to bash_profile:
```bash
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
```

## Install nucleus repo

```bash
git clone https://github.com/kkroening/nucleus.git
cd nucleus
git submodule update --init
mkdir -p ~/bin
ln -s ~/nucleus/keygen/keygen.py ~/bin/key
```

Setup symlinks (manually for now).

```bash
cd ~
ln -s ~/nucleus/.* .
rm .vim
mkdir .vim .vim/bundle .vim/ftplugin
pushd .vim/bundle
  ln -s ~/nucleus/.vim/bundle/* .
popd
pushd .vim/ftplugin
  ln -s ~/nucleus/.vim/ftplugin/* .
popd
```

## Alternative to nucleus: configure minimal bash_profile

Fix prompt (inspired by GCE) and setup `$PATH`:
```bash
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PATH=~/bin:${PATH}
```


## Install packages via homebrew

- `brew install htop`
- `brew install watch`
- `brew install ffmpeg --with-sdl2 --with-freetype --with-fontconfig`
- `brew install go`
  - add to .bash_profile:
    ```
    (fixme: add goroot to $PATH)
    ```

## Python

- `brew install pyenv direnv`
  - add to .bash_profile:
    ```
    eval "$(pyenv init -)"
    ```

- install python versions:
  ```
  pyenv install 2.7.14
  pyenv install 3.6.4
  ```

- Install latest virtualenv + pip in each pyenv:
  ```
  pyenv shell 2.7.14
  pip install -U pip
  pip install -U virtualenv

  pyenv shell 3.6.4
  pip install -U pip
  pip install -U virtualenv
  ```

## Nucleus setup (part 2)

This must be done *after* Python is set up, and the Python setup should happen after the initial nucleus setup - hence having the nucleus setup being broken up into two parts.

```
cd ~/nucleus
(vc3 && va3 && pip install -e .)
ln -sf .venv3/bin/{csview,snake,camel} ~/bin
```

## gcloud sdk

```bash
cd ~
curl https://sdk.cloud.google.com | bash
```
- Refer to https://cloud.google.com/sdk/downloads
- run `install.sh` to add to bash_profile

## vim


FUCKING CANCER:
```
sudo /System/Library/Frameworks/Python.framework/Versions/2.7/bin/python -m ensurepip
sudo /System/Library/Frameworks/Python.framework/Versions/2.7/bin/python -m pip install pyflakes
```
There's apparently no way to get vim to work with another python environment, and it gives a worthless erorr message, so the only way to instdall pytholn deps is to fucking use sudo against system python. wtfffvfffgffffdfguysdffssdgfuysufysugdyfasdfgiuadfsgiadfisghadfs;hioadfshoiuadfshio;dfsadfsadsddfAS;;

Probably not needed:
```
brew reinstall vim --with-custom-python
```

`.vimrc`:
```
filetype plugin indent on
set directory^=$HOME/.vim/tmp//
set et hls sts=4 sw=4 ts=4
syn on

"
" Fix shift+arrow key combinations.
"
nmap <S-Up>    <Up>
nmap <S-Down>  <Down>
nmap <S-Left>  <Left>
nmap <S-Right> <Right>
imap <S-Up>    <Up>
imap <S-Down>  <Down>
imap <S-Left>  <Left>
imap <S-Right> <Right>
vmap <S-Up>    <Up>
vmap <S-Down>  <Down>
vmap <S-Left>  <Left>
vmap <S-Right> <Right>

map <Esc>[A <Up>
map <Esc>[B <Down>
map <Esc>[C <Right>
map <Esc>[D <Left>
```

`~/.vim/ftplugin/text.vim`:
```
setlocal sts=2 sw=2 ts=2
```

Install pathogen.vim:
``` bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
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

- Remove /Library/Preferences/com.apple.windowserver.plist
- Remove Users/karlk/Library/Preferences/com.apple.windowserver.*
- nvram/pram reset: power off, then hit power then hold command+option+p+r for about 30 seconds; screen should flash twice
- smc reset: power off then cmd+option+shift+power
- edit: this doesn't actually fix it or even seem to make a difference.
