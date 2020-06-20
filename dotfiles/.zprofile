# Default programs:
export EDITOR="nvim"
export TERMINAL="st-256color"
export BROWSER="chromium"
export READER="zathura"
export FILE="thunar"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export CARGO_HOME="$XDG_DATA_HOME"/cargo

#PATH="$PATH:$HOME/.local/bin"
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
