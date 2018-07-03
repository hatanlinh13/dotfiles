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
							   " git control
Plugin 'tpope/vim-fugitive'
                               " syntax completion
Plugin 'Valloric/YouCompleteMe'
                               " javascript editing support
Plugin 'ternjs/tern_for_vim'
                               " html5 auto completion
Plugin 'othree/html5.vim'
                               " close html tags
Plugin 'alvan/vim-closetag'
                               " html expanding abbreviations
Plugin 'mattn/emmet-vim'
                               " snippets engine
Plugin 'SirVer/ultisnips'
                               " snippets
Plugin 'honza/vim-snippets'
                               " snippets for bootstrap 4
Plugin 'jvanja/vim-bootstrap4-snippets'

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


""""""""""""""""""""""""""""""""""""""""
" editting
""""""""""""""""""""""""""""""""""""""""

set noesckeys
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

"set cursorline " hightlight the current working line
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
          " colors
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }


""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""

          " default config file
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


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


" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.htm,*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'


""""""""""""""""""""""""""""""""""""""""
" vim-emmet: expanding abbreviations
""""""""""""""""""""""""""""""""""""""""

" emmet for html and css file only
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" change default key
let g:user_emmet_leader_key='<C-s>'


""""""""""""""""""""""""""""""""""""""""
" UltiSnips
""""""""""""""""""""""""""""""""""""""""

" Trigger configuration
let g:UltiSnipsExpandTrigger="<C-q>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" snips edit keymap
nnoremap <C-y> :UltiSnipsEdit<CR>
" :UltiSnipsEdit split window.
let g:UltiSnipsEditSplit="vertical"
