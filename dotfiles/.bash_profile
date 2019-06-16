# Use gnu coreutils.
if [[ "${OSTYPE}" == "darwin"* ]]; then
    PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

# Setup python (pyenv, pip, virtualenv, etc.)
if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi
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
alias vc2='virtualenv venv -p $(pyenv shell --unset; pyenv which python2) --no-site-packages'
alias vc3='virtualenv venv -p $(pyenv shell --unset; pyenv which python3) --no-site-packages'
alias .vc2='virtualenv .venv -p $(pyenv shell --unset; pyenv which python2) --no-site-packages'
alias .vc3='virtualenv .venv -p $(pyenv shell --unset; pyenv which python3) --no-site-packages'
alias vd='deactivate'
alias ls='ls --color=auto'
alias less='less -FRX'
alias ..='cd ..'
#alias vi='PYTHONHOME=~/nucleus/.venv3/lib/python3.6/site-packages vi'
#alias vim='PYTHONHOME=~/nucleus/.venv3/lib/python3.6/site-packages vim'
#alias vimdiff='PYTHONHOME=~/nucleus/.venv vimdiff'

# Setup gcloud.
if [ -f '/Users/karlk/google-cloud-sdk/path.bash.inc' ]; then source '/Users/karlk/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/Users/karlk/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/karlk/google-cloud-sdk/completion.bash.inc'; fi

# Include nucleus tools.
PATH="~/bin:~/nucleus/bin:${PATH}"

export APPENGINE_SDK="${HOME}/google-cloud-sdk/platform/google_appengine"
export PATH="${APPENGINE_SDK}:${PATH}"

export NVM_DIR="$HOME/.nvm"
#export NVM_DIR="/usr/local/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"


## QT stuff (log during `brew install qt5`):
#echo 'export PATH="/usr/local/opt/qt/bin:$PATH"' >> ~/.bash_profile
#LDFLAGS:  -L/usr/local/opt/qt/lib
#CPPFLAGS: -I/usr/local/opt/qt/include
#PKG_CONFIG_PATH: /usr/local/opt/qt/lib/pkgconfig
export PATH="/usr/local/opt/qt/bin:$PATH"

export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# Setup kubectl aliases:
alias kw='watch -n 1 kubectl'
alias kc='kubectl'
alias kca='kc apply'
alias kcc='kc create'
alias kcfg='kc config'
alias kcfggc='kcfg get-contexts'
alias kcfgsc='kcfg set-context'
alias kcg='kc get'
alias kwg='kw get'
alias kcgd='kc get deployments'
alias kwgd='kw get deployments'
alias kcgp='kc get pods'
alias kwgp='kw get pods'
alias kcgs='kc get services'
alias kwgs='kw get services'
alias kcgj='kc get jobs'
alias kwgj='kw get jobs'
alias kcl='kc logs'
alias kwl='kw logs'
alias kcd='kc describe'
alias kwd='kw describe'
alias kcD='kc delete'
alias kcdp='kc describe pod'
alias kwdp='kw describe pod'
alias kcds='kc describe service'
alias kwds='kw describe service'
alias kcl='kc logs'
alias kwl='kw logs'
alias kcpf='kc port-forward'
alias tf=terraform
