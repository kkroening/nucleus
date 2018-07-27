# Use gnu coreutils.
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Setup python (pyenv, pip, virtualenv, etc.)
eval "$(pyenv init -)"
export PIPENV_VENV_IN_PROJECT=true
export PIP_REQUIRE_VIRTUALENV=true
export PYTHONDONTWRITEBYTECODE=true

# Setup prompt.
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Hack around vim trying to call wrong python when in venv. (There's gotta be a better way to do this)
unset vi vimdiff
VI=$(which vi)
VIMDIFF=$(which vimdiff)
vi() {
    (deactivate 2>/dev/null; ${VI} $@)
}
vimdiff() {
    (deactivate 2>/dev/null; ${VIMDIFF} $@)
}

# Setup aliases.
alias vc='virtualenv venv --no-site-packages'
alias .vc='virtualenv .venv --no-site-packages'
alias va='. venv/bin/activate'
alias .va='. .venv/bin/activate'
alias .vc3='virtualenv .venv3 -p $(pyenv which 3.6.4) --no-site-packages'
alias va3='. venv3/bin/activate'
alias .va3='. .venv3/bin/activate'
alias vd='deactivate'
alias ls='ls --color=auto'
alias less='less -FRX'
alias ..='cd ..'
#alias vi='PYTHONHOME=~/.pyenv/versions/2.7.14 vi'
#alias vim='PYTHONHOME=~/.pyenv/versions/2.7.14 vi'
#alias vimdiff='PYTHONHOME=~/.pyenv/versions/2.7.14 vi'

# Setup gcloud.
if [ -f '/Users/karlk/usr/google-cloud-sdk/path.bash.inc' ]; then source '/Users/karlk/usr/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/Users/karlk/usr/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/karlk/usr/google-cloud-sdk/completion.bash.inc'; fi

# Include nucleus tools.
NUCLEUS_DIR="$(dirname $(readlink -f ~/.bashrc))"
PATH=~/bin:${NUCLEUS_DIR}/bin:${PATH}
PATH=${PATH}:$(readlink -f ~/src/notmine/apitrace/build)

export APPENGINE_SDK="${HOME}/usr/google-cloud-sdk/platform/google_appengine"
export PATH="${APPENGINE_SDK}:${PATH}"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



## QT stuff (log during `brew install qt5`):
#echo 'export PATH="/usr/local/opt/qt/bin:$PATH"' >> ~/.bash_profile
#LDFLAGS:  -L/usr/local/opt/qt/lib
#CPPFLAGS: -I/usr/local/opt/qt/include
#PKG_CONFIG_PATH: /usr/local/opt/qt/lib/pkgconfig
export PATH="/usr/local/opt/qt/bin:$PATH"

export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
