set nocompatible

let g:nvim_config_root = expand('<sfile>:p:h')
set rtp+=~/.config/nvim
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autochdir
set colorcolumn=80,120
set formatprg=par\ -w80
set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

" Enable clipboard buffer to be used as vim buffer
set clipboard=unnamedplus

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
nmap <leader>f  <ESC>za

" NERDCommenter config
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDTreeChDirMode=2

" NERDCommenter shortcuts
nmap <C-\> <leader>c<space>
vmap <C-\> <leader>c<space>

" Calling my script that allows per-project configuration of tasks keybindings
call projector#init()
