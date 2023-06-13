" nnoremap <leader>ta :call DeleteHiddenBuffers()<cr>
function DeleteHiddenBuffers()
    NERDTreeClose
    NERDTreeToggle
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
    NERDTreeToggle
endfunction



" 设置折叠的快捷键，第一次折叠，再一次展开
let g:FoldMethod = 0
" map <leader>zz :call ToggleFold()<CR>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun


" 用 sudo 权限保存文件
cmap w!! %!sudo tee > /dev/null %   



" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif







" Markdown的折叠 「za」
" https://stackoverflow.com/questions/3828606/vim-markdown-folding
function! MarkdownLevel()
    let curline = getline(v:lnum)
    if curline =~ '^# .*$'
        return ">1"
    endif
    if curline =~ '^## .*$'
        return ">2"
    endif
    if curline =~ '^### .*$'
        return ">3"
    endif
    if curline =~ '^#### .*$'
        return ">4"
    endif
    if curline =~ '^##### .*$'
        return ">5"
    endif
    if curline =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction

function! MarkdownFoldText()
    let foldsize = v:foldend - v:foldstart
    return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr
au BufEnter *.md setlocal foldtext=MarkdownFoldText()








