#!/usr/bin/env bash

nucleus::_setup_git_aliases() {
  unset -f nucleus::_setup_git_aliases

  alias gita='git add'
  alias gitb='git branch'
  alias gitbv='git branch -v'
  alias gitc='git commit'
  alias gitco='git checkout'
  alias gitcom='git checkout master'
  alias gitcp='git cherry-pick'
  alias gitd='git diff'
  alias gitdh='git diff HEAD'
  alias gitdom='git diff origin/master'
  alias gitdt='git describe --tags'
  alias gitf='git fetch origin'
  alias gitl1h='git log --oneline --color=always | head'
  alias gitl='git log'
  alias gitlom='git log origin/master'
  alias gitm='git merge'
  alias gitmb='git merge-base'
  alias gitmbom='git merge-base origin/master'
  alias gitmlogom='gitmlog origin/master'
  alias gitmom='git merge origin/master'
  alias gitP='git pull'
  alias gitp='git push'
  alias gitpo='git push origin'
  alias gitpoh='git push origin HEAD'
  alias gitr='git reset'
  alias gitrb='git rebase -i'
  alias gitrbc='git rebase --continue'
  alias gitrbom='git rebase -i origin/master'
  alias gitro='git remote'
  alias gits='git status'
  alias gitsm='git submodule'
  alias gitt='git tag'
}

nucleus::_setup_git_aliases
