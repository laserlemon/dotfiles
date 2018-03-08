set nocompatible
set termguicolors

let mapleader=","

source ~/.vim/bundle.vim
source ~/.vim/colors.vim

" Enable backgrounding buffers
set hidden

" Remember more commands and search history
set history=1000

" Make tab completion for files/buffers act like Bash
set wildmenu

" Keep more context when scrolling off the end of a buffer
set scrolloff=2

" Enable backspacing over everything in insert mode
set backspace=indent,eol,start

" Disable backups, on-write backups and swapfiles
set nobackup
set nowb
set noswapfile

" Show cursor position
set ruler

" Show command information
set showcmd

" Mark end of match with $ for clarity
set cpoptions=Bces$

" Show line numbers
set number

" Set 2-space soft tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Highlight column 80
set colorcolumn=80

" Copy indent from current line
set autoindent

" Briefly jump to matching bracket
set showmatch

" Show highlights for matches as they occur
set hls
set incsearch

" Kill highlight after search
nnoremap <CR> :noh<CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Complete to longest common string and list all matches
set wildmode=longest,list

" Don't wrap
set nowrap

" Mark unwanted spaces
set list
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=extends:❯
set listchars+=precedes:❮

" Highlight current line in insert mode
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" Jump to first open window that contains buffer
set switchbuf=useopen

" Source .vimrc on save
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

" Make ctrl-p search by filename only (not path)
let g:ctrlp_by_filename=1

" Make ctrl-p find hidden files
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = {
\   'dir': '\v\/(\.git|\.bundle|vendor\/bundle|tmp|public\/system|coverage|node_modules|deps|_build)$',
\   'file': '\v\.(gitkeep|jpe?g|gif|png|ico|log|sqlite3|DS_Store)$'
\ }

" Toggle the directory structure
map <C-n> :NERDTreeToggle<cr>

" Close NERDTree when a file is opened
let NERDTreeQuitOnOpen = 1

" Let ctrlp close NERDTree
let g:ctrlp_dont_split = 'nerdtree'

let g:VimuxRunnerType='pane'
let g:VimuxUseNearest=1

let g:use_vimux=1
