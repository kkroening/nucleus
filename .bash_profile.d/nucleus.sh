#!/usr/bin/env bash

nucleus::_setup_nucleus() {
  unset -f nucleus::_setup_nucleus
  NUCLEUS_DIR="$(dirname $(readlink -f ~/.bashrc))"
  PATH=~/bin:${NUCLEUS_DIR}/bin:${PATH}
}

nucleus::_setup_nucleus
