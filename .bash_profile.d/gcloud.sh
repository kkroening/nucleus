#!/usr/bin/env bash

nucleus::_setup_gcloud() {
  unset -f nucleus::_setup_gcloud
  if [[ -f ~/google-cloud-sdk/path.bash.inc ]]; then
    . ~/google-cloud-sdk/path.bash.inc
  fi
  if [[ -f ~/google-cloud-sdk/completion.bash.inc ]]; then
    . ~/google-cloud-sdk/completion.bash.inc
  fi
}

nucleus::_setup_gcloud
