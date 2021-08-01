" Enable line-wrap and spellcheck
set wrap
set spell

" Set tabstops to 2
set tabstop=2
set shiftwidth=2
set softtabstop=2

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_mode = 0  " 0 = never open, 1 = open and focus, 2 = open, no focus
let g:tex_conceal = 'amgs'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ]}
