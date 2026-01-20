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
  fi

  export PIPENV_VENV_IN_PROJECT=true
  export PIP_REQUIRE_VIRTUALENV=true
  # export PYTHONBREAKPOINT=IPython.terminal.debugger.set_trace
  export PYTHONDONTWRITEBYTECODE=true

  # https://stackoverflow.com/questions/66640705/how-can-i-install-grpcio-on-an-apple-m1-silicon-laptop
  export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
  export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

  alias por='poetry run'
  alias mytest='mypy && pytest'

  # Poetry has a severely brain-dead "intentional" design choice where
  # `poetry install` pointlessly hard-fails if the deps change in
  # `pyproject.toml` rather than just doing The Right Fucking Thing and
  # automatically updating the lockfile - claiming that it's "dangerous" when
  # in fact the lockfile is version controlled and clearly diffable - requiring
  # you to manually run `poetry lock` *sometimes* depending on whether the
  # stupid fucking thing dies with the "intentional" hard-fail error message.
  # This alias eliminates such useless noise.
  alias poinst='poetry lock && poetry install'

  # Alternatively, nuke the entire Poetry venv + lock file to completely
  # upgrade, limited only by pyproject version constraints.  If doing this
  # causes problems, your pyproject version constraints are wrong - not this
  # command.  In theory, `poetry update` should do something similar, but it's
  # got a mind of its own and foolishly tries to adhere to existing lock file
  # and venv state making upgrades behave erradically depending on hidden state.
  alias ponuke='rm -rf .venv poetry.lock; poetry install'
}

nucleus::_setup_python
