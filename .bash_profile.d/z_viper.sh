#!/usr/bin/env bash

nucleus::_setup_viper() {
  unset -f nucleus::_setup_viper

  if [[ "${HOSTNAME}" == "viper" ]]; then
    alias cdc='cd ~/c-home'
    alias cdd='cd ~/d-home'
  fi
}

nucleus::_setup_viper
