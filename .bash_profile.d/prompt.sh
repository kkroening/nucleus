#!/usr/bin/env bash

nucleus::_setup_prompt() {
  unset -f nucleus::_setup_prompt

  ## Prompt that also sets the terminal tab title:
  PS1='\[\e]0;${PWD##*/}\a\]==> \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

  shopt -s cdspell
}

nucleus::_setup_prompt
