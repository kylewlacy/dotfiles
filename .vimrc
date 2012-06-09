" The .vimrc file
" For dependencies and the like, see the README file
set linebreak
set expandtab
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set number
set clipboard=unnamed
set backspace=2
set t_Co=256
if exists("&breakindent")
  set breakindent
endif
if exists(":CommandT")
  let g:CommandTAlwaysShowDotFiles=1
  let g:CommandTScanDotDirectories=1
  let g:CommandTMaxDepth=5
  set wildignore="/Applications/**,/Library/**,.git/**,"
endif
call pathogen#infect()

syntax on
color twilight256
filetype plugin indent on
highlight LineNr ctermfg=DarkGrey guifg=DarkGrey
if has("gui_running")
  set guioptions=egmt
  set guifont=Monaco:h18
  set transparency=10
  color twilight
endif

let mapleader = " "
map <leader><leader> i_<ESC>r
map <leader>y :w !pbcopy<CR><CR>
map <leader>p :r !pbpaste<CR>
map <leader>t :tabnew<CR>
nmap <leader>T :tab split<CR>
nmap <leader>w :tabclose<CR>
nmap <leader><C-w> :tabclose!<CR>
nmap <leader>W :tabo<CR>
nmap <leader><C-W> :tabo!<CR>
nnoremap <leader>a 0
vnoremap <leader>a 0
nnoremap <leader>f $
vnoremap <leader>f $
nnoremap <CR> :set nohlsearch!<CR>
nmap <leader>e :CommandT<CR>
nmap <leader>v <leader>av<leader>f
map !! <ESC>:! 
nmap <leader>! :ConqueTerm sh<CR>
noremap ' `
nnoremap ` '


nnoremap <leader>r <C-w>
nmap <leader>rt gt
nmap <leader>rT gT

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
