set nocompatible
set nohidden
set linebreak
set expandtab
set autoindent
set smartindent
set hlsearch
set incsearch
set smartcase
set ignorecase
set shiftwidth=2
set tabstop=2
set number
set clipboard=unnamed
set scrolloff=3
set backspace=2
set t_Co=256
set showcmd
set wildmenu
set backup
set list
set backupdir=~/.vim/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,/var/tmp,/tmp
set exrc
set nosecure
if exists("&breakindent")
  set breakindent
  autocmd VimEnter,GUIEnter,BufNewFile,BufRead * set breakindentshift=2
  set breakindentshift=2
endif
call pathogen#infect()
Helptags

syntax on
filetype plugin indent on
if has("gui_running")
  set guioptions=egmt
  set guifont=Monaco:h18
  if exists("&transparency")
    set transparency=0
  endif

  set listchars=tab:▸\ ,trail:･
  color twilight
else
  set listchars=tab:>\ ,trail:.
  color twilight256
endif
set laststatus=2
set statusline=%f\ %m%w%r%=%y%{CharacterInfo()}\ \|\ line\ %l\/%L%<

highlight NonText guifg=#4a4a59 ctermfg=239
highlight SpecialKey guifg=#4a4a59 ctermfg=239
highlight Pmenu term=none ctermfg=236 ctermbg=251 gui=none guifg=#303030 guibg=#c6c6c6
highlight PmenuSel term=none ctermfg=251 ctermbg=236 gui=none guifg=#c6c6c6 guibg=#303030
highlight PmenuSbar ctermbg=251 guibg=#c6c6c6
highlight PmenuThumb ctermbg=234 guibg=#1c1c1c
highlight Search cterm=underline ctermfg=15 ctermbg=none gui=underline guifg=#ffffff guibg=NONE

command Wsudo w !sudo tee % > /dev/null

noremap j gj
noremap k gk

let mapleader = " "
map <leader><leader> i_<ESC>r
map <leader><S-Space> a_<ESC>r
map <leader>t :tabnew<CR>
nmap <leader>T :tab split<CR>
nmap <leader><C-w> :tabclose!<CR>
nmap <leader>W :tabo<CR>
nmap <leader><C-W> :tabo!<CR>
noremap <leader>a ^
noremap <leader>f $
nnoremap <S-CR> :set nohlsearch!<CR>
nmap <leader>e :CommandTFlush<CR>:CommandT<CR>
nmap <leader>v ^v$
map !! <ESC>:!
autocmd Filetype help nnoremap <CR> <C-]>

nnoremap <leader>r <C-w>
nnoremap <C-t> gt
inoremap <C-t> <ESC>gt
nnoremap <C-w> gT
inoremap <C-w> <ESC>gT
nnoremap <C-h> <C-w>h
inoremap <C-h> <ESC><C-w>h
nnoremap <C-j> <C-w>j
inoremap <C-j> <ESC><C-w>j
nnoremap <C-k> <C-w>k
inoremap <C-k> <ESC><C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-l> <ESC><C-w>l
nnoremap = <C-w>+
nnoremap - <C-w>-
nnoremap + <C-w>>
nnoremap _ <C-w><

nmap <leader>ssh :leftabove vsplit<CR>
nmap <leader>ssj :rightbelow split<CR>
nmap <leader>ssk :leftabove split<CR>
nmap <leader>ssl :rightbelow vsplit<CR>
nmap <leader>sh :leftabove vnew<CR>
nmap <leader>sj :rightbelow new<CR>
nmap <leader>sk :leftabove new<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>ddh :topleft vsplit<CR>
nmap <leader>ddj :botright split<CR>
nmap <leader>ddk :topleft split<CR>
nmap <leader>ddl :botright vsplit<CR>
nmap <leader>dh :topleft vnew<CR>
nmap <leader>dj :botright new<CR>
nmap <leader>dk :topleft new<CR>
nmap <leader>dl :botright vnew<CR>

" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

autocmd Filetype asm set commentstring=;\ %s
autocmd Filetype gitconfig set noexpandtab
autocmd VimEnter * :call Plugins()
function! Plugins()
  if exists(":CommandT")
    let g:CommandTAlwaysShowDotFiles=1
    let g:CommandTScanDotDirectories=1
    let g:CommandTMaxHeight=15
    let g:CommandTCancelMap=['<C-c>', '<Esc>']
    set wildignore+=.git/**,.Trash/**,.DS_Store,*.swp,.sass-cache/**,build/*-iphonesimulator/**,build/*.build/**,*.xcodeproj/**
  endif
endfunction

function! FileSize()
  let bytes= getfsize(expand("%:p"))
  let prefix=" bytes"
  if bytes > 1024
    let bytes = bytes/1024
    let prefix = "KB"
  endif
  if bytes > 1024
    let bytes = bytes/1024
    let prefix = "MB"
  endif
  if bytes > 1024
    let bytes = bytes/1024
    let prefix = "GB"
  endif
  return bytes . prefix
endfunction

function! CharacterCount()
  let characters=getfsize(expand("%:p"))
  if characters > 10000
    return (characters/1000) . "k"
  endif
  return characters
endfunction

function! CharacterInfo()
  let characters=getfsize(expand("%:p"))
  if characters < 0
    return ""
  endif
  if characters < 1024
    return " | " . CharacterCount() . " chars"
  endif
  return " | " . CharacterCount() . " chars (" . FileSize() . ")"
endfunction

function! CheckSwap()
  swapname
  if v:statusmsg =~ '\.sw[^p]$'
    set ro
  endif
endfunc

if &swf
  set shm+=A
  au BufReadPre * call CheckSwap()
endif
