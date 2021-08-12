#!/usr/bin/env bash

cda() {
  if [[ $# -ne 1 ]]; then
    echo "Usage: cdr <dir>" 2>&1
    exit 1
  fi
  local -r rel_dir="$1"
  local -r abs_dir="$(readlink -f "${rel_dir}")"
  cd "${abs_dir}"
}
