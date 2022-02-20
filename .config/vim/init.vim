set nocompatible

set rtp+=$XDG_CONFIG_HOME/vim/
call plug#begin("$XDG_CONFIG_HOME/vim/plugins")
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
call plug#end()
filetype plugin indent on

syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autochdir
set colorcolumn=80,120
highlight ColorColumn ctermbg=8 guibg=lightgrey
set formatprg=par\ -w80
set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

" Enable clipboard buffer to be used as vim buffer
" set clipboard=unnamedplus
set mouse=a

" Settings for gvim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Set line numbering rules
set relativenumber number
au InsertEnter * set number norelativenumber
au InsertLeave * set relativenumber

let mapleader="\<Space>"

" Remap splits shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <leader>s  <ESC>:vsplit<CR>
nmap <leader>vs <ESC>:split<CR>

" NERDCommenter config
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1
let g:NERDTreeChDirMode=2

" NERDCommenter shortcuts
nmap <C-k> <leader>c<space>
vmap <C-k> <leader>c<space>

" Copy to clipboard
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>d "+d
vmap <leader>d "+d
