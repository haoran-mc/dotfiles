"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap {<cr> {<cr>}<esc>O
nnoremap <leader>0 i<Space><C-c>la<Space><C-c>h
nnoremap <leader>rc :e ~/dotfiles/vim/init/init-base.vim<cr>
nnoremap <leader><cr> :nohlsearch<cr>
" nnoremap <leader><leader> <esc>/<++><cr>:nohlsearch<cr>c4l
" nnoremap <leader>ft :Vex<cr>

nmap <leader>wc :q<cr>
nmap <leader>wv :vsp<cr>
nmap <leader>ws :sp<cr>
nmap <leader>wh <c-w><c-h>
nmap <leader>wj <c-w><c-j>
nmap <leader>wk <c-w><c-k>
nmap <leader>wl <c-w><c-l>

nmap <leader><tab> :ls<cr>

imap <c-g> <c-c>
nmap <c-g> <c-c>
vmap <c-g> <c-c>
cmap <c-g> <c-c>


" 修复 ctags ctrl+] 无效问题
" nmap <c-]> g<c-]>
