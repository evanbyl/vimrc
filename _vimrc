set number
set ignorecase
set smartcase
set backspace=indent,eol,start

let mapleader="\<Space>"
let g:ctrlp_cmd = 'CtrlP'
nmap <leader>p :CtrlP<cr>

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
 set runtimepath^=~/.vim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 NeoBundle 'https://github.com/easymotion/vim-easymotion'
 NeoBundle 'https://github.com/kien/ctrlp.vim'
" NeoBundle 'https://github.com/wookiehangover/jshint.vim'
 NeoBundle 'https://github.com/scrooloose/syntastic'
 NeoBundle 'https://github.com/kana/vim-textobj-user'
 NeoBundle 'https://github.com/Julian/vim-textobj-variable-segment'
 NeoBundle 'https://github.com/aykamko/vim-easymotion-segments'
 NeoBundle 'https://github.com/Shougo/unite.vim'
 NeoBundle 'https://github.com/vim-airline/vim-airline'
 NeoBundle 'https://github.com/PProvost/vim-ps1'
 NeoBundle 'https://github.com/jeetsukumaran/vim-buffergator'

 call neobundle#end()

 " Required:
 filetype plugin indent on
 set tabstop=4
 set shiftwidth=0
 set expandtab

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

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

" Unite stuff for fuzzy line search
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
nnoremap <C-k> :<C-u>Unite -buffer-name=search -start-insert line<cr>

run SyntasticEnable javascript


autocmd BufNewFile,BufRead *.sj e ++enc=utf-16le
autocmd BufNewFile,BufRead *.sj set filetype=javascript 
autocmd GUIEnter * simalt ~x
syn on
colo desert
set guifont=Consolas:h11:cANSI
set guioptions-=m
set guioptions-=T
