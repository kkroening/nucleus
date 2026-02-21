#!/usr/bin/env bash

nucleus::_setup_aliases() {
  unset -f nucleus::_setup_aliases

  # alias pbc='pbcopy'  # TBD: replaced by script

  alias cccat='ccat --color=always'
  alias ..='cd ..'
  alias less='less -FRX'
  alias lla='ls -la'
  alias ls='ls --color=auto'
  alias tf=terraform
  alias va3='. venv3/bin/activate'
  alias .va='. .venv/bin/activate'
  alias va='. venv/bin/activate'
  alias .vc='python -m venv .venv'
  alias vc='python -m venv venv'
  alias vd='deactivate'
}

nucleus::_setup_aliases
