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
set laststatus=2
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
set hidden
set updatetime=100
set shortmess+=c
set nobackup
set nowritebackup
set signcolumn=yes

let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog=$HOME.'/.pyenv/versions/3.10.0/bin/python'

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
" Close window
nnoremap <leader>w :bd!<CR>

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

" Run this Python file
nnoremap <leader>rp :sp <CR> :term python % <CR>
" Run this shell file
nnoremap <leader>rs :sp <CR> :term bash % <CR>

call plug#begin('~/.config/nvim/plugged')

Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'voldikss/vim-floaterm'
Plug 'TabbyML/vim-tabby'

call plug#end()

" Bottom status line
function! s:statusline_expr()
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '%F %<'.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()

" Colorscheme config, see :help gruvbox-material.txt
if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material

" nerdtree
nnoremap <F3> :NERDTreeToggle<CR>
" Locating current file in nerdtree
map <leader>l :NERDTreeFind<cr>
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" vim-fugitive
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Git status<CR>
nnoremap <Leader>gb :Git blame<CR>

" git-messenger.vim
let g:git_messenger_floating_win_opts = { 'border': 'single' }

" fzf
" fzf.vim
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>b  :Buffers<CR>
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <C-d> :BD<CR>
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

" ===== floaterm =====
nnoremap <silent> <leader>t  :FloatermNew<CR>
nnoremap <silent> <leader>t  :FloatermToggle<CR>
tnoremap <silent> <C-t>      <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_position = 'right'
let g:floaterm_width = 0.70
let g:floaterm_height = 0.95

" ===== coc.nvim =====
let g:coc_global_extensions = [
      \ 'coc-marketplace',
      \ 'coc-vimlsp',
      \ 'coc-json',
      \ 'coc-actions',
      \ 'coc-diagnostic',
      \ 'coc-docker',
      \ 'coc-yaml',
      \ 'coc-jedi',
      \ 'coc-snippets']

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Show all diagnostics.
" nnoremap <silent><nowait> da :<C-u>CocList diagnostics<cr>

" vim-snippets
let g:snips_author='Jia Lei'

let g:tabby_node_binary = $HOME.'/.nvm/versions/node/v20.9.0/bin/node'
let g:tabby_trigger_mode = 'manual'
" let g:tabby_keybinding_accept = '<Tab>'
" let g:tabby_keybinding_trigger_or_dismiss = '<C-\>'
