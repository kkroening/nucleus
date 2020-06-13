# Use gnu coreutils.
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Setup python (pyenv, pip, virtualenv, etc.)
if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)"
fi
export PIPENV_VENV_IN_PROJECT=true
export PIP_REQUIRE_VIRTUALENV=true
export PYTHONDONTWRITEBYTECODE=true
export CLOUDSDK_PYTHON="$(pyenv shell 2.7.14 && pyenv which python)"

# Include nucleus tools.
NUCLEUS_DIR="$(dirname $(readlink -f ~/.bashrc))"
PATH=~/bin:${NUCLEUS_DIR}/bin:${PATH}

# Setup prompt.
PS1='==> \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

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
alias vc='virtualenv venv'
alias va='. venv/bin/activate'
alias va3='. venv3/bin/activate'
alias vd='deactivate'
alias ls='ls --color=auto'
alias less='less -FRX'
alias ..='cd ..'
#alias vi='PYTHONHOME=~/nucleus/.venv3 vi'
#alias vim='PYTHONHOME=~/nucleus/.venv3 vim'
#alias vimdiff='PYTHONHOME=~/nucleus/.venv3 vimdiff'

# Setup gcloud.
if [ -f '/Users/karlk/google-cloud-sdk/path.bash.inc' ]; then source '/Users/karlk/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/Users/karlk/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/karlk/google-cloud-sdk/completion.bash.inc'; fi

#export APPENGINE_SDK="${HOME}/google-cloud-sdk/platform/google_appengine"
#export PATH="${APPENGINE_SDK}:${PATH}"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"


## QT stuff (log during `brew install qt5`):
#echo 'export PATH="/usr/local/opt/qt/bin:$PATH"' >> ~/.bash_profile
#LDFLAGS:  -L/usr/local/opt/qt/lib
#CPPFLAGS: -I/usr/local/opt/qt/include
#PKG_CONFIG_PATH: /usr/local/opt/qt/lib/pkgconfig
export PATH="/usr/local/opt/qt/bin:$PATH"

export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

alias gits='git status'
alias pbc='pbcopy'
alias pbp='pbpaste'

alias kw='watch -n 1 kubectl'
alias kc='kubectl'
alias kca='kc apply'
alias kcc='kc create'
alias kcfg='kc config'
#alias kcfggc='kcfg get-contexts'
#alias kcfguc='kcfg use-context'
alias kce='kc exec'
alias kcg='kc get'
alias kwg='kw get'
alias kcD='kc delete'

alias kcgcm='kc get configmaps'
alias kwgcm='kw get configmaps'
alias kcdcm='kc describe configmap'
alias kwdcm='kw describe configmap'

alias kcgd='kc get deployments'
alias kwgd='kw get deployments'
alias kcdd='kc describe deployment'
alias kwdd='kw describe deployment'

alias kcgp='kc get pods'
alias kwgp='kw get pods'
alias kcdp='kc describe pod'
alias kwdp='kw describe pod'
alias kcDp='kc delete pod'

alias kcgi='kc get ingress'
alias kwgi='kw get ingress'
alias kcdi='kc describe ingress'
alias kwdi='kw describe ingress'
alias kcDi='kc delete ingress'

alias kcgs='kc get services'
alias kwgs='kw get services'
alias kcds='kc describe service'
alias kwds='kw describe service'

alias kcgS='kc get secrets'
alias kwgS='kw get secrets'
alias kcdS='kc describe secret'
alias kwdS='kw describe secret'

alias kcgj='kc get jobs'
alias kwgj='kw get jobs'
alias kcdj='kc describe job'
alias kwdj='kw describe job'
alias kcDj='kc delete job'

alias kcgcj='kc get cronjobs'
alias kwgcj='kw get cronjobs'
alias kcdcj='kc describe cronjob'
alias kwdcj='kw describe cronjob'
alias kcDcj='kc delete cronjob'

alias kcge='kc get events'
alias kwge='kw get events'
alias kcde='kc describe event'
alias kwde='kw describe event'

alias kcgn='kc get nodes'
alias kwgn='kw get nodes'
alias kcdn='kc describe node'
alias kwdn='kw describe node'

alias kcgss='kc get statefulset'
alias kwgss='kw get statefulset'
alias kcdss='kc describe statefulset'
alias kwdss='kw describe statefulset'

alias kcgrs='kc get replicaset'
alias kwgrs='kw get replicaset'
alias kcdrs='kc describe replicaset'
alias kwdrs='kw describe replicaset'

alias kcges='kc get elasticsearch'
alias kwges='kw get elasticsearch'
alias kcdes='kc describe elasticsearch'
alias kwdes='kw describe elasticsearch'

alias kcgkb='kc get kibana'
alias kwgkb='kw get kibana'
alias kcdkb='kc describe kibana'
alias kwdkb='kw describe kibana'

alias kcl='kc logs'
alias kwl='kw logs'
alias kcd='kc describe'
alias kwd='kw describe'
alias kcl='kc logs'
alias kwl='kw logs'
alias kcpf='kc port-forward'
alias kcgc='kubectl config get-contexts'
alias kcsns='kubectl config set-context $(kubectl config current-context) --namespace'
alias kcscc='kubectl config use-context'
alias kcgcc='kubectl config view --minify -o json | yq ".contexts[0].context" -y'
alias kctn='kubectl top node'
alias kcnres='kcdn | grep Resource -A5'
alias tf=terraform

export DIRENV_LOG_FORMAT=
#if which direnv > /dev/null; then
#    eval $(direnv hook bash)
#fi

export SNAPBUILD_NO_COMMIT_PROMPT=1

alias jsum='kronos get-issue-summary'

#source <(kubectl completion bash)

sk="$(readlink -f ~/work/skykit)"
alias sk='cd ~/work/skykit'
