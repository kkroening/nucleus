#!/usr/bin/env bash

nucleus::_setup_gnu_coreutils() {
  # Use gnu coreutils.
  PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
  MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
}

nucleus::_main() {
  unset -f nucleus::_main

  # Setup GNU coreutils before anything else:
  nucleus::_setup_gnu_coreutils
  unset -f nucleus::_setup_gnu_coreutils

  if [[ -d ~/.bash_profile.d ]]; then
    FILES="$(shopt -s nullglob && echo ~/.bash_profile.d/*.sh)"
    for file in ${FILES}; do
      . "${file}"
    done
  fi
}

nucleus::_main
