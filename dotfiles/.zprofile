# Default programs:
export EDITOR="/usr/bin/nvim"
export TERMINAL="st"
export BROWSER="chromium"
export READER="zathura"
export FILE="thunar"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export CARGO_HOME="$XDG_DATA_HOME"/cargo

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
