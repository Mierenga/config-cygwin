""""""""""""
" PATHOGEN
""""""""""""
execute pathogen#infect()

""""""""""""
" VIM
""""""""""""
" tabs
set sw=4
set ts=4
set sts=4
set expandtab
" looks
set nu
syntax on
filetype plugin indent on
colo monokai
" make scrolling faster
set ttyfast 
" no more reaching
imap jj <Esc> 
imap jk <Esc>
imap kj <Esc>

""""""""""""
" CYGWWIN 
""""""""""""
" make a block cursor for cygwin vim
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

""""""""""""
" NERDTREE
""""""""""""
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" start NERDTree automatically when vim starts with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map hotkey for NERDTreeToggle
map <C-\> :NERDTreeToggle<CR>
" close vim if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
" ignore files in NERDTree (add to the array for more)
let NERDTreeIgnore = ['\.xip$', '\.xiw$']
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"TagBar
nmap <C-B> :TagbarToggle<CR>

""""""""""""
" delimitMate (auto close stuff)
""""""""""""
let g:delimitMate_expand_cr=2
