#!/usr/bin/env bash

nucleus::_setup_prompt() {
  unset -f nucleus::_setup_prompt

  PS1='==> \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

  shopt -s cdspell
}

nucleus::_setup_prompt
