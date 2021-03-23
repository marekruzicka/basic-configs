syntax on
colorscheme koehler
set number
set expandtab
set incsearch
set smartindent
set nowrap
set autoindent

" TAB settings
let tab_size=2
set expandtab
execute "set shiftwidth=".tab_size
execute "set softtabstop=".tab_size

" toggle between tab and spaces
function! TabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
  else
    execute "set shiftwidth=".g:tab_size
    execute "set softtabstop=".g:tab_size
    set expandtab
  endif
endfunction
nmap <F4> mz:execute TabToggle()<CR>'z

" automatically set +x on executables (scripts)
function ModeChange()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod a+x <afile>
    endif
  endif
endfunction
autocmd BufWritePost * call ModeChange()

" toggle paste/nopaste
set pastetoggle=<F2>
set showmode

" toggle line nubmering
nnoremap <F3> :set invnumber number?<CR>
set showmode

" run git diff on :Diff
command Diff execute 'w !git diff --no-index % -'

command W execute 'w !sudo dd of=' . shellescape(expand('%'))
