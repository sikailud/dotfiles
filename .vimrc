" Plugins
call plug#begin()
  Plug 'bluz71/vim-moonfly-colors'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
call plug#end()

" General
set nobackup
set noswapfile
set hidden
set mouse=a

" No bells
set vb t_vb=
set belloff=all
set noerrorbells
set novisualbell

" setup system clipboard
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" Format & Indentation
set shiftwidth=2
set tabstop=2
set expandtab
set softtabstop=2
set smartindent
let g:python_recommended_style = 0
let g:gdscript_recommended_style = 0

" Search
set ignorecase smartcase
set incsearch
set hlsearch
set showmatch
set matchtime=2

" Keymaps
let mapleader = ' ' 
let maplocalleader = '\\'
nnoremap <leader>e :Ex<CR>
nnoremap <leader>= :vs ~/.vimrc<CR>
nnoremap <leader>9 :vs<CR>
nnoremap <leader>0 :sp<CR>
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <silent> <ESC><ESC> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Appearance & Syntax highlighting
set number
set relativenumber
set ruler
set cmdheight=1
set laststatus=1
syntax on
silent! colorscheme moonfly
let g:netrw_banner = 0 "No Netrw banner
" highlight LineNr ctermfg=grey
