" source the example set
source $VIMRUNTIME/vimrc_example.vim

" enable filetype dectection and ft specific plugin/indent
set nocp
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
" set title
set mouse=a
set number
set showcmd

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

" default indentation
set smartindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" auto add ctags
set tags=tags;
set autochdir

" taglist sets
let Tlist_Show_One_File=0
let Tlist_Exit_OnlyWindow=1
let Tlist_File_FOLD_Auto_Close=1

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"

" auto load cscope
if !has("cscope")
	finish
endif
function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
au VimEnter * call LoadCscope()

" OmniCppComplete
" autocmd FileType c setlocal omnifunc=ccomplete#Complete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1 
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" auto close complete windows
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

" keybindings for plugins toggle
nnoremap <C-l> :TlistToggle<cr>
nnoremap <C-n> :NERDTreeToggle<cr>
" build tags of your own project with F2 
nmap <F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ./<cr> 
" build cscope of your own project with F3
nmap <F7> :!cscope -kbqR <cr>
" keybindings for cscope find funcs
nmap <C-\>s :cs f s <C-R>=expand("<cword>")<CR><cr>
nmap <C-\>g :cs f g <C-R>=expand("<cword>")<CR><cr>
nmap <C-\>c :cs f c <C-R>=expand("<cword>")<CR><cr>
nmap <C-\>t :cs f t <C-R>=expand("<cword>")<CR><cr>
nmap <C-\>e :cs f e <C-R>=expand("<cword>")<CR><cr>
nmap <C-\>f :cs f f <C-R>=expand("<cword>")<CR><cr>
nmap <C-\>i :cs f i <C-R>=expand("<cword>")<CR><cr>
nmap <C-\>d :cs f d <C-R>=expand("<cword>")<CR><cr>
