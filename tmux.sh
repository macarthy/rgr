#!/bin/bash

tmux new -s kata -d
tmux rename-window -t kata vim
tmux send-keys -t kata 'nvim -o class.rb class_spec.rb' C-m
tmux split-window -h -t kata
tmux resize-pane -R 75
tmux send-keys -t kata 'bundle exec guard' C-m
tmux attach -t kata
