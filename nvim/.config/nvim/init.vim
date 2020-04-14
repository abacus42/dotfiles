filetype off                  " required

call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'tomtom/tcomment_vim'
Plug 'plasticboy/vim-markdown'
Plug 'machakann/vim-highlightedyank'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-dictionary'
Plug 'deoplete-plugins/deoplete-jedi'
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'abacus42/CoCoA-Vim'
Plug 'https://gitlab.com/HiPhish/repl.nvim'
Plug 'ludovicchabant/vim-gutentags'

" Colorschemes
Plug 'rakr/vim-one'

" All of your Plugins must be added before the following line
call plug#end()

"------------------------------------------------------------
" General settings
"------------------------------------------------------------
" Ignore certain file types (e.g. in ctrlp search)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.mp3,*.jpg,*.png,*.aux,*.pdf,*synctex.gz,*.fdb_latexmk

" Better command-line completion
set wildmode=longest:full,full

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

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

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
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

" Activate mouse in all modes
set mouse=a

" live preview of substitution in split window
set inccommand=split

"------------------------------------------------------------
" Mappings
"------------------------------------------------------------
let mapleader='ö'
let maplocalleader='ö'

" Force saving files that require root permission
cmap w!! w !sudo tee > /dev/null %

" Set common command misspellings as aliases to make them work nonetheless
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))

" Cycle through buffers
nnoremap <Leader><TAB> :bnext<CR>
nnoremap <ä><TAB> :bprevious<CR>
nnoremap <A-b> :b

" toggle spellchecking
map <F8> :setlocal spell! spelllang=de_de<CR>
map <F9> :setlocal spell! spelllang=en_us<CR>

" change working directory to  directory of the current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" copy and paste to/from system clipboards
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "*y
noremap <Leader>P "*p

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
 \ "\<Plug>(neosnippet_expand)" : "\<CR>"
smap <silent><CR> <Plug>(neosnippet_expand)

" neosnippet: load own snippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
" disable preview window in neosnippet candidates
set completeopt-=preview

"vimtex-complete-deoplete
call deoplete#custom#var('omni', 'input_patterns', {'tex': g:vimtex#re#deoplete})

"gutentags
let g:gutentags_cache_dir='~/.ctags/'
let g:gutentags_generate_on_write = 1

"jump to tag definition
nnoremap <leader>t <C-]>

" repl.nvim
" open repl
nmap <leader>sh :vert Repl<CR><ESC><C-w><C-p>
" Send the text of a motion to the REPL
nmap <leader>s <Plug>(ReplSend)
" Send the current line to the REPL
nmap <Space> <Plug>(ReplSendLine)
" Send the selected text to the REPL
vmap <Space> <Plug>(ReplSend)
" Send the current line to the REPL and move to terminal
nmap <C-Space> <Plug>(ReplSendLine)<ESC><C-w><C-p>
" Send the selected text to the REPL and move to terminal
vmap <C-Space> <Plug>(ReplSend)<ESC><C-w><C-p>
