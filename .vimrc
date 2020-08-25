" PluginInstallers {{{ 
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
call plug#end()
execute pathogen#infect()
" }}}
" Setup {{{ :PluginInstall
set nocompatible
set number relativenumber
set laststatus=2
set ignorecase
colorscheme gruvbox
set background=dark
filetype plugin indent on
syntax enable
set path+=**
set wildmenu
set modifiable
set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end
let NERDTreeShowHidden=1
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
" }}}
" Options {{{
set omnifunc=syntaxcomplete#Complete
let g:ranger_map_keys = 0
set foldmethod=marker
set number
set tabstop=2
set timeoutlen=600 ttimeoutlen=0
set encoding=utf-8
set fileencoding=utf-8
set rtp+=~/.fzf
" }}}
" Keys {{{
" File  manipulation {{{
inoremap <leader>q <esc>:q!<cr>
inoremap <leader>z <esc>:wq<cr>
inoremap <leader>s <esc>:w!<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>z :wq<cr>
nnoremap <leader>s :w!<cr>
" }}}
" Keys:Plugin {{{
imap jj <Esc>
nmap <leader>vl 'a<C-v>'b$S<li>'aO<ul><Esc>'bo</ul><Esc>'akO<h3>Vlastnosti:</h3><Esc>
nnoremap <leader>f :FZF!<cr>
nnoremap <leader>rd :sort u<cr><esc>
nnoremap <leader>el :g/^$/d<cr>
nmap <leader>tv :vsplit<cr>
nmap <leader>th :split<cr>
nmap <leader>tt <C-w><C-w>
nmap <leader>tc <C-w><C-q>
xnoremap <C-k> :m-2<cr>gv=gv
xnoremap <C-j> :m'>+<cr>gv=gv
" }}}
" Locales {{{
" Svenska {{{
inoremap <C-v>aa <C-k>aa
inoremap <C-v>ae <C-k>a:
inoremap <C-v>oo <C-k>o:
" }}}
" Slovencina {{{
inoremap <C-v>00 <C-k>e'
inoremap <C-v>22 <C-k>l<
inoremap <C-v>33 <C-k>s<
inoremap <C-v>44 <C-k>c<
inoremap <C-v>55 <C-k>t<
inoremap <C-v>66 <C-k>z<
inoremap <C-v>77 <C-k>y'
inoremap <C-v>88 <C-k>a'
inoremap <C-v>99 <C-k>i'
inoremap <C-v>nn <C-k>n<
inoremap <C-v>;; <C-k>o>
" }}}
" }}}
" }}}
" Autocommands {{{
command! -nargs=1 Ngrep vimgrep "<args>" **
" }}}
