runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set title
set titleold=
set titlestring=%t

filetype plugin indent on
"set directory^=$HOME/.vim/tmp//
set et hls sts=4 sw=4 ts=4
syn on
set number
set bs=2
set colorcolumn=100

set mouse=a
map <ScrollWheelDown> j
map <ScrollWheelUp> k
set scrolloff=5

highlight LineNr ctermfg=grey ctermbg=lightgrey
highlight Italic ctermbg=lightgrey
highlight BoldItalic ctermbg=lightgrey
highlight ColorColumn ctermbg=lightgrey
highlight DiffAdd ctermfg=black ctermbg=lightgreen
highlight DiffDelete ctermfg=black ctermbg=red
highlight DiffChange ctermfg=black ctermbg=lightmagenta
highlight DiffText ctermfg=black ctermbg=magenta

" disable auto-commenting:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o noai nocin nosi inde=
autocmd FileType sh setlocal sts=2 sw=2 ts=2 colorcolumn=81 | nmap ,f mkMml:%!bashfmt`lzz`k | vmap ,f mkMml:!bashfmt`lzz`k

" disable smart(-ass) mouse event handling:
set mouse -=a

" function! PreserveViewAndCursor(func)  " TBD
"     let l:winview = winsaveview()
"     call execute(a:func)
"     call winrestview(l:winview)
" endfunction

" TODO: de-duplicate these nasty definitions:
autocmd BufRead,BufNewFile *.c setlocal colorcolumn=89   | nmap ,f mkMml:%!clang-format`lzz`k | vmap ,f mkMml:!clang-format`lzz`k
autocmd BufRead,BufNewFile *.cpp setlocal colorcolumn=89   | nmap ,f mkMml:%!clang-format`lzz`k | vmap ,f mkMml:!clang-format`lzz`k
autocmd BufRead,BufNewFile *.h setlocal colorcolumn=89   | nmap ,f mkMml:%!clang-format`lzz`k | vmap ,f mkMml:!clang-format`lzz`k
autocmd BufRead,BufNewFile *.glsl setlocal sts=2 sw=2 ts=2 colorcolumn=89   | nmap ,f mkMml:%!clang-format`lzz`k | vmap ,f mkMml:!clang-format`lzz`k
autocmd BufRead,BufNewFile *.css setlocal sts=2 sw=2 ts=2 | nmap ,f mkMml:%!pcss`lzz`k | vmap ,f mkMml:!pjs`lzz`k
autocmd BufRead,BufNewFile *.docker setlocal sts=2 sw=2 ts=2 filetype=dockerfile
autocmd BufRead,BufNewFile *.glsl setlocal sts=2 sw=2 ts=2
autocmd BufRead,BufNewFile *.gql setlocal sts=2 sw=2 ts=2
autocmd BufRead,BufNewFile *.html setlocal sts=2 sw=2 ts=2
autocmd BufRead,BufNewFile *.js setlocal sts=2 sw=2 ts=2   | nmap ,f mkMml:%!pjs`lzz`k | vmap ,f mkMml:!pjs`lzz`k
autocmd BufRead,BufNewFile *.json setlocal sts=2 sw=2 ts=2 | nmap ,f mkMml:%!pj`lzz`k  | vmap ,f mkMml:!pj`lzz`k
autocmd BufRead,BufNewFile *.jsx setlocal sts=2 sw=2 ts=2  | nmap ,f mkMml:%!pjs`lzz`k | vmap ,f mkMml:!pjs`lzz`k
" autocmd BufRead,BufNewFile *.py  setlocal colorcolumn=89   | nmap ,f :Black | vmap ,f :Black | nmap ,i mkMml:%!isrt -`lzz`k
" autocmd BufRead,BufNewFile *.pyi setlocal colorcolumn=89   | nmap ,f :Black | vmap ,f :Black | nmap ,i mkMml:%!isrt -`lzz`k
autocmd BufRead,BufNewFile *.py  setlocal colorcolumn=89   | nmap ,F mkMml:%!bsq`lzz`k | vmap ,f mkMml:!bsq`lzz`k | nmap ,i mkMml:%!isrt -`lzz`k | nmap ,f ,F,i
autocmd BufRead,BufNewFile *.pyi setlocal colorcolumn=89   | nmap ,F mkMml:%!bsq --pyi`lzz`k | vmap ,f mkMml:!bsq --pyi`lzz`k | nmap ,i mkMml:%!isrt -`lzz`k | nmap ,f ,F,i
autocmd BufRead,BufNewFile *.nix setlocal sts=2 sw=2 ts=2 colorcolumn=81 | nmap ,f mkMml:%!nixfmt`lzz`k | vmap ,f mkMml:%!nixfmt`lzz`k
autocmd BufRead,BufNewFile *.rs nmap ,f mkMml:%!prs`lzz`k | vmap ,f mkMml:!prs`lzz`k
autocmd BufRead,BufNewFile *.sh setlocal sts=2 sw=2 ts=2 colorcolumn=81 | nmap ,f mkMml:%!bashfmt`lzz`k | vmap ,f mkMml:!bashfmt`lzz`k
autocmd BufRead,BufNewFile *.sql setlocal sts=2 sw=2 ts=2
autocmd BufRead,BufNewFile *.tf setlocal sts=2 sw=2 ts=2 | nmap ,f mkMml:%!terraform fmt -no-color -`lzz`k | vmap ,f mkMml:!terraform fmt -no-color -`lzz`k
autocmd BufRead,BufNewFile *.toml nmap ,f mkMml:%!toml-fmt`lzz`k | vmap ,f mkMml:!toml-fmt`lzz`k
autocmd BufRead,BufNewFile *.ts setlocal sts=2 sw=2 ts=2 filetype=typescript | nmap ,f mkMml:%!prettier --parser=typescript`lzz`k | vmap ,f mkMml:!prettier --parser=typescript`lzz`k
autocmd BufRead,BufNewFile *.tsx setlocal sts=2 sw=2 ts=2 | nmap ,f mkMml:%!prettier --parser=typescript`lzz`k | vmap ,f mkMml:!prettier --parser=typescript`lzz`k
autocmd BufRead,BufNewFile *.vue setlocal sts=2 sw=2 ts=2
autocmd BufRead,BufNewFile *.yaml setlocal sts=2 sw=2 ts=2 | nmap ,f mkMml:%!goyq -P e . -`lzz`k | vmap ,f mkMml:!goyq -P e . -`lzz`k | nmap ,i mkMml1GV}OA!sort -f`lzz`k
autocmd BufRead,BufNewFile *.yml setlocal sts=2 sw=2 ts=2  | nmap ,f mkMml:%!goyq -P e . -`lzz`k | vmap ,f mkMml:!goyq -P e . -`lzz`k | nmap ,i mkMml1GV}OA!sort -f`lzz`k
autocmd BufRead,BufNewFile *pylintrc setlocal filetype=toml
autocmd BufRead,BufNewFile Dockerfile setlocal sts=2 sw=2 ts=2 filetype=dockerfile
autocmd BufRead,BufNewFile requirements*.txt setlocal sts=2 sw=2 ts=2 filetype=requirements

