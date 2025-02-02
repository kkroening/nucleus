#!/usr/bin/env bash

nucleus::_setup_rust() {
  unset -f nucleus::_setup_rust
  if [[ -r ~/.cargo/env ]]; then
    source ~/.cargo/env
  fi
  if which rustc > /dev/null; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library/"
  fi
}

nucleus::_setup_rust
