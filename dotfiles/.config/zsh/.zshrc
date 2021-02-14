#!/usr/bin/zsh

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
#PS1="%B%{$fg[red]%}[%{$fg[white]%}%n%{$fg[white]%}@%{$fg[white]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%} λ%b "
PS1="%{$fg[blue]%}%~$reset_color ⚡"

#alias doas="doas --"
#alias sudo="doas --"
alias visudo="sudo EDITOR=vim visudo"
alias ls="exa --icons -a --group-directories-first"
alias fzf="fzf -m"
alias mpv="mpv --loop"
alias sc="sc-im"
alias convert="convert -quality 100"
alias nb="newsboat"
alias cl="clear"
alias lg="cd $HOME/.config/dotgit; lazygit; cd -"
alias vfm="$HOME/.config/vifm/scripts/vifmrun"
alias vim="nvim -c ':set showtabline=1'"
alias diff="diff --color"
alias ap="absolutely-proprietary"
alias mk="sudo make install clean; sudo make clean"
alias paclog='pacman -Qiie | grep -iE "nome[ ]+:|Data da Instalação" | sed "s/.*: //" | tac | paste -d " " - - | sort -n --k 2'
alias tr="transmission-remote -l | sed '/Sum/d'"
alias dck="docker inspect -f \
'{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' \
$1"
alias imgrm="sxiv -r -q -o * | xargs rm"
alias vwiki="cd $HOME/Documentos/wiki; nvim -c ':VimwikiIndex' -c ':set showtabline=1'; cd -"
alias vnote="nvim -c ':VimwikiDiaryIndex'"
alias readable="readable -l force -p text-content"
alias td="cat $HOME/Documentos/wiki/index.md | rg TODO"
alias emacs="emacsclient -t"
alias orgy="emacsclient -t $HOME/Documentos/orgwiki/index.org"
alias pkg="paru"
alias off="xset -display :0.0 dpms force off"
alias pacman="paru"

#myip - finds your current IP if your connected to the internet
myip() {
	lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}

ft() { cd $HOME/Documentos/wiki; ${EDITOR:-vim} $(rg -i -n $1 | fzf --layout=reverse --height 50% --ansi | sed -E 's/(.*):([0-9]+):.*/\1 +\2/g'); }

# Calculator
calc() { echo "scale=5;$*" | bc -l; }

# mkdir and cd in one command
mcd() {
	mkdir -p -- "$1" &&
		cd -P -- "$1" || return
	}

o()
{
  nvim $(find -L $HOME -maxdepth 4 -type f | fzf)
}

g()
{
  cd $(find -L $HOME -maxdepth 4 -type d | fzf)
}

fl() {
    lf "$@"
    cd "$(cat "$HOME/.config/lf/lf.d")"
    echo "./" > ~/.config/lf/lf.d
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
bindkey -s '<<' 'g\n'
bindkey -s '<z' 'o\n'
bindkey -s '++' 'ls\n'
bindkey -s "^t" 'msd\n'

# Load zsh-syntax-highlighting; should be last.
export FZF_DEFAULT_OPTS='-e -i --height 40% --layout=reverse --border'
source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/unicode.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
