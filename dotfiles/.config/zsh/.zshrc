#!zsh

export EDITOR="nvim"
export TERMINAL="st"
export VISUAL="nvim"

setopt hist_ignore_dups
setopt hist_ignore_space
setopt auto_menu

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
alias mpv="mpv --loop"
alias nb="newsboat"
alias lg="cd $HOME/.config/dotgit; lazygit; cd -"
alias vim="nvim -c ':set showtabline=0'"
alias diff="diff --color"
alias micl="doas make install clean; doas make clean"
alias paclog='pacman -Qiie | grep -iE "nome[ ]+:|Data da Instalação" | sed "s/.*: //" | tac | paste -d " " - - | sort -n --k 2'
alias tr="transmission-remote -l | sed '/Sum/d'"
alias sxrm="sxiv -q -o ./ | xargs rm"
alias emacs="emacsclient -t"
alias orgy="emacsclient -t $HOME/Documentos/orgwiki/index.org"
alias off="xset -display :0.0 dpms force off"
alias ytplay="ytplay -t"
alias y2mp3="youtube-dl -x --audio-format mp3 "$1""
alias lf="$HOME/.local/bin/ff"
alias dust="dust -rn $1"
alias du="du -ahxD --apparent-size -d 1 "$@" 2>/dev/null | sort -h -r"
alias fc="fc-list | cut -d ":" -f 2 | fzf"
alias tux="tux -r"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

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
  xdg-open "$(find -L $HOME /media/Vault -maxdepth 4 -type f | fzf --height 100% --preview 'pv {}')"
}

t()
{
  cd $(find -L $HOME /media/Vault -maxdepth 4 -type d | fzf)
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

# Load zsh-syntax-highlighting; should be last.
export FZF_DEFAULT_OPTS='-e -i --height 40% --layout=reverse --border'
source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/unicode.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
