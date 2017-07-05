# general sets
syntax on
set number
set tabstop=4
set shiftwidth=4

# auto config ctags
set tags=tags;
set autochdir

# taglist config
let Tlist_Show_One_File=0
let Tlist_Exit_OnlyWindow=1
let Tlist_File_FOLD_Auto_Close=1

# auto add cscope
if filereadable("cscope.out")
    cs add cscope.out
endif
