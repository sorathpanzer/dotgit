#!zsh

export EDITOR="nvim"
export TERMINAL="st"
export VISUAL="nvim"
export ANDROID_HOME=/opt/android-sdk

setopt hist_ignore_dups
setopt hist_ignore_space
setopt auto_menu
unsetopt prompt_cr prompt_sp

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt SHARE_HISTORY

autoload -U colors && colors
setopt PROMPT_SUBST
PS1="%{$fg[blue]%}%~$reset_color ⚡"

alias ls="exa --icons -a --group-directories-first"
alias fzf="fzf -m"
alias ifz="ifzf --no-height --no-reverse"
alias mpv="mpv --loop"
alias nb="newsboat"
alias lg="cd $HOME/.config/dotgit; lazygit; cd -"
alias vim="nvim -c ':set showtabline=0'"
alias diff="diff --color"
alias paclog='pacman -Qiie | grep -iE "nome[ ]+:|Data da Instalação" | sed "s/.*: //" | tac | paste -d " " - - | sort -n --k 2'
alias tr="transmission-remote -l | sed '/Sum/d'"
alias emacs="emacsclient -t"
alias orgy="emacsclient -t $HOME/Documentos/orgwiki/index.org"
alias off="xset -display :0.0 dpms force off"
alias ytplay="ytplay -t"
alias yt="ytplay -t -S --fancy-subs=0 --subs=1"
alias y2mp3="youtube-dl -x --audio-format mp3 "$1""
alias du="du -h -d 1 "$@" 2>/dev/null | sort -h -r"
alias fc="fc-list | cut -d ":" -f 2 | fzf"
alias tux="tux -r"
alias market='w3m "http://68k.news/index.php?section=business&loc=PT"'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias sudo="doas"
alias xpg="gpg -c --no-symkey-cache --cipher-algo AES256"

iwf() {
  iwctl station wlan0 scan
  SSID="$(iwctl station wlan0 get-networks | awk '{print $1}' | head -n -1 | tail -n +5 | fzf)"
  iwctl station wlan0 connect $SSID
}

gpull() {
  git stash --include-untracked
  git reset --hard
  git clean -fd
  git pull
}

fl() {
    FILE="$HOME/.config/lf/lf.d"
    ff "$@"
    if test -f "$FILE"; then
      cd "$(cat "$FILE")"
      rm ~/.config/lf/lf.d
    fi
      killall -q --signal 9 ueberzug
      #killall -q --signal 9 lf
      clear
}
alias lf="fl"

fkill() {
  process=$(ps -ef | fzf | awk '{print $8}')
  pkill --signal 9 $process
}

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})' |
    cut -c4- | sed 's/.* -> //'
  #git add $selectum
  #echo "Commit Message:"
  #read MESSAGE
  #git commit -m "$MESSAGE"
	#git push -u origin master

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

# mkdir and cd in one command
mcd() {
	mkdir -p -- "$1" &&
		cd -P -- "$1" || return
	}

o()
{
  if [ -d "/media/Vault" ]; then
    xdg-open "$(find -L $HOME /media/Vault -maxdepth 4 -type f | fzf --height 100% --preview 'pv {}')"
  else
    xdg-open "$(find -L $HOME -maxdepth 4 -type f | fzf --height 100% --preview 'pv {}')"
  fi
}

t()
{
  if [ -d "/media/Vault" ]; then
    cd $(find -L $HOME /media/Vault -maxdepth 4 -type d | fzf)
    lf
  else
    cd $(find -L $HOME -maxdepth 4 -type d | fzf)
    lf
  fi
}

msd() {
  doas udisksctl unlock -b /dev/sda1
  doas udisksctl mount -b /dev/dm-1
  cd /media/Vault
  ls -alF
}

xt () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.xz)    tar xvf $1     ;;
			*.tar.bz2)   tar xvjf $1    ;;
			*.tar.gz)    tar xvzf $1    ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       unrar e $1     ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xvf $1     ;;
			*.tbz2)      tar xvjf $1    ;;
			*.tgz)       tar xvzf $1    ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)           echo "don't know how to extract "$1"..." ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}

cx () {
    tar cfJv "$1.tar.xz" "$1"
    ls -la
}

setopt auto_cd
setopt menucomplete

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

# Load zsh-syntax-highlighting; should be last.
export FZF_DEFAULT_OPTS='-e -i --height 40% --layout=reverse --border'
source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/forgit.zsh
source ~/.config/zsh/unicode.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
