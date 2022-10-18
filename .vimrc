" Plugins: Installation
  call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-test/vim-test'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'tpope/vim-surround'
  Plug 'itchyny/lightline.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'preservim/nerdtree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  call plug#end()
" Plugins: Setup 
  set background=dark
  set number relativenumber
  set nocompatible
  set nofoldenable
  set foldmethod=marker
  set timeoutlen=400 ttimeoutlen=0
  set encoding=utf-8
  set number
  set tabstop=4
  set laststatus=2
  set ignorecase
  set fileencoding=utf-8
  set rtp+=~/.fzf
  set autoindent
  set smartindent
  set shiftwidth=4
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
  " imap kk <Esc>la
" Keybindings: Testing
  nmap <silent> <leader>t :TestNearest<CR>
" Keybindings: Split windows & jump 
  nmap sd :vsplit<cr>
  nmap sx :split<cr>
  nmap sh <C-w>h
  nmap sj <C-w>j
  nmap sk <C-w>k
  nmap sl <C-w>l
  nmap <leader>aa ggVG"*y
  nmap <leader>ii ciw'<C-r>"'jj
  vmap <leader>cc "*y
  nmap <leader>ht :%s/<[^>]*>/\r/g<cr><esc><leader>elgg
  nmap <leader>cl ggVGc<Esc>
  nnoremap ff :FZF!<cr>
  nnoremap gr :GoRun<cr>
  nnoremap <leader>nn :NERDTree<cr>
  nnoremap <leader>rd :sort u<cr><esc>
  nnoremap <leader>el :g/^$/d<cr>
  nmap <leader>r :RangerWorkingDirectory<cr>
  xnoremap <C-k> :m-2<cr>gv=gv
  xnoremap <C-j> :m'>+<cr>gv=gv
" Autocommands 
  command! -nargs=1 Ngrep vimgrep "<args>" **
  au BufNewFile, BufRead *.py set tabstop=4 set softtabstop=4 set shiftwidth=4 set textwidth=79 set expandtab set autoindent set fileformat=unix
  au BufNewFile, BufRead *.js,*.html,*.css
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
