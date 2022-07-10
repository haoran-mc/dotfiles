map  <F9>  :%s/\s\+$//e<CR>:nohl<CR>:w<CR>:call Run()<CR>
imap <F9>  <ESC>:%s/\s\+$//e<CR>:nohl<CR>:w<CR>:call Run()<CR>

func! Run()
	if &filetype == 'c'
		exec "FloatermNew --autoclose=0 gcc % -o o-o && time ./o-o"
		echohl WarningMsg | echo " Running finish! ^_^"
	elseif &filetype == 'cpp'
		exec "FloatermNew --autoclose=0 g++ % -o o-o && ./o-o"
		echohl WarningMsg | echo " Running finish! ^_^"
	elseif &filetype == 'python'
		exec "FloatermNew --autoclose=0 python3 %"
		echohl WarningMsg | echo " Running finish! ^_^"
	elseif &filetype == 'scheme'
		exec "FloatermNew --autoclose=0 scheme %"
		echohl WarningMsg | echo " Running finish! ^_^"
	elseif &filetype == 'java'
		exec "FloatermNew --autoclose=0 javac % && java %<"
		echohl WarningMsg | echo " Running finish! ^_^"
	elseif &filetype == 'go'
		exec "FloatermNew --autoclose=0 go run %"
		echohl WarningMsg | echo " Running finish! ^_^"
	else
		redraw!
		echo "Language not support! -_-"
	endif
endfunc

nnoremap ta :call DeleteHiddenBuffers()<CR>
function DeleteHiddenBuffers()
	let tpbl=[]
	call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
	for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
		silent execute 'bwipeout' buf
	endfor
endfunction

" get some label for a single tab
function! MyTabLabel(tabarg)
	" try t:TabLabel
	let l:result = gettabvar(a:tabarg, "TabLabel", "")
	" or active buffer name
	if empty(l:result)
		let l:result = bufname(winbufnr(win_getid(tabpagewinnr(a:tabarg), a:tabarg)))
	endif
	" or some fixed string
	if empty(l:result)
		let l:result = '[NULL]'
	endif
	" truncate the path, so (hopefully) it will not get too long
	return l:result[strridx(l:result, '/') + 1 : ]
endfunction

" build the whole tabline
function! MyTabLine()
	let l:result = ''
	" all our tabs
	for l:num in range(1, tabpagenr("$"))
		" tab color
		let l:result .= (l:num != tabpagenr()) ? '%#TabLine#' : '%#TabLineSel#'
		" tab text
		let l:result .= '%' . l:num . 'T %{MyTabLabel(' . l:num . ')} '
	endfor
	" space filler
	let l:result .= '%#TabLineFill#%T%='
	" [X] button on the right if there are several tabs
	let l:result .= repeat('%#TabLine#%999X[X]', l:num > 1)
	return l:result
endfunction
