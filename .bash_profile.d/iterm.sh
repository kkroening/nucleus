#!/usr/bin/env bash

nucleus::_setup_iterm() {
  unset -f nucleus::_setup_iterm
  #test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
}

nucleus::_setup_iterm
