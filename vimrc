""""""""""""""""""""""""""""""
" vundle setting
""""""""""""""""""""""""""""""
filetype off        " required!

set rtp+=$HOME/vimfiles/vundle  "记得改！
call vundle#rc('$HOME/vimfiles/bundle/')

Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'msanders/snipmate.vim'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'

filetype plugin indent on    " required!

""""""""""""""""""""""""""""""
" common setting
""""""""""""""""""""""""""""""

set nocompatible
set smartindent
set ignorecase smartcase
set ruler
set autochdir
set number
filetype plugin on "允许插件
set guifont=Bitstream_Vera_Sans_Mono:h10.5:cANSI
set hlsearch
set incsearch

"switch buffer
nnoremap <F1> :bp<cr>
nnoremap <F2> :bn<cr>

"map ESC with jj
imap jj <ESC>

set nobackup
set noshowmode

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set go=


set t_Co=256
syntax enable
set background=dark
colorscheme solarized

set imactivatekey=C-space
inoremap <ESC> <ESC>:set iminsert=2<CR>

"Set mapleader
let mapleader = ","

"Fast reloading of the .vimrc
nmap <silent> <leader>ss :source $MYVIMRC<cr>
"Fast editing of .vimrc
nmap <silent> <leader>ee :e $MYVIMRC<cr>
"When .vimrc is edited, reload it
autocmd BufEnter * silent! lcd %:p:h

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
autocmd! bufwritepost .vimrc source ~/.vimrc

""""""""""""""""""""""""""""""
" Tagbar setting
""""""""""""""""""""""""""""""

nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""
" neocomplcache setting
""""""""""""""""""""""""""""""

let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2

let g:neocomplcache_enable_auto_select = 1

inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"

""""""""""""""""""""""""""""""
" python setting
""""""""""""""""""""""""""""""
set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python
set smartindent " next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set foldmethod=indent " fold
set foldlevel=99

let python_space_error_highlight=1

"Pydiction
let g:pydiction_location = 'd:\Program Files (x86)\Vim\vimfiles\ftplugin\pydiction\complete-dict'

map <F5> <Esc>:w<CR>:! python %<CR>

""""""""""""""""""""""""""""""
" Ruby setting
""""""""""""""""""""""""""""""

map <F6> :!start ruby %<CR>

""""""""""""""""""""""""""""""
" NerdTree setting
""""""""""""""""""""""""""""""
let NERDTreeChDirMode=2
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeMirror .\<CR>
map <F3> :NERDTreeToggle .\<CR>

""""""""""""""""""""""""""""""
" Syntastic setting
""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1

""""""""""""""""""""""""""""""
" Task List setting
""""""""""""""""""""""""""""""
map <leader>td <Plug>TaskList

""""""""""""""""""""""""""""""
" bufferline setting
""""""""""""""""""""""""""""""
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1


""""""""""""""""""""""""""""""
" ctags setting
""""""""""""""""""""""""""""""

set tags+=tags;

""""""""""""""""""""""""""""""
" airline setting
""""""""""""""""""""""""""""""
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="bubblegum"

"/*-----------------------------c++IDE------------------------------*/

if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:vimrc_iswindows=1
else
    let g:vimrc_iswindows=0
endif


source $VIMRUNTIME/mswin.vim 
behave mswin 

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
