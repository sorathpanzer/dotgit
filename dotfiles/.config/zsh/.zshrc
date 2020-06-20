#!/usr/bin/zsh

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
alias gtr="cd ~/.local/share/Trash/files; ls -la"
alias gm="cd /media; ls -la"
alias gv="cd ~/Videos; ls -la"
alias gi="cd ~/Imagens; ls -la"
alias gw="cd ~/Imagens/Wallpapers; ls -la"
alias gd="cd ~/Documentos; ls -la"
alias gt="cd ~/Transferências; ls -la"
alias gb="cd ~/.local/bin; ls -la"
alias gg="cd ~/.config/dotgit; ls -la"
alias gc="cd ~/.config; ls -la"
alias gs="cd ~/.config/suckless; ls -la"
alias ge="cd /etc; ls"
alias gu="cd /usr; ls"
alias gus="cd /usr/share; ls"

convert="convert -quality 100"
alias nb="newsboat"
alias cl="clear"
alias lg="cd $HOME/.config/dotgit; lazygit; cd -"
alias vfm="$HOME/.config/vifm/scripts/vifmrun"
alias vm='nvim'
alias vim='nvim'
alias ls='ls --color --group-directories-first'
alias nvlist='find -L $HOME -maxdepth 4 -type f ! -path "$HOME/.local/*" ! -path "$HOME/.cache/*" ! -path "$HOME/.*Brave*" \
! -path "$HOME/.*/R/*" ! -path "$HOME/.*dotfiles/*" ! -path "$HOME/Projectos/r-backtester/.Rproj.user/*" \
! -path "$HOME/.steam*" ! -path "$HOME/.cargo*" ! -path "$HOME/.config/coc/*" ! -path "$HOME/.*/nvim/autoload/*" ! -path "$HOME/.npm/*" | fzf --reverse'
alias dlist='find -L $HOME -maxdepth 4 -type d ! -path "$HOME*/.local/*" ! -path "$HOME*/.cache/*" ! -path "$HOME*/Brave*" \
! -path "$HOME*/.config/R/*" ! -path "$HOME*/.*dotfiles/*" ! -path "$HOME*/Projectos/r-backtester/.Rproj.user/*" \
! -path "$HOME/.steam*" ! -path "$HOME/.cargo/*" ! -path "$HOME*/.config/coc/*" ! -path "$HOME*/.*/nvim/autoload/*" ! -path "$HOME/.npm/*" | fzf --reverse --header='Jump to location''

fl() {
    res_nvlist=$(nvlist)
    nvim $res_nvlist
    echo "nvim $res_nvlist" >> $HISTFILE
}


dr() {
    res_dlist=$(dlist)
    cd $res_dlist; ls -l | cut -d ">" -f 1 | sed 's/-$//'
    echo "cd $res_dlist" >> $HISTFILE
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
bindkey '^d' backward-kill-word
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
