#!/usr/bin/env bash

nucleus::_setup_aliases() {
  unset -f nucleus::_setup_aliases

  alias ..='cd ..'
  alias .va='. .venv/bin/activate'
  alias .vc='python -m venv .venv'
  alias cccat='ccat --color=always'
  alias less='less -FRX'
  alias lla='ls -la'
  alias ls='ls --color=auto'
  # alias pbc='pbcopy'
  alias pbp='pbpaste'
  alias tf=terraform
  alias va3='. venv3/bin/activate'
  alias va='. venv/bin/activate'
  alias vc='python -m venv venv'
  alias vd='deactivate'
}

nucleus::_setup_aliases
