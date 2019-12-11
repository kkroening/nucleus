runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin indent on
"set directory^=$HOME/.vim/tmp//
set et hls sts=4 sw=4 ts=4
syn on
set number
set bs=2
set colorcolumn=100

highlight LineNr ctermfg=grey ctermbg=lightgrey
highlight Italic ctermbg=lightgrey
highlight BoldItalic ctermbg=lightgrey
highlight ColorColumn ctermbg=lightgrey
highlight DiffAdd ctermfg=black ctermbg=lightgreen
highlight DiffDelete ctermfg=black ctermbg=red
highlight DiffChange ctermfg=black ctermbg=lightmagenta
highlight DiffText ctermfg=black ctermbg=magenta

" disable auto-commenting.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o noai nocin nosi inde=
autocmd FileType sh setlocal sts=2 sw=2 ts=2 colorcolumn=80

autocmd BufRead,BufNewFile *.docker setlocal filetype=dockerfile
autocmd BufRead,BufNewFile *.html setlocal sts=2 sw=2 ts=2
autocmd BufRead,BufNewFile *.js setlocal sts=2 sw=2 ts=2
autocmd BufRead,BufNewFile *.json setlocal sts=2 sw=2 ts=2
autocmd BufRead,BufNewFile *.jsx setlocal sts=2 sw=2 ts=2
autocmd BufRead,BufNewFile *.py setlocal colorcolumn=100
autocmd BufRead,BufNewFile *.sh setlocal sts=2 sw=2 ts=2
autocmd BufRead,BufNewFile *.tf setlocal sts=2 sw=2 ts=2
autocmd BufRead,BufNewFile *.txt setlocal sts=2 sw=2 ts=2 colorcolumn=120
autocmd BufRead,BufNewFile *.yaml setlocal sts=2 sw=2 ts=2

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

map ,g :diffget
map ,p :diffput
map ,u :diffup

" disable markdown fucking spellcheck (I know how to spell, you cunt)
let g:markdown_enable_spell_checking = 0
let g:ale_set_signs = 0

let g:vue_pre_processors = ['typescript']
"let g:vue_pre_processors = 'detect_on_enter'

let g:pyflakes_prefer_python_version = 3