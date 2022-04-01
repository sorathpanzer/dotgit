" auto-install vim-plug
"if empty(glob('~/.config/nvim/autoload/plug.vim'))
"  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
"  autocmd VimEnter * PlugInstall | source $MYVIMRC
"endif

call plug#begin('~/.config/nvim/autoload/plugged')
  "Highlighted Parentesis
    Plug 'junegunn/rainbow_parentheses.vim'
  " Cool Icons
    Plug 'ryanoasis/vim-devicons'
  " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
  " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
  " Float Terminal
    Plug 'voldikss/vim-floaterm'
  " Start Screen
    Plug 'mhinz/vim-startify'
  " Nerd Commenter
    Plug 'scrooloose/nerdcommenter'
  " Interaction with git
    Plug 'airblade/vim-gitgutter'
  " Org Mode
    Plug 'kristijanhusak/orgmode.nvim'
  " If you are using Vim-Plug
    Plug 'arcticicestudio/nord-vim'
  " Goyo Plugin
    Plug 'junegunn/goyo.vim'
  call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
