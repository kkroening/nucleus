#!/usr/bin/env bash

nucleus::_setup_prompt() {
  unset -f nucleus::_setup_prompt

  shopt -s cdspell

  # Windows Terminal CWD integration (only when inside WSL)
  # This enables Duplicate Tab (Ctrl+Shift+D) to open in the current directory.

  if [[ -n "${WT_SESSION}" && -x "$(command -v wslpath)" ]]; then
    PROMPT_COMMAND="${PROMPT_COMMAND:+"${PROMPT_COMMAND}; "}"'printf "\e]9;9;%s\e\\" "$(wslpath -w "${PWD}")"'
  fi

  local default_color='01;32'        # Green
  # local default_color='01;38;5;73' # CadetBlue

  # Per-host hostname color. Each known host gets a distinct hue so it's
  # obvious at a glance which machine a shell is on; unmapped hosts fall back
  # to the default green. Extend the case as new hosts come online.
  local host_color
  case "${HOSTNAME%%.*}" in
    axiom) host_color='01;31' ;;       # Maroon
    cobra) host_color='01;96' ;;       # Cyan
    viper) host_color='01;38;5;214' ;; # Orange1
    tegu) host_color='01;38;5;141' ;;  # MediumPurple1
    *) host_color="${default_color}" ;;
  esac

  PS1=''
  PS1+='\[\e]0;${PWD##*/}\a\]'                        # Window/tab title: basename of PWD
  PS1+='==> '                                         # Prompt prefix
  PS1+="\[\033[${default_color}m\]\u@\[\033[00m\]"    # User@
  PS1+="\\[\\033[${host_color}m\\]\\h\\[\\033[00m\\]" # Host (per-host color)
  PS1+=':'                                            # Separator
  PS1+='\[\033[01;34m\]\w\[\033[00m\]'                # Working directory
  PS1+='\$ '                                          # Final prompt character
}

nucleus::_setup_prompt
