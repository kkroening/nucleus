#!/usr/bin/env bash

nucleus::_setup_homebrew() {
  unset -f nucleus::_setup_homebrew

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

nucleus::_setup_gnu_coreutils() {
  unset -f nucleus::_setup_gnu_coreutils

  # Use gnu coreutils.
  PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
  MANPATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnuman:$MANPATH"

  # # TBD:
  # PATH="${HOMEBREW_PREFIX}/opt/gnu-tar/libexec/gnubin:$PATH"
}

nucleus::_main() {
  unset -f nucleus::_main

  # Setup Homebrew + GNU coreutils before anything else:
  nucleus::_setup_homebrew
  nucleus::_setup_gnu_coreutils

  if [[ -d ~/.bash_profile.d ]]; then
    FILES="$(shopt -s nullglob && echo ~/.bash_profile.d/*.sh)"
    for file in ${FILES}; do
      . "${file}"
    done
  fi
}

nucleus::_main
