" Vim-plug
" https://github.com/junegunn/vim-plug/
call plug#begin('~/.vim/plugged')
" themes
Plug 'morhetz/gruvbox'
Plug 'Lokaltog/vim-distinguished'
Plug 'nanotech/jellybeans.vim'
" delete buffers without closing windows
Plug 'moll/vim-bbye'
" smart tmux + vim pane switching
Plug 'christoomey/vim-tmux-navigator'
call plug#end()


set background=dark
colorscheme gruvbox

set number
syntax on

let mapleader = ","


" search
set hlsearch
set incsearch
nnoremap <leader>/ :noh<cr>

" window nav (currently using tmux-navigator)
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

set mouse=a

" buffers
nnoremap <tab> :bn<CR>
nnoremap <S-tab> :bp<CR>
" shortcut for Bbye
nnoremap <Leader>q :Bdelete<CR>

" best vim key binding
nnoremap ; :

" burn all the tabs
set expandtab
set tabstop=4
set shiftwidth=4


" wrap to prev/next line when moving cursor
set whichwrap+=<,>,h,l,[,]

