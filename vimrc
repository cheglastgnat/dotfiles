" Setting up Vundle - the VIM plugin bundler
" This will auto-install Vundle and all listed plugins
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
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
  " Syntax highlighter
  Bundle 'Syntastic'
  " Ctags 
  Bundle 'majutsushi/tagbar'
  " File system tree
  Bundle 'scrooloose/nerdtree'
  Bundle 'jistr/vim-nerdtree-tabs'
  Bundle 'fholgado/minibufexpl.vim'
  " Add, delete, change surrounding ',",(,[,{,< and HTML-tags
  Bundle 'tpope/vim-surround'
  " Extend repeating per '.' to non-native commands
  Bundle 'vim-scripts/repeat.vim'
  " Autocompletion
  " Bundle 'Valloric/YouCompleteMe'

  if haveVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
  endif
"//////////////////////////////////////////////////////////////////////

" Plugin setups
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
" Tagbar (find the CTags bin first)
let tagbar_ctags_bin='~/.vim/exuberant-ctags/build/bin/ctags'
nnoremap <F7> :TagbarToggle<CR>

" NERDtree and NERDtree-Tabs
nnoremap <F5> :NERDTreeTabsToggle<CR>

" MiniBufExplorer
nnoremap <F4> :TMiniBufExplorer<CR>
"//////////////////////////////////////////////////////////////////////

syntax on
syntax enable
filetype indent on
filetype plugin on

" Set leader to ',' (comma)
let mapleader=','

" Invisible characters
"(set list)  " <- uncomment for default listchars
set listchars=tab:▸\ ,eol:¬
" Toggle invisible characters with <\><l>
nmap <leader>l :set list!<CR> :call TYShowBreak()<CR>
" Quick buffer switch with <\><\>
nmap <leader><leader> :b#<CR>
" Clear search highlighting with <\>< >
nnoremap <leader><space> :nohlsearch<CR>

" Show linewraps
set showbreak=…
" Toggle showbreak
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
set incsearch             " Begin search while still typing
set ignorecase            " Lower-case search is case-insensitive...
set smartcase             " ...but case with upper-case characters isn't
set hlsearch              " Highlight current search
set autoread
set number
set showcmd
" Fix backspace key
set backspace=2
" Activate mouse support (visual)
set mouse=a
" <tab> when autocompleting in command mode shows options
set wildmenu
" Complete only up to the point of ambiguity
set wildmode=list:longest

" Current buffer can be put to the background without writing to disk and when a background buffer becomes current again, marks and undo-history are remembered
set hidden

" Persistent undo/redo history
set undofile
set undodir=~/.vim/undodir/

" <%> can switch if/elsif/else/end, XML tags etc.
runtime macros/matchit.vim

" Solarized color scheme
set t_Co=16  "choose the right color palette
set background=light
colorscheme solarized

" Status line
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Try to keep current line off window borders
set scrolloff=5
set sidescrolloff=5

" Intuitive cursor movement in wrapped lines (goto next/previous displayed line instead of physical line)
" (Use nNOREmap to prevent revursive mappings. nmap allows user maps on the right hand side)
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
nnoremap j gj
nnoremap k gk

" Editing/sourcing .vimrc
map <F6> :so $HOME/.vimrc<CR>
map <F9> :e $HOME/.vimrc<CR>
" And .bashrc
map <F8> :e $HOME/.bashrc<CR>

" Bubble single lines
" these mappings have problems with edge cases (bottom lines)
nnoremap <C-k> ddkP
nnoremap <C-j> ddp
" Bubble multiple lines (visual mode)
vnoremap <C-k> xkP`[V`]
vnoremap <C-j> xp`[V`]

" Reindent entire file (remembering position)
"map <F7> mzgg=G'z<CR>

" Autosave when losing focus
au FocusLost * :wa

" Cycle through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" Close (no-unsaved-changes) buffer with Ctrl-W
nnoremap <C-w> :bd<CR>
