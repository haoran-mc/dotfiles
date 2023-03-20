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
" 运行代码
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <F9> :call RunInTerm()<CR>

func! RunInTerm()
	if &filetype == 'c'
		exec "!gcc % -o _exe"
		exec "term ./_exe"
		redraw!
		echohl WarningMsg | echo " Running finish! ^_^"
	elseif &filetype == 'cpp'
		exec "!g++ % -o _exe"
		exec "term ./_exe"
		redraw!
		echohl WarningMsg | echo " Running finish! ^_^"
	elseif &filetype == 'python'
		echo " compiling..."
		exec "term python3 %"
		redraw!
		echohl WarningMsg | echo " Running finish! ^_^"
	elseif &filetype == 'go'
		echo " compiling..."
		exec "term go run %"
		redraw!
		echohl WarningMsg | echo " Running finish! ^_^"
	else
		redraw!
		echo "language not support! -_-"
	endif
endfunc
