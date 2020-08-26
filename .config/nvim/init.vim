set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Set line numbering rules
set relativenumber number
au InsertEnter * set number norelativenumber
au InsertLeave * set relativenumber

autocmd StdinReadPre * let s:std_in=1

" Open NERDTree if no file specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree if openning directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

map <C-n> :NERDTreeToggle<CR>

" Remap splits shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDCommenter config
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" NERDCommenter shortcuts
nmap <C-\> <leader>c<space>
vmap <C-\> <leader>c<space>
