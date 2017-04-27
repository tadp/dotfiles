runtime bundle/vim-pathogen/autoload/pathogen.vim

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <C-p> :CtrlP<CR>

call pathogen#infect()
call pathogen#helptags()

set relativenumber
set nocompatible
set hidden
set history=1000
set wildmenu
set ignorecase
set smartcase
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set t_ti= t_te=

set iskeyword+=- " words with dashes count as single words for autocompletion
set iskeyword+=? " words with dashes count as single words for autocompletion

set backspace=indent,eol,start

if has("vms")
  set nobackup
else
  set backup
endif
set ruler
set showcmd

map Q qq " macro fast

syntax on

set hlsearch

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass 
  autocmd! BufRead,BufNewFile *.jbuilder setfiletype ruby 

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Indent p tags
  autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off
augroup END

autocmd BufRead,BufNewFile *.html source ~/.vim/indent/html.vim

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hls

:set t_Co=256 " 256 colors
:color Tomorrow-Night

let mapleader=" "
" two leaders
nmap \ ,

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

set cursorline
set cmdheight=2

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

command! W :w

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

set showtabline=2

let g:ctrlp_working_path_mode = 2
let g:ctrlp_max_height = 20
" let g:ctrlp_dotfiles = 0

let g:ctrlp_custom_ignore = {
      \ 'dir':  'log$\|tmp$\|bower_components$\|node_modules$\|\.sass-cache$\|\.git$\|\.hg$\|\.svn$\|vendor$',
      \ 'file': '\.DS_STORE$\|tags',
      \ 'link': '',
      \ }

" Better copy paste integration
map <leader>v :r !pbpaste<cr>

set winwidth=84

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"imap <c-l> <space>=><space>

function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

set ttimeoutlen=50  " Make Esc work faster

" Enable > indent and < unindent
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" Close buffer
nmap <leader>d :bprevious<CR>:bdelete #<CR>

" Close all buffers
nmap <leader>D :bufdo bd<CR>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

let coffee_compile_vert = 1
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent
au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss

set colorcolumn=80
":nnoremap <leader><space> :nohlsearch<cr>

set grepprg=ag

vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

let g:ctrlp_map = '<Leader>f'

au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" let g:snips_trigger_key='<c-\>'
:imap <C-\> <Plug>snipMateNextOrTrigger
:smap <C-\> <Plug>snipMateNextOrTrigger
:imap <C-J> <Plug>snipMateShow

" Poweline customizations
let g:html_indent_tags = 'p\|li\|nav'

"load ftplugins and indent files
filetype plugin on
filetype indent on

"Show line number instead of 0
set number

set tags=.tags;/

set complete=.,b,u,]

:nmap <silent> <leader>d <Plug>DashGlobalSearch
autocmd Filetype gitcommit setlocal spell textwidth=72

" indent everything in the file
map <Leader>i mmgg=G`m<CR>

if has("mouse")
  set mouse=a
endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Execute current buffer as Ruby
map <S-r> :w !ruby<CR> 

nmap <F8> :TagbarToggle<CR>

" Force save files that require root permission
cmap w!! %!sudo tee > /dev/null %
set nofoldenable

