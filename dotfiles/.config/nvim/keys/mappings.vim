imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l
" g Leader key
let mapleader=" "
" let localleader=" "
nnoremap <Space> <Nop>

"Keep search matches in the middle of the screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Open terminals in insert mode
autocmd BufEnter term://* startinsert
" Open vertical terminal split
nnoremap <A-t> :vsplit term://zsh<CR>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

"execute selected lines
xnoremap <leader>x :w !zsh<cr>

" Better indenting
vnoremap < <gv
vnoremap > >gv

if exists('g:vscode')

" Simulate same TAB behavior in VSCode
nmap <Tab> :Tabnext<CR>
nmap <S-Tab> :Tabprev<CR>

else
  " Better nav for omnicomplete
  inoremap <expr> <c-j> ("\<C-n>")
  inoremap <expr> <c-k> ("\<C-p>")

  " TAB in general mode will move to text buffer
  nnoremap <silent> <TAB> :bnext<CR>
  " SHIFT-TAB will go back
  nnoremap <silent> <S-TAB> :bprevious<CR>

  " Alternate way to save
  " nnoremap <silent> <C-s> :w<CR>
  " Alternate way to quit
  nnoremap <silent> <C-Q> :wq!<CR>
  " Use control-c instead of escape
  nnoremap <silent> <C-c> <Esc>
  " <TAB>: completion.
  inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

  " Easy CAPS
  inoremap <S-Up> <ESC>bvU<S-$>i<Right>
  nnoremap <S-Up> bvU<Esc><S-$>
  inoremap <C-S-Up> <ESC>viwU<S-$>i<Right>
  nnoremap <C-S-Up> viwU<Esc><S-$>

  " Better window navigation
  nnoremap <A-Left> <C-w>h
  nnoremap <A-Down> <C-w>j
  nnoremap <A-Up> <C-w>k
  nnoremap <A-Right> <C-w>l

  " TerminalAwindow navigation
  tnoremap <A-Left> <C-\><C-N><C-w>h
  tnoremap <A-Down> <C-\><C-N><C-w>j
  tnoremap <A-Up> <C-\><C-N><C-w>k
  tnoremap <A-Right> <C-\><C-N><C-w>l
  inoremap <A-Left> <C-\><C-N><C-w>h
  inoremap <A-Down> <C-\><C-N><C-w>j
  inoremap <A-Up> <C-\><C-N><C-w>k
  inoremap <A-Right> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-q> <C-\><C-n>:q<CR>

  " Use alt + hjkl to resize windows
  nnoremap <silent> <M-j>    :resize -2<CR>
  nnoremap <silent> <M-k>    :resize +2<CR>
  nnoremap <silent> <M-h>    :vertical resize -2<CR>
  nnoremap <silent> <M-l>    :vertical resize +2<CR>
endif

iab <expr> dts strftime("%c")
nnoremap <silent> <C-d> "=strftime("%c")<CR>P

" Find & Replace Globally
  :nnoremap <C-S-s> :%s/\<<C-r><C-w>\>//g<Left><Left>
  :nnoremap <C-f> :VimwikiSearch<Space>
  :nmap <C-n> :lnext<CR>
  :nmap <C-p> :lprevious<CR>
  :nmap <C-o> :lopen<CR>
  :nmap <C-c> :lclose<CR>
