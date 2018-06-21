call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/alternate-lite'
Plug 'dyng/ctrlsf.vim'
"Plug 'crucerucalin/qml.vim'
Plug 'peterhoeg/vim-qml'

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
set lcs+=space:·
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
nmap <CR><CR> o<ESC>
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

map <F7> mzgg=G`z
