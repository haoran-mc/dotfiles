"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap {<cr> {<cr>}<esc>O
nnoremap <leader>0 i<Space><C-c>la<Space><C-c>h
nnoremap <leader>rc :e ~/dotfiles/vim/.vimrc<cr>
nnoremap <leader><cr> :nohlsearch<cr>
nnoremap <leader><leader> <esc>/<++><cr>:nohlsearch<cr>c4l

nnoremap <leader>ft :NERDTreeToggle<cr>
nnoremap <leader>of :Autoformat<cr>

nnoremap ta :call DeleteHiddenBuffers()<cr>
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

