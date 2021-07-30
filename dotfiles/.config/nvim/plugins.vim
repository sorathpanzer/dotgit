" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " Better escape
    Plug 'zhou13/vim-easyescape'
  "Change dates fast
    Plug 'tpope/vim-speeddating'
  "Highlighted Parentesis
    Plug 'junegunn/rainbow_parentheses.vim'
  " Cool Icons
    Plug 'ryanoasis/vim-devicons'
  " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
  " Status Line
    Plug 'vim-airline/vim-airline'
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
  call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
