syntax on
colorscheme koehler
set number
set expandtab
set incsearch
set smartindent
set autoindent
set shiftwidth=2
set softtabstop=2
set nowrap

function ModeChange()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod a+x <afile>
    endif
  endif
endfunction
autocmd BufWritePost * call ModeChange()

set pastetoggle=<F2>
set showmode

nnoremap <F3> :set invnumber number?<CR>
set showmode

command Diff execute 'w !git diff --no-index % -'

