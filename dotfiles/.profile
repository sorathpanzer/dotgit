export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="qutebrowser"
export READER="zathura"
export TERM=vt100

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export _JAVA_AWT_WM_NONREPARENTING=1

PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.local/bin/transmission"
PATH="$PATH:/opt/android-sdk/tools/bin"
PATH="$PATH:/var/lib/snapd/snap/bin"

eval $( dircolors -b $HOME/.config/dir_colors )

if [ "$(tty)" = "/dev/tty1" ]; then
  #sx $HOME/.xinitrc
  startx
fi

