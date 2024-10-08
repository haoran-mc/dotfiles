" 自动记住上次位置
autocmd BufReadPost *
    \ if line("'\"")>0&&line("'\"")<=line("$") |
    \   exe "normal g'\"" |
    \ endif

" markdown
autocmd Filetype markdown set wrap
autocmd Filetype markdown nnoremap j gj
autocmd Filetype markdown nnoremap k gk

" golang
" autocmd FileType go nmap <leader>cf :silent ! ~/go/bin/goimports -w %<cr>
autocmd FileType go :set noexpandtab tabstop=4 " Do not use spaces instead of tabs
" go build -o _exe -gcflags "-N -l" main.go
" gdb -tui _exe
" autocmd BufNewFile go :TemplateInit()

" c/cpp
" autocmd FileType c,cpp nmap <leader>cf :silent ! astyle --style=attach --pad-oper --lineend=linux %<cr>
" autocmd FileType c,cpp :set shiftwidth=4 expandtab

" autocmd FileType sh :set noexpandtab tabstop=4
" autocmd FileType lua :set shiftwidth=4
" autocmd FileType python :set tabstop=4 shiftwidth=4 expandtab ai
" autocmd FileType ruby,javascript,html,css,xml :set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
