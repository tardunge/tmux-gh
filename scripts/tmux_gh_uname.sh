#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/helpers.sh"

# fetch context and namespace
main() {
  local tmux_gh_icon=$(get_tmux_option "@tmux_gh_icon" "Github:")
  local tmux_gh_default_uname=$(get_tmux_option "@tmux_gh_default_uname" "tmux-gh-uname")
  # TODO: use json options when gh supports. Extract host info.
  local uname="$(gh auth status | grep -B1 "Active account: true" | head -n 1 |awk '{for(i=1;i<=NF;i++) if($i=="account") print $(i+1)}')"
  
  if [ -z "$uname" ]; then
    uname=$tmux_gh_default_uname
  fi


  echo -n "$tmux_gh_icon $uname"
}

main
