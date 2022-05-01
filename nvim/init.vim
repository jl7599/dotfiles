" Author: jlei

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set number
set secure
set exrc
set noshowmode
set ignorecase
set smartcase
set cursorline
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set list
set listchars=tab:\|\ ,
set scrolloff=7
set splitright
set splitbelow
set lazyredraw
set visualbell
set foldmethod=indent
set foldlevel=99
set foldenable

let mapleader=" "

" Copy to system clipboard
vnoremap Y "+y

" Disable the default s key
noremap s <nop>
" Split window
noremap ss :split<Return><C-w>w
noremap sv :vsplit<Return><C-w>w
" Move window
noremap <C-k> <C-W>k
noremap <C-j> <C-W>j
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
" Resize window
noremap <C-left> <C-w><
noremap <C-right> <C-w>>
noremap <C-up> <C-w>+
noremap <C-down> <C-w>-
" Opening a terminal window
noremap <leader>` :set splitbelow<CR>:split<CR>:res -10<CR>:term<CR>

" Create a new tabedit
noremap te :tabedit 
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

call plug#begin('~/.config/nvim/plugged')

Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'

call plug#end()

" Colorscheme config, see :help gruvbox-material.txt
if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material
