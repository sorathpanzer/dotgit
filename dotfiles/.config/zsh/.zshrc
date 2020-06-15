#!/usr/bin/zsh
export EDITOR="nvim"
export TERMINAL="alacritty"
export VISUAL="nvim"

setopt hist_ignore_dups
setopt hist_ignore_space
setopt auto_menu

autoload -U colors && colors
setopt PROMPT_SUBST
PS1="%B%{$fg[red]%}[%{$fg[white]%}%n%{$fg[white]%}@%{$fg[white]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%} λ%b "

RPROMPT='[%D{%a %d %b %Y %H:%M}]'
TMOUT=1
TRAPALRM() {
    zle reset-prompt
}

#alias sudo="doas"
alias cl="clear"
alias lg="cd $HOME/.config/dotgit; lazygit; cd -"
alias vfm="$HOME/.config/vifm/scripts/vifmrun"
alias vim='nvim'
alias ls='ls --color --group-directories-first'
#alias gu='echo "Commit Message:"; read MESSAGE; gt add -u; gt commit -m "$MESSAGE"; gt push -u origin master'
alias nv='nvim $(find -L $HOME -maxdepth 4 -type f ! -path "$HOME/.local/*" ! -path "$HOME/.cache/*" ! -path "$HOME/.*Brave*" \
! -path "$HOME/.*/R/*" ! -path "$HOME/.*dotfiles/*" ! -path "$HOME/Projectos/r-backtester/.Rproj.user/*" \
! -path "$HOME/.steam*" ! -path "$HOME/.cargo*" ! -path "$HOME/.config/coc/*" ! -path "$HOME/.*/nvim/autoload/*" ! -path "$HOME/.npm/*" | fzf --reverse)'
alias dlist='find -L $HOME -maxdepth 4 -type d ! -path "$HOME*/.local/*" ! -path "$HOME*/.cache/*" ! -path "$HOME*/Brave*" \
! -path "$HOME*/.config/R/*" ! -path "$HOME*/.*dotfiles/*" ! -path "$HOME*/Projectos/r-backtester/.Rproj.user/*" \
! -path "$HOME/.steam*" ! -path "$HOME/.cargo/*" ! -path "$HOME*/.config/coc/*" ! -path "$HOME*/.*/nvim/autoload/*" ! -path "$HOME/.npm/*" | fzf --reverse --header='Jump to location''

 sl() {
    cd $(dlist); ls -l | cut -d ">" -f 1 | sed 's/-$//'
}


ext () {
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

dwmcmp() {
	cd ~/.config/suckless
	tar -czvf ./dwm-backup.tar.gz ./dwm/
	cd ~/.config/suckless/dwm/src
	vim config.h
	sudo make install clean
	cd
}

setopt auto_cd
setopt menucomplete
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt SHARE_HISTORY

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
#bindkey "^[[1;3D" backward-word
#bindkey "^[[1;3C" forward-word
bindkey '^H' backward-kill-word
bindkey "\e[3~" delete-char

bindkey -s '^g' 'lgit\n'
bindkey '^v' edit-command-line
bindkey -s '^f' 'nv\n'
bindkey -s '^d' 'sl\n'

#bindkey -s '^d' 'cd $(sl); ls -l | cut -d ">" -f 1 | sed 's/-$//'\n'

# Load zsh-syntax-highlighting; should be last.
source ~/.config/zsh/unicode.zsh
source ~/.config/zsh/goto.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
#source /home/sorath/.config/broot/launcher/bash/br
