#!/usr/bin/env bash

nucleus::_setup_aliases() {
  unset -f nucleus::_setup_aliases

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
}

nucleus::_setup_aliases
