#!/usr/bin/env bash

nucleus::_setup_aliases() {
  unset -f nucleus::_setup_aliases

  # alias pbc='pbcopy'  # TBD: replaced by script

  alias ..='cd ..'
  alias less='less -FRX'
  alias lla='ls -la'
  alias ls='ls --color=auto'
  alias pbp='pbpaste'
  alias tf=terraform
  alias .va='. .venv/bin/activate'
  alias va3='. venv3/bin/activate'
  alias va='. venv/bin/activate'
  alias vc='virtualenv venv'
  alias vd='deactivate'
  alias cccat='ccat --color=always'
}

nucleus::_setup_aliases
