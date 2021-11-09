" Plugins: Installation
  call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'tpope/vim-surround'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'preservim/nerdtree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'francoiscabrol/ranger.vim'
  if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  endif
  call plug#end()
" Plugins: Setup 
  set background=dark
  set number relativenumber
  set nocompatible
  set foldmethod=marker
  set timeoutlen=600 ttimeoutlen=0
  set encoding=utf-8
  set number
  set tabstop=4
  set laststatus=2
  set ignorecase
  set fileencoding=utf-8
  set rtp+=~/.fzf
  set autoindent
  set smartindent
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set path+=**
  set omnifunc=syntaxcomplete#Complete
  set wildmenu
  set modifiable
  set mouse=a
  set foldmethod=indent
  let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
  let g:material_theme_style = 'ocean'
  let NERDTreeShowHidden=1
  let g:ranger_map_keys = 0
  let g:surround_indent = 0
  colorscheme material
  filetype plugin indent on
  syntax enable
  if (has('termguicolors'))
    set termguicolors
  endif
" Keybindings: File manipulation 
  inoremap <leader>q <esc>:q!<cr>
  inoremap <leader>z <esc>:wq<cr>
  inoremap <leader>s <esc>:w!<cr>
  nnoremap <leader>q :q!<cr>
  nnoremap <leader>z :wq<cr>
  nnoremap <leader>s :w!<cr>
" Keybindings: Plugin 
  imap jj <Esc>
  imap kk <Esc>la
  nmap <leader>aa ggVG"*y
  nmap <leader>ii ciw'<C-r>"'jj
  vmap <leader>cc "*y
  nmap <leader>ht :%s/<[^>]*>/\r/g<cr><esc><leader>elgg
  nmap <leader>cl ggVGc<Esc>
  nnoremap <leader>nn :NERDTree<cr>
  nnoremap <leader>f :FZF!<cr>
  nnoremap <leader>rd :sort u<cr><esc>
  nnoremap <leader>el :g/^$/d<cr>
  nmap <leader>r :RangerWorkingDirectory<cr>
  nmap <leader>tv :vsplit<cr>
  nmap <leader>th :split<cr>
  nmap <leader>tt <C-w><C-w>
  nmap <leader>tc <C-w><C-q>
  xnoremap <C-k> :m-2<cr>gv=gv
  xnoremap <C-j> :m'>+<cr>gv=gv
" Autocommands 
  command! -nargs=1 Ngrep vimgrep "<args>" **
