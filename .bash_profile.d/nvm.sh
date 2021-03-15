#!/usr/bin/env bash

nucleus::_nvm_init() {
  unset -f nvm node npm npx
  export NVM_DIR=~/.nvm
  if [[ -s "${NVM_DIR}/nvm.sh" ]]; then
    . "${NVM_DIR}/nvm.sh"
  fi
  if [[ -s "${NVM_DIR}/bash_completion" ]]; then
    . "${NVM_DIR}/bash_completion"
  fi
}

nvm() {
  nucleus::_nvm_init
  nvm $@
}

node() {
  nucleus::_nvm_init
  node $@
}

npm() {
  nucleus::_nvm_init
  npm $@
}

npx() {
  nucleus::_nvm_init
  npx $@
}

nucleus::_setup_nvm() {
  unset -f nucleus::_setup_nvm
  export NVM_DIR="${HOME}/.nvm"
}

nucleus::_setup_nvm
