#!/usr/bin/env bash

nucleus::_setup_viper() {
  unset -f nucleus::_setup_viper

  if [[ "${HOSTNAME}" == "viper" ]]; then
    alias cdc='cd ~/c-home'
    alias cdd='cd ~/d-home'

    # export QT_SCALE_FACTOR="1.5"
  fi
}

nucleus::_setup_viper
