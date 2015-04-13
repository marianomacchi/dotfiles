""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  VIM Run Commands                                "
"                                                                                  "
"                          1) Plugins and plugin configuration                     "
"                          2) Global settings                                      "
"                          3) Search settings                                      "
"                          4) Programming settings                                 "
"                          5) Custom mappings                                      "
"                          6) Functions                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Author: Mariano Macchi

" 1) Plugins and plugin configuration "
"""""""""""""""""""""""""""""""""""""""
" Call vim-plug (plugin manager)
call plug#begin('~/.vim/plugged')
" Add surround commands (ys, cs, ds)
Plug 'tpope/vim-surround'
" Enable '.' repeating support for plugins (supported plugins only)
Plug 'tpope/vim-repeat'
" Fuzzy finder (files, buffers, tags, etc)
Plug 'kien/ctrlp.vim'
" Colorful Status/tabline
Plug 'bling/vim-airline'
" Show open buffers in status line
Plug 'bling/vim-bufferline'
" End vim-plug call
call plug#end()

" 2) Global settings "
""""""""""""""""""""""
" Enable mouse (all modes)
set mouse=a
" Always display status line
set laststatus=2
" Show commands as they are being written
set showcmd
" Show possible matches when invoking completion in the command line
set wildmenu
" Min lines above and below the cursor
set scrolloff=3
" Allow buffer switching without saving
set hidden
" Use strings to represent special characters (list must be set)
set listchars=tab:>-
" Set timeouts (prevents terminal key codes from interfering w/ normal use)
set timeout timeoutlen=3000 ttimeoutlen=100
" Automatically reload vimrc when it's saved
autocmd BufWritePost .vimrc source ~/.vimrc

" 3) Search Settings "
""""""""""""""""""""""
" Incremental search (start matching when the search pattern is being defined)
set incsearch
" Highlight all matches
set hlsearch
" Highlight matching brackets
set showmatch
" Ignore case while searching
set ignorecase
" Don't ignore case if Uppercase char in search
set smartcase

" 4) Programming Settings "
"""""""""""""""""""""""""""
" Numbered lines
set nu
" Basic autoindentation (copies indentation from previous line)
set autoindent
" Custom color scheme
colorscheme jellybeans
" Set syntax highlighting
syntax on
" Highlight group for columns
highlight ColorColumn ctermbg=black
" Highlight group for whitespace
highlight Whitespace ctermbg=DarkGrey
" Make a background for the first 80 columns using colorcolumn
"let &colorcolumn=join(range(1,80), ',')
" Highlight limit column (80)
nnoremap <silent> <F8> :call ToggleColumnColor()<CR>
" Highlight trailing whitespace in current and new windows
match Whitespace /\s\+$/
autocmd WinEnter * match Whitespace /\s\+$/

" 5) Custom mappings "
""""""""""""""""""""""
" Set custom <Leader>
let mapleader = ','
" Open .vimrc in a new tab
nnoremap <Leader>v :tabe $HOME/.vimrc<CR>
" Allow _small_ hjkl movements while editing (insert mode)
inoremap <Leader>h <Left>
inoremap <Leader>j <Down>
inoremap <Leader>k <Up>
inoremap <Leader>l <Right>
" Insert a space (normal mode)
nnoremap <Space> a<Space><Esc>
" Insert spaces equivalent to a tab (insert mode, width = 8)
inoremap <Leader><Leader> <C-O>8a<Space><Esc>i
" Begin a new line below or above the cursor (normal mode)
nnoremap <CR> o<Esc>
nnoremap <Leader><CR> O<Esc>
" Copy to clipboard (visual mode)
vnoremap <C-C> "+y
" Paste clipboard (normal and visual mode, move cursor)
nnoremap <Leader>p "+gp
vnoremap <Leader>p "+gp
" Remove trailing whitespace
nnoremap <silent> <C-Z> :%s/\s\+$//<CR>
" Remove search highlightning
nnoremap <silent> <BS> :nohlsearch<CR>
" List buffers with quick selection available
nnoremap <Leader>b :ls<CR>:b<Space>
" Switch to next and previous buffer (relative to number)
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
" Switch to previous buffer (last one edited)
nnoremap <Tab> :b#<CR>
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
