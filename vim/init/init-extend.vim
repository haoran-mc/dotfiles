nnoremap <leader>ta :call DeleteHiddenBuffers()<cr>
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




" 设置折叠的快捷键
" 我这里就是 ,zz
" 第一次 ,zz 折叠，再一次就展开
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<CR>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun


cmap w!! %!sudo tee > /dev/null %   " 用 sudo 权限保存文件
