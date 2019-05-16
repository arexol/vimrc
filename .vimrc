" initial package control install by line below
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" On-demand loading
" sudo apt install build-essential cmake
" sudo apt-get install python-dev python3-dev
" ./install.py --clang-complete
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
"Plug 'kien/ctrlp.vim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
" apt-get install silversearcher-ag
Plug 'rking/ag.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/alternate-lite'
Plug 'dyng/ctrlsf.vim'
Plug 'crucerucalin/qml.vim'
Plug 'peterhoeg/vim-qml'
" On-demand loading
Plug 'klen/python-mode'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
call plug#end()



set number
set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set incsearch
set timeoutlen=1000 ttimeoutlen=0
set noswapfile
let g:mapleader=','
"set list
"set lcs=space:·
"set lcs+=tab:>-
let g:ctrl_custom_ignore = {
 \ 'dir': '\.git$\|tmp$|commit-backus',
 \ 'file': '\.so$|\.dat$'
 \ }
if executable("ag")
  let g:ackprg = "ag --nogroup --column"
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:fzf_buffers_jump = 1
imap <C-D> <Del>
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
map <C-t> :FZF<CR>
map <C-c> :Buffers<CR>
nmap <CR><CR> o<ESC>
nmap     <C-F>f <Plug>CtrlSFCwordPath
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
"nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
"let g:ctrlsf_extra_backend_args = {
"      \ 'ag': '-g cpp'
"      \ }
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-j>'
let g:multi_cursor_select_all_word_key = '<A-j>'
let g:multi_cursor_start_key           = 'g<C-j>'
let g:multi_cursor_select_all_key      = 'g<A-j>'
let g:multi_cursor_next_key            = '<C-j>'
let g:multi_cursor_prev_key            = '<C-k>'
let g:multi_cursor_skip_key            = '<C-l>'
let g:multi_cursor_quit_key            = '<Esc>'

let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:airline#extensions#tabline#enabled = 1 
map <F7> mzgg=G`z
let g:pymode_run = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

execute "set <M-n>=\en"
"execute "set <M-m>=\em"
"nnoremap <M-n> :m +1<CR> 


function! ShowTerm()
  silent !read -sN 1
  redraw!
endfunction

map == :call ShowTerm()<CR>


function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction


let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


