set nocompatible " be ImProved
filetype off " Required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'mhinz/vim-grepper'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end() " Required by vundle
filetype plugin indent on " Required by vundle

let g:rspec_command = "Dispatch rspec {spec}"

runtime macros/matchit.vim
let mapleader=" "
noremap <leader><leader> <c-^>

"https://github.com/thoughtbot/dotfiles/blob/master/vimrc
" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

filetype plugin indent on " Required
set t_Co=256

set number    " Show line numbers
syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set tabstop=2
set shiftwidth=2
set expandtab

set encoding=utf-8

set showmatch           "do not show matching brackets by flickering
set incsearch           "shows the match while typing
set ignorecase          "search case insensitive
set smartcase           "...but not when search pattern contains upper case characters

