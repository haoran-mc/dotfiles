" default
" habamax
" lunaperche
" macvim
" pablo
" slate
" torte

set background=dark             " 设置背景颜色黑色
set t_Co=256                    " 终端 256 色

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set background=dark

set statusline=
set statusline+=\ %n
set statusline+=\ %*
set statusline+=\ ‹‹
set statusline+=\ %f\ %*
set statusline+=\ ››
set statusline+=%=
set statusline+=\ ‹‹
set statusline+=\ %l:%c
set statusline+=\ ::
set statusline+=\ %{strftime('%R',\ getftime(expand('%')))}
set statusline+=\ ››\ %*


if has("gui_running")
    set transparency=20
endif



set guicursor=n:block-blinkoff0,i:block-iCursor-blinkoff0,v:block-blinkoff0
" highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=red



hi TabLineSel term=inverse
hi TabLineSel ctermfg=red ctermbg=Black
hi TabLineSel gui=none guifg=red guibg=Black

set tabline=%!TabLine()
function TabLine()
    let TabStyle = ''
    for i in range(tabpagenr('$'))
        if i + 1 == tabpagenr()
            let TabStyle .= '%#TabLineSel#'
        else
            let TabStyle .= '%#TabLine#'
        endif
        let TabStyle .= ' %{ShortTabLabel(' . (i + 1) . ')} '
    endfor
    let TabStyle .= '%##'
    return TabStyle
endfunction

function ShortTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let label = bufname (buflist[tabpagewinnr (a:n) -1])
    let filename = fnamemodify (label, ':t')
    return filename
endfunction


