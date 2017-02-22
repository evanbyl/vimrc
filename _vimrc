call plug#begin('~/vimfiles/plugged')
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'aykamko/vim-easymotion-segments'
Plug 'vim-syntastic/syntastic'
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'vim-airline/vim-airline'
Plug 'PProvost/vim-ps1'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'scrooloose/nerdtree'
call plug#end()

set number
set ignorecase
set smartcase
set backspace=indent,eol,start


let mapleader="\<Space>"
let g:ctrlp_cmd = 'CtrlP'
nmap <leader>p :CtrlP<cr>

nmap <leader>ev :edit d:\dev\vimrc\_vimrc<cr>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
nmap <C-Q> <C-W><C-Q>

" BufferGator stuff
let buffergator_viewport_split_policy = 'R'

" NerdTree shortcuts
let NERDTreeQuitOnOpen = 1
let NERDTreeChDirMode = 2
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 60

" Shortcuts for toggling NERDTree
nnoremap <Leader>nt :NERDTree<CR><C-w>h:NERDTreeFind<CR>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" change or delete without changing buffer
nmap <leader>d "_d
nmap <leader>c "_c
nmap <leader>x "_x

" insert lines above/below without entering insert mode
nmap <leader>o o<esc>
nmap <leader>O O<esc>

" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

" Required:
 filetype plugin indent on
 set tabstop=4
 set shiftwidth=0
 set expandtab

if &compatible
  set nocompatible
endif

filetype plugin indent on
syntax enable
" CtrlP stuff
let g:ctrlp_root_markers = ['dmake.targets, requireConfig.js']
let g:ctrlp_working_path_mode = 'ra'

" Syntastic stuff
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']

" Set JSHint config for Syntastic if there's a TIER_ROOT_COREWEB env var set
if $TIER_ROOT_COREWEB != ''
    for coreweb_path in split($TIER_ROOT_COREWEB)
        let jshint_exec_path = expand(join([coreweb_path, 'pub', 'resources', 'node_modules', '.bin', 'jshint.cmd'], '/'))
        if filereadable(jshint_exec_path)
            let g:syntastic_javascript_jshint_exec = jshint_exec_path
            break
        endif
    endfor
    for coreweb_path in split($TIER_ROOT_COREWEB)
        let jshintrc_path = expand(join([coreweb_path, 'pub', 'src', '.jshintrc'], '/'))
        if filereadable(jshintrc_path)
            let g:syntastic_javascript_jshint_args = printf('--config "%s"', jshintrc_path)
            break
        endif
    endfor
endif

" Airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

set hidden
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>w :bp <BAR> bd #<CR>

run SyntasticEnable javascript


autocmd BufNewFile,BufRead *.sj e ++enc=utf-16le
autocmd BufNewFile,BufRead *.sj set filetype=javascript 
autocmd GUIEnter * simalt ~x
syn on
colo desert
set guifont=Consolas:h11:cANSI
set guioptions-=m
set guioptions-=T
set guioptions-=L
