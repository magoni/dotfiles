execute pathogen#infect()

set showmatch
let g:gitgutter_terminal_reports_focus=0

" Shortcuts
let mapleader = ","
nmap <leader>w :w!<cr>
command W w !sudo tee % > /dev/null
map <leader>pp :setlocal paste!<cr>
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Shortcuts - buffers
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" close all buffers
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Colors
syntax on
let base16colorspace=256
colorscheme base16-eighties
set cursorline

" Search
set ignorecase
set smartcase

" Indentation
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
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
set splitbelow
set splitright
set equalalways

" File search
set path+=**
set wildignore+=**/node_modules/**