nmap <F8> :TagbarToggle<CR>

"
" Fix shift+arrow key combinations.
"
nmap <S-Up>    <Up>
nmap <S-Down>  <Down>
nmap <S-Left>  <Left>
nmap <S-Right> <Right>
imap <S-Up>    <Up>
imap <S-Down>  <Down>
imap <S-Left>  <Left>
imap <S-Right> <Right>
vmap <S-Up>    <Up>
vmap <S-Down>  <Down>
vmap <S-Left>  <Left>
vmap <S-Right> <Right>

map <Esc>[A <Up>
map <Esc>[B <Down>
map <Esc>[C <Right>
map <Esc>[D <Left>

vmap ,s !sort -f
map ,g :diffget
map ,p :diffput
map ,u :diffup

let g:black_skip_string_normalization = 1

let g:markdown_enable_input_abbreviations = 0
let g:markdown_enable_spell_checking = 0

let g:vue_pre_processors = ['typescript']
"let g:vue_pre_processors = 'detect_on_enter'

let g:pyflakes_prefer_python_version = 3

" Configure tagbar:
let g:tagbar_width = 60
"autocmd VimEnter * nested :call tagbar#autoopen(1)

" Set `:C` command to clear search. https://stackoverflow.com/a/18003136
:command C let @/=""

command! -range=% Pbc silent <line1>,<line2>w !pbc
