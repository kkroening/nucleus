# OS X installation instructions

> _**Note**_: Most of the sections in this setup guide are optional, and can be applied on an à la carte basis, depending on personal requirements/preferences.


## System settings

### Sign into Apple Store

_(Optional):_ Install application updates.

### Set hostname

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

System Preferences => Trackpad => Point & Click
- Uncheck "Force Click and haptic feedback"
    - (This disables the excruciatingly annoying Dictionary app from popping up when
      double-clicking to select text, and accidentally pressing slightly too hard to
      activate the Dictionary's _popup from hell_ functionality)
- Uncheck "Look up \& data detectors"
    - (This is also necessary for disabling the atrocious dictionary popup. Good
      riddance!)

System Preferences => Trackpad => More Gestures
- "Swipe between pages" => "Off"
- Uncheck "App Exposé"

### Set window management hotkey(s)

System Preferences => Keyboard
- _(Optional):_ Shortcuts => App Shortcuts => `+` button:
  - Menu Title: `Zoom`
  - Keyboard Shortcut: `⌥ ⌘ =`
- _(Probably defunct)_:
  - Shortcuts => Accessibility => unselect all.
  - Dictation => Shortcut => Off (or "Press 🎙" if the _Off_ option is missing)

### Disable OS X sounds

System Preferences => Sound
- Uncheck "Play sound on startup"
- Uncheck "Play user interface sound effects"
- Set alert volume to 0

### Menu bar

System Preferences => Menu Bar
- Uncheck "Spotlight"
- "Sound" => "Always Show"
- TBD: "Automatically hide and show the menu bar" => "Always"

### Enable FileVault disk encryption

System Preferences => Security & Privacy => FileVault

### Screen lock settings

System Preferences => Lock Screen
- "Turn display off on battery when inactive" => 5 minutes
- "Turn display off on power adapter when inactive" => (TBD)

System Preferences => Security & Privacy
- General => "Require password 15 minutes after sleep or screen saver begins"

### Enable firewall

System Preferences => Network => Firewall => Turn on "Firewall"
System Preferences => Network => Firewall => Options
- Uncheck "Automatically allow built-in software to receive incoming connections"
- Uncheck "Automatically allow downloaded signed software to receive incoming connections"
- Check "Enable stealth mode"

### Disable automatic screen brightness

System Preferences => Displays
- Uncheck "Automatically adjust brightness"

### Disable nonsensical automatic virtual desktop reordering

System Preferences => Desktop & Dock => Mission Control
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
- Add to OS X dock


## Homebrew

[https://brew.sh](https://brew.sh)


## iTerm2

```bash
brew install iterm2
```

Run iterm and configure:
- iTerm2 => Settings => Appearance
  - _(Optional)_: Theme => "Light (High Contrast)"
- iTerm2 => Settings => Profiles
  - General => Reuse previous session's directory
  - General => Characters considered part of word for selection => `/-+\~_.@`  (FIXME: no logner present?)
  - General -> Title: "Job Name with Arguments" / "Job+Args"
  - _(Optional)_: Colors => Color Presets => Light Background
    - Change yellow colors to brown/peach to be more visible: `#c78d00` for normal and `#fec467` for bright.
  - Text => Font => Font Size: 16
  - Window => New windows: 100 columns by 40 rows
  - Window => New windows => Style: "Full Screen"
  - Terminal => Check "Silence bell"
  - Terminal => Mousing Reporting => Enable "Report mouse wheel events" and disable "Report mouse clicks & drags"
  - Terminal => Scrollback lines => 30,000
  - Session => "Prompt before closing if there are jobs running besides..."
  - Session => Timestamps => Check "Enabled"
  - Session => Timestamps => "Over contents when mouse hovers over scrollbar"
  - Keys => General
    - Set Left ⎇  Key: Esc+
  - Keys => Key Bindings
    - Add ⎇ +← mapping: Send Escape Sequence: b
      - "Apply to all sessions"
    - Add ⎇ +→ mapping: Send Escape Sequence: f
      - "Apply to all sessions"
    - (Note that the alt symbol is reversed in this doc for some reason; fixme)
  - Other actions => Set as Default
- Add to OS X dock
- System Preferences => Privacy & Security => Full Disk Access => Add _iTerm_


## Setup bash

```bash
brew install bash
```

Open new terminal session, and then:

```bash
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
cat ~/.ssh/id_ed25519.pub | pbcopy
```


## Python

```bash
brew install pyenv

eval "$(pyenv init - bash)"  # temporary - will be persisted in Nucleus setup below

unset PIP_REQUIRE_VIRTUALENV 2>/dev/null
pyenv install 3.14.6
pyenv shell 3.14.6
pip install -U pip
pip install -U virtualenv
pyenv global 3.14.6
```


## Nucleus installation - shell customization, Vim configuration, etc.

> _**Note**_: This section depends on the previous sections, including setup of Homebrew, git, GitHub, bash, coreutils, Python, etc.

[Nucleus](https://github.com/kkroening/nucleus) includes shell setup/customization, Vim configuration, etc.

```bash
brew install coreutils

git clone git@github.com:kkroening/nucleus.git ~/nucleus

cd ~/nucleus
git submodule update --init

mkdir -p \
  ~/.bash_profile.d \
  ~/.jupyter/lab \
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

Restart the terminal, and then set up a virtual environment for Nucleus:

```bash
cd ~/nucleus
virtualenv .venv \
  && .venv/bin/pip install -r requirements.txt
```


## Vim

Install Vim through Homebrew:

```bash
brew install vim
```

Vim's configuration is mostly handled above already, via the nucleus setup instructions, which
configures `~/.vimrc`, `~/.vim`, etc.  The Python syntax highlighting is tricky though, because
pyflakes is *still* the best Vim Python plugin, but must be installed in the system-level Python
installation that Homebrew's Vim depends on.

### Vim Python syntax

Confirm which version of Python Homebrew's version of Vim depends on:

```bash
brew info vim
```

>   [!NOTE]
>   Homebrew's version of vim periodically changes to depend on different versions of Python, so
>   the command below may need to be adjusted in the future.  Refer to the output of
>   `brew info vim`, by noting the `python@3.xx` in the _Caveats_ section.

Install pyflakes for Homebrew's version of Vim:

```bash
(unset PIP_REQUIRE_VIRTUALENV; $(brew --prefix python@3.14)/bin/pip3.14 install pyflakes --break-system-packages)
```


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
  wasm-tools \
  watch
```


## Setup gpg key

```bash
brew install gpg
gpg --full-generate-key
```

Press enter three times to accept default choices, followed by `y` (yes). For example:
-   `(9) ECC (sign and encrypt) *default*`
-   `(1) Curve 25519 *default*`
-   `0 = key does not expire`
-   `Is this correct? (y/N) y`

Provide _Real name_ and _Email address_. _Comment_ may be blank (or whatever you want).
Press `o` for okay.

Choose a password (and write it down somewhere) and complete the process.


## Networking

### Enable SSH server

```bash
sudo systemsetup -setremotelogin on
```

### Configure `/etc/hosts`

Use a common, shared hosts file with definitions to apply for the main LAN.

```bash
sudo vi /etc/hosts
```

Recommended: add an entry/entries for this new host, and roll out the host file changes to the
other devices in the network.

>   [!NOTE]
>   The `/etc/hosts` file content is _not_ committed in this repo, since it's entirely machine-
>   and network-specific.  Ideally this would be handled by a proper DNS level solution, since
>   `/etc/hosts` can be a bit of a crutch, but this works sufficiently well in practice.

### Add SSH authorized keys

Add your SSH public key(s) to your other machines - e.g. via `ssh-copy-id`:

```bash
ssh-copy-id user@remote_host
```

(Optionally use `-i` to specify a different identity / public key file)

Repeat for each combination of source/destination SSH pairs (e.g. this machine to another, the
other machine to this one, etc.).


## Rust

```bash
brew install rustup-init wasm-pack
rustup-init
```

>   [!NOTE]
>   Customize the `rustup-init` installation to not modify the PATH since nucleus already does it
>   in `~/.bash_profile.d/rust.sh`.


## gcloud sdk

```bash
brew install gcloud-cli
```


## Visual Studio Code

Extensions:

* rust-analyzer


## Slack

```bash
brew install slack
```

> **TODO**: Explain Slack settings - e.g. sort conversations/channels alphabetically.


## Docker

```bash
brew install --cask docker
```

>   [!NOTE]
>   There's a non-cask version of Docker available, but the cask version is recommended because it
>   includes more complete capability out of the box, including Docker Desktop.


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
