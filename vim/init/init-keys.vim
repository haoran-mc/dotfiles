"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap {<cr> {<cr>}<esc>O
nnoremap <leader>0 i<Space><C-c>la<Space><C-c>h
nnoremap <leader>rc :e ~/dotfiles/vim/init/init-base.vim<cr>
nnoremap <leader><cr> :nohlsearch<cr>
nnoremap <leader><leader> <esc>/<++><cr>:nohlsearch<cr>c4l

" nnoremap <leader>ft :Vex<cr>
nnoremap <leader>ft :NERDTree<cr>
nnoremap <leader>c :NERDTree ~/haoran/algo<cr>
nnoremap <leader>of :Autoformat<cr>



" 修复 ctags ctrl+] 无效问题
" nmap <c-]> g<c-]>
