#!/usr/bin/env bash

nucleus::_setup_gcloud() {
  unset -f nucleus::_setup_gcloud

  if [[ -d "${HOME}/google-cloud-sdk" ]]; then
    GCLOUD_ROOT="${HOME}/google-cloud-sdk"
  elif [[ -n "${BREW_PREFIX:-}" ]]; then
    local candidate_dir="${BREW_PREFIX}/share/google-cloud-sdk"
    if [[ -d "${candidate_dir}" ]]; then
      GCLOUD_ROOT="${candidate_dir}"
    fi
  fi

  if [[ -n "${GCLOUD_ROOT:-}" && -d "${GCLOUD_ROOT}" ]]; then
    PATH="${GCLOUD_ROOT}/bin:${PATH}"

    ## gcloud's `path.bash.inc` pollutes global bash variables (like `bin_path`,
    ## `apparent_sdk_dir`, etc.) merely to set PATH; done above instead.
    # if [[ -f "${GCLOUD_ROOT}/path.bash.inc" ]]; then
    #   source "${GCLOUD_ROOT}/path.bash.inc"
    # fi

    ## TBD: gcloud auto-completion is annoying - especially for gsutil.
    # if [[ -f "${GCLOUD_ROOT}/completion.bash.inc" ]]; then
    #   source "${GCLOUD_ROOT}/completion.bash.inc"
    # fi
  fi

  # # Note: gcloud auto-completion is quite annoying - especially for gsutil.
  # if [[ -f "${GCLOUD_ROOT}/completion.bash.inc" ]]; then
  #   source "${GCLOUD_ROOT}/completion.bash.inc"
  # fi

  alias gccu='gcloud components update'
  alias gcs='gcloud storage'
}

nucleus::_setup_gcloud
