#!/usr/bin/env bash

set -u

dir=$@
proj=$(basename $dir)

if tmux has-ession -t "$proj"; then
    tmux switch -t "$proj"
else 
    tmux new-session -c "$dir" -s "$proj" -d
    tmux switch -t "$proj"
fi


