""""""""""""""""""""""""""""""""""""""""
" general and plugins
""""""""""""""""""""""""""""""""""""""""

set nocompatible               " use vim settings

" PLUGINS
filetype off
                               " set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()            " initialize

                               " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
                               " gruvbox colorscheme
Plugin 'morhetz/gruvbox'
                               " simple status line
Plugin 'itchyny/lightline.vim'
                               " quoting/parenthesizing
Plugin 'tpope/vim-surround'
                               " file explorer
Plugin 'scrooloose/nerdtree'
                               " git flags for NERDtree
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()
" PLUGINS END

filetype plugin indent on      " enable filetype indent

set backspace=indent,eol,start " make backspace more sane
set noerrorbells               " remove the annoying beeps
set novisualbell               " remove visual error characters
set nobackup                   " who needs backup when we have vcs :)

                               " save annoying swap files into
                               " a specific directory
                               " the last double slash (//) make swap files
                               " with full path substituted
                               " to prevent file names conflictions
set directory=$HOME/.vim/swapfiles//


""""""""""""""""""""""""""""""""""""""""
" colors
""""""""""""""""""""""""""""""""""""""""

set background=dark " prefer dark variant
colorscheme gruvbox " set the colorscheme
syntax on           " enable syntax highlighting

                    " enable transparent
highlight Normal ctermbg=None
highlight Statement ctermbg=None
highlight Title ctermbg=None
highlight Todo ctermbg=None
highlight Underlined ctermbg=None
highlight ErrorMsg ctermbg=None
highlight LineNr ctermbg=None
highlight CursorLineNr ctermbg=None
highlight VertSplit ctermbg=None
highlight CursorLine ctermbg=None
highlight Error ctermbg=None
highlight Error cterm=bold


""""""""""""""""""""""""""""""""""""""""
" editting
""""""""""""""""""""""""""""""""""""""""

if !has('nvim')
	set noesckeys
endif
set showcmd
set pastetoggle=<F3>


""""""""""""""""""""""""""""""""""""""""
" spaces and tabs
""""""""""""""""""""""""""""""""""""""""

set tabstop=4       " number of visual spaces per tab
set softtabstop=4   " number of visual spaces per tab when editing
set shiftwidth=4    " number of visual spaces for each step of indent
set noexpandtab     " do not expand tab into spaces


""""""""""""""""""""""""""""""""""""""""
" indentation
""""""""""""""""""""""""""""""""""""""""

set autoindent  " match indent on new line
set smartindent " smart indentation


""""""""""""""""""""""""""""""""""""""""
" UI config
""""""""""""""""""""""""""""""""""""""""

set cursorline " hightlight the current working line
set wildmenu   " visual autocomplete for command menu
set showmatch  " hightlight matching {[()]}
               " disable preview attribute in completeopt
set completeopt=menuone

               " show line number in hybrid mode on active normal, absolute
               " otherwise
set number relativenumber
nnoremap <C-e> :set relativenumber!<CR>
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


""""""""""""""""""""""""""""""""""""""""
" searching
""""""""""""""""""""""""""""""""""""""""

set ignorecase " case insensitive search
set smartcase  " if there are uppercase letters, become case sensitive
set incsearch  " search as characters are entered
set hlsearch   " hightlight matches

               " map a key binding to turn off search hightlighting
nnoremap <leader><space> :nohlsearch<CR>


""""""""""""""""""""""""""""""""""""""""
" movement
""""""""""""""""""""""""""""""""""""""""

          " move vertically by visual line
nnoremap j gj
nnoremap k gk


""""""""""""""""""""""""""""""""""""""""
" lightline
""""""""""""""""""""""""""""""""""""""""

          " add status line
set laststatus=2
          " remove mode in base status line
set noshowmode
let g:lightline = { 
                \ 'colorscheme': 'jellybeans',
                \ 'subseparator': { 'right': '', 'left': '' },
                \ }


""""""""""""""""""""""""""""""""""""""""
" NERDtree
""""""""""""""""""""""""""""""""""""""""

" open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" key bindings
nnoremap <C-t> :NERDTreeToggle<CR>
