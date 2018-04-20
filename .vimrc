execute pathogen#infect()

set number relativenumber

" Colors
syntax on
let base16colorspace=256
colorscheme base16-eighties
set cursorline

" Indentation
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Quicker update time for vim-gitgutter
set updatetime=100
