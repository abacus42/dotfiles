filetype off                  " required

call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'plasticboy/vim-markdown'
Plug 'machakann/vim-highlightedyank'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'abacus42/CoCoA-Vim'
Plug 'https://gitlab.com/HiPhish/repl.nvim'
Plug 'deoplete-plugins/deoplete-dictionary'

" Colorschemes
Plug 'rakr/vim-one'

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on

" Enable syntax highlighting
syntax on

"------------------------------------------------------------
" General settings
"------------------------------------------------------------
" Ignore certain file types (e.g. in ctrlp search)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.mp3,*.jpg,*.png,*.aux,*.pdf,*synctex.gz,*.fdb_latexmk

" Better command-line completion
set wildmenu
set wildmode=longest:full,full

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

" highlight matching pattern as you type
set incsearch

" store swap files in a central place
set directory=~/.vim/swapfiles//,/tmp//

" Command line history/
set history=100

" Set Window title
set title

" open new buffers to the right of the current one when splitting vertically
set splitright

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" No visual bell or beeping
set belloff=all

" Display line numbers on the left
set number
set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=100

" show vertical line after 120 characters
set colorcolumn=121

" linewrapping and textwidth
set textwidth=120
set formatoptions-=t
set wrap
set linebreak
set breakindent
set nojoinspaces

" minimize lag when scrolling large files with cursorline enabled
set lazyredraw

" always show at least 3 lines above and below cursor when scrolling
set scrolloff=3

" show hex code of unprinteable characters
set display="uhex"

"Folding
set foldmethod=syntax   " Syntay highlighting items specify folds
set foldnestmax=2       " avoids that too many folds are created
set nofoldenable        " start with all folds expanded

" allows to hide buffers without saving
set hidden

" show tab characters
set list
set listchars=tab:▸\

" updatetime (for gitgutter)
set updatetime=250

" enable undodir
set undofile
set undodir=~/.config/nvim/undodir

" Warn when file changed on disk
set autoread
autocmd CursorHold * checktime

" Indentation options
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab


if has('nvim')
    " live preview of substitution in split window
    set inccommand=split
endif

"------------------------------------------------------------
" Mappings
"------------------------------------------------------------
let mapleader='ö'
let maplocalleader='ö'

" Force saving files that require root permission
cmap w!! w !sudo tee > /dev/null %

" scroll by wrapped, rather than by actual lines
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

" Set common command misspellings as aliases to make them work nonetheless
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))

" Cycle through buffers
nnoremap <Leader><TAB> :bnext<CR>
nnoremap <Leader><S-TAB> :bprevious<CR>
nnoremap <A-b> :b

" toggle spellchecking
map <F8> :setlocal spell! spelllang=de_de<CR>
map <F9> :setlocal spell! spelllang=en_us<CR>

" change working directory to  directory of the current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" neovim terminal mappings
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    " map <Esc> to exit terminal-mode
    tnoremap <Esc> <C-\><C-n>
endif

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"------------------------------------------------------------
" Theming
"------------------------------------------------------------
set termguicolors
set background=light
colorscheme one
highlight ExtraWhitespace guibg=#f4acbb ctermbg=210


"------------------------------------------------------------
" Plugin Settings
"------------------------------------------------------------

" Airline settings
let g:airline#extensions#tabline#enabled = 1

" vimlatex settings
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
          \ 'continuous' : 1,
          \ 'build_dir' : 'build',
          \ }
let g:vimtex_fold_enabled = 1
let g:vimtex_imaps_leader = 'ö'
let g:vimtex_complete_close_braces = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_method = 'zathura'
"make vimlatex work with neovim
let g:vimtex_compiler_progname = '/usr/bin/nvr'

"set filetype=tex on empty tex files.
let g:tex_flavor='latex'

" highlightedyank
let g:highlightedyank_highlight_duration = 600
hi HighlightedyankRegion cterm=reverse gui=reverse

" vim-markdown
let g:vim_markdown_math = 1

"deoplete
"Map expression when a tab is hit:
"   checks if the completion popup is visible
"   if yes
"       then it cycles to next item
"   else
"       if expandable_or_jumpable
"           then expands_or_jumps
"       else returns a normal TAB
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Expands or completes the selected snippet/item in the popup menu
imap <expr><silent><CR> pumvisible() ? deoplete#close_popup() .
 \ "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>"
smap <silent><CR> <Plug>(neosnippet_jump_or_expand)

" load own snippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

"vimtex-complete-deoplete
call deoplete#custom#var('omni', 'input_patterns', {'tex': g:vimtex#re#deoplete})

" repl.nvim
" open repl
nmap <leader>sh :vert Repl<CR>
" Send the text of a motion to the REPL
nmap <leader>rs  <Plug>(ReplSend)<ESC><C-w><C-p>
" Send the current line to the REPL
nmap <Space> <Plug>(ReplSendLine)<ESC><C-w><C-p>
" Send the selected text to the REPL
vmap <Space> <Plug>(ReplSend)<ESC><C-w><C-p>
" Send the current line to the REPL and stay there
nmap <C-Space> <Plug>(ReplSendLine)
" Send the selected text to the REPL and stay there
vmap <C-Space> <Plug>(ReplSend)
