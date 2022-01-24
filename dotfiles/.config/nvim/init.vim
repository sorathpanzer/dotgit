"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" Always source these
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/gitgutter.vim

syntax on                           " Enables syntax highlighing
colorscheme nord
set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			        " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
"set number relativenumber               " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=0                       " Always show tabs
"set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set foldmethod=manual                   " Fold method
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
"set signcolumn=no                      " Always show the signcolumn, otherwise it would shift the text each time
set wildmode=longest:full,full
"set list
"set listchars=tab:➤\ ,trail:.
set clipboard=unnamedplus               " Copy paste between vim and everything else
set so=999                              " Open with the cursor on the middle of the screen
set incsearch
set termguicolors
hi Normal guibg=NONE ctermbg=NONE

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"Hide tabline toggle
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

""" Toggle background transparency
let t:isTransparent = 0
function! BGToggleTransparency()
 "if t:isTransparent == 0
    hi Normal guibg=#111111 ctermbg=black
    set background=dark
    let t:isTransparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:isTransparent = 0
  endif
endfunction

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END

let g:nord_disable_background = v:true
