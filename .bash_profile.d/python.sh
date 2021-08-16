#!/usr/bin/env bash

nucleus::_setup_python() {
  unset -f nucleus::_setup_python

  export PYENV_ROOT="${HOME}/.pyenv"
  if [[ -d "${PYENV_ROOT}/bin" ]]; then
    # Note: Not all pyenv installations have a `bin` directory in
    # `${PYENV_ROOT}`; e.g. pyenv installed via homebrew has the pyenv binary
    # in `/usr/local/bin`, in which case this section is skipped.
    PATH="${PATH}:${PYENV_ROOT}/bin"
  fi
  if which pyenv > /dev/null; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    export CLOUDSDK_PYTHON="$(pyenv shell 2.7.14 && pyenv which python)"
  fi

  export PIPENV_VENV_IN_PROJECT=true
  export PIP_REQUIRE_VIRTUALENV=true
  export PYTHONDONTWRITEBYTECODE=true
}

nucleus::_setup_python
