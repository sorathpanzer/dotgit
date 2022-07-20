" g Leader key
let mapleader=" "
" let localleader=" "
nnoremap <Space> <Nop>

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

" Find & Replace Globally
 nnoremap <C-s> :%s/\<<C-r><C-w>\>//g<Left><Left>

 nmap <C-n> :lnext<CR>
 nmap <C-p> :lprevious<CR>
 nmap <C-o> :lopen<CR>
 nmap <C-c> :lclose<CR>

"Keep search matches in the middle of the screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Open vertical terminal split
nnoremap <A-t> :vsplit term://zsh<CR>

" Toggle tabline
nnoremap <silent> <S-h> :call ToggleHiddenAll()<CR>

" Easy CAPS
inoremap <S-Up> <ESC>bvU<S>i<Right>
nnoremap <S-Up> bvU<Esc><S>
inoremap <C-S-Up> <ESC>viwU<S>i<Right>
nnoremap <C-S-Up> viwU<Esc><S>

"Insert and modify date
iab <expr> dts strftime("%c")
nnoremap <silent> <C-d> "=strftime("%c")<CR>P
nnoremap <silent> <F2>  0w<Left><c-a><S-$>
nnoremap <silent> <F3>  0w<Left><c-x><S-$>

" execute selected lines
xnoremap <leader>x :w !zsh<cr>

" Open Float Lazygit
nnoremap  <silent>  <F2>  :FloatermNew lazygit<CR>

" Comment lines
nmap ++ <plug>NERDCommenterToggle
vmap ++ <plug>NERDCommenterToggle

" keymap for custom function for toggling Transparency
nnoremap <leader>t :call BGToggleTransparency()<CR>

" Toggle tabline
nnoremap <silent> <leader>b :execute 'set showtabline=' . (&showtabline ==# 0 ? 2 : 0)<CR>

nnoremap <C-Up> zk
nnoremap <C-Down> zj
nnoremap <2-LeftMouse> za
" Toggle folds
nnoremap <silent> <return> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <return> zf

" Goyo
nnoremap <leader>g :Goyo<CR>

" Spellchecking

map <leader>s :setlocal spell! spelllang=pt_pt<CR>
map <leader><S-s> :setlocal spell! spelllang=en_us<CR>
nmap <leader><leader> z=
nnoremap <leader>z [s
nnoremap <leader>x ]s

" Compile from ms
nnoremap <leader>p :!pandoc % -t ms -o %:r.pdf; zathura %:r.pdf &<CR>

"Compile from latex
"nnoremap <leader>p :!pandoc -f markdown-implicit_figures -t pdf % -o %:r.pdf; zathura %:r.pdf &<CR>
