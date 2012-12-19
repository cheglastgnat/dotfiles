set nocompatible
"syntax on
syntax enable
filetype plugin indent on
" activate filetype-specific plugins
filetype plugin on

" invisible characters
set list
set listchars=tab:▸\ ,eol:¬
" toggle invisible characters with <\><l>
nmap <leader>l :set list!<CR> :call TYShowBreak()<CR>
nmap <leader><leader> :b#<CR>

" show linewraps
set showbreak=…
" toggle showbreak
function! TYShowBreak()
  if &showbreak == ' '
    set showbreak=…
  else
    set showbreak=\ 
  endif
endfunction
set whichwrap+=<,>,h,l,[,]

set wrap
set wrapmargin=0
set tabstop=2
set softtabstop=2
set shiftwidth=2
set formatoptions=qrn1
set expandtab
set smarttab
set autoindent
set incsearch
set hlsearch
set autoread
set ignorecase
set number
set showcmd
" fix backspace key
set backspace=2

colorscheme wombat

" status line
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" backup files don't clutter working dir. Problem here: Same file names will overwrite backup files!
"set backup
"set directory=~/.vim/tmp

" try to keep current line off window borders
set scrolloff=5
set sidescrolloff=5

" intuitive cursor movement in wrapped lines (goto next/previous displayed line instead of physical line)
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" editing/sourcing .vimrc
map <F6> :so $HOME/.vimrc<CR>
map <F9> :e $HOME/.vimrc<CR>
" and .bashrc
map <F10> :e $HOME/.bashrc<CR>

" comfortable macro execution
"nnoremap <Space> @q

" clear search highlighting with <\><space>
"nnoremap <leader><space> :noh<cr>

" Bubble single lines
" these mappings have problems with edge cases (bottom lines)
nmap <C-k> ddkP
nmap <C-j> ddp
" Bubble multiple lines (visual mode)
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

" autosave when losing focus
au FocusLost * :wa
