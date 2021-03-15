#!/usr/bin/env bash

NUCLEUS__COLOR_LIGHT_GREEN='\033[1;32m'
NUCLEUS__COLOR_OFF='\033[0m'

nucleus::show_banner() {
  2>&1 printf "\n====> ${NUCLEUS__COLOR_LIGHT_GREEN}${@}${NUCLEUS__COLOR_OFF}\n"
}
