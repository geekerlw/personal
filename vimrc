"
" Author: Steven Lee <geekerlw@gmail.com>
"

" vim plugin manager
call plug#begin('~/.vim/plugged')

Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dyng/ctrlsf.vim'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/ycm-generator', { 'branch': 'stable' }
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

" source the example set
source $VIMRUNTIME/vimrc_example.vim

" vim color scheme set
colorscheme molokai
set t_Co=256

" enable filetype dectection and ft specific plugin/indent
set nocp
filetype on
filetype plugin on
filetype plugin indent on

" disable backup and undofiles
set nobackup
set noundofile

" enable syntax hightlight and completion
syntax on

" search
set incsearch
set nohlsearch
set ignorecase
set smartcase

" editor setting
set mouse+=a
set number
set showcmd

" default indentation
set smartindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tagbar left
let g:tagbar_left = 1

" guentags setting
let g:gutentags_project_root = ['.root', '.git']
let g:gutentags_cache_dir    = expand('~/.cache/tags')

" ycm setting
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_complete = 1

" Nerd Tree right
let NERDChristmasTree     = 0
let NERDTreeWinSize       = 30
let NERDTreeChDirMode     = 2
let NERDTreeIgnore        = ['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks = 1
let NERDTreeWinPos        = "right"

" nerd comment setting
let g:NERDSpaceDelims            = 1
let g:NERDCompactSexyComs        = 1
let g:NERDDefaultAlign           = 'left'
let g:NERDAltDelims_java         = 1
let g:NERDCustomDelimiters       = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines      = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines    = 1

" airline sets
let g:airline_theme = 'molokai'

" *** key binds ***
" Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

" Ctrlsf search key bind
nmap <F4> :CtrlSF<Space>
nmap <F5> :CtrlSFOpen<cr>

" build tags of your own project with F6
nmap <F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ./<cr>

" keybindings for plugins toggle
nnoremap <C-l> :TagbarToggle<cr>
" nnoremap <C-l> :TlistToggle<cr>
nnoremap <C-n> :NERDTreeToggle<cr>

" easy align key binds
xmap ea <Plug>(EasyAlign)
nmap ea <Plug>(EasyAlign)

" easy motion key binds
map f2 <Plug>(easymotion-s2)
map fn <Plug>(easymotion-sn)

" ctrlsp key binds
vmap <C-f> <Plug>CtrlSFVwordExec

" ycm key binds
nnoremap <F11> :YcmCompleter GoToDeclaration<cr>
nnoremap <F12> :YcmCompleter GoToDefinition<cr>
