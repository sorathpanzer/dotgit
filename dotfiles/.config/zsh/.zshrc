#!/usr/bin/zsh

eval "$(fasd --init posix-alias zsh-hook)"
export EDITOR="nvim"
export TERMINAL="st"
export VISUAL="nvim"
#PATH="$PATH:$HOME/.local/bin"

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
PS1="%B%{$fg[red]%}[%{$fg[white]%}%n%{$fg[white]%}@%{$fg[white]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%} λ%b "

#RPROMPT='[%D{%a %d %b %Y %H:%M}]'
#TMOUT=1
#TRAPALRM() {
#    zle reset-prompt
#}

#alias doas="doas --"
convert="convert -quality 100"
alias nb="newsboat"
alias cl="clear"
alias lg="cd $HOME/.config/dotgit; lazygit; cd -"
alias vfm="$HOME/.config/vifm/scripts/vifmrun"
alias vm='nvim'
alias vim='nvim'
alias diff="diff --color"
alias ap="absolutely-proprietary"
alias cpl="sudo make install clean; sudo make clean"
alias ls='ls --color --group-directories-first'
alias paclog='pacman -Qiie | grep -iE "nome[ ]+:|Data da Instalação" | sed "s/.*: //" | tac | paste -d " " - - | sort -n --k 2'
alias tr="transmission-remote -l | sed '/Sum/d'"
alias dck="docker inspect -f \
'{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' \
$1"
alias v="f -e nvim"

calc()
{
   echo $* | bc
}
alias calc='noglob calc'

fl() {
    lf "$@"
    cd "$(cat "$HOME/.config/lf/lf.d")"
    echo " " > ~/.config/lf/lf.d
}
alias lf="fl"

msd() {
   sudo udisksctl unlock -b /dev/sda1
   sudo udisksctl mount -b /dev/dm-1
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

gitup() {
	cd $HOME/.config/dotgit
	git status -s
	echo "Commit Message:"
	read MESSAGE
	git add -u
	git commit -m "$MESSAGE"
	git push -u origin master
	cd -
}

dcop() {
	cd ~/.config/suckless
	rm dwm-backup.tar.gz
	tar -czvf ./dwm-backup.tar.gz ./dwm/
	cd ~/.config/suckless/dwm
	vim config.h
	sudo make install clean
	cd -
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

bindkey -s '^g' 'lgit\n'
bindkey '^v' edit-command-line
bindkey -s '^f' 'fl\n'
bindkey -s '^d' 'dr\n'

# Load zsh-syntax-highlighting; should be last.
source ~/.config/zsh/unicode.zsh
source ~/.config/zsh/goto.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
