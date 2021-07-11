#!/usr/bin/env bash

nucleus::_setup_git_aliases() {
  unset -f nucleus::_setup_git_aliases

  alias gita='git add'
  alias gitb='git branch'
  alias gitc='git commit'
  alias gitco='git checkout'
  alias gitd='git diff'
  alias gitf='git fetch'
  alias gitl='git log'
  alias gitm='git merge'
  alias gitp='git push'
  alias gitpo='git push origin'
  alias gits='git status'
  alias gitt='git tag'
}

nucleus::_setup_git_aliases
