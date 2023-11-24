" for status bar and table line

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
