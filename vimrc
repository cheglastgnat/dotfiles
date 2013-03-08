" Setting up Vundle - the VIM plugin bundler
" This will auto-install Vundle and all listed plugins
"______________________________________________________________________
  let haveVundle=1
  let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
  if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let haveVundle=0
  endif

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  Bundle 'gmarik/vundle'
  " Solarized color scheme
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'Syntastic'

  if haveVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
  endif
" Setting up Vundle
"______________________________________________________________________

syntax on
syntax enable
filetype indent on
filetype plugin on

" invisible characters
"(set list)  " <- uncomment for default listchars
set listchars=tab:▸\ ,eol:¬
" toggle invisible characters with <\><l>
nmap <leader>l :set list!<CR> :call TYShowBreak()<CR>
" quick buffer switch with <\><\>
nmap <leader><leader> :b#<CR>
" clear search highlighting with <\>< >
nnoremap <leader><space> :noh<cr>

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

set nocompatible
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
" activate mouse support (visual)
set mouse=a
" <tab> when autocompleting in command mode shows options
set wildmenu
" complete only up to the point of ambiguity
set wildmode=list:longest

" current buffer can be put to the background without writing to disk and when a background buffer becomes current again, marks and undo-history are remembered
set hidden

" <%> can switch if/elsif/else/end, XML tags etc.
runtime macros/matchit.vim

" Solarized color scheme
set t_Co=16  "choose the right color palette
set background=light
colorscheme solarized

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
map <F8> :e $HOME/.bashrc<CR>

" Bubble single lines
" these mappings have problems with edge cases (bottom lines)
nmap <C-k> ddkP
nmap <C-j> ddp
" Bubble multiple lines (visual mode)
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

" reindent file (remembering position)
map <F7> mzgg=G'z<CR>

" autosave when losing focus
au FocusLost * :wa

