#!/usr/bin/env bash

nucleus::_setup_rust() {
  unset -f nucleus::_setup_rust
  export PATH="${HOME}/.cargo/bin:${PATH}"
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library/"
}

nucleus::_setup_rust
