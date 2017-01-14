" vundle
" 1. https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'https://github.com/vim-syntastic/syntastic.git'
Plugin 'valloric/youcompleteme' " 3. NEED INSTALLATION
Plugin 'mileszs/ack.vim'
Plugin 'SirVer/ultisnips'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'majutsushi/tagbar' " 4. NEED INSTALLATION http://ctags.sourceforge.net/


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" 3. :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ


"==========Non-plugin settings==========
"tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"tabs
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>

"set solarized color scheme
syntax enable
syntax on
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized

"let g:solarized_termcolors=256

set mouse=a
set number
set autoindent
set showmode
set showcmd
set visualbell
set cursorline
set ttyfast
set laststatus=2
set ttimeoutlen=50
set scrolloff=3
set history=1000
set ruler
set gdefault " :%s/foo/bar/g by default
let mapleader = "," " REMAPS leader key 

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

"set list
"set listchars=tab:▸\ ,eol:¬

au FocusLost * :wa

" better regex in searching
nnoremap / /\v
vnoremap / /\v

" search highlighting
set hlsearch
set incsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"current buffer can be put into background without writing to disk 2.history of background buffers are remembered
set hidden

"tab complete only up to point of ambiguity
set wildmenu
set wildmode=list:longest

" /-style search ignores *-style search continues tobe case-ensitive 
set showmatch
set ignorecase 
set smartcase

"store temporary files in .vim-tmpfiles
set backupdir=~/.vim-tmpfiles,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmpfiles,~/.tmp,~/tmp,/var/tmp,/tmp

"scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


"==========Plugin settings==========
">>>NERDTree
" let NERDTreeMapOpenInTab='<ENTER>'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <leader>n :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

">>>airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='sol'
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_powerline_fonts = 1

">>>syntactic, use :lclose to close :Errors
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html', 'tex'] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" Use flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'

" youcompleteme
let g:ycm_python_binary_path = 'python'

set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1 
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Goto definition with F3
noremap <leader>m :tab split \| YcmCompleter GoTo<CR>

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" toggle tagbar
noremap <leader>t  :TagbarToggle<CR>

