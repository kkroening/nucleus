filetype plugin on
set directory^=$HOME/.vim/tmp//
set et hls sts=4 sw=4 ts=4
syn on

" disable horseshit auto-commenting.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd BufRead,BufNewFile *.txt setlocal sts=2 sw=2 ts=2
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
