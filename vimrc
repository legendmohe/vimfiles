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

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'preservim/nerdtree'
Plug 'vim-scripts/TaskList.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-startify'
Plug 'monkoose/vim9-stargate'
Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeTabsToggle' }
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'udalov/kotlin-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'romainl/Apprentice'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-rooter'
Plug 'doums/darcula'
Plug 'matze/vim-move'
Plug 'fholgado/minibufexpl.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rhysd/clever-f.vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required!

""""""""""""""""""""""""""""""
" common setting
""""""""""""""""""""""""""""""
set cmdheight=2
set shortmess=a
set nocompatible
" set ff=unix
set colorcolumn=80
set smartindent
" set cursorline 
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
set lazyredraw

" if has('win32') || has('win64')
"     set shell=pwsh.exe
" endif

"Set mapleader
" let mapleader = ","
let mapleader=" "
nnoremap <Space> <Nop>

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

inoremap <C-U> <C-G>u<C-U>

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

nnoremap <c-f> <Esc>/
inoremap <c-f> <Esc>/

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
    set rnr
  endif
endfunction

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

""""""""""""""""""""""""""""""
" terminal setting
""""""""""""""""""""""""""""""
nnoremap <a-0> :term<cr>
inoremap <a-0> :term<cr>

nmap <M-Right> :vertical resize +1<CR>
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

""""""""""""""""""""""""""""""
" color and fonts setting
""""""""""""""""""""""""""""""
"Font
if has('win32') || has('win64')
    set guifont=Consolas:h11,Microsoft\ Yahei:h11:cANSI
else
    set guifont=:h11
endif

"colo
syntax enable

set background=dark
colorscheme palenight

if (has("termguicolors"))                                                               
      set termguicolors                                                                     
endif

" if has('win32') || has('win64')
"     colorscheme darcula
" endif
"
" if &diff
"     colorscheme murphy
" endif

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
" vim9-stargate
""""""""""""""""""""""""""""""
" For 1 character to search before showing hints

if !has('nvim')
    noremap <leader>f <Cmd>call stargate#OKvim(1)<CR>
    noremap <leader>g <Cmd>call stargate#OKvim(2)<CR>
endif

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
let NERDTreeChDirMode=1
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
let NERDTreeHighlightCursorline = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

map <F3> <plug>NERDTreeTabsToggle<CR>
map <a-1> :NERDTreeFind<CR>
map <S-F3> :NERDTreeFind<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
let g:airline#extensions#tabline#enabled = 0 "顶部tab栏显示
" let g:airline_theme                      = "bubblegum" "设定主题

""""""""""""""""""""""""""""""
" ctrlsf setting
""""""""""""""""""""""""""""""
nmap <leader>F <Esc>:CtrlSF <space>
vmap <leader>F <Plug>CtrlSFVwordExec
let g:ackprg = "ack-grep -H --nocolor --nogroup --column"

""""""""""""""""""""""""""""""
" fzf setting
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>p <Esc>:Files<CR>
vnoremap <silent> <leader>p <Esc>:FZF -q <C-R>=<SID>getVisualSelection()<CR><CR>
nnoremap <silent> <leader><leader>p <Esc>:FZF -q <C-R>=expand("<cword>")<CR><CR>

nnoremap <silent> <c-e> :History<CR>
nnoremap <silent> <c-n> <Esc>:Files<CR>

let g:fzf_preview_window = []
let g:fzf_layout = { 'down': '40%' }

""""""""""""""""""""""""""""""
" gitgutter setting
""""""""""""""""""""""""""""""
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

""""""""""""""""""""""""""""""
" vim-move setting
""""""""""""""""""""""""""""""
let g:move_key_modifier = 'C'

""""""""""""""""""""""""""""""
" others setting
""""""""""""""""""""""""""""""
if has('win32') || has('win64')
    source $VIMRUNTIME/mswin.vim 
    behave mswin
endif

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

if has("gui_running")
    " Cursor in terminal
    let &t_SI.="\e[5 q"
    let &t_SR.="\e[4 q"
    let &t_EI.="\e[1 q"
endif
" Set cursor shape and color
" " 1 -> blinking block  闪烁的方块
" " 2 -> solid block  不闪烁的方块
" " 3 -> blinking underscore  闪烁的下划线
" " 4 -> solid underscore  不闪烁的下划线
" " 5 -> blinking vertical bar  闪烁的竖线
" " 6 -> solid vertical bar  不闪烁的竖线
"
" function! s:getVisualSelection()
"     let [line_start, column_start] = getpos("'<")[1:2]
"     let [line_end, column_end] = getpos("'>")[1:2]
"     let lines = getline(line_start, line_end)
"
"     if len(lines) == 0
"         return ""
"     endif
"
"     let lines[-1] = lines[-1][:column_end - (&selection == "inclusive" ? 1 : 2)]
"     let lines[0] = lines[0][column_start - 1:]
"
"     return join(lines, "\n")
" endfunction
