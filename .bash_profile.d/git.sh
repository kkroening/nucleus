#!/usr/bin/env bash

nucleus::_setup_git_aliases() {
  unset -f nucleus::_setup_git_aliases

  alias gita='git add'
  alias gitb='git branch'
  alias gitc='git commit'
  alias gitco='git checkout'
  alias gitcp='git cherry-pick'
  alias gitd='git diff'
  alias gitdom='git diff origin/master'
  alias gitf='git fetch'
  alias gitl='git log'
  alias gitlom='git log origin/master'
  alias gitm='git merge'
  alias gitmb='git merge-base'
  alias gitmbom='git merge-base origin/master'
  alias gitmom='git merge origin/master'
  alias gitp='git push'
  alias gitpo='git push origin'
  alias gitr='git reset'
  alias gitrb='git rebase'
  alias gitro='git remote'
  alias gits='git status'
  alias gitsm='git submodule'
  alias gitt='git tag'
}

nucleus::_setup_git_aliases
