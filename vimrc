" Setting up Vundle - the VIM plugin bundler
" This will auto-install Vundle and all listed plugins
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
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
  Plugin 'gmarik/vundle'
  " Solarized color scheme
  Plugin 'altercation/vim-colors-solarized'
  " Syntax highlighter
  Plugin 'Syntastic'
  " Ctags 
  Plugin 'majutsushi/tagbar'
  " File system tree
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'fholgado/minibufexpl.vim'
  " Add, delete, change surrounding ',",(,[,{,< and HTML-tags
  Plugin 'tpope/vim-surround'
  " Extend repeating per '.' to non-native commands
  Plugin 'vim-scripts/repeat.vim'
  " Highlight words
  Plugin 't9md/vim-quickhl'
  " Toggle, display and navigate marks
  Plugin 'kshenoy/vim-signature'
  " Search for the current visual mode selection using <*> or <#>
  Plugin 'nelstrom/vim-visual-star-search'
  " Status/tabline
  Plugin 'bling/vim-airline'
  " TODO tags etc
  Plugin 'TaskList.vim'
  " Gundo (undo tree helper)
  Plugin 'sjl/gundo.vim'
  " JSON tools
  Plugin 'elzr/vim-json'
  " Work with GPG encrypted files
  Plugin 'jamessan/vim-gnupg'
  " Run Async shell commands
  Plugin 'skywind3000/asyncrun.vim'
  
  if haveVundle == 0
    echo "Installing plugins via vundle, please ignore key map error messages"
    echo ""
    :PluginInstall
  endif
"//////////////////////////////////////////////////////////////////////
"/////////////////////////////////////////////////////////////////////


" Set leader to ',' (comma)
let mapleader=','


" Plugin setups
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
" Syntastic (enable C++11)
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" Tagbar (find the CTags bin first)
let tagbar_ctags_bin='~/.vim/exuberant-ctags/build/bin/ctags'
nnoremap <F7> :TagbarToggle<CR>

" NERDtree and NERDtree-Tabs
nnoremap <F5> :NERDTreeTabsToggle<CR>

" MiniBufExplorer
nnoremap <F4> :MBEToggle<CR>

" QuickHL
nmap <leader>m <Plug>(quickhl-manual-this)
xmap <leader>m <Plug>(quickhl-manual-this)
nmap <leader>M <Plug>(quickhl-manual-reset)
xmap <leader>M <Plug>(quickhl-manual-reset)
nmap <leader>j <Plug>(quickhl-cword-toggle)

" Airline
" Get powerline fonts from https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1
"let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline_theme = 'sol'

" Gundo
nnoremap <F4> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom = 1
let g:gundo_auto_preview = 0

" JSON.vim
" Do not hide quotes
let g:vim_json_syntax_conceal = 0

"//////////////////////////////////////////////////////////////////////
"/////////////////////////////////////////////////////////////////////



" Don't wait when leaving a mode
set ttimeoutlen=50

" UTF-8
set encoding=utf-8

syntax on
syntax enable
filetype indent on
filetype plugin on

" Invisible characters
"(set list)  " <- uncomment for default listchars
set listchars=tab:▸\ ,eol:¬
" Toggle invisible characters with <leader><l>
nnoremap <leader>l :set list!<CR> :call TYShowBreak()<CR>
" Quick buffer switch with <leader><leader>
"nmap <leader><leader> :b#<CR>
" Clear search highlighting with <leader><space>
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
set incsearch         " Begin search while still typing
set ignorecase        " Lower-case search is case-insensitive...
set smartcase         " ...but case with upper-case characters isn't
set hlsearch          " Highlight current search
set autoread
set number            " Line numbers
set showcmd
" Fix backspace key
set backspace=2
" Activate mouse support (visual)
set mouse=a
set ttymouse=xterm2
" <tab> when autocompleting in command mode shows options
set wildmenu
" Complete only up to the point of ambiguity
set wildmode=list:longest
" Mark lines longer than 80 characters
set colorcolumn=72
hi ColorColumn ctermbg=0
" Mark current cursor line
set cursorline
hi CursorLine term=reverse ctermbg=0 cterm=NONE

" Current buffer can be put to the background without writing to disk 
" and when a background buffer becomes current again, marks and 
" undo-history are remembered
set hidden

" Persistent undo/redo history
set undofile
"set undodir=~/.vim/undodir/

" <%> can switch if/elsif/else/end, XML tags etc.
runtime macros/matchit.vim

" Solarized color scheme
set t_Co=16  "choose the right color palette
set background=light
"colorscheme solarized

" Status line
set laststatus=2

" Try to keep current line off window borders
set scrolloff=5
set sidescrolloff=5

" Intuitive cursor movement in wrapped lines (goto next/previous 
" displayed line instead of physical line)
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

" Async make
nmap <leader>mc :AsyncRun make clean<CR>
nmap <leader>md :AsyncRun make debug -j12 -l12<CR>
nmap <leader>mm :AsyncRun make -j12 -l12<CR>
nmap <leader>ms :AsyncStop<CR>
" Toggle quickfix window
function! QFixToggle()
  if exists("g:qfix_win") 
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
nmap <leader>qf :call QFixToggle()<CR>


" Autosave when losing focus
"au FocusLost * :wa

" Cycle through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" Close buffer with Ctrl-W
nnoremap <C-w> :bd<CR>

" Shift-Tab unindents (command mode and insert mode)
nnoremap <S-Tab> <<
inoremap <S-Tab> <ESC><<i

" Make mappings available for Ctrl+{Del|arrow keys}
map <ESC>[3;5~ <C-Del>
map <ESC>[1;5A <C-Up>
map <ESC>[1;5B <C-Down>
map <ESC>[1;5D <C-Left>
map <ESC>[1;5C <C-Right>
" Ctrl+{arrow keys} -> Navigate splits
nnoremap <C-Up> :wincmd k<CR>
nnoremap <C-Down> :wincmd j<CR>
nnoremap <C-Left> :wincmd h<CR>
nnoremap <C-Right> :wincmd l<CR>

" Fix Python indentation
autocmd FileType python set shiftwidth=2 | set tabstop=2


" Folding
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  " Open documents with all folds open
  set foldlevelstart=99

  " <space> to toggle folds
  "nnoremap <space> za
  "vnoremap <space> za

  " "Refocus" folds
  nnoremap ,z zMzvzz

  " C++
  augroup ft_cpp
    au!
    au FileType cpp setlocal foldmethod=marker foldmarker={,}
  augroup END
  " CUDA
  augroup ft_cuda
    au!
    au FileType cuda setlocal foldmethod=marker foldmarker={,}
  augroup END
  " C
  augroup ft_c
    au!
    au FileType c setlocal foldmethod=marker foldmarker={,}
  augroup END

  " XML
  let g:xml_syntax_folding=1
  au FileType xml setlocal foldmethod=syntax
  au FileType html setlocal foldmethod=syntax
  " CSS
  au FileType css setlocal foldmethod=syntax
"//////////////////////////////////////////////////////////////////////
"/////////////////////////////////////////////////////////////////////


" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END


