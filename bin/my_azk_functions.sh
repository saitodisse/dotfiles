#!/bin/bash


# output colors

atput() {
  [ -z "$TERM" ] && return 0
  eval "tput $@"
}

escape() {
  echo "$@" | sed "
    s/%{red}/$(atput setaf 1)/g;
    s/%{green}/$(atput setaf 2)/g;
    s/%{yellow}/$(atput setaf 3)/g;
    s/%{blue}/$(atput setaf 4)/g;
    s/%{magenta}/$(atput setaf 5)/g;
    s/%{cyan}/$(atput setaf 6)/g;
    s/%{white}/$(atput setaf 7)/g;
    s/%{bold}/$(atput bold atput setaf 7 atput sgr0)/g;
    s/%{reset}/$(atput sgr0)/g;
    s/%{[a-z]*}//g;
  "
}

log() {
  local level="$1"; shift
  case "${level}" in
  blue)
    local color="%{blue}"
    ;;
  yellow)
    local color="%{yellow}"
    ;;
    bold)
    local color="%{bold}"
    ;;
  esac

  if [[ $1 == "-n" ]]; then
    local opts="-n"
    shift
  fi

  if [[ $1 == "-e" ]]; then
    local opts="$opts -e"
    shift
  fi

  echo $opts "$(escape "${color}\$>%{reset} $@")"
}

blue() { log blue $@; }
yellow() { log yellow $@; }
bold() { log bold $@; }

function exec_and_log() {
  log bold "$@";
  $@;
}



# azk "ALIASES"

function bazk() {
  log yellow "using /usr/bin/azk";
  /usr/bin/azk $@;
}

function mazk() {
  log yellow "using ~/_git/master-azk/bin/azk";
  ~/_git/master-azk/bin/azk $@;
}



# azk lauchers

  ## azk dev
function azk_atom() {
  exec_and_log cd ~/_git/azk
  exec_and_log atom ~/_git/azk
}

function z1_azk_start_agent() {
  exec_and_log cd ~/_git/azk
  exec_and_log ./bin/azk agent start --no-daemon
}

function z2_azk_nvm_gulp_watch() {
  exec_and_log cd ~/_git/azk
  exec_and_log ./bin/azk nvm gulp watch
}

function z3_tail_sed_azk_log_files() {
  exec_and_log cd ~/_git/azk
  log bold "tail -f ~/.azk/data/logs/azk.log | sed -n '/\[postal\]/p' & tail -f ~/.azk/data/logs/azk_test.log | sed -n '/\[postal\]/p'";
  tail -f ~/.azk/data/logs/azk.log | sed -n '/\[postal\]/p' & tail -f ~/.azk/data/logs/azk_test.log | sed -n '/\[postal\]/p'
}

  ## master azk
function mazk_atom() {
  exec_and_log cd ~/_git/master-azk
  exec_and_log atom ~/_git/master-azk
}

function mz1_azk_start_agent() {
  exec_and_log cd ~/_git/master-azk
  exec_and_log ./bin/azk agent start --no-daemon
}

function mz2_azk_nvm_gulp_watch() {
  exec_and_log cd ~/_git/master-azk
  exec_and_log ./bin/azk nvm gulp watch
}

  ## utilitários
function todo_atom() {
  exec_and_log cd ~/_git/todolist.md
  exec_and_log atom ~/_git/todolist.md
}
function dotfiles_atom() {
  exec_and_log cd ~/_git/dotfiles
  exec_and_log atom ~/_git/dotfiles
}