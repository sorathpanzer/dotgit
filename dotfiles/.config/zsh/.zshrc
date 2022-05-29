#!zsh

export EDITOR="nvim"
export TERMINAL="st"
export VISUAL="nvim"
export ANDROID_HOME=/opt/android-sdk

setopt hist_ignore_dups
setopt hist_ignore_space
setopt auto_menu
setopt auto_cd
setopt menucomplete
unsetopt prompt_cr prompt_sp

unset zle_bracketed_paste

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt SHARE_HISTORY

autoload -U colors && colors
setopt PROMPT_SUBST

if [[ -f /run/.containerenv && -f /run/.toolboxenv ]]; then
    PS1="%{$fg[blue]%B%}%~$fg[red] ⚫$reset_color"
else
    PS1="%{$fg[blue]%}%~$reset_color ⚡"
fi

#alias ls="exa --icons --group-directories-first"
alias ls="ls --color=auto --group-directories-first"
alias fzf="fzf -m"
alias mpv="mpv --loop"
alias tg="cd $HOME/.config/dotgit; tig; cd -"
alias lgit="lazygit"
alias diff="diff --color"
alias paclog='pacman -Qiie | grep -iE "nome[ ]+:|Data da Instalação" | sed "s/.*: //" | tac | paste -d " " - - | sort -n --k 2'
alias aptlog='zcat /var/log/apt/history.log.*.gz | cat - /var/log/apt/history.log'
alias trl="transmission-remote -l | sed '/Sum/d'"
alias trs='pidof transmission-daemon >/dev/null || (transmission-daemon && notify-send "Starting transmission daemon...")'
alias ytsub="yt -S --sort"
alias y2mp3="youtube-dl -x --audio-format mp3 "$1""
alias du="du -h -d 1 "$@" 2>/dev/null | sort -h -r"
#export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
alias xpg="gpg -c --no-symkey-cache --cipher-algo AES256"
alias emacs="emacsclient -c -a 'emacs'"
alias vim="nvim"
alias box="toolbox run"

trd()
{
  list=$(trl | tail -n +2 | fzf | awk '{print $1}')
  transmission-remote -t $list --remove
}

iwf() {
  iwctl station wlan0 scan
  sleep 2
  SSID="$(iwctl station wlan0 get-networks | awk '{print $1}' | head -n -1 | tail -n +5 | fzf)"
  iwctl station wlan0 connect $SSID
}

fl() {
    FILE="$HOME/.config/lf/lf.d"
    ff "$@"
    if test -f "$FILE"; then
      cd "$(cat "$FILE")"
      rm ~/.config/lf/lf.d
    fi
      killall -q --signal 9 ueberzug
#      clear
}
alias lf="fl"

fkill() {
  process=$(ps -ef | fzf | awk '{print $8}')
  pkill --signal 9 $process
}

fzf-down() {
  fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

spac() {
  pacmenu=$(paru -Ss $1 | awk "1" RS="\n[ \t]* " ORS=" >> " | fzf | awk '{print $1}')
  paru -S $pacmenu
}

rpac() {
  cd /var/cache/pacman/pkg
  doas pacman -U $(exa | grep -v / | fzf)
  cd -
}

#myip - finds your current IP if your connected to the internet
myip() {
	lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}

# Calculator
calc() { echo "scale=5;$*" | bc -l; }

o()
{
    nvim "$(find -L . $HOME -maxdepth 4 -type f | fzf --height 100% --preview 'pv {}')"
}

t()
{
    cd $(find -L . $HOME -maxdepth 4 -type d | fzf)
    lf
}

msd() {
  sudo udisksctl unlock -b /dev/sda1
  sudo udisksctl mount -b /dev/dm-3
  cd /media/Vault
  ls -alF
}

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump
_comp_options+=(globdots)		# Include hidden files.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey '^H' backward-kill-word
bindkey "\e[3~" delete-char

bindkey '^v' edit-command-line
bindkey -s '<<' 't\n'
bindkey -s '<z' 'o\n'
bindkey -s "^t" 'msd\n'
bindkey -s '^z' 'zsh\n'
bindkey -s '^x' 'fg\n'
bindkey '^[x' autosuggest-execute
bindkey '^[z' autosuggest-toggle

# Load zsh-syntax-highlighting; should be last.
export FZF_DEFAULT_OPTS='-e -i --height 40% --layout=reverse --border'
source ~/.config/zsh/plugins/fzf.zsh
source ~/.config/zsh/plugins/unicode.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions.zsh 2>/dev/null
source ~/.config/zsh/plugins/zsh-syntax-highlighting.zsh 2>/dev/null
source ~/.config/zsh/plugins/sudo.plugin.zsh
source ~/.config/zsh/plugins/fancy-ctrl-z.plugin.zsh
