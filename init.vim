call plug#begin('~/.local/share/nvim/plugged')
Plug 'nightsense/simplifysimplify'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Raimondi/delimitMate'
" remove the on parameter to enable YCM
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer', 'on': [] }
call plug#end()

" Color Scheme
set termguicolors " Enable true colors support

colorscheme simplifysimplify-dark
let g:simplifysimplify_dark_CursorLineNr = 'on'
let g:simplifysimplify_dark_LineNr = 'on'

" Editor
syntax enable

set number
set cursorline
set showmatch
set colorcolumn=120

set showcmd
set wildmenu

" More natural view split behaviour
set splitbelow
set splitright

" Tab options
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set copyindent

" Search options
set showmatch
set incsearch
set hlsearch

" Lightline options
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" NERD options
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

" Ack options (use Ag)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" YCM options
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 1

" CScope options
" add any cscope database in current directory
if filereadable("cscope.out")
    cs add cscope.out
" else add the database pointed to by environment variable
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

" Commnads
command Showtws /\s\+$
command Cleartws %s/\s\+$//e

" Key mappings
let mapleader=","

nnoremap <leader>b :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>fix :YcmCompleter FixIt<CR>

" View controls
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap <S-Up>    <C-w>5+
nnoremap <S-Down>  <C-w>5-
nnoremap <S-Left>  <C-w>5<
nnoremap <S-Right> <C-w>5>

nnoremap <C-o> <C-w>o
nnoremap <S-o> <C-w>=

" Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-q> <C-\><C-n>:q<Enter>

" Toggle NERD Tree
map <C-n> :NERDTreeToggle<CR>

" CScope
" 's'  symbol:   find all references to the token under cursor
" 'g'  global:   find global definition(s) of the token under cursor
" 'c'  calls:    find all calls to the function name under cursor
" 't'  text:     find all instances of the text under cursor
" 'e'  egrep:    egrep search for the word under cursor
" 'f'  file:     open the filename under cursor
" 'i'  includes: find files that include the filename under cursor
" 'd'  called:   find functions that function under cursor calls

nnoremap <leader>fs :cs find s<space>
nnoremap <leader>ft :cs find e<space>

nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" horizontal split on select
nnoremap <leader>hs :scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>hc :scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ht :scs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>hf :scs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>hi :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <leader>hd :scs find d <C-R>=expand("<cword>")<CR><CR>

" vertical split on select
nnoremap <leader>vs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>vc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>vt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>vf :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>vi :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <leader>vd :vert scs find d <C-R>=expand("<cword>")<CR><CR>

