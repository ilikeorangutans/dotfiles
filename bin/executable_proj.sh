#!/usr/bin/env bash

set -eu

dir=$@
proj=$(basename $dir)

if [[ $(tmux has-session -t "$proj" > /dev/null 2>&1) -ne 1 ]]; then
    tmux switch -t "$proj"
else 
    tmux new-session -c "$dir" -s "$proj" -d
    tmux switch -t "$proj"
fi


