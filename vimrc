" enable filetype dectection and ft specific plugin/indent
set nocp
filetype plugin on
filetype plugin indent on

" enable syntax hightlight and completion
syntax on

" search
set incsearch
set ignorecase
set smartcase

" editor setting
set mouse=a
set number
set showcmd

" default indentation
set cindent
set smartindent
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

" auto load cscope
if filereadable("./cscope.out")
	cs add ./cscope.out ./
else
	let cs_db=findfile("cscope.out", ".;")
	let cs_dir=matchstr(cs_db, ".*/")
	if !empty(cs_db) && filereadable(cs_db)
		exe "cs add" cs_db cs_dir
	endif
endif

set completeopt=menu

" OmniCppComplete
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
