#!/usr/bin/env bash

nucleus::_setup_python() {
  unset -f nucleus::_setup_python

  if which pyenv > /dev/null; then
      eval "$(pyenv init -)"
  fi

  export PIPENV_VENV_IN_PROJECT=true
  export PIP_REQUIRE_VIRTUALENV=true
  export PYTHONDONTWRITEBYTECODE=true
  export CLOUDSDK_PYTHON="$(pyenv shell 2.7.14 && pyenv which python)"
}

nucleus::_setup_python
