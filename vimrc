""""""""""""""""""""""""""""""
" vundle setting
""""""""""""""""""""""""""""""
filetype off        " required!

if has('win32') || has('win64')
  set rtp+=$HOME/vimfiles/vundle/
  call vundle#rc('$HOME/vimfiles/bundle/')
else
  " Usual quickstart instructions
  set rtp+=~/.vim/vundle/
  call vundle#rc()
endif

Bundle 'Shougo/vimproc.vim'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/TaskList.vim'
"Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'SirVer/ultisnips'
Bundle 'mhinz/vim-startify'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/vimshell.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'terryma/vim-expand-region'
"Bundle 'YankRing.vim'
Bundle 'EasyGrep'
Bundle 'tomtom/tcomment_vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'plasticboy/vim-markdown'
Bundle 'nanotech/jellybeans.vim'
Bundle 'legendmohe/conque_2.3_fix'

filetype plugin indent on    " required!

""""""""""""""""""""""""""""""
" common setting
""""""""""""""""""""""""""""""
set ff=unix
set nocompatible
set smartindent
set ignorecase smartcase
set ruler
" set autochdir
set number
"filetype plugin on "允许插件
"set hlsearch
set incsearch
set nobackup
set noshowmode
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set go=

"Set mapleader
let mapleader = ","

set imactivatekey=C-space
inoremap <ESC> <ESC>:set iminsert=2<CR>

"switch buffer
map <F1> :bp!<cr>
map <F2> :bn!<cr>
"switch tabs
nnoremap <leader>=  :tabnext<CR>
nnoremap <leader>-  :tabprev<CR>

"搜索时把当前结果置于屏幕中央并打开折叠
nnoremap n nzzzv
nnoremap N Nzzzv

"map ESC with jj
imap jj <ESC>

"Fast reloading of the .vimrc
nmap <silent> <leader>ss :source $MYVIMRC<cr>
"Fast editing of .vimrc
nmap <silent> <leader>ee :e $MYVIMRC<cr>
"When .vimrc is edited, reload it
autocmd BufEnter * silent! lcd %:p:h

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
autocmd! bufwritepost .vimrc source ~/.vimrc

""""""""""""""""""""""""""""""
" color and fonts setting
""""""""""""""""""""""""""""""
"Font
if has('win32') || has('win64')
    set guifont=Bitstream_Vera_Sans_Mono:h10.5:cANSI
else
    set guifont=Monaco:h12 
endif
"
"colo
set t_Co=256
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
    let g:solarized_termtrans = 1
endif
let g:solarized_termcolors=256
colorscheme solarized

""""""""""""""""""""""""""""""
" Tagbar setting
""""""""""""""""""""""""""""""
nmap <F4> :TagbarToggle<CR>

""""""""""""""""""""""""""""""
" Ctrlp setting
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>h :CtrlPMRU<cr>
"nnoremap <silent> <leader>p :CtrlP<cr>
let g:ctrlp_map = '<Leader>p'

""""""""""""""""""""""""""""""
" easy-align setting
""""""""""""""""""""""""""""""
" vip<Enter>=
vmap <Enter> <Plug>(EasyAlign)
nnoremap <Leader>a <Plug>(EasyAlign)

""""""""""""""""""""""""""""""
" vim-markdown setting
""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1

""""""""""""""""""""""""""""""
" neocomplcache setting
""""""""""""""""""""""""""""""

let g:acp_enableAtStartup              = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-g>     neocomplete#undo_completion()

" Cache when buffer opend
autocmd BufReadPost,BufEnter,BufWritePost :neocompleteCachingBuffer <buffer>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

""""""""""""""""""""""""""""""
" VimShell setting
""""""""""""""""""""""""""""""
nmap <F5> <esc>:VimShellTab<CR>
let g:vimshell_enable_smart_case = 1
if has('win32') || has('win64')
  " Display user name on Windows.
  let g:vimshell_prompt = $USERNAME."% "
else
  " Display user name on Linux.
  let g:vimshell_prompt = $USER."% "
endif

let g:ConqueTerm_ExecFileKey = 0
let g:ConqueTerm_SendFileKey = 0
let g:ConqueTerm_SendVisKey = 0

""""""""""""""""""""""""""""""
" Ultisinps setting
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-CR>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

""""""""""""""""""""""""""""""
" python setting
""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.py,*.pyw setf python
set smartindent " next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set foldmethod=indent " fold
set foldlevel=99

let python_space_error_highlight=1

""""""""""""""""""""""""""""""
" Ruby setting
""""""""""""""""""""""""""""""

"map <F6> <Esc>:w<CR>:! ruby %<CR>

""""""""""""""""""""""""""""""
" NerdTree setting
""""""""""""""""""""""""""""""
let NERDTreeChDirMode=2
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
let NERDTreeHighlightCursorline = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

map <F3> <plug>NERDTreeTabsToggle<CR>
""""""""""""""""""""""""""""""
" vim-multiple-cursors setting
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Syntastic setting
""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1

""""""""""""""""""""""""""""""
" Task List setting
""""""""""""""""""""""""""""""
map <leader>td <Plug>TaskList

""""""""""""""""""""""""""""""
" ctags setting
""""""""""""""""""""""""""""""

set tags+=tags;

""""""""""""""""""""""""""""""
" airline setting
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_detect_whitespace          = 0 "关闭空白符检测
let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
let g:airline_theme                      = "bubblegum" "设定主题

""""""""""""""""""""""""""""""
" others setting
""""""""""""""""""""""""""""""
if has('win32') || has('win64')
    source $VIMRUNTIME/mswin.vim 
    behave mswin
endif

" insert word of the line above
inoremap <C-Y> <C-C>:let @z = @"<CR>mz
           \:exec 'normal!' (col('.')==1 && col('$')==1 ? 'k' : 'kl')<CR>
           \:exec (col('.')==col('$') - 1 ? 'let @" = @_' : 'normal! yw')<CR>
           \`zp:let @" = @z<CR>a

""""""""""""""""""""""""""""""
" defult
""""""""""""""""""""""""""""""

set diffexpr=MyDiff()
function! MyDiff()
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
