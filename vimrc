""""""""""""""""""""""""""""""
" vundle setting
""""""""""""""""""""""""""""""
filetype off        " required!

" directwrite
if has('win32') || has('win64')
    if has("gui_running")
        set guioptions=icpM
        if has('win32') || has('win64')
            if (v:version == 704 && has("patch393")) || v:version > 704
                set renderoptions=type:directx,level:0.75,gamma:1.25,contrast:0.25,
                            \geom:1,renmode:5,taamode:1
            endif
        endif
    endif
endif

if has('win32') || has('win64')
  set rtp+=$HOME/vimfiles/vundle/
  call vundle#rc('$HOME/vimfiles/bundle/')
else
  " Usual quickstart instructions
  set rtp+=~/.vim/vundle/

  " for fzf
  set rtp+=~/.fzf

  call vundle#rc()
endif

Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/nerdtree'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-repeat'
Plugin 'mhinz/vim-startify'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mg979/vim-visual-multi'
Plugin 'tomtom/tcomment_vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'Raimondi/delimitMate'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'udalov/kotlin-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'romainl/Apprentice'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-rooter'

if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

filetype plugin indent on    " required!

""""""""""""""""""""""""""""""
" common setting
""""""""""""""""""""""""""""""
set nocompatible
" set ff=unix
set colorcolumn=80
set smartindent
set cursorline 
set ignorecase smartcase
set ruler
" set autochdir
set number
"filetype plugin on "允许插件
"set hlsearch
"set incsearch
set nobackup
set noshowmode
set ffs=unix,dos
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set go=
set backspace=indent,eol,start " more powerful backspacing    
set nowrap 

if has('win32') || has('win64')
    set shell=pwsh.exe
endif

"Set mapleader
let mapleader = ","

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

inoremap <C-U> <C-G>u<C-U>

set imactivatekey=C-space
inoremap <ESC> <ESC>:set iminsert=2<CR>

"switch buffer
map <F1> :bp!<cr>
map <F2> :bn!<cr>
"switch tabs
nnoremap <leader>=  :tabnext<cr>
nnoremap <leader>-  :tabprev<cr>

nnoremap <leader>]  :bnext<cr>
nnoremap <leader>[  :bprevious<cr>

"quickfix
nnoremap <F9> :cp!<cr>
nnoremap <F10> :cn!<cr>

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
" autocmd BufEnter * silent! lcd %:p:h

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
autocmd! bufwritepost .vimrc source ~/.vimrc

" Relative numbering
function NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunction

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

""""""""""""""""""""""""""""""
" color and fonts setting
""""""""""""""""""""""""""""""
"Font
if has('win32') || has('win64')
    set guifont=Consolas:h11,Microsoft\ Yahei:h11:cANSI
else
    " set guifont=:h11
endif

"colo
syntax enable
set termguicolors

set background=dark
colorscheme apprentice

if &diff
    colorscheme murphy
endif

""""""""""""""""""""""""""""""
" License setting
""""""""""""""""""""""""""""""
let g:licenses_authors_name = 'Xinyu, He <legendmohe@foxmail.com>'
""""""""""""""""""""""""""""""
" Tagbar setting
""""""""""""""""""""""""""""""
nmap <F4> :TagbarToggle<CR>
let g:tagbar_left = 1
""""""""""""""""""""""""""""""
" easy-align setting
""""""""""""""""""""""""""""""
" vip<Enter>=
vmap <Enter> <Plug>(EasyAlign)
nnoremap <Leader>a <Plug>(EasyAlign)
""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"
" " These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

""""""""""""""""""""""""""""""
" vim-markdown setting
""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1

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
" NerdTree setting
""""""""""""""""""""""""""""""
" let NERDTreeChDirMode=1
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
let NERDTreeHighlightCursorline = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

map <F3> <plug>NERDTreeTabsToggle<CR>
map <S-F3> :NERDTreeFind<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""
" Syntastic setting
""""""""""""""""""""""""""""""
let g:syntastic_enable_highlighting=0
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = { 'mode': 'passive',
                               \ 'active_filetypes': ['ruby', 'python'],
                               \ 'passive_filetypes': [] }
""""""""""""""""""""""""""""""
" Task List setting
""""""""""""""""""""""""""""""
map <leader>td <Plug>TaskList

""""""""""""""""""""""""""""""
" ctags setting
""""""""""""""""""""""""""""""

set tags+=tags;

""""""""""""""""""""""""""""""
" vim-rooter setting
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" airline setting
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_detect_whitespace          = 0 "关闭空白符检测
let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
" let g:airline_theme                      = "bubblegum" "设定主题

""""""""""""""""""""""""""""""
" ctrlsf setting
""""""""""""""""""""""""""""""
nmap <leader>f :CtrlSF <space>
vmap <leader>f <Plug>CtrlSFVwordExec
let g:ackprg = "ack-grep -H --nocolor --nogroup --column"

""""""""""""""""""""""""""""""
" fzf setting
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>p :Files<CR>

""""""""""""""""""""""""""""""
" gitgutter setting
""""""""""""""""""""""""""""""
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

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
