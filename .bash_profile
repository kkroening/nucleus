nucleus::_setup_aliases() {
  # Setup aliases.
  alias vc='virtualenv venv'
  alias va='. venv/bin/activate'
  alias va3='. venv3/bin/activate'
  alias vd='deactivate'
  alias ls='ls --color=auto'
  alias less='less -FRX'
  alias ..='cd ..'

  alias gits='git status'
  alias pbc='pbcopy'
  alias pbp='pbpaste'

  alias tf=terraform

  sk="$(readlink -f ~/work/skykit)"
  alias sk='cd ~/work/skykit'

  alias ops-serving='~/work/skykit/ops/venv/bin/skykit-ops serving'
}

nucleus::_setup_gcloud() {
  # Setup gcloud.
  if [[ -f '/Users/karlk/google-cloud-sdk/path.bash.inc' ]]; then
    source '/Users/karlk/google-cloud-sdk/path.bash.inc'
  fi
  if [[ -f '/Users/karlk/google-cloud-sdk/completion.bash.inc' ]]; then
    source '/Users/karlk/google-cloud-sdk/completion.bash.inc'
  fi
}

nucleus::_setup_gnu_coreutils() {
  # Use gnu coreutils.
  PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
  MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
}

nucleus::_setup_iterm() {
  #test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
  true
}

nucleus::_setup_kubectl() {
  #source <(kubectl completion bash)

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
}

nucleus::_setup_misc() {
  export SNAPBUILD_NO_COMMIT_PROMPT=1
}

nucleus::_setup_nucleus() {
  # Include nucleus tools.
  NUCLEUS_DIR="$(dirname $(readlink -f ~/.bashrc))"
  PATH=~/bin:${NUCLEUS_DIR}/bin:${PATH}
}

nucleus::_nvm_init() {
  unset -f nvm node npm npx
  export NVM_DIR=~/.nvm
  [[ -s "${NVM_DIR}/nvm.sh" ]] && . "${NVM_DIR}/nvm.sh"
  [[ -s "$NVM_DIR/bash_completion" ]] && . "${NVM_DIR}/bash_completion"
}

nvm() {
  nucleus::_nvm_init
  nvm $@
}

node() {
  nucleus::_nvm_init
  node $@
}

npm() {
  nucleus::_nvm_init
  npm $@
}

npx() {
  nucleus::_nvm_init
  npx $@
}

nucleus::_setup_nvm() {
  export NVM_DIR="$HOME/.nvm"
}

nucleus::_setup_prompt() {
  # Setup prompt.
  PS1='==> \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
}

nucleus::_setup_python() {
  # Setup python (pyenv, pip, virtualenv, etc.)
  if which pyenv > /dev/null; then
      eval "$(pyenv init -)"
  fi
  export PIPENV_VENV_IN_PROJECT=true
  export PIP_REQUIRE_VIRTUALENV=true
  export PYTHONDONTWRITEBYTECODE=true
  export CLOUDSDK_PYTHON="$(pyenv shell 2.7.14 && pyenv which python)"
}

nucleus::_setup_vim() {
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
}

nucleus::_setup_qt() {
  ## QT stuff (log during `brew install qt5`):
  #echo 'export PATH="/usr/local/opt/qt/bin:$PATH"' >> ~/.bash_profile
  #LDFLAGS:  -L/usr/local/opt/qt/lib
  #CPPFLAGS: -I/usr/local/opt/qt/include
  #PKG_CONFIG_PATH: /usr/local/opt/qt/lib/pkgconfig
  export PATH="/usr/local/opt/qt/bin:$PATH"
  export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
}

nucleus::_setup_rust() {
  export PATH="$HOME/.cargo/bin:$PATH"
  export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/
}

nucleus::_main() {
  # Setup GNU coreutils before anything else:
  nucleus::_setup_gnu_coreutils
  unset -f nucleus::_setup_gnu_coreutils

  local -r funcs=(
    nucleus::_setup_aliases
    nucleus::_setup_gcloud
    nucleus::_setup_iterm
    nucleus::_setup_kubectl
    nucleus::_setup_misc
    nucleus::_setup_nucleus
    nucleus::_setup_nvm
    nucleus::_setup_prompt
    nucleus::_setup_python
    nucleus::_setup_qt
    nucleus::_setup_rust
    nucleus::_setup_vim
  )

  local func
  for func in "${funcs[@]}"; do
    "${func}"
    unset -f "${func}"
  done

  unset -f nucleus::_main
}

nucleus::_main
