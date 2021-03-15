#!/usr/bin/env bash

# Hack around vim trying to call wrong python when in venv
# (There's gotta be a better way to do this):
unset vi vimdiff
NUCLEUS__VI="$(which vi)"
NUCLEUS__VIMDIFF="$(which vimdiff)"
vi() {
    (deactivate 2>/dev/null; ${NUCLEUS__VI} $@)
}
vimdiff() {
    (deactivate 2>/dev/null; ${NUCLEUS__VIMDIFF} $@)
}
