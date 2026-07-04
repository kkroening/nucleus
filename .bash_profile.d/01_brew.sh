#!/usr/bin/env bash

nucleus::_setup_homebrew() {
  ##
  ## Set `BREW_PREFIX` if Homebrew is installed - otherwise leave it undefined.
  ##

  unset -f nucleus::_setup_homebrew

  if command -v brew &>/dev/null; then
    BREW_PREFIX="$(brew --prefix)"
  fi
}

nucleus::_setup_homebrew
