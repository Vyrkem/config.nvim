#!/bin/bash

SESSION_NAME="dev"
WORKDIR="${1:-.}"
WORKDIR=$(realpath "$WORKDIR")

# Crée une nouvelle session ou s'y attache si elle existe
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
    # Nouvelle session (panneau gauche)
    tmux new-session -d -s $SESSION_NAME -c "$WORKDIR" -x "$(tput cols)" -y "$(tput lines)"

    # Split: crée le panneau central + droite (80% restant)
    tmux split-window -h -p 80 -c "$WORKDIR"

    # Split: crée le panneau de droite (25% de 80% = 20% du total)
    tmux split-window -h -p 25 -c "$WORKDIR"

    # Navigation compatible nvim (vim-tmux-navigator)
    tmux set -t $SESSION_NAME -g @plugin 'christoomey/vim-tmux-navigator'
    tmux bind -n C-h select-pane -L
    tmux bind -n C-l select-pane -R
    tmux bind -n C-j select-pane -D
    tmux bind -n C-k select-pane -U

    # Splits: Ctrl+b puis \ (vertical) ou - (horizontal)
    tmux bind '\' split-window -h -c "#{pane_current_path}"
    tmux bind - split-window -v -c "#{pane_current_path}"

    # Couleurs mauve foncé
    tmux set -t $SESSION_NAME pane-border-style "fg=colour53"
    tmux set -t $SESSION_NAME pane-active-border-style "fg=colour93"
    tmux set -t $SESSION_NAME status-style "bg=colour53,fg=white"

    # Sélectionne le panneau central pour nvim
    tmux select-pane -t 1

    # Lance nvim dans le panneau central
    tmux send-keys "nvim ." Enter

    # Layout final:
    # +------+------------------+------+
    # |      |                  |      |
    # | term |      nvim        | term |
    # | 20%  |       60%        | 20%  |
    # |      |                  |      |
    # +------+------------------+------+
fi

tmux attach-session -t $SESSION_NAME
