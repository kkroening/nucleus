#!/usr/bin/env bash

nucleus::_setup_gcloud() {
  unset -f nucleus::_setup_gcloud

  GCLOUD_ROOT1="~/google-cloud-sdk"
  GCLOUD_ROOT2="${HOMEBREW_PREFIX}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
  if [[ -d "${GCLOUD_ROOT1}" ]]; then
    GCLOUD_ROOT="${GCLOUD_ROOT1}"
  elif [[ -d "${GCLOUD_ROOT2}" ]]; then
    GCLOUD_ROOT="${GCLOUD_ROOT2}"
  fi

  if [[ -f "${GCLOUD_ROOT}/path.bash.inc" ]]; then
    source "${GCLOUD_ROOT}/path.bash.inc"
  fi
  if [[ -f "${GCLOUD_ROOT}/completion.bash.inc" ]]; then
    source "${GCLOUD_ROOT}/completion.bash.inc"
  fi
}

nucleus::_setup_gcloud
