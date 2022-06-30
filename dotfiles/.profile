#!/bin/bash

if [ "$(tty)" = "/dev/tty1" ]; then

export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export TERM=vt100

# ~/ Clean-up:
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export _JAVA_AWT_WM_NONREPARENTING=1

PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.local/bin/dblocks"
PATH="$PATH:$HOME/.local/bin/dmenuX"
PATH="$PATH:$HOME/.local/bin/lfx"
PATH="$PATH:$HOME/.local/bin/utils"
PATH="$PATH:$HOME/.local/bin/transmission"

eval $( dircolors -b $HOME/.config/dir_colors )

  startx
fi

