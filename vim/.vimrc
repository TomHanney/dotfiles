execute pathogen#infect()

" set vim defaults in preference to those of vi
set nocompatible

" See https://github.com/gmarik/Vundle.vim
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'pbrisbin/vim-syntax-shakespeare'

" All of your Plugins must be added before the following line
call vundle#end()    


" turn off .swp file creation
set noswapfile

" show line numbers
set number

" show the status bar
set laststatus=2

" imported from cheatsheet
set ruler
set showcmd
set showmode

" highlighting
syntax on

" Try to detect filetypes
" filetype on

" Enable loading indent file for filetype
filetype plugin indent on

" use indent of previous line for newly created lines
" and smart indenting to indent automatically after
" curly braces... (see :help smartindent)
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
" set softtabstop=4
set noexpandtab
au! FileType python setl nosmartindent
au FileType python set omnifunc=pythoncomplete#Complete
au FileType java set omnifunc=javacomplete#Complete

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

let g:syntastic_haskell_checkers = ['ghc-mod']

" ghc-mod: Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" ghc-mod: Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

" haskell repl uing vim-slime
" ctrl-c ctrl-c sends current visual mode block to tmux session
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

" shortcut to display open buffers (overrides page down...)
" REMOVED: prefer to keep C-b on page down... can use :ls to display all
" open buffers
"nnoremap <C-b> :buffers <CR>

" Remap a simple and unlikely key combo to exit insert mode
inoremap kj <Esc>

" Set Y to yank to end of line similarly to C, D, ...
nnoremap Y y$

" this will make > and < use tabs rather than spaces to indent
set expandtab

" enable incremental search
set incsearch

" highlight search results
set hlsearch

" remove highlighting post-search by hitting ctrl-L
nnoremap <silent> <C-L> :noh<CR><C-L>

" use case-insensitive matching for search
set ignorecase

" allow buffer switching without saving first
set hidden

" look for tags file in current folder or any above
set tags=./tags,tags;

set background=dark
"colorscheme monokai

" set path to vimwiki files
let g:vimwiki_list = [{'path': '$VIMWIKI/site/', 'path_html': '$VIMWIKI/html/'}]
