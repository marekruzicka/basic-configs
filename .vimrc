syntax on
colorscheme koehler
set number
set expandtab
set incsearch
set smartindent
set autoindent
set softtabstop=8
set nowrap

function ModeChange()
if getline(1) =~ "^#!"
if getline(1) =~ "/bin/"
silent !chmod a+x <afile>
endif
endif
endfunction
autocmd BufWritePost * call ModeChange()

