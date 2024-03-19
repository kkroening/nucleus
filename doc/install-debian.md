## Install Debian packages

```bash
sudo apt update
sudo apt install \
  build-essential \
  curl \
  dnsutils \
  git \
  jq \
  man \
  vim \
  wget
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
ssh-keygen
cat ~/.ssh/id_rsa.pub | pbcopy
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
