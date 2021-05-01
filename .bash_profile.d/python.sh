#!/usr/bin/env bash

nucleus::_setup_python() {
  unset -f nucleus::_setup_python

  if [[ -d ~/.pyenv/bin ]]; then
    PATH="${PATH}:~/.pyenv/bin"
  fi
  if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
    export CLOUDSDK_PYTHON="$(pyenv shell 2.7.14 && pyenv which python)"
  fi

  export PIPENV_VENV_IN_PROJECT=true
  export PIP_REQUIRE_VIRTUALENV=true
  export PYTHONDONTWRITEBYTECODE=true
}

nucleus::_setup_python
