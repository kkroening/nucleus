#!/usr/bin/env bash

nucleus::_setup_prompt() {
  unset -f nucleus::_setup_prompt

  shopt -s cdspell

  # Windows Terminal CWD integration (only when inside WSL)
  # This enables Duplicate Tab (Ctrl+Shift+D) to open in the current directory.

  if [[ -n "${WT_SESSION}" && -x "$(command -v wslpath)" ]]; then
    PROMPT_COMMAND="${PROMPT_COMMAND:+"${PROMPT_COMMAND}; "}"'printf "\e]9;9;%s\e\\" "$(wslpath -w "${PWD}")"'
  fi

  PS1=''
  PS1+='\[\e]0;${PWD##*/}\a\]'            # Window/tab title: basename of PWD
  PS1+='==> '                             # Prompt prefix
  PS1+='\[\033[01;32m\]\u@\h\[\033[00m\]' # User@host
  PS1+=':'                                # Separator
  PS1+='\[\033[01;34m\]\w\[\033[00m\]'    # Working directory
  PS1+='\$ '                              # Final prompt character
}

nucleus::_setup_prompt
