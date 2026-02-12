#!/usr/bin/env bash

nucleus::_setup_bash() {
  unset -f nucleus::_setup_zsh

  # Silence zsh info message at bash startup.
  # Source: https://apple.stackexchange.com/questions/371997/suppressing-the-default-interactive-shell-is-now-zsh-message-in-macos-catalina
  export BASH_SILENCE_DEPRECATION_WARNING=1

  alias src='cd ~/src'
}

nucleus::_setup_bash
