

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<cr>"
nnoremap <silent> <space>? :call CocActionAsync("doHover")<cr>

nnoremap <expr> <c-d> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<c-d>"
nnoremap <expr> <c-u> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<c-u>"

nmap <space>d <Plug>(coc-definition)
nmap <space>r <Plug>(coc-references)
nmap <space>t <Plug>(coc-type-definition)
nmap <space>i <Plug>(coc-implementation)
nmap <space>2 <Plug>(coc-rename)
nmap <space>h <Plug>(coc-diagnostic-prev)
nmap <space>l <Plug>(coc-diagnostic-next)
nmap <space>p <Plug>(coc-format)
