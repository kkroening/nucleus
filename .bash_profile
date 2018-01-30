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

# Setup aliases.
alias vc='virtualenv .venv --no-site-packages'
alias va='. venv/bin/activate'
alias .va='. .venv/bin/activate'
alias vd='deactivate'
alias ls='ls --color=auto'
alias ..='cd ..'

# Setup gcloud.
if [ -f '/Users/karlk/usr/google-cloud-sdk/path.bash.inc' ]; then source '/Users/karlk/usr/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/Users/karlk/usr/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/karlk/usr/google-cloud-sdk/completion.bash.inc'; fi

# Include nucleus tools.
NUCLEUS_DIR="$(dirname $(readlink -f ~/.bashrc))"
PATH=~/bin:${NUCLEUS_DIR}/bin:${PATH}
