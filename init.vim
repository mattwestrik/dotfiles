syntax on
filetype plugin indent on

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'                   " Sensible vim defaults
Plug 'tpope/vim-surround'                   " Add quote substition commands
Plug 'sheerun/vim-polyglot'                 " On-demand language packs
Plug 'google/vim-maktaba'                   " Needed for vim-bazel
Plug 'altercation/vim-colors-solarized'     " Solarized theme
Plug 'vim-airline/vim-airline'              " Lightweight status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'                  " File tree

call plug#end()

set background=light
colorscheme solarized

" ------ Remaps ------
noremap <SPACE> <Nop>
let g:mapleader = ' '

" Move around easily
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Edit & reload vim config
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" Close NERDTree if it's the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
