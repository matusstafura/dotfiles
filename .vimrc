" PluginInstallers {{{ 
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'itchyny/lightline.vim'
call plug#end()
execute pathogen#infect()
" }}}
" Setup {{{ 
set nocompatible
set number relativenumber
set laststatus=2
set ignorecase
colorscheme hipster
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
" }}}
" Options {{{
set omnifunc=syntaxcomplete#Complete
let g:ranger_map_keys = 0
set foldmethod=marker
set number
set listchars=tab:▸\ ,eol:¬
set tabstop=2
set timeoutlen=600
" }}}
" Keys {{{
" File manipulation {{{
inoremap <leader>q <esc>:q!<cr>
inoremap <leader>z <esc>:wq<cr>
inoremap <leader>s <esc>:w!<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>z :wq<cr>
nnoremap <leader>s :w!<cr>
nnoremap <leader>a gg"*yG<cr>
" }}}
" Keys:Plugin {{{
map <leader>f :Ranger<cr>
nnoremap <C-t> :FZF<cr>
nnoremap <leader>n :NERDTree<cr>
nnoremap ; :FZF!<cr>
nnoremap [[ :cprev<cr>
nnoremap ]] :cnext<cr>
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
autocmd BufNewFile,BufRead,BufWrite *.md,*.txt, set filetype=markdown ts=3 sw=3
autocmd BufNewFile,BufRead,BufWrite *.rb, set ts=3 sw=3
command! -nargs=1 Ngrep vimgrep "<args>" **
" }}}
