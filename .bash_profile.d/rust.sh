#!/usr/bin/env bash

nucleus::_setup_rust() {
  unset -f nucleus::_setup_rust

  PATH="/opt/homebrew/opt/rustup/bin:${PATH}"

  if [[ -r ~/.cargo/env ]]; then
    source ~/.cargo/env
  elif [[ ":${PATH}:" != *":${HOME}/.cargo/bin:"* ]]; then
      PATH="${HOME}/.cargo/bin:${PATH}"
  fi

  if which rustc > /dev/null; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library/"
  fi
}

nucleus::_setup_rust
