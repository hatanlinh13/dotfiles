"""""""""""""""""""""""""""""""""""""
" General vim configurations
"""""""""""""""""""""""""""""""""""""

" Fish doesn't play all that well with others
set shell=/bin/bash
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source $HOME/.vimrc
" use vim settings
set nocompatible


"""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""

filetype off

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" base16 colorspaces
Plug 'chriskempson/base16-vim'
" simple status line
Plug 'itchyny/lightline.vim'
" quoting/parenthesizing
Plug 'tpope/vim-surround'
" file explorer
Plug 'scrooloose/nerdtree'
" git flags for NERDtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" file type icons
Plug 'ryanoasis/vim-devicons'
" highlight yanked region
Plug 'machakann/vim-highlightedyank'
" auto change to root directory
Plug 'airblade/vim-rooter'

" configurations for lsp client
Plug 'neovim/nvim-lspconfig'
" auto completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()


"""""""""""""""""""""""""""""""""""""
" General vim configurations
"""""""""""""""""""""""""""""""""""""

" enable filetype indent
filetype plugin indent on
" make backspace more sane
set backspace=indent,eol,start
" remove the annoying beeps
set noerrorbells
" remove visual error characters
set novisualbell

""""""""""""""""""""""""""""""""""""""""
" editting
""""""""""""""""""""""""""""""""""""""""

if !has('nvim')
	set noesckeys
endif
" use system clipboard
set clipboard=unnamedplus
set showcmd
set pastetoggle=<F3>


"""""""""""""""""""""""""""""""""""""
" Backups and swap
"""""""""""""""""""""""""""""""""""""

" save annoying swap files into
" a specific directory
" the last double slash (//) make swap files
" with full path substituted
" to prevent file names conflictions
set directory=$HOME/.vim/swapfiles//
" enable backups, please remember to clean it eventually
set backup
set backupdir=$HOME/.vim/backups//
" Permanent undo
set undofile
set undodir=~/.vim/undodir


""""""""""""""""""""""""""""""""""""""""
" colors
""""""""""""""""""""""""""""""""""""""""

" prefer dark variant
set background=dark
" set the colorscheme
colorscheme base16-twilight
" enable syntax highlighting
syntax on


""""""""""""""""""""""""""""""""""""""""
" spaces and tabs
""""""""""""""""""""""""""""""""""""""""

" number of visual spaces per tab
set tabstop=4
" number of visual spaces per tab when editing
set softtabstop=4
" number of visual spaces for each step of indent
set shiftwidth=4
" expand tab into spaces
set expandtab


""""""""""""""""""""""""""""""""""""""""
" indentation
""""""""""""""""""""""""""""""""""""""""

" match indent on new line
set autoindent
" smart indentation
set smartindent


""""""""""""""""""""""""""""""""""""""""
" UI config
""""""""""""""""""""""""""""""""""""""""

" hightlight the current working line
set cursorline
" visual autocomplete for command menu
set wildmenu
" hightlight matching {[()]}
set showmatch
set completeopt=menu,menuone,noselect

" show line number in hybrid mode on active normal
" absolute otherwise
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

" case insensitive search
set ignorecase
" if there are uppercase letters, become case sensitive
set smartcase
" search as characters are entered
set incsearch
" hightlight matches
set hlsearch
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


"""""""""""""""""""""""""""""""""""""
" Neovim specific configurations
"""""""""""""""""""""""""""""""""""""

set termguicolors


"""""""""""""""""""""""""""""""""""""
" Lua configurations
"""""""""""""""""""""""""""""""""""""

lua << LUACONFIG
-- nvim-lspconfig
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
	-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<Esc>'] = cmp.mapping.abort(),
  -- Accept currently selected item if true. Set `select` to `false` to only confirm explicitly selected items.
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
  	cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
  	luasnip.expand_or_jump()
    else
  	fallback()
    end
  end, { 'i', 's' }),
  ['<S-Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
  	cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
  	luasnip.jump(-1)
    else
  	fallback()
    end
  end, { 'i', 's' }),
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  -- { name = 'vsnip' }, -- For vsnip users.
  { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'ultisnips' }, -- For ultisnips users.
  -- { name = 'snippy' }, -- For snippy users.
}, {
  { name = 'buffer' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

-- Setup lspconfig + cmp
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'pyright', 'rust_analyzer' }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
LUACONFIG


