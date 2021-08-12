#!/usr/bin/env bash

nucleus::_setup_shell() {
  unset -f nucleus::_setup_zsh

  # Silence zsh info message at shell startup.
  # Source: https://apple.stackexchange.com/questions/371997/suppressing-the-default-interactive-shell-is-now-zsh-message-in-macos-catalina
  export BASH_SILENCE_DEPRECATION_WARNING=1
}

nucleus::_setup_shell
