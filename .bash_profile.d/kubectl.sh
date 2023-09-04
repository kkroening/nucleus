#!/usr/bin/env bash

kcgcc() (
  set -euo pipefail
  nucleus::show_banner "Current kubectl context:" >&2
  kubectl config view --minify -o json \
    | yq ".contexts[0].context" -y \
    | grep -G '^\(cluster\|namespace\)'
  echo "" >&2
)

kcsns() (
  set -euo pipefail
  if [[ $# -ne 1 ]]; then
    echo "Usage: kcsns <namespace>" 2>&1
    exit 1
  fi

  local -r namespace="$1"
  local -r context="$(kubectl config current-context)"
  kubectl config set-context "${context}" --namespace "${namespace}"
)

kcscc() (
  set -euo pipefail
  if [[ $# -ne 1 && $# -ne 2 ]]; then
    echo 'Usage: kcsc <envid> [namespace]' 2>&1
    exit 1
  fi

  local -r context="$1"
  kubectl config use-context "${context}"

  if [[ $# -gt 1 ]]; then
    local -r namespace="$2"
    kcsns "${namespace}"
  fi

  kcgcc
)

nucleus::_setup_kubectl() {
  unset -f nucleus::_setup_kubectl

  #source <(kubectl completion bash)

  alias kw='watch -n 1 kubectl'
  alias kc='kubectl'
  alias kca='kc apply'
  alias kcc='kc create'
  alias kcfg='kc config'
  #alias kcfggc='kcfg get-contexts'
  #alias kcfguc='kcfg use-context'
  alias kce='kc exec'
  alias kcg='kc get'
  alias kwg='kw get'
  alias kcD='kc delete'

  alias kcgcm='kc get configmaps'
  alias kwgcm='kw get configmaps'
  alias kcdcm='kc describe configmap'
  alias kwdcm='kw describe configmap'

  alias kcgd='kc get deployments'
  alias kwgd='kw get deployments'
  alias kcdd='kc describe deployment'
  alias kwdd='kw describe deployment'

  alias kcgp='kc get pods'
  alias kwgp='kw get pods'
  alias kcdp='kc describe pod'
  alias kwdp='kw describe pod'
  alias kcDp='kc delete pod'

  alias kcgi='kc get ingress'
  alias kwgi='kw get ingress'
  alias kcdi='kc describe ingress'
  alias kwdi='kw describe ingress'
  alias kcDi='kc delete ingress'

  alias kcgs='kc get services'
  alias kwgs='kw get services'
  alias kcds='kc describe service'
  alias kwds='kw describe service'

  alias kcgS='kc get secrets'
  alias kwgS='kw get secrets'
  alias kcdS='kc describe secret'
  alias kwdS='kw describe secret'

  alias kcgj='kc get jobs'
  alias kwgj='kw get jobs'
  alias kcdj='kc describe job'
  alias kwdj='kw describe job'
  alias kcDj='kc delete job'

  alias kcgcj='kc get cronjobs'
  alias kwgcj='kw get cronjobs'
  alias kcdcj='kc describe cronjob'
  alias kwdcj='kw describe cronjob'
  alias kcDcj='kc delete cronjob'

  alias kcge='kc get events'
  alias kwge='kw get events'
  alias kcde='kc describe event'
  alias kwde='kw describe event'

  alias kcgn='kc get nodes'
  alias kwgn='kw get nodes'
  alias kcdn='kc describe node'
  alias kwdn='kw describe node'

  alias kcgN='kc get namespaces'
  alias kwgN='kw get namespaces'
  alias kcdN='kc describe namespaces'
  alias kwdN='kw describe namespaces'

  alias kcgss='kc get statefulset'
  alias kwgss='kw get statefulset'
  alias kcdss='kc describe statefulset'
  alias kwdss='kw describe statefulset'

  alias kcgrs='kc get replicaset'
  alias kwgrs='kw get replicaset'
  alias kcdrs='kc describe replicaset'
  alias kwdrs='kw describe replicaset'

  alias kcges='kc get elasticsearch'
  alias kwges='kw get elasticsearch'
  alias kcdes='kc describe elasticsearch'
  alias kwdes='kw describe elasticsearch'

  alias kcgkb='kc get kibana'
  alias kwgkb='kw get kibana'
  alias kcdkb='kc describe kibana'
  alias kwdkb='kw describe kibana'

  alias kcl='kc logs'
  alias kwl='kw logs'
  alias kcd='kc describe'
  alias kwd='kw describe'
  alias kcl='kc logs'
  alias kwl='kw logs'
  alias kcpf='kc port-forward'
  alias kcgc='kubectl config get-contexts'
  alias kctn='kubectl top node'
  alias kcnres='kcdn | grep Resource -A5'
}

nucleus::_setup_kubectl
