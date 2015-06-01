"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               VIM Run Commands                              "
"                                   ~/.vimrc                                  "
"                     1) Plugins and plugin configuration                     "
"                     2) Global settings                                      "
"                     3) Search settings                                      "
"                     4) Programming settings                                 "
"                     5) Custom mappings                                      "
"                     6) Functions                                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Mariano Macchi

" 1) Plugins and plugin configuration "
"""""""""""""""""""""""""""""""""""""""
" Call vim-plug (plugin manager, must be installed)
call plug#begin('~/.vim/plugged')
" Adds surround commands (ys, cs, ds)
Plug 'tpope/vim-surround'
" Enables '.' repeating support for plugins (supported plugins only)
Plug 'tpope/vim-repeat'
" Adds a fuzzy finder (for files, buffers, tags, etc)
Plug 'kien/ctrlp.vim'
" Adds a colorful and informative status/tabline
Plug 'bling/vim-airline'
" Shows open buffers in the status line and in the command line
Plug 'bling/vim-bufferline'
" Adds a git wrapper
Plug 'tpope/vim-fugitive'
" End vim-plug call
call plug#end()
" Enable powerline symbols (a font w/ powerline symbols must be in use)
let g:airline_powerline_fonts=1
" Print current open buffers in the status line only
let g:bufferline_echo=0

" 2) Global settings "
""""""""""""""""""""""
" Enable mouse (all modes)
set mouse=a
" Always display status line
set laststatus=2
" Show commands as they are being written
set showcmd
" Show possible matches when invoking tab completion in the command line
set wildmenu
" Min lines above and below the cursor
set scrolloff=3
" Use strings to represent special characters (list must be set)
set listchars=tab:>-
" Set timeouts (prevents terminal key codes from interfering w/ normal use)
set timeout timeoutlen=3000 ttimeoutlen=100
" Allow buffer switching without saving
set hidden
" Set how many columns a tab counts for
set tabstop=8
" Set how many colmuns are inserted when pressing tab (insert mode)
set softtabstop=4
" Set how many columns a text is indented when using shitfs (<< and >>)
set shiftwidth=4
" Expand tabs to spaces
set expandtab
" Detect filetype and use its indenting rules (triggers the FileType event)
filetype indent on

" 3) Search Settings "
""""""""""""""""""""""
" Incremental search (start matching when the search pattern is being defined)
set incsearch
" Highlight all matches
set hlsearch
" Highlight matching brackets
set showmatch
" Ignore case in search patterns
set ignorecase
" Make search case sensitive if capitals are used in the search string
set smartcase

" 4) Programming Settings "
"""""""""""""""""""""""""""
" Numbered lines
set nu
" Set syntax highlighting
syntax on
" Custom color scheme
colorscheme jellybeans
" Basic auto indentation (copies indentation from previous line)
set autoindent
" Highlight group for columns
highlight ColorColumn ctermbg=black
" Highlight group for whitespace
highlight Whitespace ctermbg=DarkGrey
" Highlight trailing whitespace in current and new windows
match Whitespace /\s\+$/
autocmd WinEnter * match Whitespace /\s\+$/
" Indentation settings for C (linux kernel coding style)
autocmd FileType c set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
" Indentation settings for python (PEP 8)
autocmd Filetype py set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
" Indentation settings for bash
autocmd FileType sh set tabstop=8 softtabstop=2 shiftwidth=2 expandtab

" 5) Custom mappings "
""""""""""""""""""""""
" Highlight limit column for code width (80)
nnoremap <silent> <F8> :call ToggleColumnColor()<CR>
" Toggle between relative and absolute line numbers
nnoremap <silent> <C-N> :call ToggleRelativeNumber()<CR>
" Set <Leader>
let mapleader = ','
" Open .vimrc in a new tab (see :h $MYVIMRC)
nnoremap <Leader>v :tabe $MYVIMRC<CR>
" Sort alphabetically (visual mode)
vnoremap <Leader>s :sort<CR>
" Allow _small_ hjkl movements while editing (insert mode)
inoremap <Leader>h <Left>
inoremap <Leader>j <Down>
inoremap <Leader>k <Up>
inoremap <Leader>l <Right>
" Insert a space (normal mode)
nnoremap <Space> a<Space><Esc>
" Begin a new line below or above the cursor (normal mode)
nnoremap <CR> o<Esc>
nnoremap <Leader><CR> O<Esc>
" Copy to clipboard (visual mode)
vnoremap <C-C> "+y
" Paste clipboard (normal and visual mode, move cursor)
nnoremap <Leader>p "+gp
vnoremap <Leader>p "+gp
" Remove trailing whitespace
nnoremap <silent> <C-Z> :call RemoveTrailingWhitespace()<CR>
" Remove search highlightning
nnoremap <silent> <BS> :nohlsearch<CR>
" List buffers with quick selection available
nnoremap <Leader>b :ls<CR>:b<Space>
" Switch to next and previous buffer (relative to number)
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
" Switch to previous buffer (last one edited)
nnoremap <Leader><Leader> :b#<CR>
" Quicksave (normal and insert mode, terminal flow control must be disabled)
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>
" Automatic brackets
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i<CR><CR><UP><TAB><RIGHT>
inoremap " ""<ESC>i
inoremap <Leader>' ''<ESC>i
inoremap <Leader>{ {}<ESC>i
inoremap <Leader>" "<ESC>a

" 6) Functions "
""""""""""""""""
" Toggle ColorColumn Highlight
function! ToggleColumnColor()
    if &colorcolumn==0
        set colorcolumn=80
    else
        set colorcolumn=0
    endif
endfunction
" Toggle relativenumber
function! ToggleRelativeNumber()
    if &relativenumber==0
        set relativenumber
    else
        set norelativenumber
    endif
endfunction
" Remove trailing whitespace (keeps state)
function! RemoveTrailingWhitespace()
    " Save current search string, line and column
    let last_search = @/
    let current_line = line('.')
    let current_column = col('.')
    " remove whitespace
    :%s/\s\+$//e
    " restore search string and cursor position
    let @/ = last_search
    call cursor(current_line, current_column)
endfunction
