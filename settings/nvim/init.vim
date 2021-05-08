"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" VIM PLUG
call plug#begin('~/.vim/plugged')
    Plug 'lotabout/skim', { 'do': './install' }
	Plug 'rust-lang/rust.vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" default
set nowrap
set noruler
set nonumber
set noshowcmd
set noshowmode
set noswapfile
set nohlsearch
set nopreviewwindow
set norelativenumber
set hidden
set expandtab
set incsearch
set ignorecase
set smartcase
set smartindent
set splitright
set splitbelow
set tabstop=4
set shiftwidth=4
set cmdheight=1
set laststatus=0
set backspace=indent,eol,start
set mouse=
set guicursor=

let mapleader = ";"	
noremap <F1> :echo "--- F1 ---"<CR>
nnoremap <leader>1 :e $MYVIMRC<CR>
nnoremap <leader>2 :source $MYVIMRC<CR>
nnoremap <leader>3 :SK<CR>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>
nmap <C-h> :vertical resize -4<CR>
nmap <C-l> :vertical resize +4<CR>
nmap <C-k> :resize +4<CR>
nmap <C-j> :resize -4<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>b :Cbuild --release<CR>:tabe %<CR>
nnoremap <leader>c :Ccheck<CR>:tabe %<CR>
nnoremap <leader>d :Cdoc --open<CR>:tabe %<CR>
nnoremap <leader>r :Cruntarget<CR>:tabe %<CR>
nnoremap <leader>t :Ctest<CR>:tabe %<CR>
nnoremap <leader>f :RustFmt<CR>

syntax on
filetype plugin indent on
autocmd vimenter * hi EndOfBuffer ctermfg=none  ctermbg=none guifg=none guibg=none
