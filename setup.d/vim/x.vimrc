set nocompatible nobackup

" no history
set viminfo=

""""""""""""""""""""""""""""""""""""""""
" appearance

set number ruler showcmd laststatus=2 scrolloff=4
set hlsearch incsearch showmatch
set splitright

if has("gui_running") || &t_Co == 256
    syntax on
"    color ron
"    let g:solarized_termcolors=256
"    set background=light
"    color solarized
"    color eclipse-lite
endif

hi SpecialKey ctermfg=1
set list listchars=tab:>-,trail:=

" 省略号宽1em
set ambiwidth=double

""""""""""""""""""""""""""""""""""""""""
" behavior

set backspace=indent,eol,start

set fencs=utf8,gb2312,gbk,big5,gb18030,iso8859-1 ffs=unix,dos

set noautoindent

" add space and asterisk on newline in comment
set formatoptions=tcqro

set nolinebreak nobreakindent

set textwidth=80 fo="" cc=+0 | hi ColorColumn ctermbg=lightblue

set tabstop=8 noexpandtab

set winaltkeys=no

" fctix.vim
set ttimeoutlen=100

" disable bell
set visualbell | set t_vb=

""""""""""""""""""""""""""""""""""""""""
" function

if has("autocmd")
"set autochdir
autocmd BufReadPost * cd %:p:h " goto file's dirname before open it
autocmd FileType c,cpp,java,javascript,php,sh,python,vim,lua,cs,sql :set ts=4 sw=4 et fo=""
autocmd FileType html,css,json,xml,yaml :set ts=4 sw=4 et fo=""
autocmd FileType make :set ts=8 sw=8 noet
autocmd FileType rfc :set ts=3 et tw=72 fo="tcq"
autocmd BufWritePre *.html,*.css,*.js,*.json,*.php,*.xml,*.py,*.sh,*.c,*.cpp,*.h,*.java,*.lua,*.mk %s/\s\+$//e " remove trailing space
endif

inoremap    jk  <esc>

" move around
inoremap    <c-a>   <home>
inoremap    <c-e>   <end>
nnoremap    <s-h>   <home>
nnoremap    <s-l>   <end>

" edit
inoremap    <c-d>   <esc>ddi
nnoremap    <c-d>   dd
"inoremap    <c-u>   <esc>ld<home><esc>i
inoremap    <c-u>   <c-\><c-o>d<home>
"inoremap    <c-k>   <esc>ld<end><esc>a
inoremap    <c-k>   <c-\><c-o>d<end>
"inoremap    <c-s>   <Esc>:w<CR>a

" tab/window switch
nnoremap    <m-1>   1gt
nnoremap    <m-2>   2gt
nnoremap    <m-3>   3gt
nnoremap    <m-4>   4gt

" misc
inoremap    <F2>    <C-R>=strftime("%Y-%m-%d %H:%M:%S %z")<CR>

" <F4> but not save
nnoremap    <F4>    :set fenc=utf8 <Bar> set ff=unix<CR>

" <F5> to trim trailing whitespaces
nnoremap    <F5>    :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
