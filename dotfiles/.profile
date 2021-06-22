export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="chromium"
export READER="zathura"
export FILE="nemo"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"

PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.local/bin/transmission"
PATH="$PATH:$HOME/.emacs.d/bin"
PATH="$PATH:/opt/android-sdk/tools/bin"
PATH="$PATH:/var/lib/snapd/snap/bin"
startx
