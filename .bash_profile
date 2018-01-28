# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/karlk/usr/google-cloud-sdk/path.bash.inc' ]; then source '/Users/karlk/usr/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/karlk/usr/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/karlk/usr/google-cloud-sdk/completion.bash.inc'; fi

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

PATH=~/bin:${PATH}
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

eval "$(pyenv init -)"
export PIPENV_VENV_IN_PROJECT=true
export PYTHONDONTWRITEBYTECODE=1

#export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8

alias vc='virtualenv .venv --no-site-packages'
alias va='. venv/bin/activate'
alias .va='. .venv/bin/activate'
alias vd='deactivate'
alias ls='ls --color=auto'
alias ..='cd ..'
