execute pathogen#infect()

set hidden
set showmatch
set title
let g:gitgutter_terminal_reports_focus=0

set guifont=FiraCode-Regular:h15

autocmd! bufwritepost .vimrc source %

" Auto close netrw when hidden
autocmd FileType netrw setl bufhidden=wipe

" Shortcuts
let mapleader = "\\"
set wildcharm=<C-z>
nmap <leader>w :w!<cr>
" command W w !sudo tee % > /dev/null " breaking autosourcing of vimrc somehow
nnoremap <leader>B :buffer <C-z><S-Tab>
nnoremap <leader>b :b<SPACE>
nnoremap <leader>f :find<SPACE>
nnoremap <leader>s :mksession! ~/.vim/session<CR>
map <leader>hl :set hls!<cr>
nnoremap \ :Ack<SPACE>
map <leader>pp :setlocal paste!<cr>
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Shortcuts - buffers
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" close all buffers
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Colors
let base16colorspace=256
" base16-google-dark
colorscheme base16-eighties
set cursorline
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0
" autocmd! BufEnter *.hbs setf html
autocmd! BufEnter *.hbs setf mustache

" Search
set ignorecase
set smartcase

" Indentation
" commented because now using https://github.com/tpope/vim-sleuth
" show existing tab with 4 spaces width
" set tabstop=4
" when indenting with '>', use 4 spaces width
" set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Switch cursor in iTerm
" in .tmux.conf you'll need:
" set-option -g terminal-overrides '*88col*:colors=88,*256col*:colors=256,xterm*:XT:Ms=\E]52;%p1%s;%p2%s\007:Cc=\E]12;%p1%s\007:Cr=\E]112\007:Cs=\E]50;CursorShape=%?%p1%{3}%<%t%{0}%e%p1%{2}%-%;%d\007'
" https://github.com/Casecommons/casecommons_workstation/blob/master/templates/default/dot_tmux.conf.erb
" https://github.com/Casecommons/vim-config/blob/master/init/tmux.vim
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

" Gutter
set number relativenumber
" for vim-gitgutter
set updatetime=100

" Status line
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename'
      \ },
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" Trim trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Windows
set splitright
set splitbelow

" File search
set path+=**
set wildignore+=**/node_modules/**,**/.git/**,**/_deploy/**
" File browsing with netrw
let g:netrw_liststyle = 3 " tree view
let g:netrw_altv=1 " open splits to the right

" Session saving
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,localoptions

" Project search
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Centralize swap files
set directory^=$HOME/.vim/tmp//
set nobackup
