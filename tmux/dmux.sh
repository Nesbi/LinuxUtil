#!/bin/sh
tmux new-session -d 
tmux split-window -v -p 30 
tmux split-window -h -p 40 'htop'
tmux split-window -v -p 70 'watch -n 60 -t "df -h --type=ext4"'
tmux split-window -v -p 50 'watch -n 60 -t "who -u  | grep -v tmux"'
tmux -2 attach-session -d
