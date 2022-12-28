"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 方便编程
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:ab NNN NEXTLINE
:ab dfs DFS
:ab bfs BFS
:ab inf INF
:ab llinf LLINF
:ab pi PI
:ab pii PII
:ab piii PIII
:ab mod MOD

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype cpp nmap <leader>tc :call CppSetTitle()<CR>
func CppSetTitle()
    call setline(1,          "//    filename: ")
    call append(line("."),   "//      author: Haoran Liu")
    call append(line(".")+1, "//       email: haoran.mc@outlook.com")
    call append(line(".")+2, "//    datetime: %Y-%m-%d %H:%M:%S %A")
    call append(line(".")+3, "//      source：")
    call append(line(".")+4, "//   algorithm：")
    call append(line(".")+5, "// description：")
    call append(line(".")+7, "")
endfunc

autocmd filetype cpp,go map <leader><tab>j :call CppSetEnding()<CR>
func CppSetEnding()
    call append(line(".")+3,   " *   结束日期：".strftime("%Y年%m月%d日 %A %H时%M分%S秒"))
endfunc

autocmd filetype cpp,go nmap <leader><tab>k :call CppFirstBlood()<CR>
func CppFirstBlood()
    call append(line(".")+1, " * •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••")
    call append(line(".")+2, " *")
endfunc

autocmd filetype python nmap <leader><tab>b :call PySetTitle()<CR>
func PySetTitle()
    call setline(1,          "#----------------------------------------------------------------")
    call append(line("."),   "#   ")
    call append(line(".")+1, "#   文件名称：".expand("%:t"))
    call append(line(".")+2, "#   创建日期：".strftime("%Y年%m月%d日 %A %H时%M分%S秒"))
    call append(line(".")+3, "#   题    目：<++>")
    call append(line(".")+4, "#   算    法：<++>")
    call append(line(".")+5, "#   描    述：<++>")
    call append(line(".")+6, "#")
    call append(line(".")+7, "#---------------------------------------------------------------*/")
    call append(line(".")+8, "")
endfunc

autocmd filetype python map <leader><tab>n :call PySetEnding()<CR>
func PySetEnding()
    call append(line(".")+3,   "#   结束日期：".strftime("%Y年%m月%d日 %A %H时%M分%S秒"))
endfunc

autocmd filetype python nmap <leader><tab>m :call PyFirstBlood()<CR>
func PyFirstBlood()
    call append(line(".")+1, "# •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••")
    call append(line(".")+2, "#")
endfunc

autocmd filetype go nmap <leader><tab>h :call GoSetTitle()<CR>
func GoSetTitle()
    call setline(1,          "/***")
    call append(line("."),   "*  创建日期：".strftime("%Y/%m/%d %a %H:%M:%S"))
    call append(line(".")+1, "*  题目来源：<++>")
    call append(line(".")+2, "*  算    法：<++>")
    call append(line(".")+3, "*  描    述：<++>")
    call append(line(".")+4, "**/")
    call append(line(".")+5, "")
endfunc


nmap <F9> :call Run()<CR>
func! Run()
    if &filetype == 'c'
        echo " compiling..."
        exec '!gcc % -o o-o'
        exec '! ./o-o'
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    elseif &filetype == 'cpp'
        echo " compiling..."
        exec '!g++ % -o .ogmc'
        exec '! ./.ogmc'
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    elseif &filetype == 'python'
        exec '!python3 %'
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    elseif &filetype == 'scheme'
        " exec '!scheme --load %'
        exec '!scheme %'
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    elseif &filetype == 'go'
        exec "!go run %"
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    else
        redraw!
        echo "Language not support! -_-"
    endif
endfunc

