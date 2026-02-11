#!/usr/bin/env bash

# Hack around vim trying to call wrong python when in venv
# (There's gotta be a better way to do this):
unset vi vimdiff
NUCLEUS__VI="$(which vi)"
NUCLEUS__VIMDIFF="$(which vimdiff)"

vi() {
  (
    deactivate 2> /dev/null
    ${NUCLEUS__VI} "$@"
  )
}

vimdiff() {
  (
    deactivate 2> /dev/null
    ${NUCLEUS__VIMDIFF} "$@"
  )
}

vir() {
  #
  # `vir`: Run vim in read-only/unmodifiable mode.
  #
  # This can be useful when editing certain files in multiple tabs to avoid
  # accidentally changing a file that isn't meant to be modified.
  #

  vi -R --cmd ':set nomodifiable' "$@"
}
